module memory_router(
	clk4_2,
	reset_n,
	address_bus_in,
	dma_data_mux_sel_address,
	address_bus_dma_rd,
	address_bus_offset,
	address_bus_we,
	address_bus_dma_rd_we,
	mem_we,
	data_out,
	data_dma,
	data_in_boot_ROM,
	data_in_ext_cart_rom,
	data_in_VRAM_bank0,
	data_in_VRAM_bank1,
	data_in_ext_ram_bank0,
	data_in_ext_ram_bank1,
	data_in_ext_ram_bank2,
	data_in_ext_ram_bank3,
	data_in_work_ram_bank0,
	data_in_work_ram_bank1,
	data_in_work_ram_bank2,
	data_in_work_ram_bank3,
	data_in_work_ram_bank4,
	data_in_work_ram_bank5,
	data_in_work_ram_bank6,
	data_in_work_ram_bank7,
	data_in_oam,
	data_in_high_ram,
	data_in_background_palette_mem,
	data_in_sprite_palette_mem,
	wr_en_VRAM_bank0,
	wr_en_VRAM_bank1,
	wr_en_ext_ram_bank0,
	wr_en_ext_ram_bank1,
	wr_en_ext_ram_bank2,
	wr_en_ext_ram_bank3,
	wr_en_work_ram_bank0,
	wr_en_work_ram_bank1,
	wr_en_work_ram_bank2,
	wr_en_work_ram_bank3,
	wr_en_work_ram_bank4,
	wr_en_work_ram_bank5,
	wr_en_work_ram_bank6,
	wr_en_work_ram_bank7,
	wr_en_oam,
	wr_en_high_ram,
	P1_JOYP,
	IF,
	STAT,
	VBK,
	BRLO,
	HDMA1,
	HDMA2,
	HDMA3,
	HDMA4,
	HDMA5,
	BCPS_BGPI,
	OCPS_OBPI,
	SVBK,
	IE,
	SCX,
	SCY,
	ext_ram_bank_sel,
	boot_rom_switch
	);

input						clk4_2;
input						reset_n;
input			[15:0]	address_bus_in;
input			[15:0]	dma_data_mux_sel_address;
input			[15:0]	address_bus_dma_rd;
input						address_bus_we;
input						address_bus_dma_rd_we;
input						mem_we;
input			[1:0]		ext_ram_bank_sel;

output reg	[15:0]	address_bus_offset;
output reg	[7:0]		data_out;
output reg	[7:0]		data_dma;
output					boot_rom_switch;

// Boot ROM
input			[7:0]		data_in_boot_ROM;

// External ROM (cartridge ROM)
input			[7:0]		data_in_ext_cart_rom;

// VRAM
input			[7:0]		data_in_VRAM_bank0, data_in_VRAM_bank1;
output reg				wr_en_VRAM_bank0, wr_en_VRAM_bank1;

// External RAM
input			[7:0]		data_in_ext_ram_bank0, data_in_ext_ram_bank1, data_in_ext_ram_bank2, data_in_ext_ram_bank3;
output reg				wr_en_ext_ram_bank0, wr_en_ext_ram_bank1, wr_en_ext_ram_bank2, wr_en_ext_ram_bank3;

// Work RAM
input			[7:0]		data_in_work_ram_bank0, data_in_work_ram_bank1, data_in_work_ram_bank2, data_in_work_ram_bank3;
input			[7:0]		data_in_work_ram_bank4, data_in_work_ram_bank5, data_in_work_ram_bank6, data_in_work_ram_bank7;
output reg				wr_en_work_ram_bank0, wr_en_work_ram_bank1, wr_en_work_ram_bank2, wr_en_work_ram_bank3;
output reg				wr_en_work_ram_bank4, wr_en_work_ram_bank5, wr_en_work_ram_bank6, wr_en_work_ram_bank7;

// OAM
input			[7:0]		data_in_oam;
output reg				wr_en_oam;

// High RAM
input			[7:0]		data_in_high_ram;
output reg				wr_en_high_ram;

// Palette Memories
input			[7:0]		data_in_background_palette_mem, data_in_sprite_palette_mem;

// PPU Registers
input			[7:0]		SCX;
input			[7:0]		SCY;

