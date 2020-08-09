module ShiftLeft_tb;

	reg [25:0] in;
	reg shamt;
	wire [25:0] out;

	ShiftLeft C0(in,shamt,out);

	initial begin
		#0;
		in = 26'b10000100011010010111101111; shamt=0;
		#10; 
		in = 26'b10000100011010010111101111; shamt=1;
		#10; $stop;
	end // initial

endmodule


