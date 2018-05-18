module memory(
	core_clk,
	reset_n,
	address_bus_in,
	address_bus_offset,
	addr_bus_we,
	mem_we,
	data_in,
	data_bus_in_ext,
	data_out,
	IME,
	interrupts,
	clear_interrupt,
//	v_blank_int_req,
	lcd_stat_int_req,
	timer_int_req,
	serial_int_req,
	joypad_int_req
	);

input						core_clk;
input						reset_n;
input			[15:0]	address_bus_in;
input						addr_bus_we;
input						mem_we;
input			[7:0]		data_in;
input			[7:0]		data_bus_in_ext;
input						IME;
input						clear_interrupt;
//input						v_blank_int_req;
input						lcd_stat_int_req;
input						timer_int_req;
input						serial_int_req;
input						joypad_int_req;
output reg	[7:0]		data_out;
output reg	[15:0]	address_bus_offset;
output		[4:0]		interrupts;

reg			[15:0]	address_bus_reg;

reg						wr_en_VRAM_bank0, wr_en_VRAM_bank1;
wire			[7:0]		data_out_VRAM_bank0, data_out_VRAM_bank1;

reg						wr_en_ext_ram_bank0, wr_en_ext_ram_bank1, wr_en_ext_ram_bank2, wr_en_ext_ram_bank3;
wire			[7:0]		data_out_ext_ram_bank0, data_out_ext_ram_bank1, data_out_ext_ram_bank2, data_out_ext_ram_bank3;

reg						wr_en_work_ram_bank0, wr_en_work_ram_bank1, wr_en_work_ram_bank2, wr_en_work_ram_bank3;
reg						wr_en_work_ram_bank4, wr_en_work_ram_bank5, wr_en_work_ram_bank6, wr_en_work_ram_bank7;
wire			[7:0]		data_out_work_ram_bank0, data_out_work_ram_bank1, data_out_work_ram_bank2, data_out_work_ram_bank3;
wire			[7:0]		data_out_work_ram_bank4, data_out_work_ram_bank5, data_out_work_ram_bank6, data_out_work_ram_bank7;

reg						wr_en_high_RAM;
wire			[7:0]		data_out_high_RAM;

wire			[7:0]		data_out_boot_ROM;

wire			[7:0]		data_out_background_palette_mem, data_out_sprite_palette_mem;

wire 						v_blank_int, lcd_stat_int, timer_int, serial_int, joypad_int;

// Special Registers
reg			[7:0]		P1_JOYP;
reg			[7:0]		LCDC;
reg			[7:0]		VBK;
reg			[7:0]		ROM_lockout_reg;
reg			[7:0]		SVBK;
reg			[7:0]		BCPS_BGPI;
reg			[7:0]		OCPS_OBPI;
reg			[7:0]		IF;
reg			[7:0]		IE;
// End Special Registers

wire 						boot_rom_switch;


// Data mux
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		address_bus_reg <= 8'h00;
	end
	else begin
		if (addr_bus_we) begin
			address_bus_reg <= address_bus_in;
		end
	end
