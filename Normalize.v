module Normalize(fracin,expin,fracout,expout);
input [24:0] fracin;
input [7:0] expin;
output [22:0] fracout;
output [7:0] expout;
wire [22:0] fracpr;
wire [7:0] empr;

BitOneDetective B0(fracin,fracpr,empr,round,zero);
Rounding R0(fracpr,round,fracout,expround);
Exponent E0(expin,empr,expround,zero,expout);

endmodule
