//Decoder 3-to-8
module Decoder3to8(in,out,en);
input [2:0] in;
input en;
output [7:0] out;
wire n0,n1,n2;
wire en0p,en0n;
wire n2n1,n2p1,p2n1,p2p1;

not(n0,in[0]);
not(n1,in[1]);
not(n2,in[2]);
and(en0p,en,in[0]);
and(en0n,en,n0);
and(n2n1,n2,n1);
and(n2p1,n2,in[1]);
and(p2n1,in[2],n1);
and(p2p1,in[2],in[1]);

and(out[0],n2n1,en0n);
and(out[1],n2n1,en0p);
and(out[2],n2p1,en0n);
and(out[3],n2p1,en0p);
and(out[4],p2n1,en0n);
and(out[5],p2n1,en0p);
and(out[6],p2p1,en0n);
and(out[7],p2p1,en0p);

endmodule
