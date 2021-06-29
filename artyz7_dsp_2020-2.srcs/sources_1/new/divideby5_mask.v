`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2021 11:55:22 AM
// Design Name: 
// Module Name: divideby5_mask
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module divideby5_mask(
    input clk,
    input rst,
    input value_serial_LSB_first,
    output reg divisable_by_5
    );
    
    always @ (posedge clk or posedge rst)
        begin
            if (rst)
                begin
                    divisable_by_5 <= 1'b0;
                end
            else 
                begin
                    if (value_serial_LSB_first == 1'b0)
                        begin
                        end
                    else
                        begin
                        end
                end            
        end
    
endmodule
