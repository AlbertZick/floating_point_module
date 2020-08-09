//Find the position of the first one
module OnePosition(in,out,have1);
	input [24:0] in;
	output [24:0] out;
	output have1;

OnePosElement O24(1'b0,in[24],h24,out[0]);
OnePosElement O23(h24,in[23],h23,out[1]);
OnePosElement O22(h23,in[22],h22,out[2]);
OnePosElement O21(h22,in[21],h21,out[3]);
OnePosElement O20(h21,in[20],h20,out[4]);
OnePosElement O19(h20,in[19],h19,out[5]);
OnePosElement O18(h19,in[18],h18,out[6]);
OnePosElement O17(h18,in[17],h17,out[7]);
OnePosElement O16(h17,in[16],h16,out[8]);
OnePosElement O15(h16,in[15],h15,out[9]);
OnePosElement O14(h15,in[14],h14,out[10]);
OnePosElement O13(h14,in[13],h13,out[11]);
OnePosElement O12(h13,in[12],h12,out[12]);
OnePosElement O11(h12,in[11],h11,out[13]);
OnePosElement O10(h11,in[10],h10,out[14]);
OnePosElement O9(h10,in[9],h9,out[15]);
OnePosElement O8(h9,in[8],h8,out[16]);
OnePosElement O7(h8,in[7],h7,out[17]);
OnePosElement O6(h7,in[6],h6,out[18]);
OnePosElement O5(h6,in[5],h5,out[19]);
OnePosElement O4(h5,in[4],h4,out[20]);
OnePosElement O3(h4,in[3],h3,out[21]);
OnePosElement O2(h3,in[2],h2,out[22]);
OnePosElement O1(h2,in[1],h1,out[23]);
OnePosElement O0(h1,in[0],have1,out[24]);

endmodule
