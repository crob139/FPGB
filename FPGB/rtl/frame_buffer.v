`timescale 1ns / 1ps

module frame_buffer(
	clk_ppu,
	reset_n,
	color_pixel_good,
	color_pixel,
	pixel_data_out,
	ppu_v_blank,
	frame_read_complete,
	read_pixel_data
	);

input						clk_ppu;
input						reset_n;
input						color_pixel_good;
input			[7:0]		color_pixel;
input						ppu_v_blank;
input						frame_read_complete;
input						read_pixel_data;
output	 	[14:0]	pixel_data_out;

reg			[2:0]		frame_buf_sel, frame_out_sel;
reg			[1:0]		ppu_vblank_pulse, screen_out_vblank_pulse;
reg			[14:0]	data_in_addr, data_out_addr;
reg						data_concat_state;
reg			[14:0]	color_pixel_15b;
reg						color_pixel_wr_en;
reg			[14:0]	addr_frame_buf_0, addr_frame_buf_1, addr_frame_buf_2;
reg						wr_en_frame_buf_0, wr_en_frame_buf_1, wr_en_frame_buf_2;

wire						frame_write_complete, frame_read_complete_pulse;
wire			[14:0]	data_out_frame_buf_0, data_out_frame_buf_1, data_out_frame_buf_2;



// PPU V-blank single pulse creation
always @(posedge clk_ppu or negedge reset_n) begin
	if (!reset_n) begin
		ppu_vblank_pulse <= 2'b00;
	end
	else begin
		ppu_vblank_pulse <= {ppu_vblank_pulse[0], ppu_v_blank};
	end
end
assign frame_write_complete = (!ppu_vblank_pulse[1] && ppu_vblank_pulse[0]);

// Screen output V-blank single pulse creation
always @(posedge clk_ppu or negedge reset_n) begin
	if (!reset_n) begin
		screen_out_vblank_pulse <= 2'b11;
	end
	else begin
		screen_out_vblank_pulse <= {screen_out_vblank_pulse[0], frame_read_complete};
	end
end
assign frame_read_complete_pulse = (screen_out_vblank_pulse[1] && !screen_out_vblank_pulse[0]);

// Address control and concatenation of pixel data writing to frame buffers
always @(posedge clk_ppu or negedge reset_n) begin
	if (!reset_n) begin
		data_in_addr <= 15'h0000;
		data_concat_state <= 1'b1;
		color_pixel_15b <= 15'hFFFF;
		color_pixel_wr_en <= 1'b0;
	end
	else begin
		if (color_pixel_good) begin
			if (data_concat_state) begin
				color_pixel_15b[7:0] <= color_pixel;
				color_pixel_wr_en <= 1'b0;
				data_concat_state <= 1'b0;
				data_in_addr <= data_in_addr + 15'h0001;
			end
			else begin
				color_pixel_15b[14:8] <= color_pixel[6:0];
				color_pixel_wr_en <= 1'b1;
				data_concat_state <= 1'b1;
			end
		end
		else begin
			color_pixel_wr_en <= 1'b0;
			if (frame_write_complete) begin
				data_in_addr <= 15'hFFFF;
			end
		end
	end
end

// Address control for reading from frame buffers
always @(posedge clk_ppu or negedge reset_n) begin
	if (!reset_n) begin
		data_out_addr <= 15'h0000;
	end
	else begin
		if (read_pixel_data) begin
			data_out_addr <= data_out_addr + 15'h0001;
		end
		else if (frame_read_complete_pulse) begin
			data_out_addr <= 15'h0000;
		end
	end
end


RAM_dual_port_15b RAM_dual_port_15b_inst(
	.clka		(clk_ppu),
	.wea		(color_pixel_wr_en),
	.addra	(data_in_addr),
	.dina		(color_pixel_15b),
	.douta	(),
	.clkb		(clk_ppu),
	.web		(1'b0),
	.addrb	(data_out_addr),
	.dinb		(),
	.doutb	(pixel_data_out)
	);



/*
// Frame buffer arbiter
always @(posedge clk_ppu or negedge reset_n) begin
	if (!reset_n) begin
		frame_buf_sel <= 3'b010;
		frame_out_sel <= 3'b001;
	end
	else begin
		if (frame_write_complete) begin
			frame_buf_sel <= {frame_buf_sel[1:0], frame_buf_sel[2]};
		end
		
		if (frame_read_complete_pulse) begin
			frame_out_sel <= {frame_buf_sel[0], frame_buf_sel[2:1]};
		end
	end
end

always @(*) begin
	case (frame_out_sel)
		3'b001 : begin
			pixel_data_out = data_out_frame_buf_0;
		end
		3'b010 : begin
			pixel_data_out = data_out_frame_buf_1;
		end
		3'b100 : begin
			pixel_data_out = data_out_frame_buf_2;
		end
		default : begin
			pixel_data_out = data_out_frame_buf_0;
		end
	endcase
end

RAM_15b #(
	.ADDRESS_WIDTH		(15),
	.MEM_SIZE			(23040)
	)
frame_buf_0(
	.clk					(clk_ppu),
	.en					(1'b1),
	.addr					(addr_frame_buf_0),
	.wr_en				(wr_en_frame_buf_0),
	.data_in				(color_pixel_15b),
	.data_out			(data_out_frame_buf_0)
	);
always @(*) begin
	case ({frame_buf_sel[0], frame_out_sel[0]})
		2'b00 : begin
			addr_frame_buf_0 = data_in_addr;
			wr_en_frame_buf_0 = 1'b0;
		end
		2'b01 : begin
			addr_frame_buf_0 = data_out_addr;
			wr_en_frame_buf_0 = 1'b0;
		end
		2'b10 : begin
			addr_frame_buf_0 = data_in_addr;
			wr_en_frame_buf_0 = color_pixel_wr_en;
		end
		2'b11 : begin
			addr_frame_buf_0 = data_in_addr;
			wr_en_frame_buf_0 = 1'b0;
		end
	endcase
end

RAM_15b #(
	.ADDRESS_WIDTH		(15),
	.MEM_SIZE			(23040)
	)
frame_buf_1(
	.clk					(clk_ppu),
	.en					(1'b1),
	.addr					(addr_frame_buf_1),
	.wr_en				(wr_en_frame_buf_1),
	.data_in				(color_pixel_15b),
	.data_out			(data_out_frame_buf_1)
	);
always @(*) begin
	case ({frame_buf_sel[1], frame_out_sel[1]})
		2'b00 : begin
			addr_frame_buf_1 = data_in_addr;
			wr_en_frame_buf_1 = 1'b0;
		end
		2'b01 : begin
			addr_frame_buf_1 = data_out_addr;
			wr_en_frame_buf_1 = 1'b0;
		end
		2'b10 : begin
			addr_frame_buf_1 = data_in_addr;
			wr_en_frame_buf_1 = color_pixel_wr_en;
		end
		2'b11 : begin
			addr_frame_buf_1 = data_in_addr;
			wr_en_frame_buf_1 = 1'b0;
		end
	endcase
end

RAM_15b #(
	.ADDRESS_WIDTH		(15),
	.MEM_SIZE			(23040)
	)
frame_buf_2(
	.clk					(clk_ppu),
	.en					(1'b1),
	.addr					(addr_frame_buf_2),
	.wr_en				(wr_en_frame_buf_2),
	.data_in				(color_pixel_15b),
	.data_out			(data_out_frame_buf_2)
	);
always @(*) begin
	case ({frame_buf_sel[2], frame_out_sel[2]})
		2'b00 : begin
			addr_frame_buf_2 = data_in_addr;
			wr_en_frame_buf_2 = 1'b0;
		end
		2'b01 : begin
			addr_frame_buf_2 = data_out_addr;
			wr_en_frame_buf_2 = 1'b0;
		end
		2'b10 : begin
			addr_frame_buf_2 = data_in_addr;
			wr_en_frame_buf_2 = color_pixel_wr_en;
		end
		2'b11 : begin
			addr_frame_buf_2 = data_in_addr;
			wr_en_frame_buf_2 = 1'b0;
		end
	endcase
end
*/
endmodule