end
always @(*) begin
	case (address_bus_reg[15:12])
		4'h0 : begin
			case (address_bus_reg[11:8])
				4'h0 : begin
					if (boot_rom_switch) begin
						data_out = data_bus_in_ext;
					end
					else begin
						data_out = data_out_boot_ROM;
					end
				end
				
				4'h1 : begin
					data_out = data_bus_in_ext;
				end
				
				4'h2 : begin
					if (boot_rom_switch) begin
						data_out = data_bus_in_ext;
					end
					else begin
						data_out = data_out_boot_ROM;
					end
				end
				
				4'h3 : begin
					if (boot_rom_switch) begin
						data_out = data_bus_in_ext;
					end
					else begin
						data_out = data_out_boot_ROM;
					end
				end
				
				4'h4 : begin
					if (boot_rom_switch) begin
						data_out = data_bus_in_ext;
					end
					else begin
						data_out = data_out_boot_ROM;
					end
				end
				
				4'h5 : begin
					if (boot_rom_switch) begin
						data_out = data_bus_in_ext;
					end
					else begin
						data_out = data_out_boot_ROM;
					end
				end
				
				4'h6 : begin
					if (boot_rom_switch) begin
						data_out = data_bus_in_ext;
					end
					else begin
						data_out = data_out_boot_ROM;
					end
				end
				
				4'h7 : begin
					if (boot_rom_switch) begin
						data_out = data_bus_in_ext;
					end
					else begin
						data_out = data_out_boot_ROM;
					end
				end
				
				4'h8 : begin
					if (boot_rom_switch) begin
						data_out = data_bus_in_ext;
					end
					else begin
						data_out = data_out_boot_ROM;
					end
				end
				
				default : begin
					data_out = data_bus_in_ext;
				end
			endcase
		end
		
		4'h1 : begin
			data_out = data_bus_in_ext;
		end
		
		4'h2 : begin
			data_out = data_bus_in_ext;
		end
		
		4'h3 : begin
			data_out = data_bus_in_ext;
		end
		
		4'h4 : begin
			data_out = data_bus_in_ext;
		end
		
		4'h5 : begin
			data_out = data_bus_in_ext;
		end
		
		4'h6 : begin
			data_out = data_bus_in_ext;
		end
		
		4'h7 : begin
			data_out = data_bus_in_ext;
		end
		
		4'h8 : begin
			if (VBK[0]) begin
				data_out = data_out_VRAM_bank1;
			end
			else begin
				data_out = data_out_VRAM_bank0;
			end
		end
		
		4'h9 : begin
			if (VBK[0]) begin
				data_out = data_out_VRAM_bank1;
			end
			else begin
				data_out = data_out_VRAM_bank0;
			end
		end
		
		4'hA : begin
			
		end
		
		4'hB : begin
			
		end
		
		4'hC : begin
			data_out = data_out_work_ram_bank0;
		end
		
		4'hD : begin
			case (SVBK[2:0])
				3'b000 : begin
					data_out = data_out_work_ram_bank1;
				end
				3'b001 : begin
					data_out = data_out_work_ram_bank1;
				end
				3'b010 : begin
					data_out = data_out_work_ram_bank2;
				end
				3'b011 : begin
					data_out = data_out_work_ram_bank3;
				end
				3'b100 : begin
					data_out = data_out_work_ram_bank4;
				end
				3'b101 : begin
					data_out = data_out_work_ram_bank5;
				end
				3'b110 : begin
					data_out = data_out_work_ram_bank6;
				end
				3'b111 : begin
					data_out = data_out_work_ram_bank7;
				end
			endcase
		end
		
		4'hE : begin
			
		end
		
		4'hF : begin
			case (address_bus_reg[11:8])
				4'h0 : begin
					
				end
				
				4'h1 : begin
					
				end
				
				4'h2 : begin
					
				end
				
				4'h3 : begin
					
				end
				
				4'h4 : begin
					
				end
				
				4'h5 : begin
					
				end
				
				4'h6 : begin
					
				end
				
				4'h7 : begin
					
				end
				
				4'h8 : begin
					
				end
				
				4'h9 : begin
					
				end
				
				4'hA : begin
					
				end
				
				4'hB : begin
					
				end
				
				4'hC : begin
					
				end
				
				4'hD : begin
					
				end
				
				4'hE : begin
					case (address_bus_reg[7:4])
						4'h0 : begin
							
						end
						
						4'h1 : begin
							
						end
						
						4'h2 : begin
							
						end
						
						4'h3 : begin
							
						end
						
						4'h4 : begin
							
						end
						
						4'h5 : begin
							
						end
						
						4'h6 : begin
							
						end
						
						4'h7 : begin
							
						end
						
						4'h8 : begin
							
						end
						
						4'h9 : begin
							
						end
						
						4'hA : begin
							
						end
						
						4'hB : begin
							
						end
						
						4'hC : begin
							
						end
						
						4'hD : begin
							
						end
						
						4'hE : begin
							
						end
						
						4'hF : begin
							
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
								4'hF : begin // 0xFF0F
									data_out = IF;
								end
							endcase
						end
						
						4'h1 : begin
							
						end
						
						4'h2 : begin
							
						end
						
						4'h3 : begin
							
						end
						
						4'h4 : begin // 0xFF4_
							case (address_bus_reg[3:0])
								4'hF : begin // 0xFF4F
									data_out = VBK;
								end
							endcase
						end
						
						4'h5 : begin // 0xFF5_
							case (address_bus_reg[3:0])
								4'h0 : begin // 0xFF50
									data_out = ROM_lockout_reg;
								end
							endcase
						end
						
						4'h6 : begin // 0xFF6_
							case (address_bus_reg[3:0])
								4'h9 : begin // 0xFF69
									data_out = data_out_background_palette_mem;
								end
								4'hB : begin // 0xFF6B
									data_out = data_out_sprite_palette_mem;
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
						
						4'h8 : begin
							data_out = data_out_high_RAM;
						end
						
						4'h9 : begin
							data_out = data_out_high_RAM;
						end
						
						4'hA : begin
							data_out = data_out_high_RAM;
						end
						
						4'hB : begin
							data_out = data_out_high_RAM;
						end
						
						4'hC : begin
							data_out = data_out_high_RAM;
						end
						
						4'hD : begin
							data_out = data_out_high_RAM;
						end
						
						4'hE : begin
							data_out = data_out_high_RAM;
						end
						
						4'hF : begin // 0xFFF_
							case (address_bus_reg[3:0])
								4'h0 : begin
									data_out = data_out_high_RAM;
								end
								
								4'h1 : begin
									data_out = data_out_high_RAM;
								end
								
								4'h2 : begin
									data_out = data_out_high_RAM;
								end
								
								4'h3 : begin
									data_out = data_out_high_RAM;
								end
								
								4'h4 : begin
									data_out = data_out_high_RAM;
								end
								
								4'h5 : begin
									data_out = data_out_high_RAM;
								end
								
								4'h6 : begin
									data_out = data_out_high_RAM;
								end
								
								4'h7 : begin
									data_out = data_out_high_RAM;
								end
								
								4'h8 : begin
									data_out = data_out_high_RAM;
								end
								
								4'h9 : begin
									data_out = data_out_high_RAM;
								end
								
								4'hA : begin
									data_out = data_out_high_RAM;
								end
								
								4'hB : begin
									data_out = data_out_high_RAM;
								end
								
								4'hC : begin
									data_out = data_out_high_RAM;
								end
								
								4'hD : begin
									data_out = data_out_high_RAM;
								end
								
								4'hE : begin
									data_out = data_out_high_RAM;
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

