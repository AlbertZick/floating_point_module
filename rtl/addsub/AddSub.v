module AddSub(inA,inB,op,out);
input [31:0] inA,inB;
input op;
output [31:0] out;

wire [31:0] outnormal,outz,outinf,outnan,outpre,tmp0,tmp1;	//output for other special cases

wire [1:0] opsign;
wire [1:0] select;
wire [22:0] SmallSign, BigSign;
wire [23:0] SignA, SignB, SmallSign2;
wire [7:0] expbig, expdiff;
wire [24:0] fracpr;

//Control the sign of the significand to be computed
CtrlSignificand Ct0(inA[31],inB[31],op,opsign);	

//Calculate the difference between the two exponent, then shift right the significand of the smaller one
//to prepare for the addition or subtraction
ExpDiff E0(inA[30:23],inB[30:23],expbig,expdiff,muxctrl);
mux21 #23 MShift(inA[22:0],inB[22:0],~muxctrl,SmallSign);
mux21 #23 M1(inA[22:0],inB[22:0],muxctrl,BigSign);
ShiftRight24 Sh0({1'b1,SmallSign},expdiff,SmallSign2);
mux21 #24 M2(SmallSign2,{1'b1,BigSign},~muxctrl,SignA);
mux21 #24 M3(SmallSign2,{1'b1,BigSign},muxctrl,SignB);

//Using the prepared significands to do the addition/subtraction
Significand Si0(SignA,SignB,opsign,fracpr,outnormal[31]);

//Normalize the result (changing to the correct exponent level and rounding)
Normalize N0(fracpr,expbig,outnormal[22:0],outnormal[30:23]);

//Check for other special cases: zero, infinifty and NaN (Not a number)
CheckType CtA(inA,zeroA,infA,nanA);
CheckType CtB(inB,zeroB,infB,nanB);
InfinityProcess InfP(infA,infB,op,inA,inB,outinf,naninf);
ZeroProcess ZP(zeroA,zeroB,op,inA,inB,outz);
or(inf_w,infA,infB);
or(zero_w,zeroA,zeroB);
or(nanab,nanA,nanB);
or(nan_w,nanab,naninf);
not(inf_n,inf_w);
and(infnz,inf_n,zero_w);
or(select[1],nan_w,inf_w);
or(select[0],nan_w,infnz);
assign outnan=32'b01111111101010101010101010101010;
mux21 #32 Mout0(outnormal,outz,select[0],tmp0);
mux21 #32 Mout1(outinf,outnan,select[0],tmp1);
mux21 #32 MoutM(tmp0,tmp1,select[1],outpre);
//Finally, change the result to zero if it is too small (example: 10^(-27))
CheckOutSmall COS(outpre,out);

endmodule


