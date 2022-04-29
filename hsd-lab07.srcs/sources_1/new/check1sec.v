`timescale 1ns / 1ps

module check1sec(
    input GCLK,
    input CENTER_PUSHBUTTON,
    output [7:0] LED
    );

    reg [7:0] count = 8'b00000000;

    always @(posedge GCLK) begin
        if (count == 8'b00000000)
            count <= 8'b11111111;
        else
            count <= count - 1;
        if (count == 8'b11111111)
            count <= 8'b00000000;
        else
            count <= count + 1;
    end

    assign LED = count;
    
endmodule
