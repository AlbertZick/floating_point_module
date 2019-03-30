//This module is to figure out the output if at least one input is infinity
module InfinityProcess(infA,infB,op,inA,inB,outinf,naninf);
	input infA,infB,op;
	input [31:0] inA,inB;
	output [31:0] outinf;
	output naninf;	//this output lets the controller know the undefined case: inf - inf

	wire signA,signB;
	wire infA_n,infB_n,op_n,signB_n;

	assign signA=inA[31];
	assign signB=inB[31];

	assign outinf[30:0]={8'b11111111,23'b0};	//the exponent and fraction of infinity

	//Sign of output
	not(infA_n,infA);
	not(infB_n,infB);
	not(op_n,op);
	not(signB_n,signB);

	and(sBiAn,signB,infA_n);
	and(sBniAn,signB_n,infA_n);
	and(iBopn,infB,op_n);
	and(iBop,infB,op);
	and(sAiA,signA,infA);
	and(sAiAiB,sAiA,infB);
	xor(xsBop,signB,op);

	and(s1,sBiAn,iBopn);
	and(s2,sBniAn,iBop);
	and(s3,sAiA,infB_n);
	and(s4,sAiAiB,xsBop);

	or(s12,s1,s2);
	or(s34,s3,s4);
	or(outinf[31],s12,s34);

	//Check special case like inf-inf and export to output naninf
	and(iAiB,infA,infB);
	xor(xsAsBop,xsBop,signA);
	and(naninf,iAiB,xsAsBop);

endmodule // InfinityProcess


