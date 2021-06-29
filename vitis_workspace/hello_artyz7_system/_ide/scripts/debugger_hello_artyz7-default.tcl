# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/parallels/artyz7_dsp_2020-2/vitis_workspace/hello_artyz7_system/_ide/scripts/debugger_hello_artyz7-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/parallels/artyz7_dsp_2020-2/vitis_workspace/hello_artyz7_system/_ide/scripts/debugger_hello_artyz7-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Arty Z7 003017A70147A" && level==0 && jtag_device_ctx=="jsn-Arty Z7-003017A70147A-23727093-0"}
fpga -file /home/parallels/artyz7_dsp_2020-2/vitis_workspace/hello_artyz7/_ide/bitstream/artyz7_bd_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/parallels/artyz7_dsp_2020-2/vitis_workspace/artyz7/export/artyz7/hw/artyz7_bd_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/parallels/artyz7_dsp_2020-2/vitis_workspace/hello_artyz7/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/parallels/artyz7_dsp_2020-2/vitis_workspace/hello_artyz7/Debug/hello_artyz7.elf
configparams force-mem-access 0
bpadd -addr &main
