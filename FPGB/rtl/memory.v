module memory(
	clk4_2,
	reset_n,
	address_bus_offset,
	address_bus_dma_rd,
	mem_enable,
	mem_enable_dma_rd,
	data_in,
	dma_sel_boot_rom,
	dma_sel_ext_ram_bank0,
	dma_sel_ext_ram_bank1,
	dma_sel_ext_ram_bank2,
	dma_sel_ext_ram_bank3,
	dma_sel_work_ram_bank0,
	dma_sel_work_ram_bank1,
	dma_sel_work_ram_bank2,
	dma_sel_work_ram_bank3,
	dma_sel_work_ram_bank4,
	dma_sel_work_ram_bank5,
	dma_sel_work_ram_bank6,
	dma_sel_work_ram_bank7,
	data_out_boot_ROM,
	data_out_ext_ram_bank0,
	data_out_ext_ram_bank1,
	data_out_ext_ram_bank2,
	data_out_ext_ram_bank3,
	data_out_work_ram_bank0,
	data_out_work_ram_bank1,
	data_out_work_ram_bank2,
	data_out_work_ram_bank3,
	data_out_work_ram_bank4,
	data_out_work_ram_bank5,
	data_out_work_ram_bank6,
	data_out_work_ram_bank7,
	data_out_high_ram,
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
	wr_en_high_ram
	);

input						clk4_2;
input						reset_n;
input			[15:0]	address_bus_offset;
input			[15:0]	address_bus_dma_rd;
input						mem_enable;
input						mem_enable_dma_rd;
input			[7:0]		data_in;

input						dma_sel_boot_rom;
input						dma_sel_ext_ram_bank0, dma_sel_ext_ram_bank1, dma_sel_ext_ram_bank2, dma_sel_ext_ram_bank3;
input						dma_sel_work_ram_bank0, dma_sel_work_ram_bank1, dma_sel_work_ram_bank2, dma_sel_work_ram_bank3;
input						dma_sel_work_ram_bank4, dma_sel_work_ram_bank5, dma_sel_work_ram_bank6, dma_sel_work_ram_bank7;

input						wr_en_ext_ram_bank0;
input						wr_en_ext_ram_bank1;
input						wr_en_ext_ram_bank2;
input						wr_en_ext_ram_bank3;
input						wr_en_work_ram_bank0;
input						wr_en_work_ram_bank1;
input						wr_en_work_ram_bank2;
input						wr_en_work_ram_bank3;
input						wr_en_work_ram_bank4;
input						wr_en_work_ram_bank5;
input						wr_en_work_ram_bank6;
input						wr_en_work_ram_bank7;
input						wr_en_high_ram;

output		[7:0]		data_out_boot_ROM;
output		[7:0]		data_out_ext_ram_bank0;
output		[7:0]		data_out_ext_ram_bank1;
output		[7:0]		data_out_ext_ram_bank2;
output		[7:0]		data_out_ext_ram_bank3;
output		[7:0]		data_out_work_ram_bank0;
output		[7:0]		data_out_work_ram_bank1;
output		[7:0]		data_out_work_ram_bank2;
output		[7:0]		data_out_work_ram_bank3;
output		[7:0]		data_out_work_ram_bank4;
output		[7:0]		data_out_work_ram_bank5;
output		[7:0]		data_out_work_ram_bank6;
output		[7:0]		data_out_work_ram_bank7;
output		[7:0]		data_out_high_ram;

wire			[15:0]	address_bus_boot_rom;
wire			[15:0]	address_bus_ext_ram_bank0, address_bus_ext_ram_bank1, address_bus_ext_ram_bank2, address_bus_ext_ram_bank3;
wire			[15:0]	address_bus_work_ram_bank0, address_bus_work_ram_bank1, address_bus_work_ram_bank2, address_bus_work_ram_bank3;
wire			[15:0]	address_bus_work_ram_bank4, address_bus_work_ram_bank5, address_bus_work_ram_bank6, address_bus_work_ram_bank7;

wire						mem_enable_boot_ROM;
wire						mem_enable_ext_ram_bank0, mem_enable_ext_ram_bank1, mem_enable_ext_ram_bank2, mem_enable_ext_ram_bank3;
wire						mem_enable_work_ram_bank0, mem_enable_work_ram_bank1, mem_enable_work_ram_bank2, mem_enable_work_ram_bank3;
wire						mem_enable_work_ram_bank4, mem_enable_work_ram_bank5, mem_enable_work_ram_bank6, mem_enable_work_ram_bank7;

// FPGA Internal Memories

ROM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(2304),
	.FILENAME			("rtl/roms/GBC_boot_rom_MODIFIED.txt")//("rtl/roms/GBC_boot_rom.txt") // MODIFIED has cart ROM added to it
	)																													 // Remove once cart ROM running on HW
boot_ROM(
	.clk					(clk4_2),
	.en					(mem_enable_boot_ROM),
	.addr					(address_bus_boot_rom[11:0]),
	.data_out			(data_out_boot_ROM)
	);
assign address_bus_boot_rom = (dma_sel_boot_rom) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_boot_ROM = (dma_sel_boot_rom) ? mem_enable_dma_rd : mem_enable;


RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
ext_ram_bank0(
	.clk					(clk4_2),
	.en					(mem_enable_ext_ram_bank0),
	.addr					(address_bus_ext_ram_bank0[12:0]),
	.wr_en				(wr_en_ext_ram_bank0),
	.data_in				(data_in),
	.data_out			(data_out_ext_ram_bank0)
	);
