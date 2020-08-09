module CtrlSignificand(signA,signB,opin,opout);
input signA,signB,opin;
output [1:0] opout;
wire opin_n,sBn;
wire Bnop,Bopn;

not(opin_n,opin);
not(sBn,signB);
and(Bnop,sBn,opin);
and(Bopn,signB,opin_n);

or(opout[1],Bnop,Bopn);
assign opout[0]=signA;

endmodule
