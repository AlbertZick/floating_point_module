module TwoComplementor(in,out);
	input [25:0] in;
	output [25:0] out;
	wire [25:0] inn;

	assign inn = ~in;

	csa_26b CSA0(26'b0,inn,26'b1,out,);

endmodule

