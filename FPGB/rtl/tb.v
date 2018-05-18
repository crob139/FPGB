`timescale 1ps/1ps

module tb();

reg	ext_clk;			initial ext_clk <= 1'b0;
reg	ext_reset_n;

wire	[7:0]			data_out_cart_rom;
wire	[15:0]		address_bus_out;
wire					core_clk;


// Generate Clock
always #2445 ext_clk = !ext_clk; // 204.5MHz


// Generate external reset
initial begin
	ext_reset_n <= 1'b0;
	#1000000;
	ext_reset_n <= 1'b1;
end

FPGB FPGB_inst(
	.ext_clk					(ext_clk),
	.ext_reset_n				(ext_reset_n),
	.heartbeat_led				(),
	.address_bus_out			(address_bus_out),
	.data_bus_in_ext			(data_out_cart_rom),
	.core_clk					(core_clk)
	);

// External ROM
ROM #(
	.ADDRESS_WIDTH		(21),
	.MEM_SIZE			(2097152),
	.FILENAME			("rtl/roms/Pokemon_Gold_Version_USA_Europe_SGB_Enhanced.txt")
	)
external_cart_rom(
	.clk					(core_clk),
	.en					(1'b1),
	.addr					({5'b00000, address_bus_out}),
	.data_out			(data_out_cart_rom)
	);


endmodule
