//This module is mainly used for calculate the different between the exponents
module EightBitSub(X,Y,Cout,Z);
input [7:0] X,Y;
output [7:0] Z;
output Cout;

FullAdder f0(X[0],~Y[0],1'b1,Z[0],C0);
FullAdder f1(X[1],~Y[1],C0,Z[1],C1);
FullAdder f2(X[2],~Y[2],C1,Z[2],C2);
FullAdder f3(X[3],~Y[3],C2,Z[3],C3);
FullAdder f4(X[4],~Y[4],C3,Z[4],C4);
FullAdder f5(X[5],~Y[5],C4,Z[5],C5);
FullAdder f6(X[6],~Y[6],C5,Z[6],C6);
FullAdder f7(X[7],~Y[7],C6,Z[7],Cout);

endmodule
