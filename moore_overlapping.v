`timescale 1ns / 1ps
module moore_overlapping(input clk,reset,ip,output reg op,output [1:0] state_out);

parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg [1:0] state,next_state;

always @(posedge clk or posedge reset)begin
    if(reset)
        state<=s0;
    else
        state<=next_state;end
        
always @(*)begin
    case(state)
        s0:begin if(ip) next_state=s1;
                 else next_state=s0; end
        s1:begin if(ip) next_state=s1;
                 else next_state=s2; end
        s2:begin if(ip) next_state=s3;
                 else next_state=s0; end
        s3:begin if(ip) next_state=s1;
                 else next_state=s2;end
     endcase
     end
     
always @(*)begin
    op=0;
    if(state==s3)
       op=1;
    else op=0;
end
                    
assign state_out=state;
endmodule
