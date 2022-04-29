`timescale 1ns / 1ps

module check1sec(
    input GCLK,
    input CENTER_PUSHBUTTON,
    output [7:0] LED
    );

    integer i;
    reg [7:0] count = 8'b00000000;
    
    always @(posedge GCLK) begin
        if (CENTER_PUSHBUTTON) begin
            count <= 'd0;
            i <= 0;
        end
        else begin
            if (i == 100000000) begin
                count = count + 1;
                i = 0;
            end
            else begin
                i = i + 1;
            end
        end    
    end

    assign LED = count;
    
endmodule
