module CheckType_tb;

	reg [31:0] in;
	wire zero,inf,nan;

	CheckType C0(in,zero,inf,nan);

	initial begin
		#0;
		in = {1'b0,8'b01100110,23'b000101010};				//normal positive
		#10; in = {1'b1,8'b01100110,23'b000101010};			//normal negative
		#10; in = {1'b0,8'b0,23'b0};						//zero positive
		#10; in = {1'b1,8'b0,23'b0};						//zero negative
		#10; in = {1'b0,8'b11111111,23'b0};					//inf positive
		#10; in = {1'b1,8'b11111111,23'b0};					//inf negative
		#10; in = {1'b0,8'b11111111,23'b000101010};			//NaN
		#10; in = {1'b1,8'b11111111,23'b000101010};			//NaN
		#10; $stop;
	end // initial

endmodule // CheckType_tb

