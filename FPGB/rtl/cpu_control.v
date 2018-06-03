module cpu_control(
	clk4_2,
	reset_n,
	IR,
	CB_IR,
	F,
	control_word,
	v_blank_int_req,
	lcd_stat_int_req,
	timer_int_req,
	serial_int_req,
	joypad_int_req,
	cpu_v_blank_int_clear,
	cpu_lcd_stat_int_clear,
	cpu_timer_int_clear,
	cpu_serial_int_clear,
	cpu_joypad_int_clear,
	DMA_start,
	GDMA_finished
	);

`include "control_word.vh"

input								clk4_2;
input								reset_n;
input			[7:0]				IR;
input			[7:0]				CB_IR;
input			[7:0]				F;
input								v_blank_int_req;
input								lcd_stat_int_req;
input								timer_int_req;
input								serial_int_req;
input								joypad_int_req;
input								DMA_start;
input								GDMA_finished;
output reg	[CTRL_MSB:0]	control_word;
output reg						cpu_v_blank_int_clear;
output reg						cpu_lcd_stat_int_clear;
output reg						cpu_timer_int_clear;
output reg						cpu_serial_int_clear;
output reg						cpu_joypad_int_clear;

reg	[3:0]				T_state, next_T_state, next_T_state_decoder, next_T_state_prefixCB;
reg	[CTRL_MSB:0]	decode_control_word, control_word_prefixCB;

reg						service_isr;

reg						cpu_halt;

wire	[4:0]				interrupts;

assign interrupts = {joypad_int_req, serial_int_req, timer_int_req, lcd_stat_int_req, v_blank_int_req};

// State Machine
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		T_state <= 4'b1111;
	end
	else begin
		T_state <= next_T_state;
	end
end

always @(*) begin
	case (T_state)
		4'b0000 : begin
			control_word = 0; // Do this so we can come back to this state at the end of an instruction without having to clean up
			if (DMA_start || cpu_halt) begin
				next_T_state = 4'b0000;
				if (GDMA_finished) begin
					cpu_halt = 1'b0;
				end
				else begin
					cpu_halt = 1'b1;
				end
			end
			else if (|interrupts) begin
				next_T_state = 4'b0010;
				service_isr = 1'b1;
			end
			else begin
				next_T_state = 4'b0001;
				control_word[ADDR_BUS_WR] = 1'b1;
				control_word[PC_INC] = 1'b1;
				service_isr = 1'b0;
			end
		end
				
		4'b0001 : begin
			next_T_state = 4'b0010;
			control_word[ADDR_BUS_WR] = 1'b0;
			control_word[PC_INC] = 1'b0;
			control_word[IR_WR] = 1'b1;
			control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0000;
		end
				
		4'b0010 : begin
			control_word[IR_WR] = 1'b0;
			next_T_state = next_T_state_decoder;
			control_word = decode_control_word;
		end
		
		default : begin
			next_T_state = next_T_state_decoder;
			control_word = decode_control_word;
		end
		
		4'b1111 : begin // Reset state
			next_T_state = 4'b0000;
			control_word = 0;
			service_isr = 1'b0;
			cpu_halt = 1'b0;
		end
	endcase
end

// Decode logic
always @(*) begin
	// Default
	decode_control_word = 0;
	cpu_v_blank_int_clear = 1'b0;
	cpu_lcd_stat_int_clear = 1'b0;
	cpu_timer_int_clear = 1'b0;
	cpu_serial_int_clear = 1'b0;
	cpu_joypad_int_clear = 1'b0;
	
	if (service_isr) begin
		if (T_state == 4'b0010) begin
			next_T_state_decoder = 4'b0011;
			decode_control_word[SP_DEC] = 1'b1; // Decrement SP
			decode_control_word[IME_RESET] = 1'b1; // Turn interrupts off
		end
		else if (T_state == 4'b0011) begin
			next_T_state_decoder = 4'b0100;
			decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
			decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1111; // Put PC[15:8] onto data bus
			decode_control_word[SP_DEC] = 1'b1; // Decrement SP again
			decode_control_word[IME_RESET] = 1'b0;
			decode_control_word[ADDR_BUS_WR] = 1'b1;
			decode_control_word[MEM_WR] = 1'b1;
		end
		else if (T_state == 4'b0100) begin
			next_T_state_decoder = 4'b0000;
			decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
			decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1011; // Put PC[7:0] onto data bus
			decode_control_word[SP_DEC] = 1'b0;
			decode_control_word[ADDR_BUS_WR] = 1'b1;
			decode_control_word[MEM_WR] = 1'b1;
			// Clear interrupt in priority order and update PC with intererupt vector
			if (interrupts[0]) begin
				cpu_v_blank_int_clear = 1'b1;
				decode_control_word[PC_WR_V_BLANK_INT] = 1'b1;
			end
			else if (interrupts[1]) begin
				cpu_lcd_stat_int_clear = 1'b1;
				decode_control_word[PC_WR_LCD_STAT_INT] = 1'b1;
			end
			else if (interrupts[2]) begin
				cpu_timer_int_clear = 1'b1;
				decode_control_word[PC_WR_TIMER_INT] = 1'b1;
			end
			else if (interrupts[3]) begin
				cpu_serial_int_clear = 1'b1;
				decode_control_word[PC_WR_SERIAL_INT] = 1'b1;
			end
			else begin
				cpu_joypad_int_clear = 1'b1;
				decode_control_word[PC_WR_JOYPAD_INT] = 1'b1;
			end
		end
	end
	else begin
		case (IR)
			// NOP								- 0x00
			8'h00 : begin 
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word = 0;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word = 0;
				end
			end
			
			// LD BC, nn						- 0x01
			8'h01 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[C_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[C_WR] = 1'b0;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[B_WR] = 1'b1;
				end
			end
			
			// LD (BC), A						- 0x02
			8'h02 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0011; // Put BC on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0001; // Put A onto data bus
					decode_control_word[MEM_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
			end
			
			// INC BC							- 0x03
			8'h03 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1000;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00010;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[C_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[C_WR] = 1'b0;
					decode_control_word[B_WR] = 1'b1;
				end
			end
			
			// INC B								- 0x04
			8'h04 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0010; // B to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00100;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[B_INC] = 1'b1;
				end
			end
			
			// DEC B								- 0x05
			8'h05 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0010; // B to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00111;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[B_DEC] = 1'b1;
				end
			end
			
			// LD B, d8							- 0x06
			8'h06 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[B_WR] = 1'b1;
				end
			end
			
			// RLCA								- 0x07
			8'h07 : begin 
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01010; // Rotate left operation
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // Select A into ALU
					decode_control_word[ALU_OUT_WR] = 1'b1;
					decode_control_word[A_WR_RLCA] = 1'b1;
				end
			end
			
			// LD (nn), SP						- 0x08
			8'h08 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[Z_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0111;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
				end
				else if (T_state == 4'b0111) begin
					next_T_state_decoder = 4'b1000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[W_WR] = 1'b0;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0001; // Put W and Z onto addr bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1001; // Put SP[7:0] onto data bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
				else if (T_state == 4'b1000) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0010;   // Put W and Z + 1 onto addr bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1010; // Put SP[15:8] onto data bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// ADD HL, BC						- 0x09
			8'h09 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1010;
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b1000;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00000;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[L_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[L_WR] = 1'b0;
					decode_control_word[H_WR] = 1'b1;
				end
			end
			
			// LD A, (BC)						- 0x0A
			8'h0A : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[A_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
			end
			
			// DEC BC							- 0x0B
			8'h0B : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1000;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00011;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[C_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[C_WR] = 1'b0;
					decode_control_word[B_WR] = 1'b1;
				end
			end
			
			// INC C								- 0x0C
			8'h0C : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0011; // C to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00100;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[C_INC] = 1'b1;
				end
			end
			
			// DEC C								- 0x0D
			8'h0D : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0011; // C to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00111;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[C_DEC] = 1'b1;
				end
			end
			
			// LD C, d8							- 0x0E
			8'h0E : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[C_WR] = 1'b1;
				end
			end
			
			// RRCA								- 0x0F
			8'h0F : begin 
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b10001; // Rotate right operation
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // Select A into ALU
					decode_control_word[ALU_OUT_WR] = 1'b1;
					decode_control_word[A_WR_RRCA] = 1'b1;
				end
			end
			
			// STOP								- 0x10
			8'h10 : begin
				
			end
			
			// LD DE, nn						- 0x11
			8'h11 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[E_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[E_WR] = 1'b0;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[D_WR] = 1'b1;
				end
			end
			
			// LD (DE), A						- 0x12
			8'h12 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0100; // Put DE on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0001; // Put A onto data bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// INC DE							- 0x13
			8'h13 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1001;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00010;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[E_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[E_WR] = 1'b0;
					decode_control_word[D_WR] = 1'b1;
				end
			end
			
			// INC D								- 0x14
			8'h14 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0100; // D to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00100;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[D_INC] = 1'b1;
				end
			end
			
			// DEC D								- 0x15
			8'h15 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0100; // D to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00111;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[D_DEC] = 1'b1;
				end
			end
			
			// LD D, d8							- 0x16
			8'h16 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[D_WR] = 1'b1;
				end
			end
			
			// RLA								- 0x17
			8'h17 : begin 
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01010; // Rotate left operation
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // Select A into ALU
					decode_control_word[ALU_OUT_WR] = 1'b1;
					decode_control_word[A_WR_RLA] = 1'b1;
				end
			end
			
			// JR n								- 0x18
			8'h18 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[PC_WR] = 1'b1;
				end
			end
			
			// ADD HL, DE						- 0x19
			8'h19 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1010;
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b1001;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00000;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[L_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[L_WR] = 1'b0;
					decode_control_word[H_WR] = 1'b1;
				end
			end
			
			// LD A, (DE)						- 0x1A
			8'h1A : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0100;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[A_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
			end
			
			// DEC DE							- 0x1B
			8'h1B : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1001;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00011;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[E_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[E_WR] = 1'b0;
					decode_control_word[D_WR] = 1'b1;
				end
			end
			
			// INC E								- 0x1C
			8'h1C : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0101; // E to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00100;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[E_INC] = 1'b1;
				end
			end
			
			// LD E, d8							- 0x1E
			8'h1E : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[E_WR] = 1'b1;
				end
			end
			
			// RRA								- 0x1F
			8'h1F : begin 
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b10001; // Rotate right operation
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // Select A into ALU
					decode_control_word[ALU_OUT_WR] = 1'b1;
					decode_control_word[A_WR_RRA] = 1'b1;
				end
			end
			
			// JR NZ, n							- 0x20
			8'h20 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					if (!F[7]) begin
						decode_control_word[PC_WR] = 1'b1;
					end
				end
			end
			
			// LD HL, nn						- 0x21
			8'h21 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[L_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[L_WR] = 1'b0;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[H_WR] = 1'b1;
				end
			end
			
			// LD (HL+), A						- 0x22
			8'h22 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Put HL on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0001; // Put A onto data bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
					decode_control_word[ADDR_BUS_INC_WR] = 1'b1;
				end
			end
			
			// INC HL							- 0x23
			8'h23 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1010;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00010;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[L_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[L_WR] = 1'b0;
					decode_control_word[H_WR] = 1'b1;
				end
			end
			
			// INC H								- 0x24
			8'h24 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0110; // H to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00100;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[H_INC] = 1'b1;
				end
			end
			
			// LD H, d8							- 0x26
			8'h26 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[H_WR] = 1'b1;
				end
			end
			
			// JR Z, n							- 0x28
			8'h28 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					if (F[7]) begin
						decode_control_word[PC_WR] = 1'b1;
					end
				end
			end
			
			// ADD HL, HL						- 0x29
			8'h29 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1010;
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b1010;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00000;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[L_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[L_WR] = 1'b0;
					decode_control_word[H_WR] = 1'b1;
				end
			end
			
			// LD A, (HL+)						- 0x2A
			8'h2A : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101;
					decode_control_word[A_WR] = 1'b1;
					decode_control_word[ADDR_BUS_INC_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
			end
			
			// DEC HL							- 0x2B
			8'h2B : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1010;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00011;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[L_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[L_WR] = 1'b0;
					decode_control_word[H_WR] = 1'b1;
				end
			end
			
			// INC L								- 0x2C
			8'h2C : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0111; // L to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00100;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[L_INC] = 1'b1;
				end
			end
			
			// LD L, d8							- 0x2E
			8'h2E : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[L_WR] = 1'b1;
				end
			end
			
			// CPL								- 0x2F
			8'h2F : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // A to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00110;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[A_WR_CPL] = 1'b1;
				end
			end
			
			// JR NC, n							- 0x30
			8'h30 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					if (!F[4]) begin
						decode_control_word[PC_WR] = 1'b1;
					end
				end
			end
			
			// LD SP, nn						- 0x31
			8'h31 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[SP_WR_LSB] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[SP_WR_LSB] = 1'b0;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[SP_WR_MSB] = 1'b1;
				end
			end
			
			// LD (HL-), A						- 0x32
			8'h32 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Put HL on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0001; // Put A onto data bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
					decode_control_word[ADDR_BUS_DEC_WR] = 1'b1;
				end
			end
			
			// INC SP							- 0x33
			8'h33 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1011;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00010;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[SP_WR_LSB] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[SP_WR_LSB] = 1'b0;
					decode_control_word[SP_WR_MSB] = 1'b1;
				end
			end
			
			// INC (HL)							- 0x34
			8'h34 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Put HL on the address bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1100; // data_bus to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00100;  // Increment operation
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags and put incremented result at ALU output
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100; // Put lower byte from ALU out onto databus
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// JR C, n							- 0x38
			8'h38 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					if (F[4]) begin
						decode_control_word[PC_WR] = 1'b1;
					end
				end
			end
			
			// ADD HL, SP						- 0x39
			8'h39 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1010;
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b1011;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00000;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[L_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[L_WR] = 1'b0;
					decode_control_word[H_WR] = 1'b1;
				end
			end
			
			// LD A, (HL-)						- 0x3A
			8'h3A : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101;
					decode_control_word[A_WR] = 1'b1;
					decode_control_word[ADDR_BUS_DEC_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
			end
			
			// DEC SP							- 0x3B
			8'h3B : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1011;
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00011;
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100;
					decode_control_word[ALU_OUT_WR] = 1'b0;
					decode_control_word[SP_WR_LSB] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1101;
					decode_control_word[SP_WR_LSB] = 1'b0;
					decode_control_word[SP_WR_MSB] = 1'b1;
				end
			end
			
			// INC A								- 0x3C
			8'h3C : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // A to ALU
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00100;
					decode_control_word[ALU_OUT_WR] = 1'b1; // To write flags
					decode_control_word[A_INC] = 1'b1;
				end
			end
			
			// LD A, d8							- 0x3E
			8'h3E : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[A_WR] = 1'b1;
				end
			end
			
			// LD B, E							- 0x43
			8'h43 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0101; // Put E on data_bus
					decode_control_word[B_WR] = 1'b1;
				end
			end
			
			// LD B, A							- 0x47
			8'h47 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0001; // Put A on data_bus
					decode_control_word[B_WR] = 1'b1;
				end
			end
			
			// LD C, D							- 0x4A
			8'h4A : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0100; // Put D on data_bus
					decode_control_word[C_WR] = 1'b1;
				end
			end
			
			// LD C, H							- 0x4C
			8'h4C : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0111; // Put H on data_bus
					decode_control_word[C_WR] = 1'b1;
				end
			end
			
			// LD E, B							- 0x58
			8'h58 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0010; // Put B on data_bus
					decode_control_word[E_WR] = 1'b1;
				end
			end
			
			// LD A, C							- 0x79
			8'h79 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0011; // Put C on data_bus
					decode_control_word[A_WR] = 1'b1;
				end
			end
			
			// LD A, E							- 0x7B
			8'h7B : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0101; // Put E on data_bus
					decode_control_word[A_WR] = 1'b1;
				end
			end
			
			// LD A, (HL)						- 0x7E
			8'h7E : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Put HL onto address bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[A_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
			end
			
			// XOR A								- 0xAF
			8'hAF : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // A to ALU input 0
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b0001; // A to ALU input 1
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b00101;  // Set ALU operation to XOR
					decode_control_word[ALU_OUT_WR] = 1'b1;
					decode_control_word[A_WR_XOR] = 1'b1; // Write ALU operation result into A
				end
			end
			
			// OR B								- 0xB0
			8'hB0 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // A to ALU input 0
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b0010; // B to ALU input 1
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01110;  // Set ALU operation to OR
					decode_control_word[ALU_OUT_WR] = 1'b1;
					decode_control_word[A_WR_OR] = 1'b1; // Write ALU operation result into A
				end
			end
			
			// CP (HL)							- 0xBE
			8'hBE : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Put HL on the address bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // A to ALU input 0
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b1100; // data_bus to ALU input 1
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01011; // Select compare operation in ALU
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
			end
			
			// POP BC							- 0xC1
			8'hC1 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[SP_INC] = 1'b1; // Increment SP
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[C_WR] = 1'b1;
					decode_control_word[SP_INC] = 1'b1; // Increment SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Keep SP on the address bus
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[C_WR] = 1'b0;
					decode_control_word[SP_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[B_WR] = 1'b1;
				end
			end
			
			// JP NZ, a16						- 0xC2
			8'hC2 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[Z_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[W_WR] = 1'b0;
					if (!F[7]) begin
						decode_control_word[PC_WR_WZ] = 1'b1;
					end
				end
			end
			
			// JP a16							- 0xC3
			8'hC3 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1; // Inc PC so it is ready for next cycle
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[PC_WR_LSB] = 1'b1; // Write LS Byte of PC while also capturing next address in ADDR reg
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b1; // Loads incremented address while PC LS Byte is overwritten at the same time
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_WR_MSB] = 1'b1; // Write MS Byte of PC
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
			end
			
			// PUSH BC							- 0xC5
			8'hC5 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0010; // Put B onto data bus
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; //Keep SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0011; // Put C onto data bus
					decode_control_word[SP_DEC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// RET								- 0xC9
			8'hC9 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[SP_INC] = 1'b1; // Increment SP
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Keep SP on the address bus
					decode_control_word[PC_WR_LSB] = 1'b1; // Write LS Byte of PC
					decode_control_word[SP_INC] = 1'b1; // Increment SP again
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_WR_MSB] = 1'b1; // Write MS Byte of PC
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[SP_INC] = 1'b0;
				end
			end
			
			// JP Z, a16						- 0xCA
			8'hCA : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[Z_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[W_WR] = 1'b0;
					if (F[7]) begin
						decode_control_word[PC_WR_WZ] = 1'b1;
					end
				end
			end
			
			// PREFIX CB						- 0xCB
			8'hCB : begin
				case (T_state)
					4'b0010 : begin
						next_T_state_decoder = 4'b0011;
						decode_control_word[ADDR_BUS_WR] = 1'b1;
						decode_control_word[PC_INC] = 1'b1;
					end
					4'b0011 : begin
						next_T_state_decoder = 4'b0100;
						decode_control_word[PC_INC] = 1'b0;
						decode_control_word[ADDR_BUS_WR] = 1'b0;
						decode_control_word[CB_IR_WR] = 1'b1;
					end
					default : begin
						next_T_state_decoder = next_T_state_prefixCB;
						decode_control_word = control_word_prefixCB;
					end
				endcase
			end
			
			// CALL Z, a16						- 0xCC
			8'hCC : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1; // Inc PC so it is ready for next cycle
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[Z_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1; // Inc PC again
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					if (F[7]) begin
						next_T_state_decoder = 4'b0101;
						decode_control_word[SP_DEC] = 1'b1; // Decrement SP
					end
					else begin
						next_T_state_decoder = 4'b0000;
						decode_control_word[SP_DEC] = 1'b0; // Don't Decrement SP and finish
					end
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b0;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1111; // Put PC[15:8] onto data bus
					decode_control_word[W_WR] = 1'b0;
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1011; // Put PC[7:0] onto data bus
					decode_control_word[SP_DEC] = 1'b0;
					decode_control_word[W_WR] = 1'b0;
					decode_control_word[PC_WR_WZ] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// CALL a16							- 0xCD
			8'hCD : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1; // Inc PC so it is ready for next cycle
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[Z_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[SP_DEC] = 1'b0;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1111; // Put PC[15:8] onto data bus
					decode_control_word[W_WR] = 1'b0;
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1011; // Put PC[7:0] onto data bus
					decode_control_word[SP_DEC] = 1'b0;
					decode_control_word[W_WR] = 1'b0;
					decode_control_word[PC_WR_WZ] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// POP DE							- 0xD1
			8'hD1 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[SP_INC] = 1'b1; // Increment SP
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[E_WR] = 1'b1;
					decode_control_word[SP_INC] = 1'b1; // Increment SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Keep SP on the address bus
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[E_WR] = 1'b0;
					decode_control_word[SP_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[D_WR] = 1'b1;
				end
			end
			
			// JP NC, a16						- 0xD2
			8'hD2 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[Z_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[W_WR] = 1'b0;
					if (!F[4]) begin
						decode_control_word[PC_WR_WZ] = 1'b1;
					end
				end
			end
			
			// PUSH DE							- 0xD5
			8'hD5 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0100; // Put D onto data bus
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; //Keep SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0101; // Put E onto data bus
					decode_control_word[SP_DEC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// SUB d8							- 0xD6
			8'hD6 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // A to ALU input 0
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b1100; // data_bus to ALU input 1
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b10000; // Select SUB operation in ALU
					decode_control_word[ALU_OUT_WR] = 1'b1;
					decode_control_word[A_WR_SUB] = 1'b1;
				end
			end
			
			// RETI								- 0xD9
			8'hD9 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[SP_INC] = 1'b1; // Increment SP
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Keep SP on the address bus
					decode_control_word[PC_WR_LSB] = 1'b1; // Write LS Byte of PC
					decode_control_word[SP_INC] = 1'b1; // Increment SP again
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_WR_MSB] = 1'b1; // Write MS Byte of PC
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[SP_INC] = 1'b0;
					decode_control_word[IME_SET] = 1'b1; // Enable interrupts
				end
			end
			
			// JP C, a16						- 0xDA
			8'hDA : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[Z_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[W_WR] = 1'b0;
					if (F[4]) begin
						decode_control_word[PC_WR_WZ] = 1'b1;
					end
				end
			end
			
			// CALL C, a16						- 0xDC
			8'hDC : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1; // Inc PC so it is ready for next cycle
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[Z_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[SP_DEC] = 1'b0;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1111; // Put PC[15:8] onto data bus
					decode_control_word[W_WR] = 1'b0;
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1011; // Put PC[7:0] onto data bus
					decode_control_word[SP_DEC] = 1'b0;
					decode_control_word[W_WR] = 1'b0;
					if (F[4]) begin
						decode_control_word[PC_WR_WZ] = 1'b1;
					end
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// LDH (a8), A						- 0xE0
			8'hE0 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1; // Get next byte
					decode_control_word[PC_INC] = 1'b1; // Inc PC so it is ready for next cycle
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[Z_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0110; // Put {0xFF, Z} on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0001; // Put A onto data bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// POP HL							- 0xE1
			8'hE1 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[SP_INC] = 1'b1; // Increment SP
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[L_WR] = 1'b1;
					decode_control_word[SP_INC] = 1'b1; // Increment SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Keep SP on the address bus
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[L_WR] = 1'b0;
					decode_control_word[SP_INC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[H_WR] = 1'b1;
				end
			end
			
			// LD (C), A						- 0xE2
			8'hE2 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b1000; // Put {0xFF, C} on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0001; // Put A onto data bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// PUSH HL							- 0xE5
			8'hE5 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0111; // Put H onto data bus
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; //Keep SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1000; // Put L onto data bus
					decode_control_word[SP_DEC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// AND d8							- 0xE6
			8'hE6 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // A to ALU input 0
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b1100; // data_bus to ALU input 1
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01100; // Select AND operation in ALU
					decode_control_word[ALU_OUT_WR] = 1'b1; // Write Flags from operation
					decode_control_word[A_WR_AND] = 1'b1; // Store result in A
				end
			end
			
			// LD (a16), A						- 0xEA
			8'hEA : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[Z_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[W_WR] = 1'b0;
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0001; // Put A onto data bus
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0001; // Put {W, Z} onto address bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// LD A, (C)						- 0xF2
			8'hF2 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b1000; // Put {0xFF, C} on the address bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[A_WR] = 1'b1;
				end
			end
			
			// DI									- 0xF3
			8'hF3 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[IME_RESET] = 1'b1;
				end
			end
			
			// PUSH AF							- 0xF5
			8'hF5 : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; // Put SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0001; // Put A onto data bus
					decode_control_word[SP_DEC] = 1'b1; // Decrement SP
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0111; //Keep SP on the address bus
					decode_control_word[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b0110; // Put F onto data bus
					decode_control_word[SP_DEC] = 1'b0;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[MEM_WR] = 1'b1;
				end
			end
			
			// LD A, (a16)						- 0xFA
			8'hFA : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0100;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
					decode_control_word[Z_WR] = 1'b1;
				end
				else if (T_state == 4'b0100) begin
					next_T_state_decoder = 4'b0101;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
				end
				else if (T_state == 4'b0101) begin
					next_T_state_decoder = 4'b0110;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[Z_WR] = 1'b0;
					decode_control_word[W_WR] = 1'b1;
				end
				else if (T_state == 4'b0110) begin
					next_T_state_decoder = 4'b0111;
					decode_control_word[W_WR] = 1'b0;
					decode_control_word[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0001; // Put {W, Z} onto address bus
					decode_control_word[ADDR_BUS_WR] = 1'b1;
				end
				else if (T_state == 4'b0111) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[A_WR] = 1'b1;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
				end
			end
			
			// EI									- 0xFB
			8'hFB : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[IME_SET] = 1'b1;
				end
			end
			
			// CP d8								- 0xFE
			8'hFE : begin
				if (T_state == 4'b0010) begin
					next_T_state_decoder = 4'b0011;
					decode_control_word[ADDR_BUS_WR] = 1'b1;
					decode_control_word[PC_INC] = 1'b1;
				end
				else if (T_state == 4'b0011) begin
					next_T_state_decoder = 4'b0000;
					decode_control_word[ADDR_BUS_WR] = 1'b0;
					decode_control_word[PC_INC] = 1'b0;
					decode_control_word[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // A to ALU input 0
					decode_control_word[ALU_MUX1_MSB:ALU_MUX1_LSB] = 4'b1100; // data_bus to ALU input 1
					decode_control_word[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01011; // Select compare operation in ALU
					decode_control_word[ALU_OUT_WR] = 1'b1;
				end
			end
			
		endcase
	end
end

// CB Prefix Decode Logic
always @(*) begin
	control_word_prefixCB = 0; // Default
	case (CB_IR)
		// RL B								- 0x10
		8'h10 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0101;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01001; // Rotate left operation
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0010; // Select B into ALU
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
			else if (T_state == 4'b0101) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[ALU_OUT_WR] = 1'b0;
				control_word_prefixCB[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100; // Put ALU_out[7:0] onto data_bus
				control_word_prefixCB[B_WR] = 1'b1;
			end
		end
		
		// RL B								- 0x13
		8'h13 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0101;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01001; // Rotate left operation
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0101; // Select E into ALU
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
			else if (T_state == 4'b0101) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[ALU_OUT_WR] = 1'b0;
				control_word_prefixCB[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100; // Put ALU_out[7:0] onto data_bus
				control_word_prefixCB[E_WR] = 1'b1;
			end
		end
		
		// SWAP A							- 0x37
		8'h37 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0101;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01101; // Rotate left operation
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // Select A into ALU input 0
				control_word_prefixCB[ALU_OUT_WR] = 1'b1; // Write the lower byte of ALU out with swapped nibbles of input
			end
			else if (T_state == 4'b0101) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[ALU_OUT_WR] = 1'b0;
				control_word_prefixCB[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100; // Put ALU_out[7:0] onto data_bus
				control_word_prefixCB[A_WR] = 1'b1;
			end
		end
		
		// BIT 0, B							- 0x40
		8'h40 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01000; // BIT Test Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b000; // Select which bit
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0010; // Select B into ALU
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
		end
		
		// BIT 0, C							- 0x41
		8'h41 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01000; // BIT Test Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b000; // Select which bit
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0011; // Select C into ALU
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
		end
		
		// BIT 0, (HL)						- 0x46
		8'h46 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0101;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Put HL onto address bus
				control_word_prefixCB[ADDR_BUS_WR] = 1'b1;
			end
			else if (T_state == 4'b0101) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[ADDR_BUS_WR] = 1'b0;
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1100; // Select {8'h00, data_bus} into ALU
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01000; // BIT Test Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b000; // Select bit 0
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
		end
		
		// BIT 1, B							- 0x48
		8'h48 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01000; // BIT Test Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b001; // Select which bit
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0010; // Select B into ALU
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
		end
		
		// BIT 1, C							- 0x49
		8'h49 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01000; // BIT Test Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b001; // Select which bit
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0011; // Select C into ALU
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
		end
		
		// BIT 2, B							- 0x50
		8'h50 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01000; // BIT Test Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b010; // Select which bit
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0010; // Select B into ALU
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
		end
		
		// BIT 5,H							- 0x6C
		8'h6C : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01000; // BIT Test Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b101; // Select which bit
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0110; // Select H into ALU
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
		end
		
		// BIT 7, (HL)						- 0x7E
		8'h7E : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0101;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Put HL onto address bus
				control_word_prefixCB[ADDR_BUS_WR] = 1'b1;
			end
			else if (T_state == 4'b0101) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[ADDR_BUS_WR] = 1'b0;
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1100; // Select {8'h00, data_bus} into ALU
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01000; // BIT Test Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b111; // Select bit 0
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
		end
		
		// BIT 7,A							- 0x7F
		8'h7F : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01000; // BIT Test Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b111; // Select which bit
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b0001; // Select A into ALU
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
		end
		
		// RES 0,(HL)						- 0x86
		8'h86 : begin
			if (T_state == 4'b0100) begin
				next_T_state_prefixCB = 4'b0101;
				control_word_prefixCB[CB_IR_WR] = 1'b0; // Must be in all Prefix CB first states to prevent re-write
				control_word_prefixCB[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Put HL onto address bus
				control_word_prefixCB[ADDR_BUS_WR] = 1'b1;
			end
			else if (T_state == 4'b0101) begin
				next_T_state_prefixCB = 4'b0110;
				control_word_prefixCB[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Keep HL on address bus
				control_word_prefixCB[ADDR_BUS_WR] = 1'b0;
				control_word_prefixCB[ALU_MUX0_MSB:ALU_MUX0_LSB] = 4'b1100; // Select {8'h00, data_bus} into ALU
				control_word_prefixCB[ALU_CNTL_MSB:ALU_CNTL_LSB] = 5'b01111; // Bit Reset Operation
				control_word_prefixCB[BIT_OP_MSB:BIT_OP_LSB] = 3'b000; // Select bit 0
				control_word_prefixCB[ALU_OUT_WR] = 1'b1;
			end
			else if (T_state == 4'b0110) begin
				next_T_state_prefixCB = 4'b0000;
				control_word_prefixCB[ADDR_BUS_MSB:ADDR_BUS_LSB] = 4'b0101; // Keep HL on address bus
				control_word_prefixCB[DATA_BUS_MSB:DATA_BUS_LSB] = 4'b1100; // Put ALU_out onto data_bus
				control_word_prefixCB[ADDR_BUS_WR] = 1'b1;
				control_word_prefixCB[MEM_WR] = 1'b1;
				control_word_prefixCB[ALU_OUT_WR] = 1'b0;
			end
		end
	endcase
end


endmodule


