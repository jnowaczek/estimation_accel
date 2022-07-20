################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
OBJS += \
./testbench/byte_count_stream_bench.o 

CPP_DEPS += \
./testbench/byte_count_stream_bench.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/byte_count_stream_bench.o: E:/estimation_accel/hls/byte_count_stream/src/byte_count_stream_bench.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -IC:/Xilinx/Vitis_HLS/2022.1/include -IE:/estimation_accel/hls -IC:/Xilinx/Vitis_HLS/2022.1/win64/tools/systemc/include -IC:/Xilinx/Vitis_HLS/2022.1/include/ap_sysc -IC:/Xilinx/Vitis_HLS/2022.1/include/etc -IC:/Xilinx/Vitis_HLS/2022.1/win64/tools/auto_cc/include -O0 -g3 -Wall -Wno-unknown-pragmas -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/byte_count_stream_bench.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


