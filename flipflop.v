module flipflop	(q, d, clk, n_rst) ;
input 			d, clk, n_rst ;
output reg q ;

always @(posedge clk) begin
	if (n_rst == 0)
		q <= 0;
	else
		q <= d;
end
endmodule
