module BoothDecoder(in,code,out);
	input [22:0] in;
	input [2:0] code;
	output [25:0] out;

	wire [25:0] inpos,inneg,inshift,inzero,outpre;

	assign inzero=26'b0;
	assign inpos={3'b001,in};

	TwoComplementor TC(inpos,inneg);
	mux21 #26 M0(inpos,inneg,muxctrl1,inshift);
	ShiftLeft SL(inshift,shamt,outpre);
	mux21 #26 M1(outpre,inzero,muxctrl2,out);

	assign muxctrl1 = code[2];
	xnor(shamt,code[0],code[1]);

	not(c0n,code[0]);
	not(c1n,code[1]);
	not(c2n,code[2]);

	and(c01n,c0n,c1n);
	and(cn,c01n,c2n);

	and(c01,code[0],code[1]);
	and(c,c01,code[2]);

	or(muxctrl2,c,cn);

endmodule