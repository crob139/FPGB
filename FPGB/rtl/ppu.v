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
	counterY
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
		counterY <= 8'h0;
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
//temp
always @(*) begin
	if (counterY >= 144) begin
		STAT_mode <= 2'b01;
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
assign v_blank_int_sig = ((counterX == 9'd0) && (counterY == 8'd144));


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
	case (dma_sel_VRAM_bank0)
		2'b00 : begin
			mem_enable_VRAM_bank0 = mem_enable;
			address_bus_VRAM_bank0 = address_bus_offset;
			wr_en_mux_VRAM_bank0 = wr_en_VRAM_bank0;
			data_in_VRAM_bank0 = data_in;
		end
		2'b01 : begin
			mem_enable_VRAM_bank0 = mem_enable_dma_rd;
			address_bus_VRAM_bank0 = address_bus_dma_rd;
			wr_en_mux_VRAM_bank0 = wr_en_VRAM_bank0;
			data_in_VRAM_bank0 = data_in;
		end
		2'b10 : begin
			mem_enable_VRAM_bank0 = mem_enable_dma_wr;
			address_bus_VRAM_bank0 = address_bus_dma_wr;
			wr_en_mux_VRAM_bank0 = wr_en_VRAM_bank0_dma_wr;
			data_in_VRAM_bank0 = data_in_dma_wr;
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
	case (dma_sel_VRAM_bank1)
		2'b00 : begin
			mem_enable_VRAM_bank1 = mem_enable;
			address_bus_VRAM_bank1 = address_bus_offset;
			wr_en_mux_VRAM_bank1 = wr_en_VRAM_bank1;
			data_in_VRAM_bank1 = data_in;
		end
		2'b01 : begin
			mem_enable_VRAM_bank1 = mem_enable_dma_rd;
			address_bus_VRAM_bank1 = address_bus_dma_rd;
			wr_en_mux_VRAM_bank1 = wr_en_VRAM_bank1;
			data_in_VRAM_bank1 = data_in;
		end
		2'b10 : begin
			mem_enable_VRAM_bank1 = mem_enable_dma_wr;
			address_bus_VRAM_bank1 = address_bus_dma_wr;
			wr_en_mux_VRAM_bank1 = wr_en_VRAM_bank1_dma_wr;
			data_in_VRAM_bank1 = data_in_dma_wr;
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
	.addr					(BCPS_BGPI[5:0]),
	.wr_en				((mem_we && (address_bus_offset == 16'hFF69))),
	.data_in				(data_in),
	.data_out			(data_out_background_palette_mem)
	);

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
