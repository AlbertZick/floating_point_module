module MulRound(in,round,expminus,frac,expminus2);
input [23:0] in;
input round;
input [7:0] expminus;
wire [23:0] out;
output [22:0] frac;
output [7:0] expminus2;

FullAdder frm0 (in[0],1'b0,round,out[0],Crm0);
FullAdder frm1 (in[1],1'b0,Crm0,out[1],Crm1);
FullAdder frm2 (in[2],1'b0,Crm1,out[2],Crm2);
FullAdder frm3 (in[3],1'b0,Crm2,out[3],Crm3);
FullAdder frm4 (in[4],1'b0,Crm3,out[4],Crm4);
FullAdder frm5 (in[5],1'b0,Crm4,out[5],Crm5);
FullAdder frm6 (in[6],1'b0,Crm5,out[6],Crm6);
FullAdder frm7 (in[7],1'b0,Crm6,out[7],Crm7);
FullAdder frm8 (in[8],1'b0,Crm7,out[8],Crm8);
FullAdder frm9 (in[9],1'b0,Crm8,out[9],Crm9);
FullAdder frm10 (in[10],1'b0,Crm9,out[10],Crm10);
FullAdder frm11 (in[11],1'b0,Crm10,out[11],Crm11);
FullAdder frm12 (in[12],1'b0,Crm11,out[12],Crm12);
FullAdder frm13 (in[13],1'b0,Crm12,out[13],Crm13);
FullAdder frm14 (in[14],1'b0,Crm13,out[14],Crm14);
FullAdder frm15 (in[15],1'b0,Crm14,out[15],Crm15);
FullAdder frm16 (in[16],1'b0,Crm15,out[16],Crm16);
FullAdder frm17 (in[17],1'b0,Crm16,out[17],Crm17);
FullAdder frm18 (in[18],1'b0,Crm17,out[18],Crm18);
FullAdder frm19 (in[19],1'b0,Crm18,out[19],Crm19);
FullAdder frm20 (in[20],1'b0,Crm19,out[20],Crm20);
FullAdder frm21 (in[21],1'b0,Crm20,out[21],Crm21);
FullAdder frm22 (in[22],1'b0,Crm21,out[22],Crm22);
FullAdder frm23 (in[23],1'b0,Crm22,out[23],Crm23);

assign frac=(Crm23)?out[23:1]:out[22:0];

EightBitSub Erm(expminus,{8{Crm23}},,expminus2);

endmodule
