#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_In_r "../tv/cdatafile/c.accelerator.autotvin_In_r.dat"
#define AUTOTB_TVOUT_In_r "../tv/cdatafile/c.accelerator.autotvout_In_r.dat"
#define WRAPC_STREAM_SIZE_IN_In_r "../tv/stream_size/stream_size_in_In_r.dat"
#define WRAPC_STREAM_INGRESS_STATUS_In_r "../tv/stream_size/stream_ingress_status_In_r.dat"
#define AUTOTB_TVIN_Out_r "../tv/cdatafile/c.accelerator.autotvin_Out_r.dat"
#define AUTOTB_TVOUT_Out_r "../tv/cdatafile/c.accelerator.autotvout_Out_r.dat"
#define WRAPC_STREAM_SIZE_OUT_Out_r "../tv/stream_size/stream_size_out_Out_r.dat"
#define WRAPC_STREAM_EGRESS_STATUS_Out_r "../tv/stream_size/stream_egress_status_Out_r.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_In_r "../tv/rtldatafile/rtl.accelerator.autotvout_In_r.dat"
#define AUTOTB_TVOUT_PC_Out_r "../tv/rtldatafile/rtl.accelerator.autotvout_Out_r.dat"


static const bool little_endian()
{
  int a = 1;
  return *(char*)&a == 1;
}

inline static void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    rev_endian(p, dbytes);
    vp = (p_dat) (p+dbytes);
  }

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
      if (little_endian()) {
        rev_endian(vp[i], wbytes);
      }
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};


inline static const std::string begin_str(int num)
{
  return std::string("[[transaction]]           ")
         .append(std::to_string(num))
         .append("\n");
}

inline static const std::string end_str()
{
  return std::string("[[/transaction]]\n");
}

const std::string formatData(unsigned char *pos, size_t wbits)
{
  bool LE = little_endian();
  size_t wbytes = (wbits+7)>>3;
  size_t i = LE ? wbytes-1 : 0;
  auto next = [&] () {
    auto c = pos[i];
    LE ? --i : ++i;
    return c;
  };
  std::ostringstream ss;
  ss << "0x";
  if (int t = (wbits & 0x7)) {
    if (t <= 4) {
      unsigned char mask = (1<<t)-1;
      ss << std::hex << std::setfill('0') << std::setw(1)
         << (int) (next() & mask);
      wbytes -= 1;
    }
  }
  for (size_t i = 0; i < wbytes; ++i) {
    ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
  }
  ss.put('\n');
  return ss.str();
}

static bool RTLOutputCheckAndReplacement(std::string &data)
{
  bool changed = false;
  for (size_t i = 2; i < data.size(); ++i) {
    if (data[i] == 'X' || data[i] == 'x') {
      data[i] = '0';
      changed = true;
    }
  }
  return changed;
}

struct SimException : public std::exception {
  const char *msg;
  const size_t line;
  SimException(const char *msg, const size_t line)
    : msg(msg), line(line)
  {
  }
};

template<size_t bit_width>
class PostCheck
{
  static const char *bad;
  static const char *err;
  std::fstream stream;
  std::string s;

  void send(char *p, ap_uint<bit_width> &data, size_t l, size_t rest)
  {
    if (rest == 0) {
      if (!little_endian()) {
        const size_t wbytes = (bit_width+7)>>3;
        rev_endian(p-wbytes, wbytes);
      }
    } else if (rest < 8) {
      *p = data.range(l+rest-1, l).to_uint();
      send(p+1, data, l+rest, 0);
    } else {
      *p = data.range(l+8-1, l).to_uint();
      send(p+1, data, l+8, rest-8);
    }
  }

  void readline()
  {
    std::getline(stream, s);
    if (stream.eof()) {
      throw SimException(bad, __LINE__);
    }
  }

public:
  char *param;
  size_t psize;
  size_t depth;

  PostCheck(const char *file)
  {
    stream.open(file);
    if (stream.fail()) {
      throw SimException(err, __LINE__);
    } else {
      readline();
      if (s != "[[[runtime]]]") {
        throw SimException(bad, __LINE__);
      }
    }
  }

  ~PostCheck() noexcept(false)
  {
    stream.close();
  }

  void run(size_t AESL_transaction_pc, size_t skip)
  {
    if (stream.peek() == '[') {
      readline();
    }

    for (size_t i = 0; i < skip; ++i) {
      readline();
    }

    bool foundX = false;
    for (size_t i = 0; i < depth; ++i) {
      readline();
      foundX |= RTLOutputCheckAndReplacement(s);
      ap_uint<bit_width> data(s.c_str(), 16);
      send(param+i*psize, data, 0, bit_width);
    }
    if (foundX) {
      std::cerr << "WARNING: [SIM 212-201] RTL produces unknown value "
                << "'x' or 'X' on some port, possible cause: "
                << "There are uninitialized variables in the design.\n";
    }

    if (stream.peek() == '[') {
      readline();
    }
  }
};

