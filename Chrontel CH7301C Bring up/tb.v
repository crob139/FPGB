`timescale 1ns / 1ps

module tb();

reg CLKIN1_P_IN;	initial CLKIN1_P_IN = 1'b0;
wire CLKIN1_N_IN;
wire complete;
wire clk25_2, clk25_2_270deg, rst_n;
wire I2C_SCL_video, I2C_SDA_video, DVI_V, DVI_DE;

reg				[14:0]	pix_data;

pullup(I2C_SCL_video);
pullup(I2C_SDA_video);

always #2.5 CLKIN1_P_IN = !CLKIN1_P_IN;
assign CLKIN1_N_IN = !CLKIN1_P_IN;

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

chrontel_CH7301C_driver chrontel_CH7301C_driver_inst(
	.clk25_2				(clk25_2),
	.clk25_2_270deg	(clk25_2_270deg),
	.reset_n				(complete),
	.DVI_DE				(DVI_DE),
	.DVI_H				(),
	.DVI_V				(DVI_V),
	.DVI_RESET_B		(),
	.DVI_D				(),
	.XCLK_P				(),
	.XCLK_N				(),
	.pix_data			(pix_data)
	);

i2c_mini i2c_mini_inst(
	.I2C_SCL_video		(I2C_SCL_video),
	.I2C_SDA_video		(I2C_SDA_video),
	.rst_n				(rst_n)
	);

always @(posedge clk25_2 or negedge rst_n) begin
	if (!rst_n) begin
		pix_data <= 15'h7FFF;
	end
	else begin
		if (!DVI_V) begin
			pix_data <= 15'h7FFF;
		end
		else if (DVI_DE) begin
			pix_data <= ~pix_data;
		end
	end
end



endmodule