// Special Registers
input			[7:0]		P1_JOYP;
input			[7:0]		IF;
input			[7:0]		STAT;
input			[7:0]		VBK;
input			[7:0]		BRLO;
input			[7:0]		HDMA1;
input			[7:0]		HDMA2;
input			[7:0]		HDMA3;
input			[7:0]		HDMA4;
input			[7:0]		HDMA5;
input			[7:0]		BCPS_BGPI;
input			[7:0]		OCPS_OBPI;
input			[7:0]		SVBK;
input			[7:0]		IE;


reg			[15:0]	address_bus_reg;

wire						boot_rom_switch;


assign boot_rom_switch = 1'b0; //|BRLO; // ADD BACK IN ONCE CART ROM RUNNING ON HW


/*********** Data mux ***********/
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		address_bus_reg <= 8'h00;
	end
	else begin
		if (address_bus_we) begin
			address_bus_reg <= address_bus_in;
		end
	end
end
always @(*) begin
	case (address_bus_reg[15:12])
		4'h0 : begin // 0x0___
			case (address_bus_reg[11:8])
				4'h0 : begin // 0x00__
					if (boot_rom_switch) begin
						data_out = data_in_ext_cart_rom;
					end
					else begin
						data_out = data_in_boot_ROM;
					end
				end
				
				4'h1 : begin // 0x01__
					data_out = data_in_boot_ROM;//data_in_ext_cart_rom; // ADD THIS BACK IN AFTER CART ROM RUNNING ON HW
				end
				
				4'h2 : begin // 0x02__
					if (boot_rom_switch) begin
						data_out = data_in_ext_cart_rom;
					end
					else begin
						data_out = data_in_boot_ROM;
					end
				end
				
				4'h3 : begin // 0x03__
					if (boot_rom_switch) begin
						data_out = data_in_ext_cart_rom;
					end
					else begin
						data_out = data_in_boot_ROM;
					end
				end
				
				4'h4 : begin // 0x04__
					if (boot_rom_switch) begin
						data_out = data_in_ext_cart_rom;
					end
					else begin
						data_out = data_in_boot_ROM;
					end
				end
				
				4'h5 : begin // 0x05__
					if (boot_rom_switch) begin
						data_out = data_in_ext_cart_rom;
					end
					else begin
						data_out = data_in_boot_ROM;
					end
				end
				
				4'h6 : begin // 0x06__
					if (boot_rom_switch) begin
						data_out = data_in_ext_cart_rom;
					end
					else begin
						data_out = data_in_boot_ROM;
					end
				end
				
				4'h7 : begin // 0x07__
					if (boot_rom_switch) begin
						data_out = data_in_ext_cart_rom;
					end
					else begin
						data_out = data_in_boot_ROM;
					end
				end
				
				4'h8 : begin // 0x08__
					if (boot_rom_switch) begin
						data_out = data_in_ext_cart_rom;
					end
					else begin
						data_out = data_in_boot_ROM;
					end
				end
				
				default : begin // 0x0900 thru 0x0FFF
					data_out = data_in_ext_cart_rom;
				end
			endcase
		end
		
		4'h1 : begin // 0x1___
			data_out = data_in_ext_cart_rom;
		end
		
		4'h2 : begin // 0x2___
			data_out = data_in_ext_cart_rom;
		end
		
		4'h3 : begin // 0x3___
			data_out = data_in_ext_cart_rom;
		end
		
		4'h4 : begin // 0x4___
			data_out = data_in_ext_cart_rom;
		end
		
		4'h5 : begin // 0x5___
			data_out = data_in_ext_cart_rom;
		end
		
		4'h6 : begin // 0x6___
			data_out = data_in_ext_cart_rom;
		end
		
		4'h7 : begin // 0x7___
			data_out = data_in_ext_cart_rom;
		end
		
		4'h8 : begin // 0x8___
			if (VBK[0]) begin
				data_out = data_in_VRAM_bank1;
			end
			else begin
				data_out = data_in_VRAM_bank0;
			end
		end
		
		4'h9 : begin // 0x9___
			if (VBK[0]) begin
				data_out = data_in_VRAM_bank1;
			end
			else begin
				data_out = data_in_VRAM_bank0;
			end
		end
		
		4'hA : begin // 0xA___
			case (ext_ram_bank_sel)
				2'b00 : begin
					data_out = data_in_ext_ram_bank0;
				end
				2'b01 : begin
					data_out = data_in_ext_ram_bank1;
				end
				2'b10 : begin
					data_out = data_in_ext_ram_bank2;
				end
				2'b11 : begin
					data_out = data_in_ext_ram_bank3;
				end
			endcase
		end
		
		4'hB : begin // 0xB___
			case (ext_ram_bank_sel)
				2'b00 : begin
					data_out = data_in_ext_ram_bank0;
				end
				2'b01 : begin
					data_out = data_in_ext_ram_bank1;
				end
				2'b10 : begin
					data_out = data_in_ext_ram_bank2;
				end
				2'b11 : begin
					data_out = data_in_ext_ram_bank3;
				end
			endcase
		end
		
		4'hC : begin // 0xC___
			data_out = data_in_work_ram_bank0;
		end
		
		4'hD : begin // 0xD___
			case (SVBK[2:0])
				3'b000 : begin
					data_out = data_in_work_ram_bank1;
				end
				3'b001 : begin
					data_out = data_in_work_ram_bank1;
				end
				3'b010 : begin
					data_out = data_in_work_ram_bank2;
				end
				3'b011 : begin
					data_out = data_in_work_ram_bank3;
				end
				3'b100 : begin
					data_out = data_in_work_ram_bank4;
				end
				3'b101 : begin
					data_out = data_in_work_ram_bank5;
				end
				3'b110 : begin
					data_out = data_in_work_ram_bank6;
				end
				3'b111 : begin
					data_out = data_in_work_ram_bank7;
				end
			endcase
		end
		
		4'hE : begin // 0xE___
			data_out = data_in_work_ram_bank0;
		end
		
		4'hF : begin // 0xF___
			case (address_bus_reg[11:8])
				default : begin // 0xF000 thru 0xFDFF
					case (SVBK[2:0])
						3'b000 : begin
							data_out = data_in_work_ram_bank1;
						end
						3'b001 : begin
							data_out = data_in_work_ram_bank1;
						end
						3'b010 : begin
							data_out = data_in_work_ram_bank2;
						end
						3'b011 : begin
							data_out = data_in_work_ram_bank3;
						end
						3'b100 : begin
							data_out = data_in_work_ram_bank4;
						end
						3'b101 : begin
							data_out = data_in_work_ram_bank5;
						end
						3'b110 : begin
							data_out = data_in_work_ram_bank6;
						end
						3'b111 : begin
							data_out = data_in_work_ram_bank7;
						end
					endcase
				end
				
				4'hE : begin // 0xFE__
					case (address_bus_reg[7:4])
						4'h0 : begin // 0xFE0_
							data_out = data_in_oam;
						end
						
						4'h1 : begin // 0xFE1_
							data_out = data_in_oam;
						end
						
						4'h2 : begin // 0xFE2_
							data_out = data_in_oam;
						end
						
						4'h3 : begin // 0xFE3_
							data_out = data_in_oam;
						end
						
						4'h4 : begin // 0xFE4_
							data_out = data_in_oam;
						end
						
						4'h5 : begin // 0xFE5_
							data_out = data_in_oam;
						end
						
						4'h6 : begin // 0xFE6_
							data_out = data_in_oam;
						end
						
						4'h7 : begin // 0xFE7_
							data_out = data_in_oam;
						end
						
						4'h8 : begin // 0xFE8_
							data_out = data_in_oam;
						end
						
						4'h9 : begin // 0xFE9_
							data_out = data_in_oam;
						end
						
						4'hA : begin // 0xFEA_
							data_out = data_out; // Unusable Range
						end
						
						4'hB : begin // 0xFEB_
							data_out = data_out; // Unusable Range
						end
						
						4'hC : begin // 0xFEC_
							data_out = data_out; // Unusable Range
						end
						
						4'hD : begin // 0xFED_
							data_out = data_out; // Unusable Range
						end
						
						4'hE : begin // 0xFEE_
							data_out = data_out; // Unusable Range
						end
						
						4'hF : begin // 0xFEF_
							data_out = data_out; // Unusable Range
						end
					endcase
				end
				
				4'hF : begin // 0xFF__
					case (address_bus_reg[7:4])
						4'h0 : begin // 0xFF0_
							case (address_bus_reg[3:0])
								4'h0 : begin // 0xFF00
									data_out = P1_JOYP;
								end
								4'h1 : begin // 0xFF01
									data_out = P1_JOYP;
								end
								4'hF : begin // 0xFF0F
									data_out = IF;
								end
								default : begin
									data_out = data_out;
								end
							endcase
						end
						
						4'h1 : begin // 0xFF1_
							
						end
						
						4'h2 : begin // 0xFF2_
							
						end
						
						4'h3 : begin // 0xFF3_
							
						end
						
						4'h4 : begin // 0xFF4_
							case (address_bus_reg[3:0])
								4'h1 : begin // 0xFF41
									data_out = STAT;
								end
								4'h2 : begin // 0xFF42
									data_out = SCY;
								end
								4'h3 : begin // 0xFF43
									data_out = SCX;
								end
								4'hF : begin // 0xFF4F
									data_out = VBK;
								end
								default : begin
									data_out = data_out;
								end
							endcase
						end
						
						4'h5 : begin // 0xFF5_
							case (address_bus_reg[3:0])
								4'h0 : begin // 0xFF50
									data_out = BRLO;
								end
								4'h1 : begin // 0xFF51
									data_out = HDMA1;
								end
								4'h2 : begin // 0xFF52
									data_out = HDMA2;
								end
								4'h3 : begin // 0xFF53
									data_out = HDMA3;
								end
								4'h4 : begin // 0xFF54
									data_out = HDMA4;
								end
								4'h5 : begin // 0xFF55
									data_out = HDMA5;
								end
							endcase
						end
						
						4'h6 : begin // 0xFF6_
							case (address_bus_reg[3:0])
								4'h9 : begin // 0xFF69
									data_out = data_in_background_palette_mem;
								end
								4'hB : begin // 0xFF6B
									data_out = data_in_sprite_palette_mem;
								end
							endcase
						end
						
						4'h7 : begin // 0xFF7_
							case (address_bus_reg[3:0])
								4'h0 : begin // 0xFF70
									data_out = SVBK;
								end
							endcase
						end
						
						4'h8 : begin // 0xFF8_
							data_out = data_in_high_ram;
						end
						
						4'h9 : begin // 0xFF9_
							data_out = data_in_high_ram;
						end
						
						4'hA : begin // 0xFFA_
							data_out = data_in_high_ram;
						end
						
						4'hB : begin // 0xFFB_
							data_out = data_in_high_ram;
						end
						
						4'hC : begin // 0xFFC_
							data_out = data_in_high_ram;
						end
						
						4'hD : begin // 0xFFD_
							data_out = data_in_high_ram;
						end
						
						4'hE : begin // 0xFFE_
							data_out = data_in_high_ram;
						end
						
						4'hF : begin // 0xFFF_
							case (address_bus_reg[3:0])
								4'h0 : begin // 0xFFF0
									data_out = data_in_high_ram;
								end
								
								4'h1 : begin // 0xFFF1
									data_out = data_in_high_ram;
								end
								
								4'h2 : begin // 0xFFF2
									data_out = data_in_high_ram;
								end
								
								4'h3 : begin // 0xFFF3
									data_out = data_in_high_ram;
								end
								
								4'h4 : begin // 0xFFF4
									data_out = data_in_high_ram;
								end
								
								4'h5 : begin // 0xFFF5
									data_out = data_in_high_ram;
								end
								
								4'h6 : begin // 0xFFF6
									data_out = data_in_high_ram;
								end
								
								4'h7 : begin // 0xFFF7
									data_out = data_in_high_ram;
								end
								
								4'h8 : begin // 0xFFF8
									data_out = data_in_high_ram;
								end
								
								4'h9 : begin // 0xFFF9
									data_out = data_in_high_ram;
								end
								
								4'hA : begin // 0xFFFA
									data_out = data_in_high_ram;
								end
								
								4'hB : begin // 0xFFFB
									data_out = data_in_high_ram;
								end
								
								4'hC : begin // 0xFFFC
									data_out = data_in_high_ram;
								end
								
								4'hD : begin // 0xFFFD
									data_out = data_in_high_ram;
								end
								
								4'hE : begin // 0xFFFE
									data_out = data_in_high_ram;
								end
								
								4'hF : begin // 0xFFFF
									data_out = IE;
								end
							endcase
						end
					endcase
				end
			endcase
		end
	endcase
