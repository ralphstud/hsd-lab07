`timescale 1ns / 1ps

module check1sec(
    input GCLK,
    input CENTER_PUSHBUTTON,
    output [7:0] LED
    );

    reg [7:0] count = 8'b00000000;
    reg [7:0] data = 8'b00000000;
    reg up = 'b1;
    reg down = 'b0;
    reg load = 'b0;

    always @(posedge GCLK) begin
        if (~CENTER_PUSHBUTTON) begin
            if (load) begin
                count = data;
                load <= ~load;
                up <= ~up;
                down <= ~down;
            end
            else if (up) begin
                if (count == 8'b11111111)
                    count <= 8'b00000000;
                else
                    count <= count + 1;
            end
            else if (down) begin
                if (count == 8'b00000000)
                    count <= 8'b11111111;
                else
                    count <= count - 1;
            end            
        end
        else
            count <= 8'b00000000;
    end

    assign LED = count;
    
endmodule
