module Exponent(expin,expminus,expround,zero,expout);
input [7:0] expin,expminus;
input expround,zero;
output [7:0] expout;
wire [7:0] exppre,expz,exmz;

not(zeron,zero);

and(expz[0],expin[0],zeron);
and(expz[1],expin[1],zeron);
and(expz[2],expin[2],zeron);
and(expz[3],expin[3],zeron);
and(expz[4],expin[4],zeron);
and(expz[5],expin[5],zeron);
and(expz[6],expin[6],zeron);
and(expz[7],expin[7],zeron);

and(exmz[0],expminus[0],zeron);
and(exmz[1],expminus[1],zeron);
and(exmz[2],expminus[2],zeron);
and(exmz[3],expminus[3],zeron);
and(exmz[4],expminus[4],zeron);
and(exmz[5],expminus[5],zeron);
and(exmz[6],expminus[6],zeron);
and(exmz[7],expminus[7],zeron);

EightBitSub E2(expz,exmz,,exppre);

FullAdder f0(exppre[0],1'b0,expround,expout[0],C0);
FullAdder f1(exppre[1],1'b0,C0,expout[1],C1);
FullAdder f2(exppre[2],1'b0,C1,expout[2],C2);
FullAdder f3(exppre[3],1'b0,C2,expout[3],C3);
FullAdder f4(exppre[4],1'b0,C3,expout[4],C4);
FullAdder f5(exppre[5],1'b0,C4,expout[5],C5);
FullAdder f6(exppre[6],1'b0,C5,expout[6],C6);
FullAdder f7(exppre[7],1'b0,C6,expout[7],);

endmodule
