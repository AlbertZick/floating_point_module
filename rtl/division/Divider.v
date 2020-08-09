module Divider ( quotient, finish, dividend, divisor, clk, en, n_rst ) ;
output	[24:0]	quotient ;
output			finish ;
input	[22:0] 	dividend, divisor ;
input			clk, en, n_rst ;

wire	[26:0]	s_reg_out, s_reg_in, dividend_ext, divisor_ext, m_slct_qd_out, m_slt_out ;
wire			mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3, clk_en, qi_mem_en, m_slct_q_finish, ini_iterator_slct ;
wire	[26:0]	bsd_q_2, bsd_q_1, bsd_q_0, shifted_s, abs_in ;
wire	[27:0]	next_s, abs_out ;
wire	[23:0]	bcd ;
wire	[4:0]	slct_q_s, z_ini ;
wire	[3:0]	count ;

assign			clk_en = clk & en ;

assign		dividend_ext[26:0]	=	{ 4'b0001, dividend[22:0]} ;
assign		divisor_ext[26:0]	=	{ 4'b0001, divisor[22:0]} ;

mux_2_1_27_bits		mux_0		(s_reg_in, dividend_ext, next_s[26:0], mux_slct) ;
p_register_27_bits 	s_reg		(s_reg_out, s_reg_in, clk, n_rst) ;


// mux
sub_nadd_27_bits	abs				(abs_out, 27'b0, s_reg_out, s_reg_out[26]) ;


mux_2_1_5_bits		ini_iterator_0 	(z_ini, {s_reg_out[26], abs_out[25:22]}, {s_reg_out[26], abs_out[23:20]}, ini_iterator_slct) ;

assign	slct_q_s[4:0] 		= z_ini ;

slct_q 				m_slct_q	(mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3, m_slct_q_finish, 
									/*{s_reg_out[26], s_reg_out[23:20]}*/slct_q_s, divisor_ext[24:20], clk, n_rst, en) ;

slct_qd				m_slct_qd	(m_slct_qd_out, divisor_ext, mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3, 
									clk, n_rst) ;


shift_left_2 		m_slt		(m_slt_out, s_reg_out) ;

//mux z
mux_2_1_27_bits		ini_iterator_1 (shifted_s, dividend_ext, m_slt_out, ini_iterator_slct) ;
sub_nadd_27_bits	add			(next_s, shifted_s, m_slct_qd_out, 1'b1) ;
qi_mem 				m_bsd_q		(bsd_q_2, bsd_q_1, bsd_q_0, mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3,
								 	clk, n_rst, qi_mem_en) ;
bsd_2_bcd			m_bsd_2_bcd	(bcd, bsd_q_2[11:0], bsd_q_1[11:0], bsd_q_0[11:0]) ;

assign		quotient[24:0] = { bcd[23:0], 1'b0 } ;

counter_to_13 		counter 	( count, clk_en, n_rst ) ;
assign		finish 		= 	count[3] & count[2] & ~count[1] & count[0] ; // finish at 14th clock
assign		qi_mem_en 	= ~ ( count[3] & count[2] & ~count[1] & count[0] ) ;
assign		mux_slct 	= ( ( count[3] | count[2] ) | count[1] ) | count[0] ;
assign		ini_iterator_slct = ( count[3] | count[2] ) | count[1]  ;


endmodule // divider
