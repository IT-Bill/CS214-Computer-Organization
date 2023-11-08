`timescale 1ns / 1ps

module dmemory32(
    input clock,
    input memWrite,
    input[15:0] address,
    input[31:0] writeData,
    output[31:0] readData
    );
    wire clk;
    
    dmem dmem_i (
        .clka(clk),
        .wea(memWrite),
        .addra(address[15:2]),
        .dina(writeData),
        .douta(readData)
    );
    
    assign clk = !clock;
    
endmodule
