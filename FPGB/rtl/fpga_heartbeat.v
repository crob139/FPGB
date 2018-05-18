module fpga_heartbeat(
	clk,
	reset_n,
	heartbeat_led
	);

input				clk;
input				reset_n;
output reg		heartbeat_led;

reg	[21:0]	counter;

always @(posedge clk or negedge reset_n) begin
	if (!reset_n) begin
		counter <= 22'h0;
		heartbeat_led <= 1'b0;
	end
	else begin
		if (counter == 22'd2100000) begin
			counter <= 22'h0;
			heartbeat_led <= !heartbeat_led;
		end
		else begin
			counter <= counter + 22'h1;
			heartbeat_led <= heartbeat_led;
		end
	end
end

endmodule
