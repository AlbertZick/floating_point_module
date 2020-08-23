module Multiplication(inA,inB,clk,out);
input [31:0] inA, inB;
input clk;
output [31:0] out;
wire [7:0] expsum;
wire [47:0] fracmul,fractrue;
wire [23:0] outround;
wire [1:0] select;
wire [7:0] expminus, expminus2, expbias, exptemp;
wire [31:0] outnormal,outpre,outzero,outinf,outnan,tmp1,tmp0;
wire [25:0] a,b,c,d,e,f,g,h,i,j,k,l,m;

wire [31:0] inAd,inBd;
wire [25:0] ad,bd,cd,dd,ed,fd,gd,hd,id,jd,kd,ld,md;
EightBitSub Ebias(inA[30:23],8'b01111111,,expbias);

FullAdder fm0(expbias[0],inB[23],1'b0,expsum[0],Cm0);
FullAdder fm1(expbias[1],inB[24],Cm0, expsum[1],Cm1);
FullAdder fm2(expbias[2],inB[25],Cm1, expsum[2],Cm2);
FullAdder fm3(expbias[3],inB[26],Cm2, expsum[3],Cm3);
FullAdder fm4(expbias[4],inB[27],Cm3, expsum[4],Cm4);
FullAdder fm5(expbias[5],inB[28],Cm4, expsum[5],Cm5);
FullAdder fm6(expbias[6],inB[29],Cm5, expsum[6],Cm6);
FullAdder fm7(expbias[7],inB[30],Cm6, expsum[7],);

BoothDecoder24 BD24(inA[22:0],inB[22:0],a,b,c,d,e,f,g,h,i,j,k,l,m);
MulReg MR(a,b,c,d,e,f,g,h,i,j,k,l,m,inA,inB,
			clk,
			ad,bd,cd,dd,ed,fd,gd,hd,id,jd,kd,ld,md,inAd,inBd);
WallaceTree WT(ad,bd,cd,dd,ed,fd,gd,hd,id,jd,kd,ld,md,fracmul);

// add ff to reduce timing ----------------------
reg [31:0] inAd_d1, inAd_d2 ;
reg [31:0] inBd_d1, inBd_d2 ;
reg  [7:0] expsum_d1;
reg  [47:0] fracmul_d1;
always @(posedge clk) begin
   fracmul_d1 <= fracmul;
   expsum_d1  <= expsum;

   inAd_d1   <= inAd;
   inBd_d1   <= inBd;
end
//------------------------------------------------

MulNorm Mnrm(fracmul_d1,expminus,outround,round);

// add ff to reduce timing -----------------------
reg [7:0]  expminus_d1;
reg [23:0] outround_d1;
reg        round_d1;
reg [7:0]  expsum_d2;
always @(posedge clk) begin
   expminus_d1 <= expminus;
   outround_d1 <= outround;
   round_d1    <= round;
   inAd_d2     <= inAd_d1;
   inBd_d2     <= inBd_d1;
   expsum_d2   <= expsum_d1;
end
//------------------------------------------------

MulRound Mrnd(outround_d1,round_d1,expminus_d1,outnormal[22:0],expminus2);


EightBitSub Ef(expsum_d2,expminus2,,exptemp);
EightBitSub Ex(exptemp,8'b00010111,,outnormal[30:23]);

CheckType CtA(inAd_d2,zeroA,infA,nanA);
CheckType CtB(inBd_d2,zeroB,infB,nanB);
assign outnan=32'b01111111101010101010101010101010;
xor(signinf,inAd_d2[31],inBd_d2[31]);
assign outnormal[31]=signinf;
assign outinf={signinf,8'b11111111,23'b0};
assign outzero={signinf,31'b0};
or(infAB,infA,infB);
not(znA,zeroA);
not(znB,zeroB);
and(znAB,znA,znB);
and(inf_w,infAB,znAB,nannAB);
or(zAB,zeroA,zeroB);
not(infnA,infA);
not(infnB,infB);
and(infnAB,infnA,infnB);
and(zero_w,zAB,infnAB,nannAB);
or(nanAB,nanA,nanB);
not(nannAB,nanAB);
and(ziAB,zeroA,infB);
and(ziBA,zeroB,infA);
or(zi,ziAB,ziBA);
or(nan_w,zi,nanAB);
or(select[1],inf_w,zero_w);
or(select[0],nan_w,zero_w);

mux21 #32 Mout0(outnormal,outnan,select[0],tmp0);
mux21 #32 Mout1(outinf,outzero,select[0],tmp1);
mux21 #32 MoutM(tmp0,tmp1,select[1],outpre);

CheckOutSmall COS(outpre,out);
endmodule
