; ModuleID = 'E:/estimation_accel/hls/Byte_Count_Really_Good_This_Time/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>" = type { %"struct.hls::axis<ap_int<8>, 0, 0, 0>" }
%"struct.hls::axis<ap_int<8>, 0, 0, 0>" = type { %"struct.ap_int<8>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_int<8>" = type { %"struct.ap_int_base<8, true>" }
%"struct.ap_int_base<8, true>" = type { %"struct.ssdm_int<8, true>" }
%"struct.ssdm_int<8, true>" = type { i8 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_make_go_fast_ir(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* noalias nocapture nonnull dereferenceable(7) %in, %"struct.ssdm_int<8, true>"* noalias nocapture nonnull dereferenceable(1) %out) local_unnamed_addr #1 {
entry:
  %in_copy.data = alloca i8
  %in_copy.keep = alloca i1
  %in_copy.strb = alloca i1
  %in_copy.last = alloca i1
  %out_copy = alloca i8, align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(i8* %out_copy, i32 0) ]
  call fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* nonnull %in, i8* %in_copy.data, i1* %in_copy.keep, i1* %in_copy.strb, i1* %in_copy.last, %"struct.ssdm_int<8, true>"* nonnull %out, i8* nonnull align 512 %out_copy)
  call void @apatb_make_go_fast_hw(i8* %in_copy.data, i1* %in_copy.keep, i1* %in_copy.strb, i1* %in_copy.last, i8* %out_copy)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %in, i8* %in_copy.data, i1* %in_copy.keep, i1* %in_copy.strb, i1* %in_copy.last, %"struct.ssdm_int<8, true>"* %out, i8* %out_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* noalias "unpacked"="0", i8* noalias "unpacked"="1.0" %_V_data_V, i1* noalias "unpacked"="1.1" %_V_keep_V, i1* noalias "unpacked"="1.2" %_V_strb_V, i1* noalias "unpacked"="1.3" %_V_last_V, %"struct.ssdm_int<8, true>"* noalias "unpacked"="2", i8* noalias nocapture align 512 "unpacked"="3.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>.24"(i8* %_V_data_V, i1* %_V_keep_V, i1* %_V_strb_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0struct.ssdm_int<8, true>"(i8* align 512 %2, %"struct.ssdm_int<8, true>"* %1)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* noalias align 512 %dst, i8* noalias "unpacked"="1.0" %src_V_data_V, i1* noalias "unpacked"="1.1" %src_V_keep_V, i1* noalias "unpacked"="1.2" %src_V_strb_V, i1* noalias "unpacked"="1.3" %src_V_last_V) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %dst, null
  %1 = or i1 %0, false
  br i1 %1, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* nonnull align 512 %dst, i8* %src_V_data_V, i1* %src_V_keep_V, i1* %src_V_strb_V, i1* %src_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* noalias nocapture align 512, i8* noalias nocapture "unpacked"="1.0" %_V_data_V, i1* noalias nocapture "unpacked"="1.1" %_V_keep_V, i1* noalias nocapture "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture "unpacked"="1.3" %_V_last_V) unnamed_addr #4 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"
  %2 = alloca i8
  %3 = alloca i1
  %4 = alloca i1
  %5 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %6 = call i1 @fpga_fifo_not_empty_1(i8* %_V_data_V)
  br i1 %6, label %push, label %ret

push:                                             ; preds = %empty
  call void @fpga_fifo_pop_1(i8* %2, i8* %_V_data_V)
  %7 = load volatile i8, i8* %2
  %8 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %"struct.ap_int<8>"* %8 to i8*
  store i8 %7, i8* %9
  %10 = bitcast i1* %5 to i8*
  %11 = bitcast i1* %_V_keep_V to i8*
  call void @fpga_fifo_pop_1(i8* %10, i8* %11)
  %12 = bitcast i1* %5 to i8*
  %13 = load i8, i8* %12
  %14 = trunc i8 %13 to i1
  %15 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %16 = bitcast %"struct.ap_uint<1>"* %15 to i1*
  store i1 %14, i1* %16
  %17 = bitcast i1* %4 to i8*
  %18 = bitcast i1* %_V_strb_V to i8*
  call void @fpga_fifo_pop_1(i8* %17, i8* %18)
  %19 = bitcast i1* %4 to i8*
  %20 = load i8, i8* %19
  %21 = trunc i8 %20 to i1
  %22 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %23 = bitcast %"struct.ap_uint<1>"* %22 to i1*
  store i1 %21, i1* %23
  %24 = bitcast i1* %3 to i8*
  %25 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %24, i8* %25)
  %26 = bitcast i1* %3 to i8*
  %27 = load i8, i8* %26
  %28 = trunc i8 %27 to i1
  %29 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %30 = bitcast %"struct.ap_uint<1>"* %29 to i1*
  store i1 %28, i1* %30
  %31 = bitcast %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1 to i8*
  %32 = bitcast %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_push_7(i8* %31, i8* %32)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0struct.ssdm_int<8, true>"(i8* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ssdm_int<8, true>"* noalias "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"struct.ssdm_int<8, true>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0struct.ssdm_int<8, true>"(i8* align 512 %dst, %"struct.ssdm_int<8, true>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0struct.ssdm_int<8, true>"(i8* noalias nocapture align 512 "unpacked"="0.0", %"struct.ssdm_int<8, true>"* noalias nocapture "unpacked"="1") unnamed_addr #4 {
