module Division(inA,inB,clk,en,n_rst,out,finish);

	input [31:0] inA,inB;
	input clk,en,n_rst;
	output [31:0] out;
	output finish;
	wire [7:0] ExpDiff;
	wire [24:0] quotient;
	wire [23:0] quotient_sl;
	wire [31:0] outnormal,outzero,outnan,outinf,temp1,temp2;
	wire zero,inf,nan;
	wire [1:0] select;

xor(outnormal[31],inA[31],inB[31]);

EightBitSub EBS(inA[30:23],inB[30:23],,ExpDiff);
Divider DV(quotient,finish,inA[22:0],inB[22:0],clk,en,n_rst);
ShiftLeft24 SL24(quotient[23:0],{7'b0,~quotient[23]},quotient_sl);
assign outnormal[22:0] = quotient_sl[22:0];
EightBitSub EBS2(ExpDiff,{6'b100000,~quotient[23],quotient[23]},,outnormal[30:23]);

CheckType CtA(inA,zeroA,infA,nanA);
CheckType CtB(inB,zeroB,infB,nanB);

and(sAzB,inA[31],zeroB);
and(sABiA,outnormal[31],infA);
or(outinf[31],sABiA,sAzB);
assign outinf[30:0]={8'b11111111,23'b0};
assign outnan=32'b01111111101010101010101010101010;
assign outzero={outnormal[31],31'b0};

assign zero = (zeroA&(infB|(~nanB&~zeroB)))|(infB&(zeroA|(~infA&~nanA)));
assign inf  = (zeroB&(infA|(~nanA&~zeroA)))|(infA&(zeroB|(~infB&~nanB)));
assign nan  = nanA|nanB|(zeroA&zeroB)|(infA&infB);
assign select[0] = (~zero&~nan);
assign select[1] = (~zero&~inf);
mux21 #32 M0(outzero,outinf,select[0],temp1);
mux21 #32 M1(outnan,outnormal,select[0],temp2);
mux21 #32 MM(temp1,temp2,select[1],out);

endmodule // Division