end

/*********** Read DMA Data mux ***********/
/*
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		address_bus_dma_rd_reg <= 8'h00;
	end
	else begin
		if (address_bus_dma_rd_we) begin
			address_bus_dma_rd_reg <= ;
		end
	end
end
*/
always @(*) begin
	case (dma_data_mux_sel_address[15:12])
		4'h0 : begin // 0x0___
			case (dma_data_mux_sel_address[11:8])
				4'h0 : begin // 0x00__
					if (boot_rom_switch) begin
						data_dma = data_in_ext_cart_rom;
					end
					else begin
						data_dma = data_in_boot_ROM;
					end
				end
				
				4'h1 : begin // 0x01__
					data_dma = data_in_boot_ROM;//data_in_ext_cart_rom;// ADD THIS BACK IN AFTER CART ROM RUNNING ON HW
				end
				
				4'h2 : begin // 0x02__
					if (boot_rom_switch) begin
						data_dma = data_in_ext_cart_rom;
					end
					else begin
						data_dma = data_in_boot_ROM;
					end
				end
				
				4'h3 : begin // 0x03__
					if (boot_rom_switch) begin
						data_dma = data_in_ext_cart_rom;
					end
					else begin
						data_dma = data_in_boot_ROM;
					end
				end
				
				4'h4 : begin // 0x04__
					if (boot_rom_switch) begin
						data_dma = data_in_ext_cart_rom;
					end
					else begin
						data_dma = data_in_boot_ROM;
					end
				end
				
				4'h5 : begin // 0x05__
					if (boot_rom_switch) begin
						data_dma = data_in_ext_cart_rom;
					end
					else begin
						data_dma = data_in_boot_ROM;
					end
				end
				
				4'h6 : begin // 0x06__
					if (boot_rom_switch) begin
						data_dma = data_in_ext_cart_rom;
					end
					else begin
						data_dma = data_in_boot_ROM;
					end
				end
				
				4'h7 : begin // 0x07__
					if (boot_rom_switch) begin
						data_dma = data_in_ext_cart_rom;
					end
					else begin
						data_dma = data_in_boot_ROM;
					end
				end
				
				4'h8 : begin // 0x08__
					if (boot_rom_switch) begin
						data_dma = data_in_ext_cart_rom;
					end
					else begin
						data_dma = data_in_boot_ROM;
					end
				end
				
				default : begin // 0x0900 thru 0x0FFF
					data_dma = data_in_ext_cart_rom;
				end
			endcase
		end
		
		4'h1 : begin // 0x1___
			data_dma = data_in_ext_cart_rom;
		end
		
		4'h2 : begin // 0x2___
			data_dma = data_in_ext_cart_rom;
		end
		
		4'h3 : begin // 0x3___
			data_dma = data_in_ext_cart_rom;
		end
		
		4'h4 : begin // 0x4___
			data_dma = data_in_ext_cart_rom;
		end
		
		4'h5 : begin // 0x5___
			data_dma = data_in_ext_cart_rom;
		end
		
		4'h6 : begin // 0x6___
			data_dma = data_in_ext_cart_rom;
		end
		
		4'h7 : begin // 0x7___
			data_dma = data_in_ext_cart_rom;
		end
		
		4'h8 : begin // 0x8___
			if (VBK[0]) begin
				data_dma = data_in_VRAM_bank1;
			end
			else begin
				data_dma = data_in_VRAM_bank0;
			end
		end
		
		4'h9 : begin // 0x9___
			if (VBK[0]) begin
				data_dma = data_in_VRAM_bank1;
			end
			else begin
				data_dma = data_in_VRAM_bank0;
			end
		end
		
		4'hA : begin // 0xA___
			case (ext_ram_bank_sel)
				2'b00 : begin
					data_dma = data_in_ext_ram_bank0;
				end
				2'b01 : begin
					data_dma = data_in_ext_ram_bank1;
				end
				2'b10 : begin
					data_dma = data_in_ext_ram_bank2;
				end
				2'b11 : begin
					data_dma = data_in_ext_ram_bank3;
				end
			endcase
		end
		
		4'hB : begin // 0xB___
			case (ext_ram_bank_sel)
				2'b00 : begin
					data_dma = data_in_ext_ram_bank0;
				end
				2'b01 : begin
					data_dma = data_in_ext_ram_bank1;
				end
				2'b10 : begin
					data_dma = data_in_ext_ram_bank2;
				end
				2'b11 : begin
					data_dma = data_in_ext_ram_bank3;
				end
			endcase
		end
		
		4'hC : begin // 0xC___
			data_dma = data_in_work_ram_bank0;
		end
		
		4'hD : begin // 0xD___
			case (SVBK[2:0])
				3'b000 : begin
					data_dma = data_in_work_ram_bank1;
				end
				3'b001 : begin
					data_dma = data_in_work_ram_bank1;
				end
				3'b010 : begin
					data_dma = data_in_work_ram_bank2;
				end
				3'b011 : begin
					data_dma = data_in_work_ram_bank3;
				end
				3'b100 : begin
					data_dma = data_in_work_ram_bank4;
				end
				3'b101 : begin
					data_dma = data_in_work_ram_bank5;
				end
				3'b110 : begin
					data_dma = data_in_work_ram_bank6;
				end
				3'b111 : begin
					data_dma = data_in_work_ram_bank7;
				end
			endcase
		end
		
		4'hE : begin // 0xE___
			data_dma = data_in_work_ram_bank0;
		end
		
		4'hF : begin // 0xF___
			case (dma_data_mux_sel_address[11:8])
				default : begin // 0xF000 thru 0xFDFF
					case (SVBK[2:0])
						3'b000 : begin
							data_dma = data_in_work_ram_bank1;
						end
						3'b001 : begin
							data_dma = data_in_work_ram_bank1;
						end
						3'b010 : begin
							data_dma = data_in_work_ram_bank2;
						end
						3'b011 : begin
							data_dma = data_in_work_ram_bank3;
						end
						3'b100 : begin
							data_dma = data_in_work_ram_bank4;
						end
						3'b101 : begin
							data_dma = data_in_work_ram_bank5;
						end
						3'b110 : begin
							data_dma = data_in_work_ram_bank6;
						end
						3'b111 : begin
							data_dma = data_in_work_ram_bank7;
						end
					endcase
				end
				
				4'hE : begin // 0xFE__
					case (dma_data_mux_sel_address[7:4])
						4'h0 : begin // 0xFE0_
							data_dma = data_in_oam;
						end
						
						4'h1 : begin // 0xFE1_
							data_dma = data_in_oam;
						end
						
						4'h2 : begin // 0xFE2_
							data_dma = data_in_oam;
						end
						
						4'h3 : begin // 0xFE3_
							data_dma = data_in_oam;
						end
						
						4'h4 : begin // 0xFE4_
							data_dma = data_in_oam;
						end
						
						4'h5 : begin // 0xFE5_
							data_dma = data_in_oam;
						end
						
						4'h6 : begin // 0xFE6_
							data_dma = data_in_oam;
						end
						
						4'h7 : begin // 0xFE7_
							data_dma = data_in_oam;
						end
						
						4'h8 : begin // 0xFE8_
							data_dma = data_in_oam;
						end
						
						4'h9 : begin // 0xFE9_
							data_dma = data_in_oam;
						end
						
						4'hA : begin // 0xFEA_
							data_dma = data_dma; // Unusable Range
						end
						
						4'hB : begin // 0xFEB_
							data_dma = data_dma; // Unusable Range
						end
						
						4'hC : begin // 0xFEC_
							data_dma = data_dma; // Unusable Range
						end
						
						4'hD : begin // 0xFED_
							data_dma = data_dma; // Unusable Range
						end
						
						4'hE : begin // 0xFEE_
							data_dma = data_dma; // Unusable Range
						end
						
						4'hF : begin // 0xFEF_
							data_dma = data_dma; // Unusable Range
						end
					endcase
				end
				
				4'hF : begin // 0xFF__
					case (dma_data_mux_sel_address[7:4])
						4'h0 : begin // 0xFF0_
							case (dma_data_mux_sel_address[3:0])
								4'h0 : begin // 0xFF00
									data_dma = P1_JOYP;
								end
								4'h1 : begin // 0xFF01
									data_dma = P1_JOYP;
								end
								4'hF : begin // 0xFF0F
									data_dma = IF;
								end
								default : begin
									data_dma = data_dma;
								end
							endcase
						end
						
						4'h1 : begin // 0xFF1_
							
						end
						
						4'h2 : begin // 0xFF2_
							
						end
						
						4'h3 : begin // 0xFF3_
							
						end
						
						4'h4 : begin // 0xFF4_
							case (dma_data_mux_sel_address[3:0])
								4'h1 : begin // 0xFF41
									data_dma = STAT;
								end
								4'h2 : begin // 0xFF42
									data_dma = SCY;
								end
								4'h3 : begin // 0xFF43
									data_dma = SCX;
								end
								4'hF : begin // 0xFF4F
									data_dma = VBK;
								end
								default : begin
									data_dma = data_dma;
								end
							endcase
						end
						
						4'h5 : begin // 0xFF5_
							case (address_bus_reg[3:0])
								4'h0 : begin // 0xFF50
									data_dma = BRLO;
								end
							endcase
						end
						
						4'h6 : begin // 0xFF6_
							case (address_bus_reg[3:0])
								4'h9 : begin // 0xFF69
									data_dma = data_in_background_palette_mem;
								end
								4'hB : begin // 0xFF6B
									data_dma = data_in_sprite_palette_mem;
								end
							endcase
						end
						
						4'h7 : begin // 0xFF7_
							case (address_bus_reg[3:0])
								4'h0 : begin // 0xFF70
									data_dma = SVBK;
								end
							endcase
						end
						
						4'h8 : begin // 0xFF8_
							data_dma = data_in_high_ram;
						end
						
						4'h9 : begin // 0xFF9_
							data_dma = data_in_high_ram;
						end
						
						4'hA : begin // 0xFFA_
							data_dma = data_in_high_ram;
						end
						
						4'hB : begin // 0xFFB_
							data_dma = data_in_high_ram;
						end
						
						4'hC : begin // 0xFFC_
							data_dma = data_in_high_ram;
						end
						
						4'hD : begin // 0xFFD_
							data_dma = data_in_high_ram;
						end
						
						4'hE : begin // 0xFFE_
							data_dma = data_in_high_ram;
						end
						
						4'hF : begin // 0xFFF_
							case (address_bus_reg[3:0])
								4'h0 : begin // 0xFFF0
									data_dma = data_in_high_ram;
								end
								
								4'h1 : begin // 0xFFF1
									data_dma = data_in_high_ram;
								end
								
								4'h2 : begin // 0xFFF2
									data_dma = data_in_high_ram;
								end
								
								4'h3 : begin // 0xFFF3
									data_dma = data_in_high_ram;
								end
								
								4'h4 : begin // 0xFFF4
									data_dma = data_in_high_ram;
								end
								
								4'h5 : begin // 0xFFF5
									data_dma = data_in_high_ram;
								end
								
								4'h6 : begin // 0xFFF6
									data_dma = data_in_high_ram;
								end
								
								4'h7 : begin // 0xFFF7
									data_dma = data_in_high_ram;
								end
								
								4'h8 : begin // 0xFFF8
									data_dma = data_in_high_ram;
								end
								
								4'h9 : begin // 0xFFF9
									data_dma = data_in_high_ram;
								end
								
								4'hA : begin // 0xFFFA
									data_dma = data_in_high_ram;
								end
								
								4'hB : begin // 0xFFFB
									data_dma = data_in_high_ram;
								end
								
								4'hC : begin // 0xFFFC
									data_dma = data_in_high_ram;
								end
								
								4'hD : begin // 0xFFFD
									data_dma = data_in_high_ram;
								end
								
								4'hE : begin // 0xFFFE
									data_dma = data_in_high_ram;
								end
								
								4'hF : begin // 0xFFFF
									data_dma = IE;
								end
							endcase
						end
					endcase
				end
			endcase
		end
	endcase