template<size_t bit_width>
const char* PostCheck<bit_width>::bad = "Bad TV file";

template<size_t bit_width>
const char* PostCheck<bit_width>::err = "Error on TV file";
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  In_r_depth = 0;
  Out_r_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{In_r " << In_r_depth << "}\n";
  total_list << "{Out_r " << Out_r_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int In_r_depth;
    int Out_r_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


extern "C" void accelerator_hw_stub_wrapper(volatile void *, volatile void *);

extern "C" void apatb_accelerator_hw(volatile void * __xlx_apatb_param_In_r, volatile void * __xlx_apatb_param_Out_r) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
long __xlx_apatb_param_In_r_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_In_r);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_In_r_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_In_r_stream_buf_final_size; ++i)((hls::stream<char>*)__xlx_apatb_param_In_r)->read();
long __xlx_apatb_param_Out_r_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_Out_r);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_Out_r_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_Out_r);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > Out_r_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              Out_r_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "Out_r" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt __attribute__ ((aligned));
((char*)&xlx_stream_elt)[0*4+0] = Out_r_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = Out_r_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = Out_r_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = Out_r_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<int>*)__xlx_apatb_param_Out_r)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_In_r);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_In_r);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_Out_r);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_Out_r);
CodeState = DUMP_INPUTS;
std::vector<char> __xlx_apatb_param_In_r_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_In_r)->empty())
    __xlx_apatb_param_In_r_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_In_r)->read());
  for (int i = 0; i < __xlx_apatb_param_In_r_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_In_r)->write(__xlx_apatb_param_In_r_stream_buf[i]);
  }
long __xlx_apatb_param_In_r_stream_buf_size = ((hls::stream<char>*)__xlx_apatb_param_In_r)->size();
std::vector<int> __xlx_apatb_param_Out_r_stream_buf;
long __xlx_apatb_param_Out_r_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_Out_r)->size();
CodeState = CALL_C_DUT;
accelerator_hw_stub_wrapper(__xlx_apatb_param_In_r, __xlx_apatb_param_Out_r);
CodeState = DUMP_OUTPUTS;
long __xlx_apatb_param_In_r_stream_buf_final_size = __xlx_apatb_param_In_r_stream_buf_size - ((hls::stream<char>*)__xlx_apatb_param_In_r)->size();
// print In_r Transactions
{
aesl_fh.write(AUTOTB_TVIN_In_r, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_In_r_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_In_r_stream_buf.data()+i);
std::string s(formatData(pos, 8));
aesl_fh.write(AUTOTB_TVIN_In_r, s);
}

  tcl_file.set_num(__xlx_apatb_param_In_r_stream_buf_final_size, &tcl_file.In_r_depth);
aesl_fh.write(AUTOTB_TVIN_In_r, end_str());
}


// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_In_r, begin_str(AESL_transaction));
if (__xlx_apatb_param_In_r_stream_buf_final_size > 0) {
  long In_r_stream_ingress_size = __xlx_apatb_param_In_r_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", In_r_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_In_r, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_In_r_stream_buf_final_size; j != e; j++) {
    In_r_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", In_r_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_In_r, __xlx_sprintf_buffer.data());
  }
} else {
  long In_r_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", In_r_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_In_r, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_In_r, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_In_r, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_In_r_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_In_r, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_In_r, end_str());
}
long __xlx_apatb_param_Out_r_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_Out_r)->size() - __xlx_apatb_param_Out_r_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_Out_r)->empty())
    __xlx_apatb_param_Out_r_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_Out_r)->read());
  for (int i = 0; i < __xlx_apatb_param_Out_r_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_Out_r)->write(__xlx_apatb_param_Out_r_stream_buf[i]);
  }
// print Out_r Transactions
{
aesl_fh.write(AUTOTB_TVOUT_Out_r, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_Out_r_stream_buf_final_size; ++i) {
unsigned char *pos = (unsigned char*)(__xlx_apatb_param_Out_r_stream_buf.data()+__xlx_apatb_param_Out_r_stream_buf_size+i);
std::string s(formatData(pos, 32));
aesl_fh.write(AUTOTB_TVOUT_Out_r, s);
}

  tcl_file.set_num(__xlx_apatb_param_Out_r_stream_buf_final_size, &tcl_file.Out_r_depth);
aesl_fh.write(AUTOTB_TVOUT_Out_r, end_str());
}

{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_Out_r, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_Out_r_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_Out_r, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_Out_r, end_str());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
