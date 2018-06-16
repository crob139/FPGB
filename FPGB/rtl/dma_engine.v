`timescale 1ns / 1ps

module dma_engine(
	clk4_2,
	reset_n,
	address_bus_dma_rd,
	dma_data_mux_sel_address,
	address_bus_dma_rd_we,
	address_bus_dma_wr,
	mem_enable_dma_rd,
	mem_enable_dma_wr,
	dma_sel_boot_rom,
	dma_sel_cart_rom,
	dma_sel_ext_ram_bank0,
	dma_sel_ext_ram_bank1,
	dma_sel_ext_ram_bank2,
	dma_sel_ext_ram_bank3,
	dma_sel_work_ram_bank0,
	dma_sel_work_ram_bank1,
	dma_sel_work_ram_bank2,
	dma_sel_work_ram_bank3,
	dma_sel_work_ram_bank4,
	dma_sel_work_ram_bank5,
	dma_sel_work_ram_bank6,
	dma_sel_work_ram_bank7,
	dma_sel_VRAM_bank0,
	dma_sel_VRAM_bank1,
	dma_sel_OAM,
	wr_en_VRAM_bank0_dma_wr,
	wr_en_VRAM_bank1_dma_wr,
	wr_en_oam_dma_wr,
	HDMA1,
	HDMA2,
	HDMA3,
	HDMA4,
	HDMA5,
	DMA_start,
	boot_rom_switch,
	ext_ram_bank_sel,
	SVBK,
	VBK,
	GDMA_finished
	);

input						clk4_2;
input						reset_n;
input			[7:0]		HDMA1;
input			[7:0]		HDMA2;
input			[7:0]		HDMA3;
input			[7:0]		HDMA4;
input			[7:0]		HDMA5;
input						DMA_start;
input						boot_rom_switch;
input			[1:0]		ext_ram_bank_sel;
input 		[7:0]		SVBK;
input 		[7:0]		VBK;
output reg	[15:0]	dma_data_mux_sel_address;
output reg	[15:0]	address_bus_dma_rd;
output reg				address_bus_dma_rd_we;
output reg	[15:0]	address_bus_dma_wr;
output reg				mem_enable_dma_rd;
output reg				mem_enable_dma_wr;

output reg				dma_sel_boot_rom, dma_sel_cart_rom;
output reg				dma_sel_ext_ram_bank0, dma_sel_ext_ram_bank1, dma_sel_ext_ram_bank2, dma_sel_ext_ram_bank3;
output reg				dma_sel_work_ram_bank0, dma_sel_work_ram_bank1, dma_sel_work_ram_bank2, dma_sel_work_ram_bank3;
output reg				dma_sel_work_ram_bank4, dma_sel_work_ram_bank5, dma_sel_work_ram_bank6, dma_sel_work_ram_bank7;
output reg	[1:0]		dma_sel_VRAM_bank0, dma_sel_VRAM_bank1;
output reg				dma_sel_OAM;

output reg				wr_en_VRAM_bank0_dma_wr, wr_en_VRAM_bank1_dma_wr;
output reg				wr_en_oam_dma_wr;

output reg				GDMA_finished;

reg			[11:0]	GDMA_count;
reg			[15:0]	GDMA_address_bus_rd;
reg			[11:0]	GDMA_transfer_count, GDMA_address_bus_rd_count;
reg			[1:0]		GDMA_state;
reg			[1:0]		HDMA_state;
reg			[1:0]		OAM_DMA_state;
reg			[15:0]	OAM_DMA_address_bus_rd;
reg						DMA_source_sel, DMA_destination_sel;
reg						DMA_wr_en_dma_wr;
reg						GDMA_wr_en_dma_wr;
reg			[15:0]	DMA_source_address;


always @(*) begin
	// Defaults
	address_bus_dma_rd = 16'h0000;
	address_bus_dma_wr = 16'h0000;
	dma_data_mux_sel_address = 16'h0000;
	DMA_source_sel = 1'b0;
	DMA_destination_sel = 1'b0;
	address_bus_dma_rd_we = 1'b0;
	mem_enable_dma_rd = 1'b0;
	mem_enable_dma_wr = 1'b0;
	DMA_wr_en_dma_wr = 1'b0;
	dma_sel_OAM = 1'b0;
	
	case ({|GDMA_state, |HDMA_state, |OAM_DMA_state})
		3'b001 : begin
			address_bus_dma_rd = OAM_DMA_address_bus_rd;
			dma_data_mux_sel_address = {HDMA1, HDMA2[7:4], 4'b0000} + {4'h0, GDMA_address_bus_rd_count};
			address_bus_dma_wr = 16'h0000; // Always first address of OAM RAM
			DMA_source_sel = 1'b1;
			dma_sel_OAM = 1'b1;
			address_bus_dma_rd_we = 1'b1;
		end
		3'b010 : begin
			address_bus_dma_rd = GDMA_address_bus_rd;
			dma_data_mux_sel_address = {HDMA1, HDMA2[7:4], 4'b0000} + {4'h0, GDMA_address_bus_rd_count};
			DMA_source_sel = 1'b1;
		end
		3'b100 : begin
			address_bus_dma_rd = (GDMA_address_bus_rd + {4'h0, GDMA_address_bus_rd_count});
			dma_data_mux_sel_address = {HDMA1, HDMA2[7:4], 4'b0000} + {4'h0, GDMA_address_bus_rd_count};
			address_bus_dma_wr = ({3'b100, HDMA3[4:0], HDMA4[7:4], 4'b0000} - 16'h8000) + {4'h0, GDMA_transfer_count};
			DMA_source_sel = 1'b1;
			DMA_destination_sel = 1'b1;
			address_bus_dma_rd_we = 1'b1;
			mem_enable_dma_rd = 1'b1;
			mem_enable_dma_wr = 1'b1;
			DMA_wr_en_dma_wr = GDMA_wr_en_dma_wr;
		end
		default : begin
			address_bus_dma_rd = 16'h0000;
			address_bus_dma_wr = 16'h0000;
			DMA_source_sel = 1'b0;
			DMA_destination_sel = 1'b0;
			address_bus_dma_rd_we = 1'b0;
			mem_enable_dma_rd = 1'b0;
			mem_enable_dma_wr = 1'b0;
			DMA_wr_en_dma_wr = 1'b0;
		end
	endcase
end

// GDMA State Machine
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		OAM_DMA_state <= 2'b00; // TEMP
		HDMA_state <= 2'b00; // TEMP
		
		GDMA_state <= 1'b0;
		GDMA_address_bus_rd <= 16'h0000;
		GDMA_count <= 12'h000;
		GDMA_transfer_count <= 12'h000;
		GDMA_wr_en_dma_wr <= 1'b0;
		GDMA_finished <= 1'b0;
	end
	else begin
		case (GDMA_state)
			2'b00 : begin
				if (DMA_start && !HDMA5[7]) begin
					GDMA_state <= 2'b01;
				end
				else begin
					GDMA_state <= 2'b00;
				end
				GDMA_address_bus_rd <= DMA_source_address;
				GDMA_count <= {({1'b0, HDMA5[6:0]} + 8'h01), 4'h0};
				GDMA_transfer_count <= 12'h000;
				GDMA_wr_en_dma_wr <= 1'b0;
				GDMA_address_bus_rd_count <= 12'h000;
				GDMA_finished <= 1'b0;
			end
			2'b01 : begin
				GDMA_state <= 2'b10;
				GDMA_address_bus_rd_count <= GDMA_address_bus_rd_count + 12'h001;
				GDMA_wr_en_dma_wr <= 1'b1;
			end
			2'b10 : begin
				if (GDMA_transfer_count < (GDMA_count - 12'h001)) begin
					GDMA_state <= 2'b10;
					GDMA_transfer_count <= GDMA_transfer_count + 12'h001;
				end
				else begin
					GDMA_state <= 2'b00;
					GDMA_finished <= 1'b1;
				end
				
				if (GDMA_address_bus_rd_count < (GDMA_count - 12'h001)) begin
					GDMA_address_bus_rd_count <= GDMA_address_bus_rd_count + 12'h001;
				end
				else begin
					GDMA_address_bus_rd_count <= GDMA_address_bus_rd_count;
				end
			end
			default : begin
				GDMA_state <= 2'b00;
			end
		endcase
	end
end

// Determine Source/Read Address and Select
always @(*) begin
	// Defaults
	dma_sel_boot_rom = 1'b0;
	dma_sel_cart_rom = 1'b0;
	dma_sel_ext_ram_bank0 = 1'b0;
	dma_sel_ext_ram_bank1 = 1'b0;
	dma_sel_ext_ram_bank2 = 1'b0;
	dma_sel_ext_ram_bank3 = 1'b0;
	dma_sel_work_ram_bank0 = 1'b0;
	dma_sel_work_ram_bank1 = 1'b0;
	dma_sel_work_ram_bank2 = 1'b0;
	dma_sel_work_ram_bank3 = 1'b0;
	dma_sel_work_ram_bank4 = 1'b0;
	dma_sel_work_ram_bank5 = 1'b0;
	dma_sel_work_ram_bank6 = 1'b0;
	dma_sel_work_ram_bank7 = 1'b0;
	dma_sel_VRAM_bank0[0] = 1'b0;
	dma_sel_VRAM_bank1[0] = 1'b0;
	
	case (HDMA1[7:4])
		4'h0 : begin // 0x0___
			case (HDMA1[3:0])
				4'h0 : begin // 0x00__
					DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000};
					if (boot_rom_switch) begin
						dma_sel_cart_rom = DMA_source_sel;
					end
					else begin
						dma_sel_boot_rom = DMA_source_sel;
					end
				end
				4'h1 : begin // 0x01__
					DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
					dma_sel_boot_rom = DMA_source_sel;//dma_sel_cart_rom = DMA_source_sel; // ADD THIS BACK IN AFTER CART ROM RUNNING ON HW
				end
				4'h2 : begin // 0x02__
					DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
					if (boot_rom_switch) begin
						dma_sel_cart_rom = DMA_source_sel;
					end
					else begin
						dma_sel_boot_rom = DMA_source_sel;
					end
				end
				4'h3 : begin // 0x03__
					DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
					if (boot_rom_switch) begin
						dma_sel_cart_rom = DMA_source_sel;
					end
					else begin
						dma_sel_boot_rom = DMA_source_sel;
					end
				end
				4'h4 : begin // 0x04__
					DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
					if (boot_rom_switch) begin
						dma_sel_cart_rom = DMA_source_sel;
					end
					else begin
						dma_sel_boot_rom = DMA_source_sel;
					end
				end
				4'h5 : begin // 0x05__
					DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
					if (boot_rom_switch) begin
						dma_sel_cart_rom = DMA_source_sel;
					end
					else begin
						dma_sel_boot_rom = DMA_source_sel;
					end
				end
				4'h6 : begin // 0x06__
					DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
					if (boot_rom_switch) begin
						dma_sel_cart_rom = DMA_source_sel;
					end
					else begin
						dma_sel_boot_rom = DMA_source_sel;
					end
				end
				4'h7 : begin // 0x07__
					DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
					if (boot_rom_switch) begin
						dma_sel_cart_rom = DMA_source_sel;
					end
					else begin
						dma_sel_boot_rom = DMA_source_sel;
					end
				end
				4'h8 : begin // 0x08__
					DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
					if (boot_rom_switch) begin
						dma_sel_cart_rom = DMA_source_sel;
					end
					else begin
						dma_sel_boot_rom = DMA_source_sel;
					end
				end
				default : begin // 0x09__ thru 0x0F__
					DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
					dma_sel_cart_rom = DMA_source_sel;
				end
			endcase
		end
		4'h1 : begin
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000};
			dma_sel_cart_rom = DMA_source_sel;
		end
		4'h2 : begin
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000};
			dma_sel_cart_rom = DMA_source_sel;
		end
		4'h3 : begin
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000};
			dma_sel_cart_rom = DMA_source_sel;
		end
		4'h4 : begin
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000};
			dma_sel_cart_rom = DMA_source_sel;
		end
		4'h5 : begin
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000};
			dma_sel_cart_rom = DMA_source_sel;
		end
		4'h6 : begin
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000};
			dma_sel_cart_rom = DMA_source_sel;
		end
		4'h7 : begin
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000};
			dma_sel_cart_rom = DMA_source_sel;
		end
		4'h8 : begin // VRAM range. Should only happen on OAM DMAs.
			if (VBK[0]) begin
				dma_sel_VRAM_bank1[0] = DMA_source_sel;
			end
			else begin
				dma_sel_VRAM_bank0[0] = DMA_source_sel;
			end
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000} - 16'h8000;
		end
		4'h9 : begin // VRAM range. Should only happen on OAM DMAs.
			if (VBK[0]) begin
				dma_sel_VRAM_bank1[0] = DMA_source_sel;
			end
			else begin
				dma_sel_VRAM_bank0[0] = DMA_source_sel;
			end
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000} - 16'h8000;
		end
		4'hA : begin
			case (ext_ram_bank_sel)
				2'b00 : begin
					dma_sel_ext_ram_bank0 = DMA_source_sel;
				end
				2'b01 : begin
					dma_sel_ext_ram_bank1 = DMA_source_sel;
				end
				2'b10 : begin
					dma_sel_ext_ram_bank2 = DMA_source_sel;
				end
				2'b11 : begin
					dma_sel_ext_ram_bank3 = DMA_source_sel;
				end
			endcase
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000} - 16'hA000;
		end
		4'hB : begin
			case (ext_ram_bank_sel)
				2'b00 : begin
					dma_sel_ext_ram_bank0 = DMA_source_sel;
				end
				2'b01 : begin
					dma_sel_ext_ram_bank1 = DMA_source_sel;
				end
				2'b10 : begin
					dma_sel_ext_ram_bank2 = DMA_source_sel;
				end
				2'b11 : begin
					dma_sel_ext_ram_bank3 = DMA_source_sel;
				end
			endcase
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000} - 16'hA000;
		end
		4'hC : begin
			dma_sel_work_ram_bank0 = DMA_source_sel;
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000} - 16'hC000;
		end
		4'hD : begin
			case (SVBK[2:0])
				3'b000 : begin
					dma_sel_work_ram_bank1 = DMA_source_sel;
				end
				3'b001 : begin
					dma_sel_work_ram_bank1 = DMA_source_sel;
				end
				3'b010 : begin
					dma_sel_work_ram_bank2 = DMA_source_sel;
				end
				3'b011 : begin
					dma_sel_work_ram_bank3 = DMA_source_sel;
				end
				3'b100 : begin
					dma_sel_work_ram_bank4 = DMA_source_sel;
				end
				3'b101 : begin
					dma_sel_work_ram_bank5 = DMA_source_sel;
				end
				3'b110 : begin
					dma_sel_work_ram_bank6 = DMA_source_sel;
				end
				3'b111 : begin
					dma_sel_work_ram_bank7 = DMA_source_sel;
				end
			endcase
			DMA_source_address = {HDMA1, HDMA2[7:4], 4'b0000} - 16'hD000;
		end
		default : begin
			DMA_source_address ={HDMA1, HDMA2[7:4], 4'b0000};
			dma_sel_cart_rom = DMA_source_sel;
		end
	endcase
end

// Determine Destination/Write Address and Select
always @(*) begin
	// Defaults
	dma_sel_VRAM_bank0[1] = 1'b0;
	dma_sel_VRAM_bank1[1] = 1'b0;
	wr_en_VRAM_bank0_dma_wr = 1'b0;
	wr_en_VRAM_bank1_dma_wr = 1'b0;
	
	case (VBK[0])
		1'b0 : begin
			dma_sel_VRAM_bank1[1] = DMA_destination_sel;
			wr_en_VRAM_bank1_dma_wr = DMA_wr_en_dma_wr;
		end
		1'b1 : begin
			dma_sel_VRAM_bank0[1] = DMA_destination_sel;
			wr_en_VRAM_bank0_dma_wr = DMA_wr_en_dma_wr;
		end
	endcase
end

endmodule
