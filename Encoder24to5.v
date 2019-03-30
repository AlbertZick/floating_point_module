module Encoder24to5(in,out);
	input[23:0] in;
	output [4:0] out;
	wire [2:0] E1out,E2out,E3out;

Encoder8to3 E1(in[23:16],E1out,1'b1,no11);
Encoder8to3 E2(in[15:8],E2out,no11,no12);
Encoder8to3 E3(in[7:0],E3out,no12,no13);

or(out[2],E1out[2],E2out[2],E3out[2]);
or(out[1],E1out[1],E2out[1],E3out[1]);
or(out[0],E1out[0],E2out[0],E3out[0]);

not(out[4],no11);
not(out[3],no12);

endmodule // Encoder24to5
