
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name FPGB -dir "C:/Users/craig robertson/Desktop/FPGB/FPGB/planAhead_run_4" -part xc5vlx50tff1136-1
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "FPGB.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {rtl/ROM.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/RAM.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/cpu_control.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/ALU.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/memory.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/cpu_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/chrontel_serial_bus_driver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/chrontel_CH7301C_driver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/systemPLL.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rtl/FPGB.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top FPGB $srcset
add_files [list {FPGB.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc5vlx50tff1136-1