entry:
  %2 = alloca %"struct.ssdm_int<8, true>"
  %3 = alloca i8
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"struct.ssdm_int<8, true>"* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_1(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"struct.ssdm_int<8, true>"* %2 to i8*
  %7 = bitcast %"struct.ssdm_int<8, true>"* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %6, i8* %7)
  %8 = load volatile %"struct.ssdm_int<8, true>", %"struct.ssdm_int<8, true>"* %2
  %.evi = extractvalue %"struct.ssdm_int<8, true>" %8, 0
  store i8 %.evi, i8* %3
  call void @fpga_fifo_push_1(i8* %3, i8* %0)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* noalias "unpacked"="0", i8* noalias "unpacked"="1.0" %_V_data_V, i1* noalias "unpacked"="1.1" %_V_keep_V, i1* noalias "unpacked"="1.2" %_V_strb_V, i1* noalias "unpacked"="1.3" %_V_last_V, %"struct.ssdm_int<8, true>"* noalias "unpacked"="2", i8* noalias nocapture align 512 "unpacked"="3.0") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %0, i8* %_V_data_V, i1* %_V_keep_V, i1* %_V_strb_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0struct.ssdm_int<8, true>.10"(%"struct.ssdm_int<8, true>"* %1, i8* align 512 %2)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0struct.ssdm_int<8, true>.10"(%"struct.ssdm_int<8, true>"* noalias "unpacked"="0" %dst, i8* noalias nocapture align 512 "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"struct.ssdm_int<8, true>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0struct.ssdm_int<8, true>.13"(%"struct.ssdm_int<8, true>"* nonnull %dst, i8* align 512 %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0struct.ssdm_int<8, true>.13"(%"struct.ssdm_int<8, true>"* noalias nocapture "unpacked"="0", i8* noalias nocapture align 512 "unpacked"="1.0") unnamed_addr #4 {
entry:
  %2 = alloca i8
  %3 = alloca %"struct.ssdm_int<8, true>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %1)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  call void @fpga_fifo_pop_1(i8* %2, i8* %1)
  %5 = load volatile i8, i8* %2
  %.ivi = insertvalue %"struct.ssdm_int<8, true>" undef, i8 %5, 0
  store %"struct.ssdm_int<8, true>" %.ivi, %"struct.ssdm_int<8, true>"* %3
  %6 = bitcast %"struct.ssdm_int<8, true>"* %3 to i8*
  %7 = bitcast %"struct.ssdm_int<8, true>"* %0 to i8*
  call void @fpga_fifo_push_1(i8* %6, i8* %7)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>.24"(i8* noalias "unpacked"="0.0" %dst_V_data_V, i1* noalias "unpacked"="0.1" %dst_V_keep_V, i1* noalias "unpacked"="0.2" %dst_V_strb_V, i1* noalias "unpacked"="0.3" %dst_V_last_V, %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* noalias %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %src, null
  %1 = or i1 false, %0
  br i1 %1, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>.27"(i8* %dst_V_data_V, i1* %dst_V_keep_V, i1* %dst_V_strb_V, i1* %dst_V_last_V, %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>.27"(i8* noalias nocapture "unpacked"="0.0" %_V_data_V, i1* noalias nocapture "unpacked"="0.1" %_V_keep_V, i1* noalias nocapture "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture "unpacked"="0.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* noalias nocapture) unnamed_addr #4 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"
  %2 = alloca %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_7(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_7(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %2
  store %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>" %7, %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1
  %8 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %"struct.ap_int<8>"* %8 to i8*
  call void @fpga_fifo_push_1(i8* %9, i8* %_V_data_V)
  %10 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %11 = bitcast %"struct.ap_uint<1>"* %10 to i1*
  %12 = bitcast i1* %11 to i8*
  %13 = bitcast i1* %_V_keep_V to i8*
  call void @fpga_fifo_push_1(i8* %12, i8* %13)
  %14 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %15 = bitcast %"struct.ap_uint<1>"* %14 to i1*
  %16 = bitcast i1* %15 to i8*
  %17 = bitcast i1* %_V_strb_V to i8*
  call void @fpga_fifo_push_1(i8* %16, i8* %17)
  %18 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %19 = bitcast %"struct.ap_uint<1>"* %18 to i1*
  %20 = bitcast i1* %19 to i8*
  %21 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %20, i8* %21)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_make_go_fast_hw(i8*, i1*, i1*, i1*, i8*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* noalias "unpacked"="0", i8* noalias "unpacked"="1.0" %_V_data_V, i1* noalias "unpacked"="1.1" %_V_keep_V, i1* noalias "unpacked"="1.2" %_V_strb_V, i1* noalias "unpacked"="1.3" %_V_last_V, %"struct.ssdm_int<8, true>"* noalias "unpacked"="2", i8* noalias nocapture align 512 "unpacked"="3.0") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %0, i8* %_V_data_V, i1* %_V_keep_V, i1* %_V_strb_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0struct.ssdm_int<8, true>.10"(%"struct.ssdm_int<8, true>"* %1, i8* align 512 %2)
  ret void
}

define void @make_go_fast_hw_stub_wrapper(i8*, i1*, i1*, i1*, i8*) #6 {
entry:
  %5 = alloca %"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"
  %6 = alloca %"struct.ssdm_int<8, true>"
  call void @copy_out(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %5, i8* %0, i1* %1, i1* %2, i1* %3, %"struct.ssdm_int<8, true>"* %6, i8* %4)
  call void @make_go_fast_hw_stub(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %5, %"struct.ssdm_int<8, true>"* %6)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"* %5, i8* %0, i1* %1, i1* %2, i1* %3, %"struct.ssdm_int<8, true>"* %6, i8* %4)
  ret void
}

declare void @make_go_fast_hw_stub(%"class.hls::stream<hls::axis<ap_int<8>, 0, 0, 0>, 0>"*, %"struct.ssdm_int<8, true>"*)

declare i1 @fpga_fifo_not_empty_7(i8*)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare void @fpga_fifo_pop_7(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_7(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="8" "xlx.source"="user" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
