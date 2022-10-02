// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of num_blocks
//        bit 31~0 - num_blocks[31:0] (Read/Write)
// 0x14 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_NUM_BLOCKS_DATA 0x10
#define CONTROL_BITS_NUM_BLOCKS_DATA 32