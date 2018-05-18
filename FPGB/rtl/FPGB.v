module FPGB(
	ext_clk,
	ext_reset_n,
	heartbeat_led,
	address_bus_out,
	core_clk,
	data_bus_in_ext
	);

input 				ext_clk;
input					ext_reset_n;
input		[7:0]		data_bus_in_ext;
output				core_clk;
output				heartbeat_led;
output	[15:0]	address_bus_out;

wire		[7:0]		data_bus_cpu_out;
wire		[7:0]		data_bus_mem_out;
wire					pll_locked;
wire					mem_we;
wire					address_bus_we;
wire		[15:0]	address_bus_cpu_out;
wire					IME;
wire		[4:0]		interrupts;
wire					clear_interrupt;


// Create reset
assign reset_n = ext_reset_n && pll_locked;

// PLL to generate clock
systemPLL systemPLL_inst(
	.CLKIN1_IN					(ext_clk),
	.RST_IN						(1'b0),
	.CLKOUT0_OUT				(core_clk),
	.LOCKED_OUT					(pll_locked)
	);

fpga_heartbeat fpga_heartbeat_inst(
	.clk							(core_clk),
	.reset_n						(reset_n),
	.heartbeat_led				(heartbeat_led)
	);

cpu_top cpu_top_inst(
	.core_clk					(core_clk),
	.reset_n						(reset_n),
	.data_bus_in				(data_bus_mem_out),
	.data_bus_out				(data_bus_cpu_out),
	.address_bus				(address_bus_cpu_out),
	.address_bus_we			(address_bus_we),
	.mem_we						(mem_we),
	.IME							(IME),
	.interrupts					(interrupts),
	.clear_interrupt			(clear_interrupt)
	);

memory memory_inst(
	.core_clk					(core_clk),
	.reset_n						(reset_n),
	.address_bus_in			(address_bus_cpu_out),
	.address_bus_offset		(address_bus_out),
	.addr_bus_we				(address_bus_we),
	.mem_we						(mem_we),
	.data_in						(data_bus_cpu_out),
	.data_bus_in_ext			(data_bus_in_ext),
	.data_out					(data_bus_mem_out),
	.IME							(IME),
	.interrupts					(interrupts),
	.clear_interrupt			(clear_interrupt),
//	.v_blank_int_req			(v_blank_int_req),
	.lcd_stat_int_req			(lcd_stat_int_req),
	.timer_int_req				(timer_int_req),
	.serial_int_req			(serial_int_req),
	.joypad_int_req			(joypad_int_req)
	);

wire v_blank_int_req, lcd_stat_int_req, timer_int_req, serial_int_req, joypad_int_req;

assign v_blank_int_req = 1'b0;
assign lcd_stat_int_req = 1'b0;
assign timer_int_req = 1'b0;
assign serial_int_req = 1'b0;
assign joypad_int_req = 1'b0;

endmodule
