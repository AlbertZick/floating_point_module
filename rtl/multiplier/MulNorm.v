module MulNorm(in,expminus,out,round);
input [47:0] in;
output wire [23:0] out;
output wire [7:0] expminus;
output wire round;
wire [47:0] pos1;
wire [5:0] encode;
wire [7:0] outmux;
wire [23:0] outleft,outleft2,outright,outright2,outround,outround2;

MulOnePosition MOP(in,pos1,have1);
Encoder48to6 E48_6(pos1,encode);
EightBitSub EBS(8'b00011000,{2'b0,encode},,outmux);
mux21 #24 M0(in[47:24],in[23:0],outmux[7],outleft);
mux21 #24 M1(in[23:0],24'b0,outmux[7],outright);
ShiftLeft24  SL24(outleft,{2'b0,encode},outleft2);
ShiftRight24 SR24(outright,outmux,outright2);

//Fraction
or(out[00],outleft2[00],outright2[00]);
or(out[01],outleft2[01],outright2[01]);
or(out[02],outleft2[02],outright2[02]);
or(out[03],outleft2[03],outright2[03]);
or(out[04],outleft2[04],outright2[04]);
or(out[05],outleft2[05],outright2[05]);
or(out[06],outleft2[06],outright2[06]);
or(out[07],outleft2[07],outright2[07]);
or(out[08],outleft2[08],outright2[08]);
or(out[09],outleft2[09],outright2[09]);
or(out[10],outleft2[10],outright2[10]);
or(out[11],outleft2[11],outright2[11]);
or(out[12],outleft2[12],outright2[12]);
or(out[13],outleft2[13],outright2[13]);
or(out[14],outleft2[14],outright2[14]);
or(out[15],outleft2[15],outright2[15]);
or(out[16],outleft2[16],outright2[16]);
or(out[17],outleft2[17],outright2[17]);
or(out[18],outleft2[18],outright2[18]);
or(out[19],outleft2[19],outright2[19]);
or(out[20],outleft2[20],outright2[20]);
or(out[21],outleft2[21],outright2[21]);
or(out[22],outleft2[22],outright2[22]);
or(out[23],outleft2[23],outright2[23]);

//Round
mux21 #24 M2(in[23:0],24'b0,outmux[7],outround);
ShiftLeft24 SL24R(outround,{2'b0,encode},outround2);
assign round = outround2[23];

//Expminus
EightBitSub EBS2({2'b0,encode},8'b00011000,,expminus);

endmodule

//
module Encoder48to6(in,out);
	input [47:0] in;
	output [5:0] out;
	wire [2:0] E1out,E2out,E3out,E4out,E5out,E6out;

	Encoder8to3 E1(in[47:40],E1out,1'b1,no11);
	Encoder8to3 E2(in[39:32],E2out,no11,no12);
	Encoder8to3 E3(in[31:24],E3out,no12,no13);
	Encoder8to3 E4(in[23:16],E4out,no13,no14);
	Encoder8to3 E5(in[15:8],E5out,no14,no15);
	Encoder8to3 E6(in[7:0],E6out,no15,no16);

	or(out_123_0,E1out[0],E2out[0],E3out[0]);
	or(out_456_0,E4out[0],E5out[0],E5out[0]);
	or(out[0],out_123_0,out_456_0);

	or(out_123_1,E1out[1],E2out[1],E3out[1]);
	or(out_456_1,E4out[1],E5out[1],E5out[1]);
	or(out[1],out_123_1,out_456_1);

	or(out_123_2,E1out[2],E2out[2],E3out[2]);
	or(out_456_2,E4out[2],E5out[2],E5out[2]);
	or(out[2],out_123_2,out_456_2);

	not(n1,no11);
	not(n2,no12);
	not(n3,no13);
	not(n4,no14);
	not(n5,no15);

	or(out[5],n1,n2);
	or(out[4],n3,n4);
	or(out[3],n1,n3,n5);

endmodule

//Find the position of the first one
module MulOnePosition(in,out,have1);
	input [47:0] in;
	output [47:0] out;
	output have1;

OnePosElement O47(1'b0,in[47],h47,out[0]);
OnePosElement O46(h47,in[46],h46,out[1]);
OnePosElement O45(h46,in[45],h45,out[2]);
OnePosElement O44(h45,in[44],h44,out[3]);
OnePosElement O43(h44,in[43],h43,out[4]);
OnePosElement O42(h43,in[42],h42,out[5]);
OnePosElement O41(h42,in[41],h41,out[6]);
OnePosElement O40(h41,in[40],h40,out[7]);
OnePosElement O39(h40,in[39],h39,out[8]);
OnePosElement O38(h39,in[38],h38,out[9]);
OnePosElement O37(h38,in[37],h37,out[10]);
OnePosElement O36(h37,in[36],h36,out[11]);
OnePosElement O35(h36,in[35],h35,out[12]);
OnePosElement O34(h35,in[34],h34,out[13]);
OnePosElement O33(h34,in[33],h33,out[14]);
OnePosElement O32(h33,in[32],h32,out[15]);
OnePosElement O31(h32,in[31],h31,out[16]);
OnePosElement O30(h31,in[30],h30,out[17]);
OnePosElement O29(h30,in[29],h29,out[18]);
OnePosElement O28(h29,in[28],h28,out[19]);
OnePosElement O27(h28,in[27],h27,out[20]);
OnePosElement O26(h27,in[26],h26,out[21]);
OnePosElement O25(h26,in[25],h25,out[22]);
OnePosElement O24(h25,in[24],h24,out[23]);
OnePosElement O23(h24,in[23],h23,out[24]);
OnePosElement O22(h23,in[22],h22,out[25]);
OnePosElement O21(h22,in[21],h21,out[26]);
OnePosElement O20(h21,in[20],h20,out[27]);
OnePosElement O19(h20,in[19],h19,out[28]);
OnePosElement O18(h19,in[18],h18,out[29]);
OnePosElement O17(h18,in[17],h17,out[30]);
OnePosElement O16(h17,in[16],h16,out[31]);
OnePosElement O15(h16,in[15],h15,out[32]);
OnePosElement O14(h15,in[14],h14,out[33]);
OnePosElement O13(h14,in[13],h13,out[34]);
OnePosElement O12(h13,in[12],h12,out[35]);
OnePosElement O11(h12,in[11],h11,out[36]);
OnePosElement O10(h11,in[10],h10,out[37]);
OnePosElement O9(h10,in[9],h9,out[38]);
OnePosElement O8(h9,in[8],h8,out[39]);
OnePosElement O7(h8,in[7],h7,out[40]);
OnePosElement O6(h7,in[6],h6,out[41]);
OnePosElement O5(h6,in[5],h5,out[42]);
OnePosElement O4(h5,in[4],h4,out[43]);
OnePosElement O3(h4,in[3],h3,out[44]);
OnePosElement O2(h3,in[2],h2,out[45]);
OnePosElement O1(h2,in[1],h1,out[46]);
OnePosElement O0(h1,in[0],have1,out[47]);

endmodule

//
module ShiftLeft24(X,shamt,Y);
input [7:0] shamt;
input [23:0] X;
output wire [23:0] Y;
wire [23:0] Xreverse,Yreverse;

assign Xreverse={X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],
					X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],
					X[21],X[22],X[23]};
ShiftRight24 SR24L(Xreverse,shamt,Yreverse);
assign Y = {Yreverse[0],Yreverse[1],Yreverse[2],Yreverse[3],Yreverse[4],Yreverse[5],Yreverse[6],Yreverse[7],Yreverse[8],Yreverse[9],Yreverse[10],
					Yreverse[11],Yreverse[12],Yreverse[13],Yreverse[14],Yreverse[15],Yreverse[16],Yreverse[17],Yreverse[18],Yreverse[19],Yreverse[20],
					Yreverse[21],Yreverse[22],Yreverse[23]};

endmodule