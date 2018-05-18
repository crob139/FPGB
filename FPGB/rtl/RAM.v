module RAM(
	clk,
	en,
	addr,
	wr_en,
	data_in,
	data_out
	);

parameter	ADDRESS_WIDTH	= 12;
parameter	MEM_SIZE			= 2304;

input 									clk;
input 									en;
input			[ADDRESS_WIDTH-1:0]	addr;
input										wr_en;
input			[7:0]						data_in;
output reg	[7:0]						data_out;

(*ram_style = "block" *)	reg	[7:0]	ram	[MEM_SIZE-1:0];


always @(posedge clk) begin
	if (en) begin
		if (wr_en) begin
			ram[addr] <= data_in;
			data_out <= data_in;
		end
		else begin
			data_out <= ram[addr];
		end
	end
end

integer i;
initial begin
	for (i=0;i<MEM_SIZE;i=i+1) begin
		ram[i] = 8'h00;
	end
end

endmodule
