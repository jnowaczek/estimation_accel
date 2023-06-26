onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+concat_intr -L xilinx_vip -L xpm -L xlconcat_v2_1_4 -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.concat_intr xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {concat_intr.udo}

run -all

endsim

quit -force
