module chrontel_serial_bus_driver(
	clk25_2,
	enable,
	rst_n,
	complete,
	read_write,
	I2C_SCL_video,
	I2C_SDA_video
	);

input						clk25_2;
input						rst_n;
input                enable;
input                read_write;

output reg				complete;
output					I2C_SCL_video;
inout						I2C_SDA_video;


// State machine states
`define                 IDLE            0
`define                 START           1
`define                 DEVADDR_LOW     2
`define                 DEVADDR_HI      3
`define                 DEVADDR_ACK     4
`define                 REGADDR_LOW     5
`define                 REGADDR_HI      6
`define                 REGADDR_ACK     7
`define                 WRITE_HI        8
`define                 WRITE_LOW       9
`define                 WRITE_DAT_ACK   10
`define                 NACK_STOP       11
`define                 STOP_HI         12
`define                 STOP_LOW        13
`define                 STOP_SETUP      14
`define                 BUS_FREE_TIME   15

// Register addresses and data to write
`define					DEV_ADDRESS					(8'h76 << 1) // 7 bit address shifted left to allow for read/write bit
`define					NUMBER_OF_REGISTERS		6


//Input noise spike filter for sda.
//Specifies the number of clk edges for the filter.
//For example: A value of 3 requires 3 consecutive  
//positive clk edges before a change 
//in the internal sda occurs.
//The change will occur on the 4th edge.
//The specs of the filter are the following:
//  Spikes < (INPUT_FILT - 1)*(clk period) are guaranteed to be ignored.
//  Spikes > INPUT_FILT*(clk period) are guaranteed to propagate to internal SDA.
//The I2C spec requires a filter of 0-50ns. It must not block spikes > 50ns.
//To ensure the filter is within spec set it to the following:
//  INPUT_FILT = (50ns / (clk period)) rounded down to the nearest integer
//With a 70MHz clk, period = 14.286ns
//  INPUT_FILT = (50ns / 14.286ns) = 3.5 = 3 (rounded down)
//parameter               INPUT_FILT = 1;
//`define                 USE_SPIKE_FILTER; // Comment this out when INPUT_FILT calculates to 1.
                                            // Then spikes greater than the clock period are guaranteed to propagate but there is no guarantee to block spikes down to 0

//This parameter is used to ensure count times are
//correct for bus frequency + setup and hold times.
//Set to the clk frequency in MHz. For example:
//if you use 70MHz clk for the clk input then
//set CLK_FREQ_IN_MHZ to 70.
//parameter               CLK_FREQ_IN_MHZ = 25.2;

/*
// Change these parameters to affect bus timing settings
localparam              T_LOW    = 1.5;  // Time in microseconds of the low time of the I2C clock
localparam              T_HI     = 1;    // Time in microseconds of the high time of the I2C clock
localparam              SH_TIME  = 0.65; // Hold time for start condition in microseconds. Spec requires 0.6us min for 400kHz
localparam              SS_TIME  = 0.65; // Setup time for stop condition in microseconds. Spec requires 0.6us min for 400kHz
localparam              BUS_FREE_TIME = 1.4; // Time in microseconds between STOP and START. I2C spec requires 1.3us min for 400kHz
localparam              T_HD_DAT = 0.3;  // Data hold time before allowed SDA to change after SCL goes low. In microseconds.
*/

// Don't modify these parameters. These use parameters above for setup.
localparam              T_LOW_COUNT          = 37; // Counter value for setting I2C clock low: round up to nearest int((T_LOW / clk period) - 1)
localparam              T_LOW_COUNT_WIDTH    = 6;
localparam              T_HI_COUNT           = 24; // Counter value for setting I2C clock high: round up to nearest int((T_HI / clk period) - 1)
localparam              T_HI_COUNT_WIDTH     = 5;
localparam              SH_COUNT             = 16; // Start hold time count
localparam              SH_COUNT_WIDTH       = 5;
localparam              SS_COUNT             = 16; // Stop setup time count
localparam              SS_COUNT_WIDTH       = 5;
localparam              BUS_FREE_COUNT       = 35; // Bus free time count
localparam              BUS_FREE_COUNT_WIDTH = 6;
localparam              SDA_CHANGE_COUNT     = 7; // Count from when SCL goes low to when SDA changes


