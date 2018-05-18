module ROM(
	clk,
	en,
	addr,
	data_out
	);

parameter	ADDRESS_WIDTH	= 12;
parameter	MEM_SIZE			= 2304;
parameter	FILENAME			= "";

input 									clk;
input										en;
input			[ADDRESS_WIDTH-1:0]	addr;
output		[7:0]						data_out;

reg			[ADDRESS_WIDTH-1:0]	addr_reg;
(*rom_style = "block" *)	reg	[7:0]	rom	[MEM_SIZE-1:0];

always @(posedge clk) begin
	if (en) begin
		addr_reg <= addr;
	end
end
assign data_out = rom[addr_reg];

initial begin
	$readmemh(FILENAME, rom); 
end

endmodule
