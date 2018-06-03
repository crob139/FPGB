`timescale 1ns / 1ps

module mbc(
	address_bus_offset,
	address_bus_dma_rd,
	address_bus_out,
	dma_sel_cart_rom,
	ext_ram_bank_sel
	);

input		[15:0]	address_bus_offset;
input		[15:0]	address_bus_dma_rd;
input					dma_sel_cart_rom;

output	[15:0]	address_bus_out;
output	[1:0]		ext_ram_bank_sel;


assign address_bus_out = (dma_sel_cart_rom) ? address_bus_dma_rd : address_bus_offset;
assign ext_ram_bank_sel = 2'b00;

endmodule