// Address Decode
always @(*) begin
	
	// Defaults
	wr_en_high_RAM = 1'b0;
	wr_en_VRAM_bank0 = 1'b0;
	wr_en_VRAM_bank1 = 1'b0;
	wr_en_work_ram_bank0 = 1'b0;
	wr_en_work_ram_bank1 = 1'b0;
	wr_en_work_ram_bank2 = 1'b0;
	wr_en_work_ram_bank3 = 1'b0;
	wr_en_work_ram_bank4 = 1'b0;
	wr_en_work_ram_bank5 = 1'b0;
	wr_en_work_ram_bank6 = 1'b0;
	wr_en_work_ram_bank7 = 1'b0;

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
			address_bus_offset = address_bus_in - 16'h4000;
		end
		
		4'h5 : begin
			address_bus_offset = address_bus_in - 16'h4000;
		end
		
		4'h6 : begin
			address_bus_offset = address_bus_in - 16'h4000;
		end
		
		4'h7 : begin
			address_bus_offset = address_bus_in - 16'h4000;
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
							wr_en_high_RAM = mem_we;
						end
						
						4'h9 : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_RAM = mem_we;
						end
						
						4'hA : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_RAM = mem_we;
						end
						
						4'hB : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_RAM = mem_we;
						end
						
						4'hC : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_RAM = mem_we;
						end
						
						4'hD : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_RAM = mem_we;
						end
						
						4'hE : begin
							address_bus_offset = address_bus_in - 16'hFF80;
							wr_en_high_RAM = mem_we;
						end
						
						4'hF : begin
							case (address_bus_in[3:0])
								4'h0 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'h1 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'h2 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'h3 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'h4 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'h5 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'h6 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'h7 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'h8 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'h9 : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'hA : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'hB : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'hC : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'hD : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
								end
								
								4'hE : begin
									address_bus_offset = address_bus_in - 16'hFF80;
									wr_en_high_RAM = mem_we;
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


