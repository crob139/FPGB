module chrontel_CH7301C_driver(
	clk25_2,
	clk25_2_270deg,
	reset_n,
	DVI_DE,
	DVI_H,
	DVI_V,
	DVI_D,
	XCLK_P,
	XCLK_N
	);

input							clk25_2;
input							clk25_2_270deg;
input							reset_n;
//input				[14:0]	pix_data;

output reg					DVI_DE;
output						DVI_H;
output						DVI_V;
output			[11:0]	DVI_D;
output						XCLK_P;
output						XCLK_N;

reg					[9:0]	counterX;
reg					[9:0]	counterY;
reg			[14:0] pix_data;

wire							XCLK_SE;

// Horizontal Sync signal (active low for 640x480)
//assign DVI_H = !((counterX >= 10'd656) && (counterX < 10'd752));
assign DVI_H = !((counterX >= 10'd660) && (counterX < 10'd756)); // Offset to account for latency in Chrontel chip

// Vertical Sync signal (active low for 640x480)
assign DVI_V = !((counterY >= 10'd490) && (counterY < 10'd492));

// Data Enable signal
always @(posedge clk25_2_270deg) begin
	DVI_DE <= ((counterX >= 10'd0) && (counterX < 10'd640) && (counterY >= 10'd0) && (counterY < 10'd480) && reset_n);
end



// Counts 0 to 799 (800 pixels in X direction)
always @(posedge clk25_2 or negedge reset_n) begin
	if (!reset_n) begin
		counterX <= 10'h0;
	end
	else begin
		if (counterX == 10'd799) begin
			counterX <= 10'h0;
		end
		else begin
			counterX <= counterX + 10'h1;
		end
	end
end

// Counts 0 to 524 (525 pixels in Y direction)
always @(posedge clk25_2 or negedge reset_n) begin
	if (!reset_n) begin
		counterY <= 10'h0;
	end
	else begin
		if (counterX == 10'd799) begin
			if (counterY == 10'd524) begin
				counterY <= 10'h0;
			end
			else begin
				counterY <= counterY + 10'h1;
			end
		end
	end
end


// Temp data until implemented
always @(*) begin
	if (!reset_n) begin
		pix_data <= 15'b111111111111111;
	end
	else begin
		if ((counterY == 10'd0) || (counterY == 10'd1) || (counterY == 10'd2)) begin
			pix_data <= 15'b111111111111111;
		end
		else if ((counterY == 10'd477) || (counterY == 10'd478) || (counterY == 10'd479)) begin
			pix_data <= 15'b111111111111111;
		end
		else begin
			pix_data <= {5'b00000, counterY};
		end
	end
end
// Temp data until implemented




// Send pixel clock and data to the CH7301C device
assign DVI_D[3:0] = 4'b0000;
ODDR #(.DDR_CLK_EDGE("SAME_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")
	)
ODDR_inst4 (.Q(DVI_D[4]), .C(clk25_2_270deg), .CE(1'b1), .D1(pix_data[10]), .D2(pix_data[8]), .R(!reset_n), .S(1'b0)
	);
ODDR #(.DDR_CLK_EDGE("SAME_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")
	)
ODDR_inst5 (.Q(DVI_D[5]), .C(clk25_2_270deg), .CE(1'b1), .D1(pix_data[11]), .D2(pix_data[9]), .R(!reset_n), .S(1'b0)
	);
ODDR #(.DDR_CLK_EDGE("SAME_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")
	)
ODDR_inst6 (.Q(DVI_D[6]), .C(clk25_2_270deg), .CE(1'b1), .D1(pix_data[12]), .D2(pix_data[0]), .R(!reset_n), .S(1'b0)
	);
ODDR #(.DDR_CLK_EDGE("SAME_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")
	)
ODDR_inst7 (.Q(DVI_D[7]), .C(clk25_2_270deg), .CE(1'b1), .D1(pix_data[13]), .D2(pix_data[1]), .R(!reset_n), .S(1'b0)
	);
ODDR #(.DDR_CLK_EDGE("SAME_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")
	)
ODDR_inst8 (.Q(DVI_D[8]), .C(clk25_2_270deg), .CE(1'b1), .D1(pix_data[14]), .D2(pix_data[2]), .R(!reset_n), .S(1'b0)
	);
ODDR #(.DDR_CLK_EDGE("SAME_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")
	)
ODDR_inst9 (.Q(DVI_D[9]), .C(clk25_2_270deg), .CE(1'b1), .D1(pix_data[5]), .D2(pix_data[3]), .R(!reset_n), .S(1'b0)
	);
ODDR #(.DDR_CLK_EDGE("SAME_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")
	)
ODDR_inst10 (.Q(DVI_D[10]), .C(clk25_2_270deg), .CE(1'b1), .D1(pix_data[6]), .D2(pix_data[4]), .R(!reset_n), .S(1'b0)
	);
ODDR #(.DDR_CLK_EDGE("SAME_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")
	)
ODDR_inst11 (.Q(DVI_D[11]), .C(clk25_2_270deg), .CE(1'b1), .D1(pix_data[7]), .D2(1'b0), .R(!reset_n), .S(1'b0)
	);
	
// Clock
ODDR #(.DDR_CLK_EDGE("SAME_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")
	)
ODDR_XCLK (.Q(XCLK_SE), .C(clk25_2), .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0)
	);
OBUFDS OBUFDS_XCLK_inst(.O(XCLK_P), .OB(XCLK_N), .I(XCLK_SE));

endmodule