end


/*********** Address Decode ***********/
always @(*) begin
	
	// Defaults
	wr_en_VRAM_bank0 = 1'b0;
	wr_en_VRAM_bank1 = 1'b0;
	
	wr_en_ext_ram_bank0 = 1'b0;
	wr_en_ext_ram_bank1 = 1'b0;
	wr_en_ext_ram_bank2 = 1'b0;
	wr_en_ext_ram_bank3 = 1'b0;;
	
	wr_en_work_ram_bank0 = 1'b0;
	wr_en_work_ram_bank1 = 1'b0;
	wr_en_work_ram_bank2 = 1'b0;
	wr_en_work_ram_bank3 = 1'b0;
	wr_en_work_ram_bank4 = 1'b0;
	wr_en_work_ram_bank5 = 1'b0;
	wr_en_work_ram_bank6 = 1'b0;
	wr_en_work_ram_bank7 = 1'b0;
	
	wr_en_oam = 1'b0;
	wr_en_high_ram = 1'b0;

	case (address_bus_in[15:12])
		4'h0 : begin
			address_bus_offset = address_bus_in;
		end
		
		4'h1 : begin
			address_bus_offset = address_bus_in;
		end
		
		4'h2 : begin
			address_bus_offset = address_bus_in;
		end
		
		4'h3 : begin
			address_bus_offset = address_bus_in;
		end
		
		4'h4 : begin
			address_bus_offset = address_bus_in;
		end
		
		4'h5 : begin
			address_bus_offset = address_bus_in;
		end
		
		4'h6 : begin
			address_bus_offset = address_bus_in;
		end
		
		4'h7 : begin
			address_bus_offset = address_bus_in;
		end
		
		4'h8 : begin
			address_bus_offset = address_bus_in - 16'h8000;
			if (VBK[0]) begin
				wr_en_VRAM_bank1 = mem_we;
			end
			else begin
				wr_en_VRAM_bank0 = mem_we;
			end
		end
		
		4'h9 : begin
			address_bus_offset = address_bus_in - 16'h8000;
			if (VBK[0]) begin
				wr_en_VRAM_bank1 = mem_we;
			end
			else begin
				wr_en_VRAM_bank0 = mem_we;
			end
		end
		
		4'hA : begin
			address_bus_offset = address_bus_in - 16'hA000;
		end
		
		4'hB : begin
			address_bus_offset = address_bus_in - 16'hA000;
		end
		
		4'hC : begin
			address_bus_offset = address_bus_in - 16'hC000;
			wr_en_work_ram_bank0 = mem_we;
		end
		
		4'hD : begin
			address_bus_offset = address_bus_in - 16'hD000;
			case (SVBK[2:0])
				3'b000 : begin
					wr_en_work_ram_bank1 = mem_we;
				end
				3'b001 : begin
					wr_en_work_ram_bank1 = mem_we;
				end
				3'b010 : begin
					wr_en_work_ram_bank2 = mem_we;
				end
				3'b011 : begin
					wr_en_work_ram_bank3 = mem_we;
				end
				3'b100 : begin
					wr_en_work_ram_bank4 = mem_we;
				end
				3'b101 : begin
					wr_en_work_ram_bank5 = mem_we;
				end
				3'b110 : begin
					wr_en_work_ram_bank6 = mem_we;
				end
				3'b111 : begin
					wr_en_work_ram_bank7 = mem_we;
				end
			endcase
		end
		
		4'hE : begin
			address_bus_offset = address_bus_in - 16'h2000;
		end
		
		4'hF : begin
			case (address_bus_in[11:8])
				4'h0 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'h1 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'h2 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'h3 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'h4 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'h5 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'h6 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'h7 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'h8 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'h9 : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'hA : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'hB : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'hC : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'hD : begin
					address_bus_offset = address_bus_in - 16'h2000;
				end
				
				4'hE : begin
					case (address_bus_in[7:4])
						4'h0 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'h1 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'h2 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'h3 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'h4 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'h5 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'h6 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'h7 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'h8 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'h9 : begin
							address_bus_offset = address_bus_in - 16'hFE00;
						end
						
						4'hA : begin
							address_bus_offset = address_bus_in - 16'hFEA0;
						end
						
						4'hB : begin
							address_bus_offset = address_bus_in - 16'hFEA0;
						end
						
						4'hC : begin
							address_bus_offset = address_bus_in - 16'hFEA0;
						end
						
						4'hD : begin
							address_bus_offset = address_bus_in - 16'hFEA0;
						end
						
						4'hE : begin
							address_bus_offset = address_bus_in - 16'hFEA0;
						end
						
						4'hF : begin
							address_bus_offset = address_bus_in - 16'hFEA0;
						end
					endcase
				end
				
				4'hF : begin // 0xFF__
					case (address_bus_in[7:4])
						4'h0 : begin
							address_bus_offset = address_bus_in;
						end
						
						4'h1 : begin
							address_bus_offset = address_bus_in;
						end
						
						4'h2 : begin
							address_bus_offset = address_bus_in;
						end
						
						4'h3 : begin
							address_bus_offset = address_bus_in;
						end
						
						4'h4 : begin
							address_bus_offset = address_bus_in;
						end
						
						4'h5 : begin
							address_bus_offset = address_bus_in;
						end
						
						4'h6 : begin // 0xFF6_
							address_bus_offset = address_bus_in;
						end
						
						4'h7 : begin
							address_bus_offset = address_bus_in;
						end
						
						4'h8 : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_ram = mem_we;
						end
						
						4'h9 : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_ram = mem_we;
						end
						
						4'hA : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_ram = mem_we;
						end
						
						4'hB : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_ram = mem_we;
						end
						
						4'hC : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_ram = mem_we;
						end
						
						4'hD : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_ram = mem_we;
						end
						
						4'hE : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_ram = mem_we;
						end
						
						4'hF : begin
							case (address_bus_in[3:0])
								4'h0 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'h1 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'h2 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'h3 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'h4 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'h5 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'h6 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'h7 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'h8 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'h9 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'hA : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'hB : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'hC : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'hD : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'hE : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_ram = mem_we;
								end
								
								4'hF : begin
									address_bus_offset = address_bus_in - 16'hFFFF;
								end
							endcase
						end
					endcase
				end
			endcase
		end
	endcase
end

endmodule