// FPGA Internal Memories

ROM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(2304),
	.FILENAME			("rtl/roms/GBC_boot_rom.txt")
	)
boot_ROM(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[11:0]),
	.data_out			(data_out_boot_ROM)
	);



RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
VRAM_bank0(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[12:0]),
	.wr_en				(wr_en_VRAM_bank0),
	.data_in				(data_in),
	.data_out			(data_out_VRAM_bank0)
	);
	
RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
VRAM_bank1(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[12:0]),
	.wr_en				(wr_en_VRAM_bank1),
	.data_in				(data_in),
	.data_out			(data_out_VRAM_bank1)
	);

RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
ext_ram_bank0(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[12:0]),
	.wr_en				(wr_en_ext_ram_bank0), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_ext_ram_bank0)
	);

RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
ext_ram_bank1(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[12:0]),
	.wr_en				(wr_en_ext_ram_bank1), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_ext_ram_bank1)
	);

RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
ext_ram_bank2(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[12:0]),
	.wr_en				(wr_en_ext_ram_bank2), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_ext_ram_bank2)
	);

RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
ext_ram_bank3(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[12:0]),
	.wr_en				(wr_en_ext_ram_bank3), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_ext_ram_bank3)
	);

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank0(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank0), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank0)
	);

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank1(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank1), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank1)
	);

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank2(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank2), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank2)
	);

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank3(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank3), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank3)
	);

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank4(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank4), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank4)
	);

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank5(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank5), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank5)
	);

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank6(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank6), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank6)
	);

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank7(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank7), // Temp. Need to change this to be controlled by the register
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank7)
	);



RAM #(
	.ADDRESS_WIDTH		(7),
	.MEM_SIZE			(127)
	)
high_RAM(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(address_bus_offset[6:0]),
	.wr_en				(wr_en_high_RAM),
	.data_in				(data_in),
	.data_out			(data_out_high_RAM)
	);


RAM #(
	.ADDRESS_WIDTH		(6),
	.MEM_SIZE			(64)
	)
