
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name i2c -dir "C:/Users/craig robertson/Desktop/i2c/i2c/planAhead_run_4" -part xc5vlx50tff1136-1
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "i2c_test_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {systemPLL.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {chrontel_serial_bus_driver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {chrontel_CH7301C_driver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {i2c_test_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top i2c_test_top $srcset
add_files [list {i2c_test_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc5vlx50tff1136-1
