//Decoder 2-to-4
module Decoder2to4(in,out);
input [1:0] in;
output [3:0] out;
wire in1_n, in0_n;

not(in1_n,in[1]);
not(in0_n,in[0]);
and(out[0],in0_n,in1_n);
and(out[1],in[0],in1_n);
and(out[2],in0_n,in[1]);
and(out[3],in[0],in[1]);

endmodule