background_palette_mem(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(BCPS_BGPI[5:0]),
	.wr_en				((mem_we && (address_bus_in == 16'hFF69))),
	.data_in				(data_in),
	.data_out			(data_out_background_palette_mem)
	);

RAM #(
	.ADDRESS_WIDTH		(6),
	.MEM_SIZE			(64)
	)
sprite_palette_mem(
	.clk					(core_clk),
	.en					(addr_bus_we),
	.addr					(OCPS_OBPI[5:0]),
	.wr_en				((mem_we && (address_bus_in == 16'hFF6B))),
	.data_in				(data_in),
	.data_out			(data_out_sprite_palette_mem)
	);


// ************************************
// **** START OF SPECIAL REGISTERS ****
// ************************************

// 0xFF00 - (R/W) - P1/JOYP - Joypad
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		P1_JOYP[5:4] <= 2'b11;
	end
	else begin
		if ((address_bus_in == 16'hFF00) && (mem_we)) begin
			P1_JOYP[5:4] <= data_in[5:4];
		end
	end
end

// 0xFF40 - (R/W) - LCDC - LCD Control
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		LCDC <= 8'h00;
	end
	else begin
		if ((address_bus_in == 16'hFF40) && (mem_we)) begin
			LCDC <= data_in;
		end
	end
end

// 0xFF4F - (R/W) - VBK - VRAM Bank Selection
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		VBK <= 8'h00;
	end
	else begin
		if ((address_bus_in == 16'hFF4F) && (mem_we)) begin
			VBK[0] <= data_in[0];
		end
	end
end

// 0xFF50 - (RO) - ROM lockout register. Switches data bus mux between boot ROM and general program
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		ROM_lockout_reg <= 8'h00;
	end
	else begin
		if ((address_bus_in == 16'hFF50) && (mem_we)) begin
			ROM_lockout_reg <= data_in;
		end
	end
end
assign boot_rom_switch = ROM_lockout_reg[4] && ROM_lockout_reg[0]; // 0 means boot ROM selected

// 0xFF68 - (R/W) - BCPS_BGPI - Background Palette Index
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		BCPS_BGPI <= 8'h00;
	end
	else begin
		if ((address_bus_in == 16'hFF68) && (mem_we)) begin
			BCPS_BGPI <= data_in;
		end
		else if ((address_bus_in == 16'hFF69) && (mem_we) && BCPS_BGPI[7]) begin
			BCPS_BGPI[5:0] <= BCPS_BGPI[5:0] + 6'h01;
		end
	end
end

// 0xFF6A - (R/W) - OCPS_OBPI - Sprite Palette Index
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		OCPS_OBPI <= 8'h00;
	end
	else begin
		if ((address_bus_in == 16'hFF6A) && (mem_we)) begin
			OCPS_OBPI <= data_in;
		end
		else if ((address_bus_in == 16'hFF6B) && (mem_we) && OCPS_OBPI[7]) begin
			OCPS_OBPI[5:0] <= OCPS_OBPI[5:0] + 6'h01;
		end
	end
end

// 0xFF70 - (R/W) - SVBK - Work RAM Bank Selection
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		SVBK <= 8'h00;
	end
	else begin
		if ((address_bus_in == 16'hFF70) && (mem_we)) begin
			SVBK <= data_in;
		end
	end
end
reg v_blank_int_req;
// 0xFF0F - (R/W) - IF - Interrupt Flag
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		IF <= 8'h01;
	end
	else begin
		if (clear_interrupt) begin
			if (IF[0]) begin
				IF[0] <= 1'b0;
			end
			else if (IF[1]) begin
				IF[1] <= 1'b0;
			end
			else if (IF[2]) begin
				IF[2] <= 1'b0;
			end
			else if (IF[3]) begin
				IF[3] <= 1'b0;
			end
			else if (IF[4]) begin
				IF[4] <= 1'b0;
			end
		end
		else if ((address_bus_in == 16'hFF0F) && (mem_we)) begin
			IF <= data_in;
		end
		else begin
			IF[0] <= v_blank_int_req || IF[0];
			IF[1] <= lcd_stat_int_req || IF[1];
			IF[2] <= timer_int_req || IF[2];
			IF[3] <= serial_int_req || IF[3];
			IF[4] <= joypad_int_req || IF[4];
		end
	end
end

// 0xFFFF - (R/W) - IE - Interrupt Enable
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		IE <= 8'h00;
	end
	else begin
		if ((address_bus_in == 16'hFFFF) && (mem_we)) begin
			IE <= data_in;
		end
	end
end

assign v_blank_int = IF[0] && IE[0] && IME;
assign lcd_stat_int = IF[1] && IE[1] && IME;
assign timer_int = IF[2] && IE[2] && IME;
assign serial_int = IF[3] && IE[3] && IME;
assign joypad_int = IF[4] && IE[4] && IME;
assign interrupts = {joypad_int, serial_int, timer_int, lcd_stat_int, v_blank_int};

reg complete;
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		v_blank_int_req <= 1'b0;
		complete <= 1'b0;
	end
	else begin
		if (!complete) begin
			if (IF[0] == 1'b0) begin
				v_blank_int_req <= 1'b1;
				complete <= 1'b1;
			end
		end
		else if (complete) begin
			v_blank_int_req <= 1'b0;
			complete <= 1'b0;
		end
	end
end

endmodule
