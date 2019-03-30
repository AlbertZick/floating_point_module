module MulReg(a,b,c,d,e,f,g,h,i,j,k,l,m,inA,inB,
			clk,
			ad,bd,cd,dd,ed,fd,gd,hd,id,jd,kd,ld,md,inAd,inBd);

input clk;
input [25:0] a,b,c,d,e,f,g,h,i,j,k,l,m;
input [31:0] inA,inB;

output reg [25:0] ad,bd,cd,dd,ed,fd,gd,hd,id,jd,kd,ld,md;
output reg [31:0] inAd,inBd;

always @(posedge clk) 
begin
	ad=a;
	bd=b;
	cd=c;
	dd=d;
	ed=e;
	fd=f;
	gd=g;
	hd=h;
	id=i;
	jd=j;
	kd=k;
	ld=l;
	md=m;
	inAd=inA;
	inBd=inB;
end

endmodule