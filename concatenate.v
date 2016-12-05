`timescale 1ns / 1ps

module concatenate(clk, rst, ct_en, cost, salt, ctext, ct_initializing, ct_busy, ct_done, out);

input clk, rst, ct_en; //clock, reset, enable concatenation
input [costsize] cost; //Cost (not sure how many bits...)
input [127:0] salt; 	//128-bit salt
input [183:0] ctext;	//184-bit Ciphertext/Key
output ct_initializing, ct_busy, ct_done; //Concatenation initializing, busy, done
output [outsize] out;	//Output, size of cost + salt + ctext

always @ (posedge ct_en)	//When concatenation is enabled, signal to start
begin

assign out  = {{(costsize){cost[costsize:0]}}, {128{salt[127:0]}}, {184{ctext[183:0]}}};

end
endmodule

