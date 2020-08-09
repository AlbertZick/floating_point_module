module FloatingPointCalculator(inA,inB,op,en,rst_n,clk,out,finish);
	input clk,en,rst_n;
	input [1:0] op; //00 = add; 01 = subtract; 10 = multiply; 11 = divide;
	input [31:0] inA,inB;
	output [31:0] out;
	output finish;
	wire [31:0] inAb,inBb,outpre;
	wire [31:0] AddSub_result, Multiply_result, Divide_result,MulDiv_result;

	buffer_32bit BA(inA,en,inAb);
	buffer_32bit BB(inB,en,inBb);
	
	AddSub AddSub_m(inAb,inBb,op[0],AddSub_result);
	Multiplication Multiply_m(inAb,inBb,clk,Multiply_result);
	Division Divide_m(inAb,inBb,clk,en,rst_n,Divide_result,finish);

	flipflop FF(finish_delay,finish,clk,1'b1);
	mux21 #32 MMD(Multiply_result,Divide_result,op[0],MulDiv_result);
	mux21 #32 MF(AddSub_result,MulDiv_result,op[1],outpre);
	buffer_32bit BF(outpre,finish,out);

endmodule
/////////
module buffer_32bit(in,en,out);
	input en;
	input [31:0] in;
	output [31:0] out;

	bufif1 (out[00],in[00],en);
	bufif1 (out[01],in[01],en);
	bufif1 (out[02],in[02],en);
	bufif1 (out[03],in[03],en);
	bufif1 (out[04],in[04],en);
	bufif1 (out[05],in[05],en);
	bufif1 (out[06],in[06],en);
	bufif1 (out[07],in[07],en);
	bufif1 (out[08],in[08],en);
	bufif1 (out[09],in[09],en);
	bufif1 (out[10],in[10],en);
	bufif1 (out[11],in[11],en);
	bufif1 (out[12],in[12],en);
	bufif1 (out[13],in[13],en);
	bufif1 (out[14],in[14],en);
	bufif1 (out[15],in[15],en);
	bufif1 (out[16],in[16],en);
	bufif1 (out[17],in[17],en);
	bufif1 (out[18],in[18],en);
	bufif1 (out[19],in[19],en);
	bufif1 (out[20],in[20],en);
	bufif1 (out[21],in[21],en);
	bufif1 (out[22],in[22],en);
	bufif1 (out[23],in[23],en);
	bufif1 (out[24],in[24],en);
	bufif1 (out[25],in[25],en);
	bufif1 (out[26],in[26],en);
	bufif1 (out[27],in[27],en);
	bufif1 (out[28],in[28],en);
	bufif1 (out[29],in[29],en);
	bufif1 (out[30],in[30],en);
	bufif1 (out[31],in[31],en);

endmodule // module

//
module FinalRegister(in,en,out,finish,rst_n,clk);
	input [31:0] in;
	input en,clk,rst_n;
	output reg [31:0] out;
	output reg finish;

	always @(posedge clk)
		if (!rst_n)
		begin finish = 0; out = {32{1'bz}}; end
		else
		if (en)
		begin out = in; finish = 1;
		end

endmodule // FinalRegister