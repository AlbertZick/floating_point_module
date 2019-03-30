module Decoder24(in,out);
input [7:0] in;
output [24:0] out;
wire [3:0] en;

Decoder2to4 D24(in[4:3],en);
Decoder3to8 D38a(in[2:0],out[7:0],en[0]);
Decoder3to8 D38b(in[2:0],out[15:8],en[1]);
Decoder3to8 D38c(in[2:0],out[23:16],en[2]);
assign out[24] = en[3];

endmodule




