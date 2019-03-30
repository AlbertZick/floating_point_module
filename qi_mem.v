module qi_mem (qi_2, qi_1, qi_0, mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3, clk, n_rst, en);
output	[26:0] qi_2, qi_1, qi_0 ;
input			mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3, clk, n_rst, en ;
wire			clk_en ;

assign		clk_en = clk & en ;

// luu theo dang 1 bit dau va 2 bits usigned binary

assign		select_0 =  	~(( mul_0 | mul_2 ) | mul_n2) ;
mux_2_1				mux_0 	(in_0, 1'b0, 1'b1, select_0) ;
s_register_27_bits 	mem_0	(qi_0, in_0, clk_en, n_rst) ;

assign		select_1 =  	~(( mul_n1 | mul_1 ) | mul_0) ;
mux_2_1				mux_1 	(in_1, 1'b0, 1'b1, select_1) ;
s_register_27_bits 	mem_1	(qi_1, in_1, clk_en, n_rst) ;

assign		select_2 =  	(mul_n3 | mul_n2) | mul_n1 ;
mux_2_1				mux_2 	(in_2, 1'b0, 1'b1, select_2) ;
s_register_27_bits 	mem_2	(qi_2, in_2, clk_en, n_rst) ;

endmodule
