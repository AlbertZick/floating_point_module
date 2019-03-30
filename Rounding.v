module Rounding(fracin,round,frac,expround);
input [22:0] fracin;
input round;
output[22:0] frac;
output expround;
wire [22:0] fracout;

FullAdder fr0(fracin[0],1'b0,round,fracout[0],Cr0);
FullAdder fr1 (fracin[1],1'b0,Cr0,fracout[1],Cr1);
FullAdder fr2 (fracin[2],1'b0,Cr1,fracout[2],Cr2);
FullAdder fr3 (fracin[3],1'b0,Cr2,fracout[3],Cr3);
FullAdder fr4 (fracin[4],1'b0,Cr3,fracout[4],Cr4);
FullAdder fr5 (fracin[5],1'b0,Cr4,fracout[5],Cr5);
FullAdder fr6 (fracin[6],1'b0,Cr5,fracout[6],Cr6);
FullAdder fr7 (fracin[7],1'b0,Cr6,fracout[7],Cr7);
FullAdder fr8 (fracin[8],1'b0,Cr7,fracout[8],Cr8);
FullAdder fr9 (fracin[9],1'b0,Cr8,fracout[9],Cr9);
FullAdder fr10 (fracin[10],1'b0,Cr9,fracout[10],Cr10);
FullAdder fr11 (fracin[11],1'b0,Cr10,fracout[11],Cr11);
FullAdder fr12 (fracin[12],1'b0,Cr11,fracout[12],Cr12);
FullAdder fr13 (fracin[13],1'b0,Cr12,fracout[13],Cr13);
FullAdder fr14 (fracin[14],1'b0,Cr13,fracout[14],Cr14);
FullAdder fr15 (fracin[15],1'b0,Cr14,fracout[15],Cr15);
FullAdder fr16 (fracin[16],1'b0,Cr15,fracout[16],Cr16);
FullAdder fr17 (fracin[17],1'b0,Cr16,fracout[17],Cr17);
FullAdder fr18 (fracin[18],1'b0,Cr17,fracout[18],Cr18);
FullAdder fr19 (fracin[19],1'b0,Cr18,fracout[19],Cr19);
FullAdder fr20 (fracin[20],1'b0,Cr19,fracout[20],Cr20);
FullAdder fr21 (fracin[21],1'b0,Cr20,fracout[21],Cr21);
FullAdder fr22 (fracin[22],1'b0,Cr21,fracout[22],Cr22);

mux21 #23 M1(fracout,{1'b0,fracout[22:1]},Cr22,frac);
assign expround=Cr22;
endmodule
