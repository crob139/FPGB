`timescale 1ns / 1ps

module i2c_test_top(
	CLKIN1_P_IN,
	CLKIN1_N_IN,
	I2C_SCL_video,
	I2C_SDA_video,
	DVI_DE,
	DVI_H,
	DVI_V,
	DVI_RESET_B,
	DVI_D,
	XCLK_P,
	XCLK_N,
	LED_test
	);

input							CLKIN1_P_IN;
input							CLKIN1_N_IN;
output						I2C_SCL_video;
inout							I2C_SDA_video;
output						XCLK_P, XCLK_N;
output						DVI_DE, DVI_H, DVI_V, DVI_RESET_B;
output			[11:0]	DVI_D;
output reg					LED_test;

reg				[24:0]	LED_counter;
reg				[14:0]	pix_data;

wire							clk25_2, clk25_2_270deg, rst_n, complete;

systemPLL systemPLL_inst(
	.CLKIN1_P_IN		(CLKIN1_P_IN),
	.CLKIN1_N_IN		(CLKIN1_N_IN),
	.RST_IN				(1'b0),
	.CLKOUT0_OUT		(),
	.CLKOUT1_OUT		(clk25_2),
	.CLKOUT2_OUT		(clk25_2_270deg),
	.LOCKED_OUT			(rst_n)
	);

chrontel_serial_bus_driver chrontel_serial_bus_driver_inst(
	.clk25_2				(clk25_2),
	.enable				(!complete),
	.rst_n				(rst_n),
	.complete			(complete),
	.read_write			(1'b0),
	.I2C_SCL_video		(I2C_SCL_video),
	.I2C_SDA_video		(I2C_SDA_video)
	);

assign DVI_RESET_B = rst_n;
chrontel_CH7301C_driver chrontel_CH7301C_driver_inst(
	.clk25_2				(clk25_2),
	.clk25_2_270deg	(clk25_2_270deg),
	.reset_n				(complete),
	.DVI_DE				(DVI_DE),
	.DVI_H				(DVI_H),
	.DVI_V				(DVI_V),
	.DVI_D				(DVI_D),
	.XCLK_P				(XCLK_P),
	.XCLK_N				(XCLK_N),
	.pix_data			(pix_data)
	);

always @(posedge clk25_2 or negedge rst_n) begin
	if (!rst_n) begin
		pix_data <= 15'h0;
	end
	else begin
		if (!DVI_V) begin
			pix_data <= 15'h0000;
		end
		else if (DVI_DE) begin
			pix_data <= ~pix_data;
		end
	end
end

always @(posedge clk25_2 or negedge rst_n) begin
	if (!rst_n) begin
		LED_test <= 1'b0;
		LED_counter <= 25'h0;
	end
	else begin
		if (LED_counter == 25'd25199999) begin
			LED_counter <= 25'h0;
			LED_test <= !LED_test;
		end
		else begin
			LED_counter <= LED_counter + 25'h1;
			LED_test <= LED_test;
		end
	end
end

endmodule
