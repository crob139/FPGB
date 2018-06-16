`timescale 1ns / 1ps

module ppu(
	clk_ppu,
	clk4_2,
	reset_n,
	address_bus_offset,
	address_bus_dma_rd,
	address_bus_dma_wr,
	mem_enable,
	mem_enable_dma_rd,
	mem_enable_dma_wr,
	data_in,
	data_in_dma_wr,
	data_out_VRAM_bank0,
	data_out_VRAM_bank1,
	data_out_oam,
	mem_we,
	wr_en_VRAM_bank0,
	wr_en_VRAM_bank1,
	wr_en_oam,
	wr_en_VRAM_bank0_dma_wr,
	wr_en_VRAM_bank1_dma_wr,
	wr_en_oam_dma_wr,
	dma_sel_VRAM_bank0,
	dma_sel_VRAM_bank1,
	dma_sel_OAM,
	data_out_background_palette_mem,
	data_out_sprite_palette_mem,
	STAT_mode,
	OCPS_OBPI,
	BCPS_BGPI,
	LCDC,
	v_blank_int_sig,
	counterY,
	SCY,
	SCX,
	WY,
	WX,
	color_pixel_good,
	color_pixel
	);

input						clk_ppu;
input						clk4_2;
input						reset_n;
input			[15:0]	address_bus_offset;
input			[15:0]	address_bus_dma_rd;
input			[15:0]	address_bus_dma_wr;
input						mem_enable;
input						mem_enable_dma_rd;
input						mem_enable_dma_wr;
input			[7:0]		data_in;
input			[7:0]		data_in_dma_wr;
input						mem_we;
input						wr_en_VRAM_bank0, wr_en_VRAM_bank1;
input						wr_en_oam;
input						wr_en_VRAM_bank0_dma_wr, wr_en_VRAM_bank1_dma_wr;
input						wr_en_oam_dma_wr;
input			[1:0]		dma_sel_VRAM_bank0;
input			[1:0]		dma_sel_VRAM_bank1;
input						dma_sel_OAM;
input			[7:0]		OCPS_OBPI;
input			[7:0]		BCPS_BGPI;
input			[7:0]		LCDC;
input			[7:0]		SCY, SCX;
input			[7:0]		WY, WX;

output		[7:0]		data_out_VRAM_bank0;
output		[7:0]		data_out_VRAM_bank1;
output		[7:0]		data_out_oam;
output		[7:0]		data_out_background_palette_mem;
output		[7:0]		data_out_sprite_palette_mem;
output					v_blank_int_sig;
output reg	[7:0]		counterY;

output reg	[1:0]		STAT_mode;


reg			[15:0]	address_bus_VRAM_bank0, address_bus_VRAM_bank1;
reg						mem_enable_VRAM_bank0, mem_enable_VRAM_bank1;
reg			[7:0]		data_in_VRAM_bank0, data_in_VRAM_bank1;
reg						wr_en_mux_VRAM_bank0, wr_en_mux_VRAM_bank1;
wire						wr_en_oam_mux;
wire			[15:0]	address_bus_OAM;
wire						mem_enable_OAM;
wire			[7:0]		data_in_OAM;

reg			[8:0]		counterX;


always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		counterX <= 9'h0;
	end
	else begin
		if (LCDC[7]) begin
			if (counterX == 9'd455) begin
				counterX <= 9'h0;
			end
			else begin
				counterX <= counterX + 9'd1;
			end
		end
	end
end

always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		counterY <= 8'd145; // Start in V-blank
	end
	else begin
		if (LCDC[7]) begin
			if (counterX == 9'd455) begin
				if (counterY == 8'd153) begin
					counterY <= 8'd0;
				end
				else begin
					counterY <= counterY + 8'd1;
				end
			end
		end
	end
end

always @(*) begin
	if (counterY >= 144) begin
		STAT_mode = 2'b01;
	end
	else if (counterX < 80) begin
		STAT_mode = 2'b10;
	end
	else if ((counterX >= 80) && (counterX < 252	)) begin
		STAT_mode = 2'b11;
	end
	else begin
		STAT_mode = 2'b00;
	end
end
assign h_blank = (STAT_mode == 2'b00);
assign v_blank = (STAT_mode == 2'b01);
assign v_blank_int_sig = ((counterX == 9'd0) && (counterY == 8'd144));


reg [3:0] ppu_state;
reg [7:0] xPixelCount;
reg [7:0] yPixelCount;
reg [15:0] ppu_address;
reg ppu_sel;
reg ppu_mem_en;
reg [7:0] tile_parameters;
reg [7:0] pixel0;
reg [7:0] pixel1;
reg [3:0] count;
reg [5:0] ppu_bgd_pal_addr;
output reg color_pixel_good;
output reg [7:0] color_pixel;
reg [7:0] pixels_sent;
wire	[7:0]		xTileCount, yTileCount;
wire	[5:0]		address_bgd_palette;
assign xTileCount = SCX + xPixelCount;
assign yTileCount = SCY + yPixelCount;
always @(posedge clk_ppu or negedge reset_n) begin
	if (!reset_n) begin
		ppu_state <= 4'h0;
		xPixelCount <= 8'h00;
		yPixelCount <= 8'h00;
		ppu_address <= 16'h0000;
		ppu_sel <= 1'b0;
		ppu_mem_en <= 1'b0;
		tile_parameters <= 8'h00;
		pixel0 <= 8'h00;
		pixel1 <= 8'h00;
		count <= 4'h0;
		ppu_bgd_pal_addr <= 6'h00;
		color_pixel_good <= 1'b0;
		color_pixel <= 8'h00;
		xPixelCount <= 8'h00;
		yPixelCount <= 8'h00;
		pixels_sent <= 8'h00;
	end
	else begin
		case (ppu_state)
			4'b0000 : begin
				color_pixel_good <= 1'b0;
				if (&STAT_mode && LCDC[7]) begin
					ppu_state <= 4'b0001;
					ppu_sel <= 1'b1;
					ppu_mem_en <= 1'b1;
				end
				else begin
					ppu_state <= 4'b0000;
					ppu_sel <= 1'b0;
					ppu_mem_en <= 1'b0;
				end
				
				case (LCDC[3])
					1'b0 : begin
						ppu_address <= 16'h9800 + {8'h00, yTileCount[7:3], xTileCount[7:3]};
					end
					1'b1 : begin
						ppu_address <= 16'h9C00 + {8'h00, yTileCount[7:3], xTileCount[7:3]};
					end
				endcase
			end
			4'b0001 : begin
				ppu_state <= 4'b0010;
			end
			4'b0010 : begin
				ppu_state <= 4'b0011;
				tile_parameters <= data_out_VRAM_bank1;
				case (LCDC[4])
					1'b0 : begin
						ppu_address <= 16'h9000 + (~({data_out_VRAM_bank0[7], data_out_VRAM_bank0[7], data_out_VRAM_bank0[7], data_out_VRAM_bank0[7], data_out_VRAM_bank0[7], data_out_VRAM_bank0[7], data_out_VRAM_bank0[7], data_out_VRAM_bank0[7], data_out_VRAM_bank0} << 4) + 16'h0001) + {12'h000, yTileCount[2:0], 1'b0};
					end
					1'b1 : begin
						ppu_address <= 16'h8000 + {4'h00, data_out_VRAM_bank0, 4'h00} + {12'h000, yTileCount[2:0], 1'b0};
					end
				endcase
			end
			4'b0011 : begin
			ppu_state <= 4'b0100;
				ppu_address <= ppu_address + 16'h0001;
			end
			4'b0100 : begin
				ppu_state <= 4'b0101;
				case (tile_parameters[3])
					1'b0 : begin
						pixel0 <= data_out_VRAM_bank0;
					end
					1'b1 : begin
						pixel0 <= data_out_VRAM_bank1;
					end
				endcase
			end
			4'b0101 : begin
				ppu_state <= 4'b0110;
				count <= 4'h8;
				case (tile_parameters[3])
					1'b0 : begin
						pixel1 <= data_out_VRAM_bank0;
					end
					1'b1 : begin
						pixel1 <= data_out_VRAM_bank1;
					end
				endcase
			end
			4'b0110 : begin
				ppu_state <= 4'b0111;
				ppu_bgd_pal_addr <= {tile_parameters[2:0], pixel1[7], pixel0[7], 1'b0};
			end
			4'b0111 : begin
				ppu_state <= 4'b1000;
				color_pixel_good <= 1'b0;
				ppu_bgd_pal_addr <= ppu_bgd_pal_addr + 6'b00001;
			end
			4'b1000 : begin
				ppu_state <= 4'b1001;
				color_pixel <= data_out_background_palette_mem;
				if ((xPixelCount < {5'h00, SCX[2:0]}) || (pixels_sent == 'd160)) begin
					color_pixel_good <= 1'b0;
				end
				else begin
					color_pixel_good <= 1'b1;
					pixels_sent <= pixels_sent + 8'h01;
				end
				count <= count - 4'b0001;
				pixel0 <= {pixel0[6:0], 1'b0};
				pixel1 <= {pixel1[6:0], 1'b0};
			end
			4'b1001 : begin
				color_pixel <= data_out_background_palette_mem;
				xPixelCount <= xPixelCount + 8'h01;
				ppu_bgd_pal_addr <= {tile_parameters[2:0], pixel1[7], pixel0[7], 1'b0};
				if (|count) begin
					ppu_state <= 4'b0111;
				end
				else begin
					if (pixels_sent == 'd160) begin
						ppu_state <= 4'b1010;
						yPixelCount <= yPixelCount + 8'h01;
					end
					else begin
						ppu_state <= 4'b0000;
					end
				end
			end
			4'b1010 : begin
				color_pixel_good <= 1'b0;
				pixels_sent <= 8'h00;
				if (h_blank) begin
					if (yPixelCount == 'd144) begin
						yPixelCount <= 8'h00;
					end
					ppu_state <= 4'b0000;
					xPixelCount <= 8'h00;
				end
			end
		endcase
	end
end


RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
VRAM_bank0(
	.clk					(clk_ppu),
	.en					(mem_enable_VRAM_bank0),
	.addr					(address_bus_VRAM_bank0[12:0]),
	.wr_en				(wr_en_mux_VRAM_bank0),
	.data_in				(data_in_VRAM_bank0),
	.data_out			(data_out_VRAM_bank0)
	);
always @(*) begin
	case ({ppu_sel, dma_sel_VRAM_bank0})
		3'b000 : begin
			mem_enable_VRAM_bank0 = mem_enable;
			address_bus_VRAM_bank0 = address_bus_offset;
			wr_en_mux_VRAM_bank0 = wr_en_VRAM_bank0;
			data_in_VRAM_bank0 = data_in;
		end
		3'b001 : begin
			mem_enable_VRAM_bank0 = mem_enable_dma_rd;
			address_bus_VRAM_bank0 = address_bus_dma_rd;
			wr_en_mux_VRAM_bank0 = wr_en_VRAM_bank0;
			data_in_VRAM_bank0 = data_in;
		end
		3'b010 : begin
			mem_enable_VRAM_bank0 = mem_enable_dma_wr;
			address_bus_VRAM_bank0 = address_bus_dma_wr;
			wr_en_mux_VRAM_bank0 = wr_en_VRAM_bank0_dma_wr;
			data_in_VRAM_bank0 = data_in_dma_wr;
		end
		3'b100 : begin
			mem_enable_VRAM_bank0 = ppu_mem_en;
			address_bus_VRAM_bank0 = ppu_address;
			wr_en_mux_VRAM_bank0 = 1'b0;
			data_in_VRAM_bank0 = 8'h00;
		end
		default : begin
			mem_enable_VRAM_bank0 = mem_enable;
			address_bus_VRAM_bank0 = address_bus_offset;
			wr_en_mux_VRAM_bank0 = wr_en_VRAM_bank0;
			data_in_VRAM_bank0 = data_in;
		end
	endcase
end

RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
VRAM_bank1(
	.clk					(clk_ppu),
	.en					(mem_enable_VRAM_bank1),
	.addr					(address_bus_VRAM_bank1[12:0]),
	.wr_en				(wr_en_mux_VRAM_bank1),
	.data_in				(data_in_VRAM_bank1),
	.data_out			(data_out_VRAM_bank1)
	);
always @(*) begin
	case ({ppu_sel, dma_sel_VRAM_bank1})
		3'b000 : begin
			mem_enable_VRAM_bank1 = mem_enable;
			address_bus_VRAM_bank1 = address_bus_offset;
			wr_en_mux_VRAM_bank1 = wr_en_VRAM_bank1;
			data_in_VRAM_bank1 = data_in;
		end
		3'b001 : begin
			mem_enable_VRAM_bank1 = mem_enable_dma_rd;
			address_bus_VRAM_bank1 = address_bus_dma_rd;
			wr_en_mux_VRAM_bank1 = wr_en_VRAM_bank1;
			data_in_VRAM_bank1 = data_in;
		end
		3'b010 : begin
			mem_enable_VRAM_bank1 = mem_enable_dma_wr;
			address_bus_VRAM_bank1 = address_bus_dma_wr;
			wr_en_mux_VRAM_bank1 = wr_en_VRAM_bank1_dma_wr;
			data_in_VRAM_bank1 = data_in_dma_wr;
		end
		3'b100 : begin
			mem_enable_VRAM_bank1 = ppu_mem_en;
			address_bus_VRAM_bank1 = ppu_address;
			wr_en_mux_VRAM_bank1 = 1'b0;
			data_in_VRAM_bank1 = 8'h00;
		end
		default : begin
			mem_enable_VRAM_bank1 = mem_enable;
			address_bus_VRAM_bank1 = address_bus_offset;
			wr_en_mux_VRAM_bank1 = wr_en_VRAM_bank1;
			data_in_VRAM_bank1 = data_in;
		end
	endcase
end



RAM #(
	.ADDRESS_WIDTH		(8),
	.MEM_SIZE			(160)
	)
OAM(
	.clk					(clk_ppu),
	.en					(mem_enable_OAM),
	.addr					(address_bus_OAM[7:0]),
	.wr_en				(wr_en_oam_mux),
	.data_in				(data_in_OAM),
	.data_out			(data_out_oam)
	);
assign mem_enable_OAM = (dma_sel_OAM) ? mem_enable_dma_wr : mem_enable;
assign address_bus_OAM = (dma_sel_OAM) ? address_bus_dma_wr : address_bus_offset;
assign wr_en_oam_mux = (dma_sel_OAM) ? wr_en_oam_dma_wr : wr_en_oam;
assign data_in_OAM = (dma_sel_OAM) ? data_in_dma_wr : data_in;


RAM #(
	.ADDRESS_WIDTH		(6),
	.MEM_SIZE			(64)
	)
background_palette_mem(
	.clk					(clk_ppu),
	.en					(1'b1),
	.addr					(address_bgd_palette),
	.wr_en				(wr_en_bgd_palette),
	.data_in				(data_in),
	.data_out			(data_out_background_palette_mem)
	);
assign address_bgd_palette = (ppu_sel) ? ppu_bgd_pal_addr : BCPS_BGPI[5:0];
assign wr_en_bgd_palette = (ppu_sel) ? 1'b0 : (mem_we && (address_bus_offset == 16'hFF69));

RAM #(
	.ADDRESS_WIDTH		(6),
	.MEM_SIZE			(64)
	)
sprite_palette_mem(
	.clk					(clk_ppu),
	.en					(1'b1),
	.addr					(OCPS_OBPI[5:0]),
	.wr_en				((mem_we && (address_bus_offset == 16'hFF6B))),
	.data_in				(data_in),
	.data_out			(data_out_sprite_palette_mem)
	);

endmodule
