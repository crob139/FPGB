module cpu_top(
	clk4_2,
	reset_n,
	data_bus_in,
	data_bus_out,
	address_bus,
	address_bus_we,
	mem_we,
	IME,
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
	GDMA_finished,
	cpu_led
	);

`include "control_word.vh"

input						clk4_2;
input						reset_n;
input			[7:0]		data_bus_in;
input						v_blank_int_req;
input						lcd_stat_int_req;
input						timer_int_req;
input						serial_int_req;
input						joypad_int_req;
input						DMA_start;
input						GDMA_finished;
output reg	[7:0]		data_bus_out;
output reg	[15:0]	address_bus;
output reg				IME;
output					mem_we;
output					address_bus_we;
output					cpu_v_blank_int_clear;
output					cpu_lcd_stat_int_clear;
output					cpu_timer_int_clear;
output					cpu_serial_int_clear;
output					cpu_joypad_int_clear;
output					cpu_led;

reg			[7:0]		IR;
reg			[7:0]		CB_IR;
reg			[7:0]		ACT;
reg			[7:0]		TMP;
reg			[7:0]		B;
reg			[7:0]		C;
reg			[7:0]		D;
reg			[7:0]		E;
reg			[7:0]		H;
reg			[7:0]		L;
reg			[7:0]		W; // W and Z store temp address data for memory read/write
reg			[7:0]		Z;

reg			[15:0]	SP;
reg			[15:0]	PC;

reg			[7:0]		data_bus;
wire			[15:0]	address_bus_plus_1;
wire			[15:0]	address_bus_minus_1;

reg			[15:0]	ALU_input0;
reg			[15:0]	ALU_input1;
wire			[15:0]	ALU_out;

wire			[7:0]		F; // Flag register connection
wire			[7:0]		A;

wire	[CTRL_MSB:0]	control_word;

wire						cpu_led;

cpu_control cpu_control_inst(
	.clk4_2							(clk4_2),
	.reset_n							(reset_n),
	.IR								(IR),
	.CB_IR							(CB_IR),
	.F									(F),
	.control_word					(control_word),
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
	.GDMA_finished					(GDMA_finished),
	.cpu_led							(cpu_led)
	);

ALU ALU_inst(
	.clk4_2							(clk4_2),
	.reset_n							(reset_n),
	.ALU_out							(ALU_out),
	.control_word					(control_word),
	.ALU_input0						(ALU_input0),
	.ALU_input1						(ALU_input1),
	.data_bus						(data_bus),
	.A									(A),
	.F									(F)
	);

// ALU Input0 Mux
always @(*) begin
	case (control_word[ALU_MUX0_MSB:ALU_MUX0_LSB])
		
		4'b0000 : begin // Reset/ALU inactive
			ALU_input0 = 16'h0000;
		end
		
		4'b0001 : begin
			ALU_input0 = {8'h00, A};
		end
		
		4'b0010 : begin
			ALU_input0 = {8'h00, B};
		end
		
		4'b0011 : begin
			ALU_input0 = {8'h00, C};
		end
		
		4'b0100 : begin
			ALU_input0 = {8'h00, D};
		end
		
		4'b0101 : begin
			ALU_input0 = {8'h00, E};
		end
		
		4'b0110 : begin
			ALU_input0 = {8'h00, H};
		end
		
		4'b0111 : begin
			ALU_input0 = {8'h00, L};
		end
		
		4'b1000 : begin
			ALU_input0 = {B, C};
		end
		
		4'b1001 : begin
			ALU_input0 = {D, E};
		end
		
		4'b1010 : begin
			ALU_input0 = {H, L};
		end
		
		4'b1011 : begin
			ALU_input0 = SP;
		end
		
		4'b1100 : begin
			ALU_input0 = {8'h00, data_bus};
		end
		
		default : begin
			ALU_input0 = 16'h0000;
		end
		
	endcase
end

// ALU Input1 Mux
always @(*) begin
	case (control_word[ALU_MUX1_MSB:ALU_MUX1_LSB])
		4'b0000 : begin // Reset/ALU inactive
			ALU_input1 = 16'h0000;
		end
		
		4'b0001 : begin
			ALU_input1 = {8'h00, A};
		end
		
		4'b0010 : begin
			ALU_input1 = {8'h00, B};
		end
		
		4'b0011 : begin
			ALU_input1 = {8'h00, C};
		end
		
		4'b0100 : begin
			ALU_input1 = {8'h00, D};
		end
		
		4'b0101 : begin
			ALU_input1 = {8'h00, E};
		end
		
		4'b0110 : begin
			ALU_input1 = {8'h00, H};
		end
		
		4'b0111 : begin
			ALU_input1 = {8'h00, L};
		end
		
		4'b1000 : begin
			ALU_input1 = {B, C};
		end
		
		4'b1001 : begin
			ALU_input1 = {D, E};
		end
		
		4'b1010 : begin
			ALU_input1 = {H, L};
		end
		
		4'b1011 : begin
			ALU_input1 = SP;
		end
		
		4'b1100 : begin
			ALU_input1 = {8'h00, data_bus};
		end
		
		default : begin
			ALU_input1 = 16'h0000;
		end
	endcase
end

assign mem_we = control_word[MEM_WR];
assign address_bus_we = control_word[ADDR_BUS_WR];

// IME (Interrupt Master Enable) Flag. Controlled Directly by CPU through op codes
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		IME <= 1'b0;
	end
	else begin
		if (control_word[IME_SET]) begin
			IME <= 1'b1;
		end
		else if (control_word[IME_RESET]) begin
			IME <= 1'b0;
		end
	end
end

// IR Register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		IR <= 8'h00;
	end
	else begin
		if (control_word[IR_WR]) begin
			IR <= data_bus;
		end
		else begin
			IR <= IR;
		end
	end
end

// Prefix CB - IR Register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		CB_IR <= 8'h00;
	end
	else begin
		if (control_word[CB_IR_WR]) begin
			CB_IR <= data_bus;
		end
		else begin
			CB_IR <= CB_IR;
		end
	end
end

// B register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		B <= 8'hFc;
	end
	else begin
		if (control_word[B_WR]) begin
			B <= data_bus;
		end
		else if (control_word[B_INC]) begin
			B <= B + 8'h01;
		end
		else if (control_word[B_DEC]) begin
			B <= B - 8'h01;
		end
		else begin
			B <= B;
		end
	end
end

// C register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		C <= 8'h0f;
	end
	else begin
		if (control_word[C_WR]) begin
			C <= data_bus;
		end
		else if (control_word[C_INC]) begin
			C <= C + 8'h01;
		end
		else if (control_word[C_DEC]) begin
			C <= C - 8'h01;
		end
		else begin
			C <= C;
		end
	end
end

// D register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		D <= 8'h0a;
	end
	else begin
		if (control_word[D_WR]) begin
			D <= data_bus;
		end
		else if (control_word[D_INC]) begin
			D <= D + 8'h01;
		end
		else if (control_word[D_DEC]) begin
			D <= D - 8'h01;
		end
		else begin
			D <= D;
		end
	end
end

// E register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		E <= 8'h41;
	end
	else begin
		if (control_word[E_WR]) begin
			E <= data_bus;
		end
		else if (control_word[E_INC]) begin
			E <= E + 8'h01;
		end
		else begin
			E <= E;
		end
	end
end

// H register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		H <= 8'h00;
	end
	else begin
		if (control_word[H_WR]) begin
			H <= data_bus;
		end
		else if (control_word[ADDR_BUS_INC_WR]) begin
			H <= address_bus_plus_1[15:8];
		end
		else if (control_word[ADDR_BUS_DEC_WR]) begin
			H <= address_bus_minus_1[15:8];
		end
		else if (control_word[H_INC]) begin
			H <= H + 8'h01;
		end
		else begin
			H <= H;
		end
	end
end

// L register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		L <= 8'h03;
	end
	else begin
		if (control_word[L_WR]) begin
			L <= data_bus;
		end
		else if (control_word[ADDR_BUS_INC_WR]) begin
			L <= address_bus_plus_1[7:0];
		end
		else if (control_word[ADDR_BUS_DEC_WR]) begin
			L <= address_bus_minus_1[7:0];
		end
		else if (control_word[L_INC]) begin
			L <= L + 8'h01;
		end
		else begin
			L <= L;
		end
	end
end

// W register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		W <= 8'h00;
	end
	else begin
		if (control_word[W_WR]) begin
			W <= data_bus;
		end
		else begin
			W <= W;
		end
	end
end

// Z register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		Z <= 8'h00;
	end
	else begin
		if (control_word[Z_WR]) begin
			Z <= data_bus;
		end
		else begin
			Z <= Z;
		end
	end
end

// TMP register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		TMP <= 8'h00;
	end
	else begin
		if (control_word[TMP_WR]) begin
			TMP <= data_bus;
		end
		else begin
			TMP <= TMP;
		end
	end
end

// SP register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		SP <= 16'h0000;
	end
	else begin
		if (control_word[SP_WR_LSB]) begin
			SP[7:0] <= data_bus;
		end
		else if (control_word[SP_WR_MSB]) begin
			SP[15:8] <= data_bus;
		end
		else if (control_word[SP_INC]) begin
			SP <= SP + 16'h0001;
		end
		else if (control_word[SP_DEC]) begin
			SP <= SP - 16'h0001;
		end
		else begin
			SP <= SP;
		end
	end
end

// PC register
always @(posedge clk4_2 or negedge reset_n) begin
	if (!reset_n) begin
		PC <= 16'h0000;
	end
	else begin
		if (control_word[PC_INC]) begin
			PC <= PC + 16'h0001;
		end
		else if (control_word[PC_WR]) begin
			PC <= PC + {data_bus[7], data_bus[7], data_bus[7], data_bus[7], data_bus[7], data_bus[7], data_bus[7], data_bus[7], data_bus};
		end
		else if (control_word[PC_WR_LSB]) begin
			PC[7:0] <= data_bus;
		end
		else if (control_word[PC_WR_MSB]) begin
			PC[15:8] <= data_bus;
		end
		else if (control_word[PC_WR_WZ]) begin
			PC <= {W, Z};
		end
		else if (control_word[PC_WR_V_BLANK_INT]) begin
			PC <= 16'h0040;
		end
		else if (control_word[PC_WR_LCD_STAT_INT]) begin
			PC <= 16'h0048;
		end
		else if (control_word[PC_WR_TIMER_INT]) begin
			PC <= 16'h0050;
		end
		else if (control_word[PC_WR_SERIAL_INT]) begin
			PC <= 16'h0058;
		end
		else if (control_word[PC_WR_JOYPAD_INT]) begin
			PC <= 16'h0060;
		end
		else begin
			PC <= PC;
		end
	end
end


// Handle the data_bus. No Tri-State logic in FPGA so databus is managed with a MUX
always @(*) begin
	
	case (control_word[DATA_BUS_MSB:DATA_BUS_LSB])
		
		4'b0000 : begin
			data_bus = data_bus_in;
		end
		
		4'b0001 : begin
			data_bus = A;
		end
		
		4'b0010 : begin
			data_bus = B;
		end
		
		4'b0011 : begin
			data_bus = C;
		end
		
		4'b0100 : begin
			data_bus = D;
		end
		
		4'b0101 : begin
			data_bus = E;
		end
		
		4'b0110 : begin
			data_bus = F;
		end
		
		4'b0111 : begin
			data_bus = H;
		end
		
		4'b1000 : begin
			data_bus = L;
		end
		
		4'b1001 : begin
			data_bus = SP[7:0];
		end
		
		4'b1010 : begin
			data_bus = SP[15:8];
		end
		
		4'b1011 : begin
			data_bus = PC[7:0];
		end
		
		4'b1100 : begin
			data_bus = ALU_out[7:0];
		end
		
		4'b1101 : begin
			data_bus = ALU_out[15:8];
		end
		
		4'b1110 : begin
			// USE THIS NEXT. OTHERWISE DELETE
		end
		
		4'b1111 : begin
			data_bus = PC[15:8];
		end
		
		default : begin
			data_bus = 8'h00;
		end
		
	endcase
end

// Set the data bus output to always be the data bus
always @(*) begin
	data_bus_out = data_bus;
end

// Handle the address_bus. No Tri-State logic in FPGA so address_bus is managed with a MUX
always @(*) begin
	
	case (control_word[ADDR_BUS_MSB:ADDR_BUS_LSB])
		
		4'b0000 : begin
			address_bus = PC;
		end
		
		4'b0001 : begin
			address_bus = {W, Z};
		end
		
		4'b0010 : begin
			address_bus = {W, Z} + 16'h01;
		end
		
		4'b0011 : begin
			address_bus = {B, C};
		end
		
		4'b0100 : begin
			address_bus = {D, E};
		end
		
		4'b0101 : begin
			address_bus = {H, L};
		end
		
		4'b0110 : begin
			address_bus = {8'hFF, Z};
		end
		
		4'b0111 : begin
			address_bus = SP;
		end
		
		4'b1000 : begin
			address_bus = {8'hFF, C};
		end
		
		default : begin
			address_bus = 16'h0000;
		end
		
	endcase
end

assign address_bus_plus_1 = address_bus + 16'h0001;
assign address_bus_minus_1 = address_bus - 16'h0001;

endmodule
