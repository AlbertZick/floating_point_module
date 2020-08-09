module Comparator(inA,inB,en,lt,mt,et);
	input inA, inB, en;
	output lt,mt,et;

wire AnB,ABn,AxnB;
wire An,Bn;

not(An,inA);
not(Bn,inB);
and(AnB,An,inB);
and(ABn,inA,Bn);
xnor(AxnB,inA,inB);

and(lt,en,AnB);
and(mt,en,ABn);
and(et,en,AxnB);

endmodule
