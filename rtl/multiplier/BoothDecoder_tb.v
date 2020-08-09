module BoothDecoder_tb;

	reg [22:0] in;
	reg [2:0] code;
	wire [25:0] out;

BoothDecoder BD(in,code,out);

initial begin
	#0;
	in = 26'b00100001011010111100001100;
	code = 3'b000; #20;
	code = 3'b001; #20;
	code = 3'b010; #20;
	code = 3'b011; #20;
	code = 3'b100; #20;
	code = 3'b101; #20;
	code = 3'b110; #20;
	code = 3'b111; #20;
	$stop;
end // initial

endmodule // BoothDecoder_tb