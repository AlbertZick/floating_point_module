module Encoder8to3(in,out,en,no1);
	input [7:0] in;
	input en;
	output [2:0] out;
	output no1;

or(in45,in[4],in[5]);
or(in67,in[6],in[7]);
or(in4567,in45,in67);

and(out[2],in4567,en);

or(in23,in[2],in[3]);
or(in2367,in23,in67);

and(out[1],in2367,en);

or(in13,in[1],in[3]);
or(in57,in[5],in[7]);
or(in1357,in13,in57);

and(out[0],in1357,en);

or(in01,in[0],in[1]);
or(in0123,in01,in23);
nor(no1,in0123,in4567);

endmodule
