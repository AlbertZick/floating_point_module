//This module is to figure out the output if at least one input is zero
module ZeroProcess(zeroA,zeroB,op,inA,inB,outz);
	input zeroA,zeroB,op;
	input [31:0] inA,inB;
	output [31:0] outz;

	wire [30:0] tmp1,tmp2;
	wire signA,signB;
	wire zeroA_n,zeroB_n,op_n,signB_n;

	assign signA=inA[31];
	assign signB=inB[31];

	//Select the exponent and fraciton of output
	mux21 #31 M0x(31'b0,inA[30:0],zeroB,tmp1);
	mux21 #31 M1x(inB[30:0],31'b0,zeroB,tmp2);
	mux21 #31 MM(tmp1,tmp2,zeroA,outz[30:0]);

	//Sign of output
	not(zeroA_n,zeroA);
	not(zeroB_n,zeroB);
	not(op_n,op);
	not(signB_n,signB);

	and(sAzAn,signA,zeroA_n);
	and(sBzA,signB,zeroA);
	and(sBnzA,signB_n,zeroA);
	and(zBnopn,zeroB_n,op_n);
	and(zBnop,zeroB_n,op);

	and(s1,sAzAn,zeroB);
	and(s2,sBzA,zBnopn);
	and(s3,sBnzA,zBnop);

	or(s12,s1,s2);
	or(outz[31],s12,s3);

endmodule // ZeroProcess

