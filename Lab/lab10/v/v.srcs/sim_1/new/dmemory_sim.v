`timescale 1ns / 1ps
module dmemory_sim();
reg clock = 1'b0;
reg memWrite = 1'b0;
reg [31:0] addr = 32'h0000_0010;
reg [31:0] writeData = 32'ha000_0000;
wire [31:0] readData;
dmemory32 uram (clock,memWrite,addr,writeData,readData);
always #50 clock = ~clock;
initial fork
    #120 memWrite = 1'b1;
    #200 writeData = 32'h0000_00f5;
    #400 memWrite = 1'b0;
// ... to be completed
join
endmodule

