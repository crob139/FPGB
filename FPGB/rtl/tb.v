`timescale 1ps/1ps

module tb();

reg					ext_clk_p;	initial ext_clk_p <= 1'b0;
wire					ext_clk_n;
reg					ext_reset_n;

wire	[7:0]			data_out_cart_rom;
wire	[15:0]		address_bus_offset_to_cart_rom;
wire					clk4_2;
wire 					I2C_SCL_video, I2C_SDA_video;


pullup(I2C_SCL_video);
pullup(I2C_SDA_video);

// Generate Clock
always #2500 ext_clk_p = !ext_clk_p; // 200MHz
assign ext_clk_n = !ext_clk_p;

// Generate external reset
initial begin
	ext_reset_n <= 1'b1;
	#1000000;
	ext_reset_n <= 1'b0;
end

FPGB FPGB_inst(
	.ext_clk_p								(ext_clk_p),
	.ext_clk_n								(ext_clk_n),
	.ext_reset_n							(ext_reset_n),
	.address_bus_offset_to_cart_rom	(address_bus_offset_to_cart_rom),
	.data_in_ext_cart_rom				(data_out_cart_rom),
	.clk4_2									(clk4_2),
	.I2C_SCL_video							(I2C_SCL_video),
	.I2C_SDA_video							(I2C_SDA_video),
	.DVI_DE									(),
	.DVI_H									(),
	.DVI_V									(),
	.DVI_RESET_B							(),
	.DVI_D									(),
	.XCLK_P									(),
	.XCLK_N									(),
	.LED_test								(),
	.down_button							(1'b0),
	.up_button								(1'b0),
	.left_button							(1'b0),
	.right_button							(1'b0),
	.start_button							(1'b0),
	.select_button							(1'b0),
	.B_button								(1'b0),
	.A_button								(1'b0)
	);

// External ROM
ROM #(
	.ADDRESS_WIDTH		(21),
	.MEM_SIZE			(2097152),
	.FILENAME			("rtl/roms/Pokemon_Gold_Version_USA_Europe_SGB_Enhanced.txt")
	)
external_cart_rom(
	.clk					(clk4_2),
	.en					(1'b1),
	.addr					({5'b00000, address_bus_offset_to_cart_rom}),
	.data_out			(data_out_cart_rom)
	);

i2c_mini i2c_mini_inst(
	.I2C_SCL_video		(I2C_SCL_video),
	.I2C_SDA_video		(I2C_SDA_video),
	.rst_n				(!ext_reset_n)
	);

endmodule
