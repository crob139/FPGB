module FPGB(
	ext_clk_p,
	ext_clk_n,
	ext_reset_n,
	address_bus_offset_to_cart_rom,
	clk4_2,
	data_in_ext_cart_rom,
	I2C_SCL_video,
	I2C_SDA_video,
	DVI_DE,
	DVI_H,
	DVI_V,
	DVI_RESET_B,
	DVI_D,
	XCLK_P,
	XCLK_N,
	LED_test,
	down_button,
	up_button,
	left_button,
	right_button,
	start_button,
	select_button,
	B_button,
	A_button
	);

input 				ext_clk_p;
input 				ext_clk_n;
input					ext_reset_n;
input		[7:0]		data_in_ext_cart_rom;
input					down_button;
input					up_button;
input					left_button;
input					right_button;
input					start_button;
input					select_button;
input					B_button;
input					A_button;
inout					I2C_SDA_video;
output				I2C_SCL_video;
output	[15:0]	address_bus_offset_to_cart_rom;
output				XCLK_P, XCLK_N;
output				DVI_DE, DVI_H, DVI_V, DVI_RESET_B;
output	[11:0]	DVI_D;
output reg			LED_test;
output				clk4_2;

reg		[24:0]	LED_counter;

wire		[7:0]		data_boot_ROM;
wire					wr_en_VRAM_bank0, wr_en_VRAM_bank1;
wire		[7:0]		data_VRAM_bank0, data_VRAM_bank1;
wire					wr_en_ext_ram_bank0, wr_en_ext_ram_bank1, wr_en_ext_ram_bank2, wr_en_ext_ram_bank3;
wire		[7:0]		data_ext_ram_bank0, data_ext_ram_bank1, data_ext_ram_bank2, data_ext_ram_bank3;
wire					wr_en_work_ram_bank0, wr_en_work_ram_bank1, wr_en_work_ram_bank2, wr_en_work_ram_bank3;
wire					wr_en_work_ram_bank4, wr_en_work_ram_bank5, wr_en_work_ram_bank6, wr_en_work_ram_bank7;
wire		[7:0]		data_work_ram_bank0, data_work_ram_bank1, data_work_ram_bank2, data_work_ram_bank3;
wire		[7:0]		data_work_ram_bank4, data_work_ram_bank5, data_work_ram_bank6, data_work_ram_bank7;
wire					wr_en_oam;
wire		[7:0]		data_oam;
wire					wr_en_high_ram;
wire		[7:0]		data_high_ram;
wire		[7:0]		data_background_palette_mem, data_sprite_palette_mem;

wire		[15:0]	address_bus_dma_rd, address_bus_dma_wr;
wire		[15:0]	dma_data_mux_sel_address;
wire		[7:0]		data_dma;
wire					wr_en_VRAM_bank0_dma_wr, wr_en_VRAM_bank1_dma_wr;
wire					wr_en_oam_dma_wr;
wire					address_bus_dma_rd_we;
wire					DMA_start, GDMA_finished;

wire					dma_sel_boot_rom, dma_sel_cart_rom;
wire					dma_sel_ext_ram_bank0, dma_sel_ext_ram_bank1, dma_sel_ext_ram_bank2, dma_sel_ext_ram_bank3;
wire					dma_sel_work_ram_bank0, dma_sel_work_ram_bank1, dma_sel_work_ram_bank2, dma_sel_work_ram_bank3;
wire					dma_sel_work_ram_bank4, dma_sel_work_ram_bank5, dma_sel_work_ram_bank6, dma_sel_work_ram_bank7;
wire		[1:0]		dma_sel_VRAM_bank0, dma_sel_VRAM_bank1;
wire					dma_sel_OAM;
wire					mem_enable_dma_rd, mem_enable_dma_wr;
wire					boot_rom_switch;

wire		[7:0]		P1_JOYP, IF, LCDC, STAT, VBK, BRLO, HDMA1, HDMA2, HDMA3, HDMA4, HDMA5, SVBK, OCPS_OBPI, BCPS_BGPI, IE, SCX, SCY;
wire		[1:0]		STAT_mode;

wire					v_blank_int_req, lcd_stat_int_req, timer_int_req, serial_int_req, joypad_int_req;
wire					v_blank_int_sig, lcd_stat_int_sig, timer_int_sig, serial_int_sig, joypad_int_sig;
wire					cpu_v_blank_int_clear, cpu_lcd_stat_int_clear, cpu_timer_int_clear, cpu_serial_int_clear, cpu_joypad_int_clear;
wire					IME;

wire		[1:0]		ext_ram_bank_sel;