reg                       [3:0] state;
reg                             scl_out;
reg                             sda_out;
`ifdef	USE_SPIKE_FILTER
reg            [INPUT_FILT-1:0] sda_filt_array;
`endif
reg                             sda_filt;
reg     [T_LOW_COUNT_WIDTH-1:0] t_low_counter;
reg                             t_low_count_en;
reg      [T_HI_COUNT_WIDTH-1:0] t_hi_counter;
reg                             t_hi_count_en;
reg        [SH_COUNT_WIDTH-1:0] sh_counter;
reg                             sh_count_en;
reg        [SS_COUNT_WIDTH-1:0] ss_counter;
reg                             ss_count_en;
reg  [BUS_FREE_COUNT_WIDTH-1:0] bus_free_counter;
reg                             bus_free_count_en;
reg                       [3:0] bit_count;
reg                       [7:0] dev_address_store;
reg                       [7:0] register_address_store;
reg                       [7:0] register_address;
reg                       [7:0] data_to_send_store;
reg                       [7:0] data_to_send;
reg						  [2:0] numb_of_registers;

wire                            t_low_count_complete;
wire                            t_hi_count_complete;
wire                            sh_count_complete;
wire                            ss_count_complete;
wire                            bus_free_count_complete;
wire                            sda_change_en;
wire                            sda_in;


// Handling SDA and SCL
assign I2C_SCL_video = (scl_out) ? 1'bz : 1'b0;
assign I2C_SDA_video = (sda_out) ? 1'bz : 1'b0;
assign sda_in = I2C_SDA_video;


// Spike filter for SDA when it is an input
`ifdef USE_SPIKE_FILTER
always @(posedge clk25_2 or negedge rst_n) begin
    if (!rst_n) begin
        sda_filt_array <= {INPUT_FILT{1'b0}};
        sda_filt <= 1'b0;
    end
    else begin
        sda_filt_array <= {sda_filt_array[INPUT_FILT-1:1], sda_in};
        if (sda_filt_array == {INPUT_FILT{1'b1}}) begin
            sda_filt <= 1'b1;
        end
        else if (sda_filt_array == {INPUT_FILT{1'b0}}) begin
            sda_filt <= 1'b0;
        end
        else begin
            sda_filt <= sda_filt;
        end
    end
end
`else
always @(posedge clk25_2 or negedge rst_n) begin
    if (!rst_n) begin
        sda_filt <= 1'b0;
    end
	else begin
		sda_filt <= sda_in;
	end
