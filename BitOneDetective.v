//This module is to find the first 1 bit count from MSB to LSB, then base on that to export the correct
// significand and exponent of the result
module BitOneDetective(in,out,expminus,round,zero);
input [24:0] in;
output [22:0] out;
output round,zero;
output [7:0] expminus;
wire [24:0] pos1;
wire [4:0] encode1;
wire [23:0] outtmp;
wire [22:0] outtmp2;
wire [24:0] inreverse;

OnePosition O1(in,pos1,have1);
not(zero,have1);
Encoder24to5 E1(pos1[24:1],encode1);

and(round,pos1[0],in[0]);
assign expminus[7] = pos1[0];
assign expminus[6] = pos1[0];
assign expminus[5] = pos1[0];
or(expminus[4],pos1[0],encode1[4]);
or(expminus[3],pos1[0],encode1[3]);
or(expminus[2],pos1[0],encode1[2]);
or(expminus[1],pos1[0],encode1[1]);
or(expminus[0],pos1[0],encode1[0]);
//Instead of shifting left, I reverse the input so that I can use the shift right module I created
assign inreverse={in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7],in[8],in[9],in[10],
					in[11],in[12],in[13],in[14],in[15],in[16],in[17],in[18],in[19],in[20],
					in[21],in[22],in[23],in[24]};
ShiftRight24 S24(inreverse[24:1],expminus,outtmp);
assign outtmp2={outtmp[1],outtmp[2],outtmp[3],outtmp[4],outtmp[5],outtmp[6],outtmp[7],
			outtmp[8],outtmp[9],outtmp[10],outtmp[11],outtmp[12],outtmp[13],outtmp[14],outtmp[15],
			outtmp[16],outtmp[17],outtmp[18],outtmp[19],outtmp[20],outtmp[21],outtmp[22],outtmp[23]};
mux21 #1 M00(outtmp2[0],in[1],pos1[0],out[0]);
mux21 #1 M01(outtmp2[1],in[2],pos1[0],out[1]);
mux21 #1 M02(outtmp2[2],in[3],pos1[0],out[2]);
mux21 #1 M03(outtmp2[3],in[4],pos1[0],out[3]);
mux21 #1 M04(outtmp2[4],in[5],pos1[0],out[4]);
mux21 #1 M05(outtmp2[5],in[6],pos1[0],out[5]);
mux21 #1 M06(outtmp2[6],in[7],pos1[0],out[6]);
mux21 #1 M07(outtmp2[7],in[8],pos1[0],out[7]);
mux21 #1 M08(outtmp2[8],in[9],pos1[0],out[8]);
mux21 #1 M09(outtmp2[9],in[10],pos1[0],out[9]);
mux21 #1 M10(outtmp2[10],in[11],pos1[0],out[10]);
mux21 #1 M11(outtmp2[11],in[12],pos1[0],out[11]);
mux21 #1 M12(outtmp2[12],in[13],pos1[0],out[12]);
mux21 #1 M13(outtmp2[13],in[14],pos1[0],out[13]);
mux21 #1 M14(outtmp2[14],in[15],pos1[0],out[14]);
mux21 #1 M15(outtmp2[15],in[16],pos1[0],out[15]);
mux21 #1 M16(outtmp2[16],in[17],pos1[0],out[16]);
mux21 #1 M17(outtmp2[17],in[18],pos1[0],out[17]);
mux21 #1 M18(outtmp2[18],in[19],pos1[0],out[18]);
mux21 #1 M19(outtmp2[19],in[20],pos1[0],out[19]);
mux21 #1 M20(outtmp2[20],in[21],pos1[0],out[20]);
mux21 #1 M21(outtmp2[21],in[22],pos1[0],out[21]);
mux21 #1 M22(outtmp2[22],in[23],pos1[0],out[22]);

endmodule


