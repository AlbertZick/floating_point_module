module slct_qd	(out, d, mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3, clk, n_rst) ;
output	[26:0]	out ;		
input			mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3, clk, n_rst ;
input	[26:0]	d ;

wire	[26:0]	o_mux_0, o_mux_1, o_st_0 ;
wire	[27:0]	o_sub_nadd_0, o_sub_nadd_1, o_sub_nadd_2 ;
wire			reverse_0, reverse_1 ;

// when mul_n1 + mul_0 + mul_1  = 1, the input of shift left block is 0
assign			mux_slct_0 = (mul_n1 | mul_0) | mul_1 ;
mux_2_1_27_bits		mux_0		(o_mux_0, d, 27'b0, mux_slct_0) ;
shift_left_1		st_0		(o_st_0, o_mux_0) ;

assign		reverse_0 = (mul_n3 | mul_n2) | mul_n1 ;
sub_nadd_27_bits	sub_nadd_0 	(o_sub_nadd_0, 27'b0, o_st_0, reverse_0) ;

assign		reverse_1 = mul_n3 | mul_n1 ;
sub_nadd_27_bits	sub_nadd_1 	(o_sub_nadd_1, 27'b0, d, reverse_1) ;

assign		mux_slct_1 = (mul_n2 | mul_0) | mul_2 ;
mux_2_1_27_bits		mux_1		(o_mux_1, o_sub_nadd_1[26:0], 27'b0, mux_slct_1) ;

sub_nadd_27_bits	sub_nadd_2 	(o_sub_nadd_2, o_mux_1, o_sub_nadd_0[26:0], 1'b0) ;

assign		out[26:0] = o_sub_nadd_2[26:0] ;

endmodule // slct_qd
