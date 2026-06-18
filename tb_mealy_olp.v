`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 14:27:11
// Design Name: 
// Module Name: tb_mealy_olp
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


module tb_olp(

    );
    reg clk,reset,ip;
    wire op;
    wire [1:0] state_out;
    
    moore_overlapping dut(clk,reset,ip,op,state_out);
    
    initial begin
        clk=0;
        reset=1;
        ip=0;end
       
    always #10 clk=~clk;
    
    initial begin
        #5 ip=1;
        #15 reset=0;
        #20 ip=0;
        #20 ip=1;
        #20 ip=0;
        #20 ip=1;
        #20 ip=1;
        #20 ip=0;
        #20 ip=1;
        #100;
        $finish; end
        
        initial $monitor("t=%0t clk=%b ip=%b op=%b state_out",$time,clk,ip,op,state_out);
endmodule
