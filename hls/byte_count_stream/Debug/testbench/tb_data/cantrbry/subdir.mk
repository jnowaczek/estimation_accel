################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/estimation_accel/hls/tb_data/cantrbry/fields.c 

OBJS += \
./testbench/tb_data/cantrbry/fields.o 

C_DEPS += \
./testbench/tb_data/cantrbry/fields.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/tb_data/cantrbry/fields.o: E:/estimation_accel/hls/tb_data/cantrbry/fields.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -DAESL_TB -D__llvm__ -D__llvm__ -IC:/Xilinx/Vitis_HLS/2022.1/include -IE:/estimation_accel/hls -IC:/Xilinx/Vitis_HLS/2022.1/win64/tools/systemc/include -IC:/Xilinx/Vitis_HLS/2022.1/include/ap_sysc -IC:/Xilinx/Vitis_HLS/2022.1/include/etc -IC:/Xilinx/Vitis_HLS/2022.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


