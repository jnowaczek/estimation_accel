################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/byte_count_stream_bench.cpp 

OBJS += \
./src/byte_count_stream.o \
./src/byte_count_stream_bench.o 

CPP_DEPS += \
./src/byte_count_stream.d \
./src/byte_count_stream_bench.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IC:/Xilinx/Vitis_HLS/2022.1/include -IE:/estimation_accel/hls -IC:/Xilinx/Vitis_HLS/2022.1/win64/tools/systemc/include -IC:/Xilinx/Vitis_HLS/2022.1/include/ap_sysc -IC:/Xilinx/Vitis_HLS/2022.1/include/etc -IC:/Xilinx/Vitis_HLS/2022.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

