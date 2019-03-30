module Significand(A,B,op,Z,sign);
input [23:0] A,B;
input [1:0] op;
output [24:0] Z;
output sign;
wire [25:0] Ah,Bh,Zt,Z_extend;
wire [25:0] An,Bn,Oz,Oo;
wire [25:0] Ztr,Zx;

assign Ah={2'b00,A};
assign Bh={2'b00,B};
assign Oz={26{op[0]}};
assign Oo={26{op[1]}};
assign An=Ah^Oz;
assign Bn=Bh^Oo;
assign Ztr={26{Zt[25]}};
assign Zx=Ztr^Zt;

csa_26b CSA1(An,Bn,{25'b0,op[0]^op[1]},Zt,);
csa_26b CSA2(26'b0,Zx,{25'b0,Zt[25]},Z_extend,);
assign Z=Z_extend[24:0];
assign sign=Zt[25];
endmodule