assign address_bus_ext_ram_bank0 = (dma_sel_ext_ram_bank0) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_ext_ram_bank0 = (dma_sel_ext_ram_bank0) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
ext_ram_bank1(
	.clk					(clk4_2),
	.en					(mem_enable_ext_ram_bank1),
	.addr					(address_bus_ext_ram_bank1[12:0]),
	.wr_en				(wr_en_ext_ram_bank1),
	.data_in				(data_in),
	.data_out			(data_out_ext_ram_bank1)
	);
assign address_bus_ext_ram_bank1 = (dma_sel_ext_ram_bank1) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_ext_ram_bank1 = (dma_sel_ext_ram_bank1) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
ext_ram_bank2(
	.clk					(clk4_2),
	.en					(mem_enable_ext_ram_bank2),
	.addr					(address_bus_ext_ram_bank2[12:0]),
	.wr_en				(wr_en_ext_ram_bank2),
	.data_in				(data_in),
	.data_out			(data_out_ext_ram_bank2)
	);
assign address_bus_ext_ram_bank2 = (dma_sel_ext_ram_bank2) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_ext_ram_bank2 = (dma_sel_ext_ram_bank2) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(13),
	.MEM_SIZE			(8192)
	)
ext_ram_bank3(
	.clk					(clk4_2),
	.en					(mem_enable_ext_ram_bank3),
	.addr					(address_bus_ext_ram_bank3[12:0]),
	.wr_en				(wr_en_ext_ram_bank3),
	.data_in				(data_in),
	.data_out			(data_out_ext_ram_bank3)
	);
assign address_bus_ext_ram_bank3 = (dma_sel_ext_ram_bank3) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_ext_ram_bank3 = (dma_sel_ext_ram_bank3) ? mem_enable_dma_rd: mem_enable;


RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank0(
	.clk					(clk4_2),
	.en					(mem_enable_work_ram_bank0),
	.addr					(address_bus_work_ram_bank0[11:0]),
	.wr_en				(wr_en_work_ram_bank0),
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank0)
	);
assign address_bus_work_ram_bank0 = (dma_sel_work_ram_bank0) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_work_ram_bank0 = (dma_sel_work_ram_bank0) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank1(
	.clk					(clk4_2),
	.en					(mem_enable_work_ram_bank1),
	.addr					(address_bus_work_ram_bank1[11:0]),
	.wr_en				(wr_en_work_ram_bank1),
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank1)
	);
assign address_bus_work_ram_bank1 = (dma_sel_work_ram_bank1) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_work_ram_bank1 = (dma_sel_work_ram_bank1) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank2(
	.clk					(clk4_2),
	.en					(mem_enable_work_ram_bank2),
	.addr					(address_bus_work_ram_bank2[11:0]),
	.wr_en				(wr_en_work_ram_bank2),
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank2)
	);
assign address_bus_work_ram_bank2 = (dma_sel_work_ram_bank2) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_work_ram_bank2 = (dma_sel_work_ram_bank2) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank3(
	.clk					(clk4_2),
	.en					(mem_enable_work_ram_bank3),
	.addr					(address_bus_work_ram_bank3[11:0]),
	.wr_en				(wr_en_work_ram_bank3),
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank3)
	);
assign address_bus_work_ram_bank3 = (dma_sel_work_ram_bank3) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_work_ram_bank3 = (dma_sel_work_ram_bank3) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank4(
	.clk					(clk4_2),
	.en					(mem_enable_work_ram_bank4),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank4),
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank4)
	);
assign address_bus_work_ram_bank4 = (dma_sel_work_ram_bank4) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_work_ram_bank4 = (dma_sel_work_ram_bank4) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank5(
	.clk					(clk4_2),
	.en					(mem_enable_work_ram_bank5),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank5),
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank5)
	);
assign address_bus_work_ram_bank5 = (dma_sel_work_ram_bank5) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_work_ram_bank5 = (dma_sel_work_ram_bank5) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank6(
	.clk					(clk4_2),
	.en					(mem_enable_work_ram_bank6),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank6),
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank6)
	);
assign address_bus_work_ram_bank6 = (dma_sel_work_ram_bank6) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_work_ram_bank6 = (dma_sel_work_ram_bank6) ? mem_enable_dma_rd : mem_enable;

RAM #(
	.ADDRESS_WIDTH		(12),
	.MEM_SIZE			(4096)
	)
work_ram_bank7(
	.clk					(clk4_2),
	.en					(mem_enable_work_ram_bank7),
	.addr					(address_bus_offset[11:0]),
	.wr_en				(wr_en_work_ram_bank7),
	.data_in				(data_in),
	.data_out			(data_out_work_ram_bank7)
	);
assign address_bus_work_ram_bank7 = (dma_sel_work_ram_bank7) ? address_bus_dma_rd : address_bus_offset;
assign mem_enable_work_ram_bank7 = (dma_sel_work_ram_bank7) ? mem_enable_dma_rd : mem_enable;


RAM #(
	.ADDRESS_WIDTH		(7),
	.MEM_SIZE			(127)
	)
high_ram(
	.clk					(clk4_2),
	.en					(mem_enable),
	.addr					(address_bus_offset[6:0]),
	.wr_en				(wr_en_high_ram),
	.data_in				(data_in),
	.data_out			(data_out_high_ram)
	);

endmodule
