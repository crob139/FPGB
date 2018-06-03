`timescale 1ns / 1ps

module i2c_mini(
	I2C_SCL_video,
	I2C_SDA_video,
	rst_n
	);

input				I2C_SCL_video;
inout				I2C_SDA_video;
input				rst_n;

reg				sda_out;
reg	[4:0]		edge_count;

assign I2C_SDA_video = (sda_out) ? 1'bZ : 1'b0;

always @(posedge I2C_SCL_video or negedge rst_n) begin
	if (!rst_n) begin
		edge_count <= 5'h00;
	end
	else begin
		if (edge_count == 5'd27) begin
			edge_count <= 5'h00;
		end
		else begin
			edge_count <= edge_count + 5'h01;
		end
	end
end

always @(negedge I2C_SCL_video or negedge rst_n) begin
	if (!rst_n) begin
		sda_out <= 1'b1;
	end
	else begin
		if ((edge_count == 5'd08) || (edge_count == 5'd17) || (edge_count == 5'd26)) begin
			sda_out <= 1'b0;
		end
		else begin
			sda_out <= 1'b1;
		end
	end
end

endmodule