wire		[7:0]		counterY;

wire					reset_n, startup_reset_n;
wire		[7:0]		data_bus_cpu_out;
wire		[7:0]		data_bus_router_out;
wire					pll_locked;
wire					mem_we;
wire					address_bus_we;
wire		[15:0]	address_bus_cpu_out, address_bus_offset;

wire					clk25_2, clk25_2_270deg, complete;


// Create reset
assign startup_reset_n = !ext_reset_n && pll_locked; // Everything that needs to run before CPU starts up
assign reset_n = startup_reset_n && complete;

// PLL to generate clock
systemPLL systemPLL_inst(
	.CLKIN1_P_IN					(ext_clk_p),
	.CLKIN1_N_IN					(ext_clk_n),
	.RST_IN							(1'b0),
	.CLKOUT0_OUT					(clk4_2),
	.CLKOUT1_OUT					(clk25_2),
	.CLKOUT2_OUT					(clk25_2_270deg),
	.LOCKED_OUT						(pll_locked)
	);

chrontel_serial_bus_driver chrontel_serial_bus_driver_inst(
	.clk25_2							(clk25_2),
	.enable							(!complete),
	.rst_n							(startup_reset_n),
	.complete						(complete),
	.I2C_SCL_video					(I2C_SCL_video),
	.I2C_SDA_video					(I2C_SDA_video)
	);

assign DVI_RESET_B = 1'b1;
chrontel_CH7301C_driver chrontel_CH7301C_driver_inst(
	.clk25_2							(clk25_2),
	.clk25_2_270deg				(clk25_2_270deg),
	.reset_n							(reset_n),
	.DVI_DE							(DVI_DE),
	.DVI_H							(DVI_H),
	.DVI_V							(DVI_V),
	.DVI_D							(DVI_D),
	.XCLK_P							(XCLK_P),
	.XCLK_N							(XCLK_N)
	//.pix_data						(pix_data) // This is for data to be sent to screen
	);

cpu_top cpu_top_inst(
	.clk4_2							(clk4_2),
	.reset_n							(reset_n),
	.data_bus_in					(data_bus_router_out),
	.data_bus_out					(data_bus_cpu_out),
	.address_bus					(address_bus_cpu_out),
	.address_bus_we				(address_bus_we),
	.mem_we							(mem_we),
	.IME								(IME),
	.v_blank_int_req				(v_blank_int_req),
	.lcd_stat_int_req				(lcd_stat_int_req),
	.timer_int_req					(timer_int_req),
	.serial_int_req				(serial_int_req),
	.joypad_int_req				(joypad_int_req),
	.cpu_v_blank_int_clear		(cpu_v_blank_int_clear),
	.cpu_lcd_stat_int_clear		(cpu_lcd_stat_int_clear),
	.cpu_timer_int_clear			(cpu_timer_int_clear),
	.cpu_serial_int_clear		(cpu_serial_int_clear),
	.cpu_joypad_int_clear		(cpu_joypad_int_clear),
	.DMA_start						(DMA_start),
	.GDMA_finished					(GDMA_finished)
	);

memory_router memory_router_inst(
	.clk4_2							(clk4_2),
	.reset_n							(reset_n),
	.address_bus_in				(address_bus_cpu_out),
	.address_bus_dma_rd			(address_bus_dma_rd),
	.dma_data_mux_sel_address	(dma_data_mux_sel_address),
	.address_bus_offset			(address_bus_offset),
	.address_bus_we				(address_bus_we),
	.address_bus_dma_rd_we		(address_bus_dma_rd_we),
	.mem_we							(mem_we),
	.data_out						(data_bus_router_out),
	.data_dma						(data_dma),
	.data_in_boot_ROM				(data_boot_ROM),
	.data_in_ext_cart_rom		(data_in_ext_cart_rom),
	.data_in_VRAM_bank0			(data_VRAM_bank0),
	.data_in_VRAM_bank1			(data_VRAM_bank1),
	.data_in_ext_ram_bank0		(data_ext_ram_bank0),
	.data_in_ext_ram_bank1		(data_ext_ram_bank1),
	.data_in_ext_ram_bank2		(data_ext_ram_bank2),
	.data_in_ext_ram_bank3		(data_ext_ram_bank3),
	.data_in_work_ram_bank0		(data_work_ram_bank0),
	.data_in_work_ram_bank1		(data_work_ram_bank1),
	.data_in_work_ram_bank2		(data_work_ram_bank2),
	.data_in_work_ram_bank3		(data_work_ram_bank3),
	.data_in_work_ram_bank4		(data_work_ram_bank4),
	.data_in_work_ram_bank5		(data_work_ram_bank5),
	.data_in_work_ram_bank6		(data_work_ram_bank6),
	.data_in_work_ram_bank7		(data_work_ram_bank7),
	.data_in_oam					(data_oam),
	.data_in_high_ram				(data_high_ram),
	.data_in_background_palette_mem	(data_background_palette_mem),
	.data_in_sprite_palette_mem		(data_sprite_palette_mem),
	.wr_en_VRAM_bank0				(wr_en_VRAM_bank0),
	.wr_en_VRAM_bank1				(wr_en_VRAM_bank1),
	.wr_en_ext_ram_bank0			(wr_en_ext_ram_bank0),
	.wr_en_ext_ram_bank1			(wr_en_ext_ram_bank1),
	.wr_en_ext_ram_bank2			(wr_en_ext_ram_bank2),
	.wr_en_ext_ram_bank3			(wr_en_ext_ram_bank3),
	.wr_en_work_ram_bank0		(wr_en_work_ram_bank0),
	.wr_en_work_ram_bank1		(wr_en_work_ram_bank1),
	.wr_en_work_ram_bank2		(wr_en_work_ram_bank2),
	.wr_en_work_ram_bank3		(wr_en_work_ram_bank3),
	.wr_en_work_ram_bank4		(wr_en_work_ram_bank4),
	.wr_en_work_ram_bank5		(wr_en_work_ram_bank5),
	.wr_en_work_ram_bank6		(wr_en_work_ram_bank6),
	.wr_en_work_ram_bank7		(wr_en_work_ram_bank7),
	.wr_en_oam						(wr_en_oam),
	.wr_en_high_ram				(wr_en_high_ram),
	.P1_JOYP							(P1_JOYP),
	.IF								(IF),
	.STAT								(STAT),
	.SCY								(SCY),
	.SCX								(SCX),
	.VBK								(VBK),
	.BRLO								(BRLO),
	.HDMA1							(HDMA1),
	.HDMA2							(HDMA2),
	.HDMA3							(HDMA3),
	.HDMA4							(HDMA4),
	.HDMA5							(HDMA5),
	.BCPS_BGPI						(BCPS_BGPI),
	.OCPS_OBPI						(OCPS_OBPI),
	.SVBK								(SVBK),
	.IE								(IE),
	.ext_ram_bank_sel				(ext_ram_bank_sel),
	.boot_rom_switch				(boot_rom_switch)
	);

mbc mbc_inst(
	.address_bus_offset			(address_bus_offset),
	.address_bus_dma_rd			(address_bus_dma_rd),
	.address_bus_out				(address_bus_offset_to_cart_rom),
	.dma_sel_cart_rom				(dma_sel_cart_rom),
	.ext_ram_bank_sel				(ext_ram_bank_sel)
	);

dma_engine dma_engine_inst(
	.clk4_2							(clk4_2),
	.reset_n							(reset_n),
	.address_bus_dma_rd			(address_bus_dma_rd),
	.dma_data_mux_sel_address	(dma_data_mux_sel_address),
	.address_bus_dma_rd_we		(address_bus_dma_rd_we),
	.address_bus_dma_wr			(address_bus_dma_wr),
	.mem_enable_dma_rd			(mem_enable_dma_rd),
	.mem_enable_dma_wr			(mem_enable_dma_wr),
	.dma_sel_boot_rom				(dma_sel_boot_rom),
	.dma_sel_cart_rom				(dma_sel_cart_rom),
	.dma_sel_ext_ram_bank0		(dma_sel_ext_ram_bank0),
	.dma_sel_ext_ram_bank1		(dma_sel_ext_ram_bank1),
	.dma_sel_ext_ram_bank2		(dma_sel_ext_ram_bank2),
	.dma_sel_ext_ram_bank3		(dma_sel_ext_ram_bank3),
	.dma_sel_work_ram_bank0		(dma_sel_work_ram_bank0),
	.dma_sel_work_ram_bank1		(dma_sel_work_ram_bank1),
	.dma_sel_work_ram_bank2		(dma_sel_work_ram_bank2),
	.dma_sel_work_ram_bank3		(dma_sel_work_ram_bank3),
	.dma_sel_work_ram_bank4		(dma_sel_work_ram_bank4),
	.dma_sel_work_ram_bank5		(dma_sel_work_ram_bank5),
	.dma_sel_work_ram_bank6		(dma_sel_work_ram_bank6),
	.dma_sel_work_ram_bank7		(dma_sel_work_ram_bank7),
	.dma_sel_VRAM_bank0			(dma_sel_VRAM_bank0),
	.dma_sel_VRAM_bank1			(dma_sel_VRAM_bank1),
	.dma_sel_OAM					(dma_sel_OAM),
	.wr_en_VRAM_bank0_dma_wr	(wr_en_VRAM_bank0_dma_wr),
	.wr_en_VRAM_bank1_dma_wr	(wr_en_VRAM_bank1_dma_wr),
	.wr_en_oam_dma_wr				(wr_en_oam_dma_wr),
	.HDMA1							(HDMA1),
	.HDMA2							(HDMA2),
	.HDMA3							(HDMA3),
	.HDMA4							(HDMA4),
	.HDMA5							(HDMA5),
	.DMA_start						(DMA_start),
	.boot_rom_switch				(boot_rom_switch),
	.ext_ram_bank_sel				(ext_ram_bank_sel),
	.SVBK								(SVBK),
	.VBK								(VBK),
	.GDMA_finished					(GDMA_finished)
	);

ppu ppu_inst(
	.clk_ppu							(clk25_2),
	.clk4_2							(clk4_2),
	.reset_n							(reset_n),
	.address_bus_offset			(address_bus_offset),
	.address_bus_dma_rd			(address_bus_dma_rd),
	.address_bus_dma_wr			(address_bus_dma_wr),
	.mem_enable						(address_bus_we),
	.mem_enable_dma_rd			(mem_enable_dma_rd),
	.mem_enable_dma_wr			(mem_enable_dma_wr),
	.data_in							(data_bus_cpu_out),
	.data_in_dma_wr				(data_dma),
	.data_out_VRAM_bank0			(data_VRAM_bank0),
	.data_out_VRAM_bank1			(data_VRAM_bank1),
	.data_out_oam					(data_oam),
	.mem_we							(mem_we),
	.wr_en_VRAM_bank0				(wr_en_VRAM_bank0),
	.wr_en_VRAM_bank1				(wr_en_VRAM_bank1),
	.wr_en_oam						(wr_en_oam),
	.wr_en_VRAM_bank0_dma_wr	(wr_en_VRAM_bank0_dma_wr),
	.wr_en_VRAM_bank1_dma_wr	(wr_en_VRAM_bank1_dma_wr),
	.wr_en_oam_dma_wr				(wr_en_oam_dma_wr),
	.dma_sel_VRAM_bank0			(dma_sel_VRAM_bank0),
	.dma_sel_VRAM_bank1			(dma_sel_VRAM_bank1),
	.dma_sel_OAM					(dma_sel_OAM),
	.data_out_background_palette_mem	(data_background_palette_mem),
	.data_out_sprite_palette_mem		(data_sprite_palette_mem),
	.STAT_mode						(STAT_mode),
	.OCPS_OBPI						(OCPS_OBPI),
	.BCPS_BGPI						(BCPS_BGPI),
	.LCDC								(LCDC),
	.v_blank_int_sig				(v_blank_int_sig),
	.counterY						(counterY)
	);

memory memory_inst(
	.clk4_2							(clk4_2),
	.reset_n							(reset_n),
	.address_bus_offset			(address_bus_offset),
	.address_bus_dma_rd			(address_bus_dma_rd),
	.mem_enable						(address_bus_we),
	.mem_enable_dma_rd			(mem_enable_dma_rd),
	.data_in							(data_bus_cpu_out),
	.dma_sel_boot_rom				(dma_sel_boot_rom),
	.dma_sel_ext_ram_bank0		(dma_sel_ext_ram_bank0),
	.dma_sel_ext_ram_bank1		(dma_sel_ext_ram_bank1),
	.dma_sel_ext_ram_bank2		(dma_sel_ext_ram_bank2),
	.dma_sel_ext_ram_bank3		(dma_sel_ext_ram_bank3),
	.dma_sel_work_ram_bank0		(dma_sel_work_ram_bank0),
	.dma_sel_work_ram_bank1		(dma_sel_work_ram_bank1),
	.dma_sel_work_ram_bank2		(dma_sel_work_ram_bank2),
	.dma_sel_work_ram_bank3		(dma_sel_work_ram_bank3),
	.dma_sel_work_ram_bank4		(dma_sel_work_ram_bank4),
	.dma_sel_work_ram_bank5		(dma_sel_work_ram_bank5),
	.dma_sel_work_ram_bank6		(dma_sel_work_ram_bank6),
	.dma_sel_work_ram_bank7		(dma_sel_work_ram_bank7),
	.data_out_boot_ROM			(data_boot_ROM),
	.data_out_ext_ram_bank0		(data_ext_ram_bank0),
	.data_out_ext_ram_bank1		(data_ext_ram_bank1),
	.data_out_ext_ram_bank2		(data_ext_ram_bank2),
	.data_out_ext_ram_bank3		(data_ext_ram_bank3),
	.data_out_work_ram_bank0	(data_work_ram_bank0),
	.data_out_work_ram_bank1	(data_work_ram_bank1),
	.data_out_work_ram_bank2	(data_work_ram_bank2),
	.data_out_work_ram_bank3	(data_work_ram_bank3),
	.data_out_work_ram_bank4	(data_work_ram_bank4),
	.data_out_work_ram_bank5	(data_work_ram_bank5),
	.data_out_work_ram_bank6	(data_work_ram_bank6),
	.data_out_work_ram_bank7	(data_work_ram_bank7),
	.data_out_high_ram			(data_high_ram),
	.wr_en_ext_ram_bank0			(wr_en_ext_ram_bank0),
	.wr_en_ext_ram_bank1			(wr_en_ext_ram_bank1),
	.wr_en_ext_ram_bank2			(wr_en_ext_ram_bank2),
	.wr_en_ext_ram_bank3			(wr_en_ext_ram_bank3),
	.wr_en_work_ram_bank0		(wr_en_work_ram_bank0),
	.wr_en_work_ram_bank1		(wr_en_work_ram_bank1),
	.wr_en_work_ram_bank2		(wr_en_work_ram_bank2),
	.wr_en_work_ram_bank3		(wr_en_work_ram_bank3),
	.wr_en_work_ram_bank4		(wr_en_work_ram_bank4),
	.wr_en_work_ram_bank5		(wr_en_work_ram_bank5),
	.wr_en_work_ram_bank6		(wr_en_work_ram_bank6),
	.wr_en_work_ram_bank7		(wr_en_work_ram_bank7),
	.wr_en_high_ram				(wr_en_high_ram)
	);

special_registers special_registers_inst(
	.clk4_2							(clk4_2),
	.reset_n							(reset_n),
	.write							(mem_we),
	.address_bus_offset			(address_bus_offset),
	.data_in							(data_bus_cpu_out),
	.STAT_mode						(STAT_mode),
	.STAT_coincidence_flag		(),
	.down_button					(down_button),
	.up_button						(up_button),
	.left_button					(left_button),
	.right_button					(right_button),
	.start_button					(start_button),
	.select_button					(select_button),
	.B_button						(B_button),
	.A_button						(A_button),
	.P1_JOYP							(P1_JOYP),
	.IF								(IF),
	.LCDC								(LCDC),
	.STAT								(STAT),
	.SCY								(SCY),
	.SCX								(SCX),
	.VBK								(VBK),
	.BRLO								(BRLO),
	.HDMA1							(HDMA1),
	.HDMA2							(HDMA2),
	.HDMA3							(HDMA3),
	.HDMA4							(HDMA4),
	.HDMA5							(HDMA5),
	.DMA_start						(DMA_start),
	.GDMA_finished					(GDMA_finished),
	.BCPS_BGPI						(BCPS_BGPI),
	.OCPS_OBPI						(OCPS_OBPI),
	.SVBK								(SVBK),
	.IE								(IE),
	.IME								(IME),
	.v_blank_int_sig				(v_blank_int_sig),
	.cpu_v_blank_int_clear		(cpu_v_blank_int_clear),
	.v_blank_int_req				(v_blank_int_req),
	.lcd_stat_int_sig				(lcd_stat_int_sig),
	.cpu_lcd_stat_int_clear		(cpu_lcd_stat_int_clear),
	.lcd_stat_int_req				(lcd_stat_int_req),
	.timer_int_sig					(timer_int_sig),
	.cpu_timer_int_clear			(cpu_timer_int_clear),
	.timer_int_req					(timer_int_req),
	.serial_int_sig				(serial_int_sig),
	.cpu_serial_int_clear		(cpu_serial_int_clear),
	.serial_int_req				(serial_int_req),
	.joypad_int_sig				(joypad_int_sig),
	.cpu_joypad_int_clear		(cpu_joypad_int_clear),
	.joypad_int_req				(joypad_int_req),
	.counterY						(counterY)
	);

// TEMP - DELETE
assign lcd_stat_int_sig = 1'b0;
assign timer_int_sig = 1'b0;
assign serial_int_sig = 1'b0;
assign joypad_int_sig = 1'b0;
// END TEMP

always @(posedge clk25_2 or negedge reset_n) begin
	if (!reset_n) begin
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
