# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/vivado/workspace/zc702_estimation_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/vivado/workspace/zc702_estimation_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {zc702_estimation_platform}\
-hw {/home/vivado/Desktop/zc702_estimation_platform/zc702_estimation_platform.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/vivado/workspace}

platform write
platform generate -domains 
domain active {zynq_fsbl}
bsp reload
bsp config enable_exfat "true"
bsp config enable_exfat "false"
bsp write
domain active {standalone_domain}
bsp reload
platform generate
bsp setlib -name xilffs -ver 4.6
bsp config stdin "ps7_uart_1"
bsp reload
bsp setlib -name xilffs -ver 4.6
bsp write
bsp reload
catch {bsp regenerate}
platform generate -domains standalone_domain 
platform clean
platform generate
platform generate
platform active {zc702_estimation_platform}
platform generate -domains 
platform clean
platform clean
platform generate
platform clean