end
`endif


// Counters
// Start hold time counter
always @(posedge clk25_2 or negedge sh_count_en) begin
    if (!sh_count_en) begin
        sh_counter <= {SH_COUNT_WIDTH{1'b0}};
    end
    else begin
        sh_counter <= sh_counter + 'b1;
    end
end
assign sh_count_complete = (sh_counter == SH_COUNT);


// Stop setup time counter
always @(posedge clk25_2 or negedge ss_count_en) begin
    if (!ss_count_en) begin
        ss_counter <= {SS_COUNT_WIDTH{1'b0}};
    end
    else begin
        ss_counter <= ss_counter + 'b1;
    end
end
assign ss_count_complete = (ss_counter == SS_COUNT);


// Stop to start time counter
always @(posedge clk25_2 or negedge bus_free_count_en) begin
    if (!bus_free_count_en) begin
        bus_free_counter <= {BUS_FREE_COUNT_WIDTH{1'b0}};
    end
    else begin
        bus_free_counter <= bus_free_counter + 'b1;
    end
end
assign bus_free_count_complete = (bus_free_counter == BUS_FREE_COUNT);


// SCL high time counter
always @(posedge clk25_2 or negedge t_hi_count_en) begin
    if (!t_hi_count_en) begin
        t_hi_counter <= {T_HI_COUNT_WIDTH{1'b0}};
    end
    else begin
        t_hi_counter <= t_hi_counter + 'b1;
    end
end
assign t_hi_count_complete = (t_hi_counter == T_HI_COUNT);


// SCL low time counter
always @(posedge clk25_2 or negedge t_low_count_en) begin
    if (!t_low_count_en) begin
        t_low_counter <= {T_LOW_COUNT_WIDTH{1'b0}};
    end
    else begin
        t_low_counter <= t_low_counter + 'b1;
    end
end
assign t_low_count_complete = (t_low_counter == T_LOW_COUNT);
assign sda_change_en = (t_low_counter == SDA_CHANGE_COUNT);
// End Counters


always @(posedge clk25_2 or negedge rst_n) begin
    if (!rst_n) begin
        state <= `IDLE;
        scl_out <= 1'b1;
        sda_out <= 1'b1;
        sh_count_en <= 1'b0;
        ss_count_en <= 1'b0;
        bus_free_count_en <= 1'b0;
        t_low_count_en <= 1'b0;
        t_hi_count_en <= 1'b0;
        bit_count <= 4'b0000;
		  numb_of_registers <= 3'b000;
		  complete <= 1'b0;
    end
    else begin
        
        case (state)
            `IDLE : begin
                if (enable) begin
                    state <= `BUS_FREE_TIME;
                    bus_free_count_en <= 1'b1;
						  numb_of_registers <= (`NUMBER_OF_REGISTERS - 1);
                end
                else begin
                    state <= `IDLE;
                    sh_count_en <= 1'b0;
                    sda_out <= 1'b1;
                    scl_out <= 1'b1;
                end
            end
        
            `START : begin
                if (sh_count_complete) begin
                    scl_out <= 1'b0;
                    sh_count_en <= 1'b0;
                    state <= `DEVADDR_LOW;
                    t_low_count_en <= 1'b1;
                end
            end
        
            `DEVADDR_LOW : begin
                if (t_low_count_complete) begin
                    scl_out <= 1'b1;
                    t_low_count_en <= 1'b0;
                    t_hi_count_en <= 1'b1;
                    if (bit_count == 4'd8) begin
                        state <= `DEVADDR_ACK;
                        bit_count <= 4'b0000;
                    end
                    else begin
                        state <= `DEVADDR_HI;
                        bit_count <= bit_count + 4'b1;
                    end
                end
                
                if (sda_change_en) begin
                    if (bit_count == 4'd8) begin
                        sda_out <= 1'b1;
                    end
                    else begin
                        sda_out <= dev_address_store[7];
                        dev_address_store <= dev_address_store << 1;
                    end
                end
            end
        
            `DEVADDR_HI : begin
                if (t_hi_count_complete) begin
                    scl_out <= 1'b0;
                    state <= `DEVADDR_LOW;
                    t_low_count_en <= 1'b1;
                    t_hi_count_en <= 1'b0;
                end
            end
        
            `DEVADDR_ACK : begin
                if (sda_filt) begin
                    state <= `NACK_STOP;
                end
                else begin
                    state <= `REGADDR_HI;
                end
            end
        
            `REGADDR_LOW : begin
                if (t_low_count_complete) begin
                    scl_out <= 1'b1;
                    t_low_count_en <= 1'b0;
                    t_hi_count_en <= 1'b1;
                    if (bit_count == 4'd8) begin
                        state <= `REGADDR_ACK;
                        bit_count <= 4'b0000;
                    end
                    else begin
                        state <= `REGADDR_HI;
                        bit_count <= bit_count + 4'b1;
                    end
                end
                
                if (sda_change_en) begin
                    if (bit_count == 4'd8) begin
                        sda_out <= 1'b1;
                    end
                    else begin
                        sda_out <= register_address_store[7];
                        register_address_store <= register_address_store << 1;
                    end
                end
            end
        
            `REGADDR_HI : begin
                if (t_hi_count_complete) begin
                    scl_out <= 1'b0;
                    state <= `REGADDR_LOW;
                    t_low_count_en <= 1'b1;
                    t_hi_count_en <= 1'b0;
                end
            end
        
            `REGADDR_ACK : begin
                if (sda_filt) begin
                    state <= `NACK_STOP;
                end
                else begin
                    if (read_write) begin
                        state <= `STOP_HI; // Here is where to shift to READ state if enabling read functionality
                    end
                    else begin
                        state <= `WRITE_HI;
                    end
                end
            end
        
            `WRITE_HI : begin
                if (t_hi_count_complete) begin
                    scl_out <= 1'b0;
                    state <= `WRITE_LOW;
                    t_low_count_en <= 1'b1;
                    t_hi_count_en <= 1'b0;
                end
            end
        
            `WRITE_LOW : begin
                if (t_low_count_complete) begin
                    scl_out <= 1'b1;
                    t_low_count_en <= 1'b0;
                    t_hi_count_en <= 1'b1;
                    if (bit_count == 4'b1000) begin
                        state <= `WRITE_DAT_ACK;
                        bit_count <= 4'b0000;
                    end
                    else begin
                        state <= `WRITE_HI;
                        bit_count <= bit_count + 4'b1;
                    end
                end
                
                if (sda_change_en) begin
                    if (bit_count == 4'b1000) begin
                        sda_out <= 1'b1;
                    end
                    else begin
                        sda_out <= data_to_send_store[7];
                        data_to_send_store <= data_to_send_store << 1;
                    end
                end
            end
        
            `WRITE_DAT_ACK : begin
                if (sda_filt) begin
                    state <= `NACK_STOP;
                end
                else begin
					state <= `STOP_HI;
                end
            end
        
            `NACK_STOP : begin
                if (t_hi_count_complete) begin
                    scl_out <= 1'b0;
                    state <= `STOP_LOW;
                    t_low_count_en <= 1'b1;
                    t_hi_count_en <= 1'b0;
                end
            end
        
            `STOP_HI : begin
                if (t_hi_count_complete) begin
                    scl_out <= 1'b0;
                    state <= `STOP_LOW;
                    t_low_count_en <= 1'b1;
                    t_hi_count_en <= 1'b0;
                end
            end
        
            `STOP_LOW : begin
                if (t_low_count_complete) begin
                    scl_out <= 1'b1;
                    t_low_count_en <= 1'b0;
                    ss_count_en <= 1'b1;
                    state <= `STOP_SETUP;
                end
                
                if (sda_change_en) begin
                    sda_out <= 1'b0;
                end
            end
        
            `STOP_SETUP : begin
					if (ss_count_complete) begin
						sda_out <= 1'b1;
						if (|numb_of_registers) begin
							numb_of_registers <= numb_of_registers - 3'b001;
							state <= `BUS_FREE_TIME;
							bus_free_count_en <= 1'b1;
						end
						else begin
							state <= `IDLE;
							complete <= 1'b1;
						end
					end
            end
        
            `BUS_FREE_TIME : begin
                if (bus_free_count_complete) begin
                    state <= `START;
                    bus_free_count_en <= 1'b0;
                    sh_count_en <= 1'b1;
                    sda_out <= 1'b0;
                    scl_out <= 1'b1;
					     dev_address_store <= 8'hEC;
                    register_address_store <= register_address;
					     data_to_send_store <= data_to_send;
                end
            end
        
            default : begin
                state <= `IDLE;
            end
        
        endcase
    end
end

// Registers are selected in reverse order. So 3'b000 will be the last register written to.
always @(*) begin
	case (numb_of_registers)
		3'b000 : begin // 0x1C
			register_address = (8'b10000000 | 8'h1C);
			data_to_send = 8'b00000000;
		end
		3'b001 : begin // 0x1F
			register_address = (8'b10000000 | 8'h1F);
			data_to_send = 8'b10000011;
		end
		3'b010 : begin // 0x21
			register_address = (8'b10000000 | 8'h21);
			data_to_send = 8'b00001001;
		end
		3'b011 : begin // 0x33
			register_address = (8'b10000000 | 8'h33);
			data_to_send = 8'b11100100;
		end
		3'b100 : begin // 0x48
			register_address = (8'b10000000 | 8'h48);
			data_to_send = 8'b00011000; // Set last 2 bits to 00 for regular use, 01 for color bar test pattern
		end
		3'b101 : begin // 0x49
			register_address = (8'b10000000 | 8'h49);
			data_to_send = 8'b00000000;
		end
		default : begin
			register_address = 8'b00000000;
			data_to_send = 8'b00000000;
		end
	endcase
end

endmodule





