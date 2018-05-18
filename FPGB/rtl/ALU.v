module ALU(
	core_clk,
	reset_n,
	ALU_out,
	control_word,
	ALU_input0,
	ALU_input1,
	data_bus,
	A,
	F
	);

`include "control_word.vh"

input								core_clk;
input								reset_n;
input			[CTRL_MSB:0]	control_word;
input			[15:0]			ALU_input0, ALU_input1;
input			[7:0]				data_bus;
output reg	[15:0]			ALU_out;
output reg	[7:0]				A;
output reg	[7:0]				F;

reg			[15:0]			ADD;
reg			[3:0]				ADD_HALF_8b;
reg			[11:0]			ADD_3NIBBLES_16b; // For 16b half carry which checks nibble in upper byte.
reg								ADD_CARRY_8b;
reg								ADD_CARRY_16b;
reg								ADD_HALF_CARRY_8b;
reg								ADD_HALF_CARRY_16b;

reg			[15:0]			SUB_16b;
reg								SUB_BORROW_16b;
reg								SUB_BORROW_HALF_16b;
reg			[7:0]				SUB_8b;
reg								SUB_BORROW_8b;
reg								SUB_BORROW_HALF_8b;
reg			[15:0]			SUB_TEMP0;
reg			[7:0]				SUB_TEMP1;
reg			[11:0]			SUB_TEMP2;
reg			[3:0]				SUB_TEMP3;

reg			[15:0]			INC_16b;
reg			[15:0]			DEC_16b;
reg			[7:0]				INC_8b;
reg			[3:0]				INC_8b_HALF;
reg								INC_8b_HALF_CARRY;
reg			[7:0]				DEC_8b;
reg			[3:0]				DEC_8b_HALF;
reg								DEC_8b_HALF_CARRY;
reg			[7:0]				XOR;
reg			[7:0]				OR;
reg			[7:0]				CPL;
reg			[7:0]				AND;
reg			[7:0]				SWAP;


// A register
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		A <= 8'h00;
	end
	else begin
		if (control_word[A_WR]) begin
			A <= data_bus;
		end
		else if (control_word[A_INC]) begin
			A <= A + 8'h01;
		end
		else if (control_word[A_WR_XOR]) begin
			A <= XOR;
		end
		else if (control_word[A_WR_OR]) begin
			A <= OR;
		end
		else if (control_word[A_WR_CPL]) begin
			A <= CPL;
		end
		else if (control_word[A_WR_RLA]) begin
			A <= {ALU_input0[6:0], F[4]};
		end
		else if (control_word[A_WR_AND]) begin
			A <= AND;
		end
		else if (control_word[A_WR_SUB]) begin
			A <= SUB_8b;
		end
		else begin
			A <= A;
		end
	end
end



// Add Operation
always @(*) begin
	{ADD_CARRY_16b, ADD} = {1'b0, ALU_input0} + {1'b0, ALU_input1};
	ADD_CARRY_8b = ADD[8];
	{ADD_HALF_CARRY_8b, ADD_HALF_8b} = {1'b0, ALU_input0[3:0]} + {1'b0, ALU_input1[3:0]};
	{ADD_HALF_CARRY_16b, ADD_3NIBBLES_16b} = {1'b0, ALU_input0[11:0]} + {1'b0, ALU_input1[11:0]};
end

// Sub Operation
always @(*) begin
	SUB_16b = ALU_input0 + ((~ALU_input1) + 16'h0001); // Two's complement addition to get subtration correct if any borrow
	SUB_8b = ALU_input0[7:0] + ((~ALU_input1[7:0]) + 8'h01); // Two's complement addition to get subtration correct if any borrow
	// Borrows need to be inverted when assigned to flags
	{SUB_BORROW_16b, SUB_TEMP0} = {1'b1, ALU_input0} - {1'b0, ALU_input1};
	{SUB_BORROW_8b, SUB_TEMP1} = {1'b1, ALU_input0[7:0]} - {1'b0, ALU_input1[7:0]};
	
	{SUB_BORROW_HALF_16b, SUB_TEMP2} = {1'b1, ALU_input0[11:0]} - {1'b0, ALU_input1[11:0]};
	{SUB_BORROW_HALF_8b, SUB_TEMP3} = {1'b1, ALU_input0[3:0]} - {1'b0, ALU_input1[3:0]};
end

// 16b Incement/Decrement Operations
always @(*) begin
	INC_16b = ALU_input0 + 16'h0001;
	DEC_16b = ALU_input0 - 16'h0001;
end

// 8b Increment/Decrement Flag Operations
always @(*) begin
	INC_8b = ALU_input0[7:0] + 8'h01;
	{INC_8b_HALF_CARRY, INC_8b_HALF} = {1'b0, ALU_input0[3:0]} + 5'h01;
	
	DEC_8b = ALU_input0[7:0] - 8'h01;
	{DEC_8b_HALF_CARRY, DEC_8b_HALF} = {1'b1, ALU_input0[3:0]} - 5'h01;
end

// XOR Operation
always @(*) begin
	XOR = ALU_input0[7:0] ^ ALU_input1[7:0];
end

// OR Operation
always @(*) begin
	OR = ALU_input0[7:0] | ALU_input1[7:0];
end

// CPL Operation (Complement)
always @(*) begin
	CPL = ~ALU_input0[7:0];
end

// AND Operation
always @(*) begin
	AND = ALU_input0[7:0] & ALU_input1[7:0];
end

// SWAP Operation
always @(*) begin
	SWAP = {ALU_input0[3:0], ALU_input0[7:4]};
end

// Assign correct operaion to ALU outpu register
always @(posedge core_clk or negedge reset_n) begin
	if (!reset_n) begin
		ALU_out <= 16'h0000;
		F <= 8'h00;
	end
	else if (control_word[ALU_OUT_WR]) begin
		case (control_word[ALU_CNTL_MSB:ALU_CNTL_LSB])
			5'b00000 : begin // 16b ADD
				ALU_out <= ADD;
				F[7] <= F[7]; // No change
				F[6] <= 1'b0;
				F[5] <= ADD_HALF_CARRY_16b;
				F[4] <= ADD_CARRY_16b;
				F[3:0] <= F[3:0]; // Not used
			end
			
			5'b00001 : begin // 8b ADD (For example. Haven't actually implemented yet)
				ALU_out <= {8'h00, ADD[7:0]};
				F[7] <= F[7]; // No change
				F[6] <= 1'b0;
				F[5] <= ADD_HALF_CARRY_8b;
				F[4] <= ADD_CARRY_8b;
				F[3:0] <= F[3:0]; // Not used
			end
			
			5'b00010 : begin // 16b increment
				ALU_out <= INC_16b;
				F <= F; // No change
			end
			
			5'b00011 : begin // 16b decrement
				ALU_out <= DEC_16b;
				F <= F; // No change
			end
			
			5'b00100 : begin // 8b increment flag assignments
				ALU_out <= ALU_out; // Doesn't need to change
				F[7] <= !(|INC_8b); // Zero flag (see if any bits are set then invert)
				F[6] <= 1'b0;
				F[5] <= INC_8b_HALF_CARRY;
				F[4] <= F[4]; // No change
				F[3:0] <= F[3:0]; // Not used
			end
			
			5'b00101 : begin // XOR Operation
				ALU_out <= ALU_out; // Doesn't need to change. Written straight to A
				F[7] <= !(|XOR); // Zero flag (see if any bits are set then invert)
				F[6] <= 1'b0;
				F[5] <= 1'b0;
				F[4] <= 1'b0;
				F[3:0] <= F[3:0]; // Not used
			end
			
			5'b00110 : begin // CPL Operation
				ALU_out <= ALU_out; // Doesn't need to change. Written straight to A
				F[7] <= F[7]; // No change
				F[6] <= 1'b0;
				F[5] <= 1'b0;
				F[4] <= F[4]; // No change
				F[3:0] <= F[3:0]; // Not used
			end
			
			5'b00111 : begin // 8b decrement flag assignments
				ALU_out <= ALU_out; // Doesn't need to change
				F[7] <= !(|DEC_8b); // Zero flag (see if any bits are set then invert)
				F[6] <= 1'b1;
				F[5] <= !DEC_8b_HALF_CARRY;
				F[4] <= F[4]; // No change
				F[3:0] <= F[3:0]; // Not used
			end
			
			5'b01000 : begin // BIT operations
				ALU_out <= ALU_out; // Doesn't need to change
				case (control_word[BIT_OP_MSB:BIT_OP_LSB])
					3'b000 : begin
						F[7] <= !ALU_input0[0];
						F[6] <= 1'b0;
						F[5] <= 1'b1;
						F[4] <= F[4]; // No Change
						F[3:0] <= F[3:0]; // Not Used
					end
					3'b001 : begin
						F[7] <= !ALU_input0[1];
						F[6] <= 1'b0;
						F[5] <= 1'b1;
						F[4] <= F[4]; // No Change
						F[3:0] <= F[3:0]; // Not Used
					end
					3'b010 : begin
						F[7] <= !ALU_input0[2];
						F[6] <= 1'b0;
						F[5] <= 1'b1;
						F[4] <= F[4]; // No Change
						F[3:0] <= F[3:0]; // Not Used
					end
					3'b011 : begin
						F[7] <= !ALU_input0[3];
						F[6] <= 1'b0;
						F[5] <= 1'b1;
						F[4] <= F[4]; // No Change
						F[3:0] <= F[3:0]; // Not Used
					end
					3'b100 : begin
						F[7] <= !ALU_input0[4];
						F[6] <= 1'b0;
						F[5] <= 1'b1;
						F[4] <= F[4]; // No Change
						F[3:0] <= F[3:0]; // Not Used
					end
					3'b101 : begin
						F[7] <= ALU_input0[5]; // THIS NEEDS TO BE CHANGED BACK AFTER SIMULATION. ADD THE "!"
						F[6] <= 1'b0;
						F[5] <= 1'b1;
						F[4] <= F[4]; // No Change
						F[3:0] <= F[3:0]; // Not Used
					end
					3'b110 : begin
						F[7] <= !ALU_input0[6];
						F[6] <= 1'b0;
						F[5] <= 1'b1;
						F[4] <= F[4]; // No Change
						F[3:0] <= F[3:0]; // Not Used
					end
					3'b111 : begin
						F[7] <= !ALU_input0[7];
						F[6] <= 1'b0;
						F[5] <= 1'b1;
						F[4] <= F[4]; // No Change
						F[3:0] <= F[3:0]; // Not Used
					end
				endcase
			end
			
			5'b01001 : begin // Rotate left
				ALU_out <= {8'h00, ALU_input0[6:0], F[4]};
				F[7] <= !(|{ALU_input0[6:0], F[4]});
				F[6] <= 1'b0;
				F[5] <= 1'b0;
				F[4] <= ALU_input0[7];
				F[3:0] <= F[3:0]; // Not Used
			end
			
			5'b01010 : begin // Rotate left Accumulator
				ALU_out <= ALU_out; // A directly assigned result. Leave this the same
				F[7] <= 1'b0; // This is the only difference to the CB rotate left operations
				F[6] <= 1'b0;
				F[5] <= 1'b0;
				F[4] <= ALU_input0[7];
				F[3:0] <= F[3:0]; // Not Used
			end
			
			5'b01011 : begin // Compare Operation
				ALU_out <= ALU_out; // This doesn't change
				F[7] <= !(|SUB_8b);
				F[6] <= 1'b1;
				F[5] <= !SUB_BORROW_HALF_8b;
				F[4] <= !SUB_BORROW_8b;
				F[3:0] <= F[3:0]; // Not Used
			end
			
			5'b01100 : begin // AND Operation
				ALU_out <= ALU_out; // This doesn't change
				F[7] <= !(|AND);
				F[6] <= 1'b0;
				F[5] <= 1'b1;
				F[4] <= 1'b0;
				F[3:0] <= F[3:0]; // Not Used
			end
			
			5'b01101 : begin // SWAP Operation
				ALU_out[7:0] <= SWAP; // Put SWAP at ALU output
				F[7] <= !(|SWAP);
				F[6] <= 1'b0;
				F[5] <= 1'b0;
				F[4] <= 1'b0;
				F[3:0] <= F[3:0]; // Not Used
			end
			
			5'b01110 : begin // OR Operation
				ALU_out <= ALU_out; // Doesn't need to change. Written straight to A
				F[7] <= !(|OR); // Zero flag (see if any bits are set then invert)
				F[6] <= 1'b0;
				F[5] <= 1'b0;
				F[4] <= 1'b0;
				F[3:0] <= F[3:0]; // Not used
			end
			
			5'b01111 : begin // RES operations
				case (control_word[BIT_OP_MSB:BIT_OP_LSB])
					3'b000 : begin
						ALU_out <= {ALU_input0[7:1], 1'b0};
						F[7:0] <= F[7:0]; // Not Used
					end
					3'b001 : begin
						ALU_out <= {ALU_input0[7:2], 1'b0, ALU_input0[0]};
						F[7:0] <= F[7:0]; // Not Used
					end
					3'b010 : begin
						ALU_out <= {ALU_input0[7:3], 1'b0, ALU_input0[1:0]};
						F[7:0] <= F[7:0]; // Not Used
					end
					3'b011 : begin
						ALU_out <= {ALU_input0[7:4], 1'b0, ALU_input0[2:0]};
						F[7:0] <= F[7:0]; // Not Used
					end
					3'b100 : begin
						ALU_out <= {ALU_input0[7:5], 1'b0, ALU_input0[3:0]};
						F[7:0] <= F[7:0]; // Not Used
					end
					3'b101 : begin
						ALU_out <= {ALU_input0[7:6], 1'b0, ALU_input0[4:0]};
						F[7:0] <= F[7:0]; // Not Used
					end
					3'b110 : begin
						ALU_out <= {ALU_input0[7], 1'b0, ALU_input0[5:0]};
						F[7:0] <= F[7:0]; // Not Used
					end
					3'b111 : begin
						ALU_out <= {1'b0, ALU_input0[6:0]};
						F[7:0] <= F[7:0]; // Not Used
					end
				endcase
			end
			
			5'b10000 : begin // 8b SUB Operation
				ALU_out <= SUB_8b; // This doesn't change
				F[7] <= !(|SUB_8b);
				F[6] <= 1'b1;
				F[5] <= !SUB_BORROW_HALF_8b;
				F[4] <= !SUB_BORROW_8b;
				F[3:0] <= F[3:0]; // Not Used
			end
			
			default : begin
				ALU_out <= ALU_out;
				F <= F;
			end
		endcase
	end
	else begin
		ALU_out <= ALU_out;
		F <= F;
	end
end

endmodule
