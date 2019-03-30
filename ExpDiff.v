module ExpDiff(expA,expB,expbig,expdiff,muxctrl);
input [7:0] expA,expB;
output muxctrl;
output [7:0] expbig,expdiff;
wire [7:0] exptemp;

EightBitSub E4(expA,expB,,exptemp);
mux21 #8 m0(expA,expB,exptemp[7],expbig);
FullAdder fe0(1'b0,exptemp[0]^exptemp[7],exptemp[7],expdiff[0],C0);
FullAdder fe1(1'b0,exptemp[1]^exptemp[7],C0,expdiff[1],C1);
FullAdder fe2(1'b0,exptemp[2]^exptemp[7],C1,expdiff[2],C2);
FullAdder fe3(1'b0,exptemp[3]^exptemp[7],C2,expdiff[3],C3);
FullAdder fe4(1'b0,exptemp[4]^exptemp[7],C3,expdiff[4],C4);
FullAdder fe5(1'b0,exptemp[5]^exptemp[7],C4,expdiff[5],C5);
FullAdder fe6(1'b0,exptemp[6]^exptemp[7],C5,expdiff[6],C6);
FullAdder fe7(1'b0,1'b0,C6,expdiff[7],C7);

assign muxctrl=exptemp[7];
endmodule
