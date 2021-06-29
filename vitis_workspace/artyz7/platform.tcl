# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/parallels/artyz7_dsp_2020-2/vitis_workspace/artyz7/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/parallels/artyz7_dsp_2020-2/vitis_workspace/artyz7/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {artyz7}\
-hw {/home/parallels/artyz7_dsp_2020-2/artyz7_bd_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/home/parallels/artyz7_dsp_2020-2/vitis_workspace}

platform write
platform generate -domains 
platform active {artyz7}
platform generate
bsp reload
