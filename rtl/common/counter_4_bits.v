module counter_4_bits (
	output [3:0]	count,
	input				clk, n_rst
) ;

wire	d_0, d_1, d_2, d_3 ;

assign	d_0 = count[0] ^ 1 ;
assign	d_1 = count[1] ^ count[0] ;
assign	d_2 = count[2] ^ ( count[0] & count[1] ) ;
assign	d_3 = count[3] ^ ( count[0] & count[1] & count[2] ) ;

flipflop	ff_0	(count[0], d_0, clk, n_rst) ;
flipflop	ff_1	(count[1], d_1, clk, n_rst) ;
flipflop	ff_2	(count[2], d_2, clk, n_rst) ;
flipflop	ff_3	(count[3], d_3, clk, n_rst) ;

endmodule
