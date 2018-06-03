`timescale 1ns / 1ps

module special_registers(
	clk4_2,
	reset_n,
	write,
	address_bus_offset,
	data_in,
	STAT_mode,
	STAT_coincidence_flag,
	down_button,
	up_button,
	left_button,
	right_button,
	start_button,
	select_button,
	B_button,
	A_button,
	P1_JOYP,
	IF,
	LCDC,
	STAT,
	SCY,
	SCX,
	VBK,
	BRLO,
	HDMA1,
	HDMA2,
	HDMA3,
	HDMA4,
	HDMA5,
	DMA_start,
	GDMA_finished,
	BCPS_BGPI,
	OCPS_OBPI,
	SVBK,
	IE,
	IME,
	v_blank_int_sig,
	cpu_v_blank_int_clear,
	v_blank_int_req,
	lcd_stat_int_sig,
	cpu_lcd_stat_int_clear,
	lcd_stat_int_req,
	timer_int_sig,
	cpu_timer_int_clear,
	timer_int_req,
	serial_int_sig,
	cpu_serial_int_clear,
	serial_int_req,
	joypad_int_sig,
	cpu_joypad_int_clear,
	joypad_int_req,
	counterY
	);

input						clk4_2;
input						reset_n;
input						write;
input			[15:0]	address_bus_offset;
input			[7:0]		data_in;
input			[1:0]		STAT_mode;
input						STAT_coincidence_flag;
input						down_button;
input						up_button;
input						left_button;
input						right_button;
input						start_button;
input						select_button;
input						B_button;
input						A_button;
input						IME;
input						v_blank_int_sig, cpu_v_blank_int_clear;
input						lcd_stat_int_sig, cpu_lcd_stat_int_clear;
input						timer_int_sig, cpu_timer_int_clear;
input						serial_int_sig, cpu_serial_int_clear;
input						joypad_int_sig, cpu_joypad_int_clear;
input						GDMA_finished;
input			[7:0]		counterY;

output	 	[7:0]		P1_JOYP;
output	 	[7:0]		IF;
output reg	[7:0]		LCDC;
output		[7:0]		STAT;
output reg	[7:0]		SCY;
output reg	[7:0]		SCX;
output reg	[7:0]		LY;
output reg 	[7:0]		VBK;
output reg 	[7:0]		BRLO;
output reg 	[7:0]		HDMA1;
output reg 	[7:0]		HDMA2;
output reg 	[7:0]		HDMA3;
output reg 	[7:0]		HDMA4;
output reg 	[7:0]		HDMA5;
output reg				DMA_start;
output reg 	[7:0]		BCPS_BGPI;
output reg 	[7:0]		OCPS_OBPI;
output reg 	[7:0]		SVBK;
output reg 	[7:0]		IE;

// Interrupts
output					v_blank_int_req;
output					lcd_stat_int_req;
output					timer_int_req;
output					serial_int_req;
output					joypad_int_req;


reg 			[1:0]		P1_JOYP_reg;
reg 			[4:0]		STAT_reg;
reg			[7:0]		IF_reg;
reg						v_blank_int_set, v_blank_int_clear, lcd_stat_int_set, lcd_stat_int_clear, timer_int_set, timer_int_clear;
reg						serial_int_set, serial_int_clear, joypad_int_set, joypad_int_clear;
reg						LY_count_reset;
wire						LY_counter_reset;
wire						down, up, left, right, start, select, B, A;

// 0xFF00 - P1/JOYP - (R/W) - Joypad
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		P1_JOYP_reg[1:0] <= 2'b11;
	end
	else begin
		if ((address_bus_offset == 16'hFF00) && (write)) begin
			P1_JOYP_reg[1:0] <= data_in[5:4];
		end
	end
end
assign P1_JOYP	= {2'b00, P1_JOYP_reg, (down || start), (up || select), (left || B), (right || A)};
assign down		= P1_JOYP_reg[0] && down_button;
assign up		= P1_JOYP_reg[0] && up_button;
assign left		= P1_JOYP_reg[0] && left_button;
assign right	= P1_JOYP_reg[0] && right_button;
assign start	= P1_JOYP_reg[1] && start_button;
assign select	= P1_JOYP_reg[1] && select_button;
assign B			= P1_JOYP_reg[1] && B_button;
assign A			= P1_JOYP_reg[1] && A_button;

// 0xFF0F - IF - (R/W) - Interrupt Flag
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		v_blank_int_set <= 1'b0;
		v_blank_int_clear <= 1'b0;
		lcd_stat_int_set <= 1'b0;
		lcd_stat_int_clear <= 1'b0;
		timer_int_set <= 1'b0;
		timer_int_clear <= 1'b0;
		serial_int_set <= 1'b0;
		serial_int_clear <= 1'b0;
		joypad_int_set <= 1'b0;
		joypad_int_clear <= 1'b0;
	end
	else begin
		if ((address_bus_offset == 16'hFF0F) && (write)) begin
			if (data_in[0]) begin
				v_blank_int_set <= 1'b1;
			end
			else begin
				v_blank_int_clear <= 1'b1;
			end
			
			if (data_in[1]) begin
				lcd_stat_int_set <= 1'b1;
			end
			else begin
				lcd_stat_int_clear <= 1'b1;
			end
			
			if (data_in[2]) begin
				timer_int_set <= 1'b1;
			end
			else begin
				timer_int_clear <= 1'b1;
			end
			
			if (data_in[3]) begin
				serial_int_set <= 1'b1;
			end
			else begin
				serial_int_clear <= 1'b1;
			end
			
			if (data_in[4]) begin
				joypad_int_set <= 1'b1;
			end
			else begin
				joypad_int_clear <= 1'b1;
			end
		end
		else begin
			v_blank_int_set <= 1'b0;
			v_blank_int_clear <= 1'b0;
			lcd_stat_int_set <= 1'b0;
			lcd_stat_int_clear <= 1'b0;
			timer_int_set <= 1'b0;
			timer_int_clear <= 1'b0;
			serial_int_set <= 1'b0;
			serial_int_clear <= 1'b0;
			joypad_int_set <= 1'b0;
			joypad_int_clear <= 1'b0;
		end
	end
end
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		IF_reg <= 8'h00;
	end
	else begin
		IF_reg <= {IF[7:5], IF[4], IF[3], IF[2], IF[1], IF[0]};
	end
end
// V Blank Interrupt
assign IF[0] = ((v_blank_int_sig || IF_reg[0]) && !(v_blank_int_clear || cpu_v_blank_int_clear)) || v_blank_int_set;
assign v_blank_int_req = IF[0] && IE[0] && IME;
// LCD STAT Interrupt
assign IF[1] = ((lcd_stat_int_sig || IF_reg[1]) && !(lcd_stat_int_clear || cpu_lcd_stat_int_clear)) || lcd_stat_int_set;
assign lcd_stat_int_req = IF[1] && IE[1] && IME;
// Timer Interrupt
assign IF[2] = ((timer_int_sig || IF_reg[2]) && !(timer_int_clear || cpu_timer_int_clear)) || timer_int_set;
assign timer_int_req = IF[2] && IE[2] && IME;
// Serial Interrupt
assign IF[3] = ((serial_int_sig || IF_reg[3]) && !(serial_int_clear || cpu_serial_int_clear)) || serial_int_set;
assign serial_int_req = IF[3] && IE[3] && IME;
// Joypad Interrupt
assign IF[4] = ((joypad_int_sig || IF_reg[4]) && !(joypad_int_clear || cpu_joypad_int_clear)) || joypad_int_set;
assign joypad_int_req = IF[4] && IE[4] && IME;
// Set the rest of the IF bits that aren't used
assign IF[7:5] = 3'b000;

// 0xFF40 - LCDC - (R/W) - LCD Control
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		LCDC <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF40) && (write)) begin
			LCDC <= data_in;
		end
	end
end

// 0xFF41 - STAT - (R/W) - LCDC Status
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		STAT_reg <= 5'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF41) && (write)) begin
			STAT_reg[4:0] <= data_in[7:3];
		end
	end
end
assign STAT[7:0] = {STAT_reg, STAT_coincidence_flag, STAT_mode};

// 0xFF42 - SCY - (R/W) - Scroll Y
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		SCY <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF42) && (write)) begin
			SCY <= data_in;
		end
	end
end

// 0xFF43 - SCX - (R/W) - Scroll X
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		SCY <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF43) && (write)) begin
			SCY <= data_in;
		end
	end
end

// 0xFF44 - LY - (R) - LCDC Y-Coordinate
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		LY_count_reset <= 1'b0;
	end
	else begin
		if ((address_bus_offset == 16'hFF44) && (write)) begin
			LY_count_reset <= 1'b1;
		end
		else begin
			LY_count_reset <= 1'b0;
		end
	end
end
assign LY_counter_reset = (LY_count_reset || LY_counter_reset) && (counterY > 8'h00);
always @(*) begin
	if (LY_counter_reset) begin
		LY = 8'h00;
	end
	else begin
		LY = counterY;
	end
end

// 0xFF45 - LYC - (R/W) - LY Compare
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		LYC <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF45) && (write)) begin
			LYC <= data_in;
		end
	end
end

// 0xFF47 - VBK - (R/W) - VRAM Bank Control
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		VBK <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF47) && (write)) begin
			VBK <= data_in;
		end
	end
end

// 0xFF50 - BRLO - (R/W) - Boot ROM Lock Out
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		BRLO <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF50) && (write)) begin
			BRLO <= data_in;
		end
	end
end

// 0xFF51 - HDMA1 - (R/W) - New DMA Source, High
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		HDMA1 <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF51) && (write)) begin
			HDMA1 <= data_in;
		end
	end
end

// 0xFF52 - HDMA2 - (R/W) - New DMA Source, Low
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		HDMA2 <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF52) && (write)) begin
			HDMA2 <= data_in;
		end
	end
end

// 0xFF53 - HDMA3 - (R/W) - New DMA Destination, High
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		HDMA3 <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF53) && (write)) begin
			HDMA3 <= data_in;
		end
	end
end

// 0xFF54 - HDMA4 - (R/W) - New DMA Destination, Low
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		HDMA4 <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF54) && (write)) begin
			HDMA4 <= data_in;
		end
	end
end

// 0xFF55 - HDMA5 - (R/W) - New DMA Length/Mode/Start
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		HDMA5 <= 8'h00;
		DMA_start <= 1'b0;
	end
	else begin
		if ((address_bus_offset == 16'hFF55) && (write)) begin
			HDMA5 <= data_in;
			DMA_start <= 1'b1;
			$stop;
		end
		else if (GDMA_finished) begin
			HDMA5 <= 8'hFF;
			DMA_start <= 1'b0;
		end
		else begin
			HDMA5 <= HDMA5;
			DMA_start <= 1'b0;
		end
	end
end

// 0xFF68 - BCPS/BGPI - (R/W) - Background Palette Index
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		BCPS_BGPI <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF68) && (write)) begin
			BCPS_BGPI <= data_in;
		end
		else if ((address_bus_offset == 16'hFF69) && (write)) begin // Auto increment
			if (BCPS_BGPI[7]) begin
				if (BCPS_BGPI[5:0] == 6'b111111) begin
					BCPS_BGPI[5:0] <= 6'h00;
				end
				else begin
					BCPS_BGPI[5:0] <= BCPS_BGPI[5:0] + 6'h01;
				end
			end
		end
	end
end

// 0xFF6A - OCPS/OBPI - (R/W) - Sprite Palette Index
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		OCPS_OBPI <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF6A) && (write)) begin
			OCPS_OBPI <= data_in;
		end
		else if ((address_bus_offset == 16'hFF6B) && (write)) begin // Auto increment
			if (OCPS_OBPI[7]) begin
				if (OCPS_OBPI[5:0] == 6'b111111) begin
					OCPS_OBPI[5:0] <= 6'h00;
				end
				else begin
					OCPS_OBPI[5:0] <= OCPS_OBPI[5:0] + 6'h01;
				end
			end
		end
	end
end

// 0xFF70 - SVBK - (R/W) - Work RAM Bank Control
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		SVBK <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFF70) && (write)) begin
			SVBK <= data_in;
		end
	end
end

// 0xFFFF - IE - (R/W) - Interrupt Enable
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		IE <= 8'h00;
	end
	else begin
		if ((address_bus_offset == 16'hFFFF) && (write)) begin
			IE <= data_in;
		end
	end
end


endmodule
