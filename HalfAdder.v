module HalfAdder(inA,inB,S,Cout);
	input inA,inB;
	output S,Cout;

	xor(S,inA,inB);
	and(Cout,inA,inB);

endmodule
