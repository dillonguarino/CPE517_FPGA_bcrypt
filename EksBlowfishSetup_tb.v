
module EksBlowfishSetup_tb();

	reg clk;
	reg [127:0] Salt;
   reg [7:0] cost;
   reg [575:0] Key;
	reg rst;
   wire [327:0] cryptm;
	
	EksBlowfishSetup DUT ( clk, Salt, cost, Key, rst, cryptm);
	
	initial begin
	rst = 1'b1;
	clk = 1'b0;
	Salt = 128'd32;
	cost = 8'd1;
	Key = 576'd13;
	#20;
	clk = 1'b1;
	#20;
	clk = 1'b0;
	rst = 1'b0;
	#20;
	clk = 1'b1;
	#20;
	clk = 1'b0;
	#20;
	clk = 1'b1;
	#20;
	clk = 1'b0;
	#20;
	clk = 1'b1;
	#20;
	clk = 1'b0;
	#20;
	clk = 1'b1;
	#20;
	$finish;
	end
	
	


endmodule
