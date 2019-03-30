module mux21(in0,in1,ctrl,out);
parameter width=8;
input [width-1:0] in0,in1;
input ctrl;
output [width-1:0] out;

assign out=ctrl?in1:in0;

endmodule
