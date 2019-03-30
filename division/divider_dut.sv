module top ();

logic			clk, en, n_rst, finish ;
logic	[22:0]	dividend, divisor ;
logic	[24:0]	quotient ;
shortreal		z, d, q ;
logic	[22:0]	temp ;
logic	[31:0]	real_result ;

divider m_divider	( quotient, finish, dividend, divisor, clk, en, n_rst ) ;

/*initial begin
	clk = 0 ; 
	en = 0 ;
	n_rst = 0 ;

	divisor 	= 23'h680000 ;
	dividend 	= 23'h7d6000 ;

	#20 ;
	#5 en = 1 ; 
	#20 n_rst = 1 ;
	#300 ;
	$finish ;
end*/


initial begin
	clk = 0 ;
	en = 1 ;
	n_rst = 0 ;

	z = 1.004 ; d = 1.1654 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ; divisor[22:0] 	=	temp[22:0] ;
	real_result[31:0]			=	$shortrealtobits(q) ;
	#20 n_rst = 1 ;
	#280 ;
	real_result[22:0]			=	(quotient[23] == 1) ? (quotient[22:0]) : ({quotient[21:0], 1'b0}) ;

//
	n_rst = 0 ;
	z = 1.9999 ; d = 1.99 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ; divisor[22:0] 	=	temp[22:0] ;
	real_result[31:0]			=	$shortrealtobits(q) ;
	#20 n_rst = 1 ;
	#280 ;
	real_result[22:0]			=	(quotient[23] == 1) ? (quotient[22:0]) : ({quotient[21:0], 1'b0}) ;

//
	n_rst = 0 ;
	z = 1.567 ; d = 1.231 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ; divisor[22:0] 	=	temp[22:0] ;
	real_result[31:0]			=	$shortrealtobits(q) ;
	#20 n_rst = 1 ;
	#280 ;
	real_result[22:0]			=	(quotient[23] == 1) ? (quotient[22:0]) : ({quotient[21:0], 1'b0}) ;

//
	n_rst = 0 ;
	z = 1.6843221 ; d = 1.344256 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ; divisor[22:0] 	=	temp[22:0] ;
	real_result[31:0]			=	$shortrealtobits(q) ;
	#20 n_rst = 1 ;
	#280 ;
	real_result[22:0]			=	(quotient[23] == 1) ? (quotient[22:0]) : ({quotient[21:0], 1'b0}) ;

	#20 ;
	$finish ;
end


always begin
	clk++ ;
	#10 ;
end


endmodule


//======================================================================================================
//
module divider ( quotient, finish, dividend, divisor, clk, en, n_rst ) ;
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
//======================================================================================================

//======================================================================================================
//
module bsd_2_bcd (bcd, bsd_2, bsd_1, bsd_0);
output	[23:0]		bcd ;
input	[11:0]		bsd_2, bsd_1, bsd_0 ;

wire	[23:0]		pos_part, neg_part ;
wire	[27:0]		conversion_out ;

assign		pos_part[00] = ~bsd_2[00] & bsd_0[00] ;
assign		pos_part[01] = ~bsd_2[00] & bsd_1[00] ;
assign		pos_part[02] = ~bsd_2[01] & bsd_0[01] ;
assign		pos_part[03] = ~bsd_2[01] & bsd_1[01] ;
assign		pos_part[04] = ~bsd_2[02] & bsd_0[02] ;
assign		pos_part[05] = ~bsd_2[02] & bsd_1[02] ;
assign		pos_part[06] = ~bsd_2[03] & bsd_0[03] ;
assign		pos_part[07] = ~bsd_2[03] & bsd_1[03] ;
assign		pos_part[08] = ~bsd_2[04] & bsd_0[04] ;
assign		pos_part[09] = ~bsd_2[04] & bsd_1[04] ;
assign		pos_part[10] = ~bsd_2[05] & bsd_0[05] ;
assign		pos_part[11] = ~bsd_2[05] & bsd_1[05] ;
assign		pos_part[12] = ~bsd_2[06] & bsd_0[06] ;
assign		pos_part[13] = ~bsd_2[06] & bsd_1[06] ;
assign		pos_part[14] = ~bsd_2[07] & bsd_0[07] ;
assign		pos_part[15] = ~bsd_2[07] & bsd_1[07] ;
assign		pos_part[16] = ~bsd_2[08] & bsd_0[08] ;
assign		pos_part[17] = ~bsd_2[08] & bsd_1[08] ;
assign		pos_part[18] = ~bsd_2[09] & bsd_0[09] ;
assign		pos_part[19] = ~bsd_2[09] & bsd_1[09] ;
assign		pos_part[20] = ~bsd_2[10] & bsd_0[10] ;
assign		pos_part[21] = ~bsd_2[10] & bsd_1[10] ;
assign		pos_part[22] = ~bsd_2[11] & bsd_0[11] ;
assign		pos_part[23] = ~bsd_2[11] & bsd_1[11] ;

assign		neg_part[00] =  bsd_2[00] & bsd_0[00] ;
assign		neg_part[01] =  bsd_2[00] & bsd_1[00] ;
assign		neg_part[02] =  bsd_2[01] & bsd_0[01] ;
assign		neg_part[03] =  bsd_2[01] & bsd_1[01] ;
assign		neg_part[04] =  bsd_2[02] & bsd_0[02] ;
assign		neg_part[05] =  bsd_2[02] & bsd_1[02] ;
assign		neg_part[06] =  bsd_2[03] & bsd_0[03] ;
assign		neg_part[07] =  bsd_2[03] & bsd_1[03] ;
assign		neg_part[08] =  bsd_2[04] & bsd_0[04] ;
assign		neg_part[09] =  bsd_2[04] & bsd_1[04] ;
assign		neg_part[10] =  bsd_2[05] & bsd_0[05] ;
assign		neg_part[11] =  bsd_2[05] & bsd_1[05] ;
assign		neg_part[12] =  bsd_2[06] & bsd_0[06] ;
assign		neg_part[13] =  bsd_2[06] & bsd_1[06] ;
assign		neg_part[14] =  bsd_2[07] & bsd_0[07] ;
assign		neg_part[15] =  bsd_2[07] & bsd_1[07] ;
assign		neg_part[16] =  bsd_2[08] & bsd_0[08] ;
assign		neg_part[17] =  bsd_2[08] & bsd_1[08] ;
assign		neg_part[18] =  bsd_2[09] & bsd_0[09] ;
assign		neg_part[19] =  bsd_2[09] & bsd_1[09] ;
assign		neg_part[20] =  bsd_2[10] & bsd_0[10] ;
assign		neg_part[21] =  bsd_2[10] & bsd_1[10] ;
assign		neg_part[22] =  bsd_2[11] & bsd_0[11] ;
assign		neg_part[23] =  bsd_2[11] & bsd_1[11] ;

sub_nadd_27_bits	conversion	(conversion_out, {3'h0, pos_part}, {3'h0, neg_part}, 1'b1) ;

assign		bcd[23:0] = conversion_out[23:0] ;

endmodule
//======================================================================================================


//======================================================================================================
// checked
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
//======================================================================================================

//======================================================================================================
// checked
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
//======================================================================================================

//======================================================================================================
// checked
module slct_q (mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3, finish, s, d, clk, n_rst, en);

output			mul_n3, mul_n2, mul_n1, mul_0, mul_1, mul_2, mul_3, finish ;
input			clk, n_rst, en ;
input	[4:0]	s, d ;

//assign mul_n3 =   (s[4] &&  s[3] &&  s[2] && !s[1] && !s[0] &&  d[3] &&  d[2])                  ||
// 		     		(s[4] &&  s[3] &&  s[2] && !s[1] &&           d[3] &&  d[2] &&  d[1])         ||
// 		     		(s[4] &&  s[3] && !s[2] &&  s[1] && !s[0] &&  d[3] &&           d[1])         ||
// 		     		(s[4] &&  s[3] && !s[2] &&  s[1] &&           d[3] &&  d[2])                  ||
// 		     		(s[4] &&  s[3] && !s[2] &&  s[1] &&           d[3] &&           d[1] && d[0]) ||
// 		     		(s[4] &&  s[3] && !s[2] && !s[1] &&  s[0] &&  d[3] &&          !d[1] && d[0]) ||
// 		     		(s[4] &&  s[3] && !s[2] && !s[1] && !s[0] &&  d[3] && !d[2])                  ||
// 		     		(s[4] &&  s[3] && !s[2] && !s[1] &&           d[3] && !d[2] &&  d[1])         ||
// 		     		(s[4] &&  s[3] && !s[2] &&           s[0] &&  d[3] &&  d[2] && !d[1])         ||
// 		     		(s[4] &&  s[3] &&           s[1] && !s[0] &&  d[3] &&  d[2] &&  d[1])         ||
// 		     		(s[4] &&  s[3] &&           s[1] &&           d[3] &&  d[2] &&  d[1] && d[0]) ||
// 		     		(s[4] &&  s[3] &&          !s[1] &&  s[0] &&  d[3] &&  d[2] && !d[1] && d[0]) ||
// 		     		(s[4] && !s[3] &&  s[2] &&  s[1] &&  s[0] &&  d[3] && !d[2] && !d[1]) ;

// updated
assign mul_n3 = (s[4]  &&  s[3]  &&  s[2]  && !s[1]  && !s[0]  &&  d[3]  &&  d[2])                     ||
				(s[4]  &&  s[3]  &&  s[2]  && !s[1]  &&            d[3]  &&  d[2]  &&  d[1])           ||
				(s[4]  &&  s[3]  && !s[2]  &&  s[1]  && !s[0]  &&  d[3]  &&            d[1])           ||
				(s[4]  &&  s[3]  && !s[2]  &&  s[1]  &&            d[3]  &&  d[2])                     ||
				(s[4]  &&  s[3]  && !s[2]  &&  s[1]  &&            d[3]  &&            d[1]  &&  d[0]) ||
				(s[4]  &&  s[3]  && !s[2]  && !s[1]  &&  s[0]  &&  d[3]  &&           !d[1]  &&  d[0]) ||
				(s[4]  &&  s[3]  && !s[2]  && !s[1]  && !s[0]  &&  d[3]  && !d[2])                     ||
				(s[4]  &&  s[3]  && !s[2]  && !s[1]  &&            d[3]  && !d[2]  &&  d[1])           ||
				(s[4]  &&  s[3]  && !s[2]  &&            s[0]  &&  d[3]  &&  d[2]  && !d[1])           ||
				(s[4]  &&  s[3]  &&            s[1]  && !s[0]  &&  d[3]  &&  d[2]  &&  d[1])           ||
				(s[4]  &&  s[3]  &&            s[1]  &&            d[3]  &&  d[2]  &&  d[1]  &&  d[0]) ||
				(s[4]  &&  s[3]  &&           !s[1]  &&  s[0]  &&  d[3]  &&  d[2]  && !d[1]  &&  d[0]) ||
				(s[4]  && !s[3]  &&  s[2]  &&  s[1]  &&  s[0]  &&  d[3]  && !d[2]  && !d[1])           ||
				(s[4]  && !s[3]  &&  s[2]  &&  s[1]  &&            d[3]  && !d[2]  && !d[1]  && !d[0]) ;


//
// assign mul_n2 = 
// 				(s[4] &&  s[3] && !s[2] && !s[1] && !s[0] &&  d[3] &&  d[2])                  ||
// 				(s[4] &&  s[3] && !s[2] && !s[1] &&           d[3] &&  d[2] &&  d[1])         ||
// 				(s[4] && !s[3] &&  s[2] &&  s[1] &&  s[0] &&  d[3] &&           d[1])         ||
// 				(s[4] && !s[3] &&  s[2] &&  s[1] &&           d[3] &&  d[2] && !d[1])         ||
// 				(s[4] && !s[3] &&  s[2] &&  s[1] &&           d[3] && !d[2] &&  d[1])         ||
// 				(s[4] && !s[3] &&  s[2] && !s[1] &&  s[0] &&  d[3] && !d[2])                  ||
// 				(s[4] && !s[3] &&  s[2] &&          !s[0] &&  d[3] && !d[2] && !d[1]) ;
// updated
assign mul_n2 = 
				(s[4]  &&  s[3]  && !s[2]  && !s[1]  && !s[0]  &&  d[3]  &&  d[2])                    ||
				(s[4]  &&  s[3]  && !s[2]  && !s[1]  &&            d[3]  &&  d[2]  &&  d[1])          ||
				(s[4]  && !s[3]  &&  s[2]  &&  s[1]  &&  s[0]  &&  d[3]  &&            d[1])          ||
				(s[4]  && !s[3]  &&  s[2]  &&  s[1]  &&            d[3]  &&  d[2]  && !d[1])          ||
				(s[4]  && !s[3]  &&  s[2]  &&  s[1]  &&            d[3]  && !d[2]  &&  d[1])          ||
				(s[4]  && !s[3]  &&  s[2]  && !s[1]  &&            d[3]  && !d[2]  && !d[1])          ||
				(s[4]  && !s[3]  &&  s[2]  &&            s[0]  &&  d[3]  && !d[2]  &&  d[1])          ||
				(s[4]  && !s[3]  &&  s[2]  &&           !s[0]  &&  d[3]  && !d[2]  && !d[1]  &&  d[0]) ;

assign mul_n1 = 
				(s[4] && !s[3] &&  s[2] && !s[1] && !s[0] &&  d[3] &&           d[1])         ||
				(s[4] && !s[3] &&  s[2] && !s[1] &&           d[3] &&   d[2])                 ||
				(s[4] && !s[3] &&  s[2] &&          !s[0] &&  d[3] &&   d[2] && d[1])         ||
				(s[4] && !s[3] && !s[2] &&  s[1] &&  s[0] &&  d[3])                           ||
				(s[4] && !s[3] && !s[2] &&  s[1] &&           d[3] &&  !d[2]) ;

assign mul_0  = 
				(s[4] && !s[3] && !s[2] && !s[1] &&           d[3])                           ||
				(s[4] && !s[3] && !s[2] &&          !s[0] &&  d[3] &&  d[2])                  ||
				(        !s[3] && !s[2] && !s[1] && !s[0] &&  d[3])                           ||
				(        !s[3] && !s[2] && !s[1] &&           d[3] &&  d[2] &&  d[1])         ||
				(        !s[3] && !s[2] && !s[1] &&           d[3] &&  d[2] &&         d[0]) ;

assign mul_1  = 
				( !s[4] && !s[3] &&  s[2] && !s[1] && !s[0] &&  d[3] &&  d[2] &&  d[1])          ||
				( !s[4] && !s[3] &&  s[2] && !s[1] && !s[0] &&  d[3] &&  d[2] &&           d[0]) ||
				( !s[4] && !s[3] &&  s[2] && !s[1] &&           d[3] &&  d[2] &&  d[1] &&  d[0]) ||
				( !s[4] && !s[3] && !s[2] &&  s[1] && !s[0] &&  d[3] )                           ||
				( !s[4] && !s[3] && !s[2] &&  s[1] &&           d[3] &&  d[2])                   ||
				( !s[4] && !s[3] && !s[2] &&  s[1] &&           d[3] &&           d[1] &&  d[0]) ||
				( !s[4] && !s[3] && !s[2] && !s[1] &&  s[0] &&  d[3] && !d[2])                   ||
				( !s[4] && !s[3] && !s[2] && !s[1] &&  s[0] &&  d[3] &&          !d[1] && !d[0]) ;

// assign mul_2  = 
// 				( !s[4] &&  s[3] && !s[2] && !s[1] && !s[0] &&  d[3] &&  d[2] &&  d[1] &&  d[0])    ||
// 				( !s[4] && !s[3] &&  s[2] &&  s[1] &&           d[3] &&  d[2] &&  d[1])             ||
// 				( !s[4] && !s[3] &&  s[2] &&  s[1]          &&  d[3] &&  d[2] &&           d[0])    ||
// 				( !s[4] && !s[3] &&  s[2] && !s[1] &&  s[0] &&  d[3] &&                   !d[0])    ||
// 				( !s[4] && !s[3] &&  s[2] && !s[1] &&           d[3] && !d[2] )                     ||
// 				( !s[4] && !s[3] &&  s[2] &&           s[0] &&  d[3] &&  d[2] && !d[1] &&  d[0])    ||
// 				( !s[4] && !s[3] &&  s[2] &&          !s[0] &&  d[3] &&  d[2] && !d[1] && !d[0])    ||
// 				( !s[4] && !s[3] &&  s[2] &&          !s[0] &&  d[3] && !d[2] &&  d[1] &&  d[0])    ||
// 				( !s[4] && !s[3] && !s[2] &&  s[1] &&  s[0] &&  d[3] && !d[2] && !d[1])             ||
// 				( !s[4] && !s[3] && !s[2] &&  s[1] &&  s[0] &&  d[3] && !d[2] &&          !d[0]) ;

// updated
assign mul_2 = 
				( !s[4]  &&  s[3]  && !s[2]  && !s[1]  && !s[0]  &&  d[3] &&  d[2] &&  d[1] &&  d[0])||
				( !s[4]  && !s[3]  &&  s[2]  &&  s[1]  && !s[0]  &&  d[3] &&  d[2])                  ||
				( !s[4]  && !s[3]  &&  s[2]  &&  s[1]  && !s[0]  &&  d[3] &&           d[1] &&  d[0])||
				( !s[4]  && !s[3]  &&  s[2]  &&  s[1]  &&            d[3] &&  d[2] &&  d[1])         ||
				( !s[4]  && !s[3]  &&  s[2]  && !s[1]  && !s[0]  &&  d[3] && !d[2])                  ||
				( !s[4]  && !s[3]  &&  s[2]  && !s[1]  &&            d[3] &&  d[2] && !d[1] && !d[0])||
				( !s[4]  && !s[3]  &&  s[2]  && !s[1]  &&            d[3] && !d[2] &&  d[1])         ||
				( !s[4]  && !s[3]  &&  s[2]  &&            s[0]  &&  d[3] &&  d[2] &&  d[1] && !d[0])||
				( !s[4]  && !s[3]  &&  s[2]  &&            s[0]  &&  d[3] &&  d[2] && !d[1] &&  d[0])||
				( !s[4]  && !s[3]  && !s[2]  &&  s[1]  &&  s[0]  &&  d[3] && !d[2] && !d[1])         ||
				( !s[4]  && !s[3]  && !s[2]  &&  s[1]  &&  s[0]  &&  d[3] && !d[2] &&          !d[0]) ;

// assign mul_3  = 
// 				( !s[4] &&  s[3] &&  s[2] &&          !s[0] &&  d[3] &&  d[2] &&  d[1])            ||
// 				( !s[4] &&  s[3] && !s[2] &&  s[1] && !s[0] &&  d[3] && !d[2] && !d[1] && !d[0])   ||
// 				( !s[4] &&  s[3] && !s[2] &&  s[1] &&           d[3] &&  d[2] )                    ||
// 				( !s[4] &&  s[3] && !s[2] && !s[1] &&  s[0] &&  d[3] &&           d[1])            ||
// 				( !s[4] &&  s[3] && !s[2] && !s[1] && !s[0] &&  d[3] &&                   !d[0])   ||
// 				( !s[4] &&  s[3] && !s[2] && !s[1] &&           d[3] &&          !d[1] &&  d[0])   ||
// 				( !s[4] &&  s[3] && !s[2] &&           s[0] &&  d[3] &&  d[2] )                    ||
// 				( !s[4] &&  s[3] && !s[2] &&                    d[3] && !d[2] &&  d[1] &&  d[0])   ||
// 				( !s[4] &&  s[3] &&          !s[1] &&  s[0] &&  d[3] &&  d[2] &&  d[1])            ||
// 				( !s[4] &&  s[3] &&          !s[1] &&  s[0] &&  d[3] &&  d[2] &&           d[0])   ||
// 				( !s[4] &&  s[3] &&          !s[1] && !s[0] &&  d[3] &&  d[2] && !d[1])            ||
// 				( !s[4] &&  s[3] &&                    s[0] &&  d[3] &&  d[2] &&  d[1] &&  d[0])   ||
// 				( !s[4] && !s[3] &&  s[2] &&  s[1] &&  s[0] &&  d[3] && !d[2] )                    ||
// 				( !s[4] && !s[3] &&  s[2] &&  s[1] &&  s[0] &&  d[3] &&          !d[1] && !d[0])   ||
// 				( !s[4] && !s[3] &&  s[2] &&  s[1] &&           d[3] && !d[2] && !d[1])            ||
// 				( !s[4] && !s[3] &&  s[2] &&  s[1] &&           d[3] && !d[2] &&          !d[0]) ;

// updated
assign mul_3 = 
( !s[4]  &&  s[3]  &&  s[2] &&          !s[0] &&  d[3] &&  d[2] &&  d[1])         ||
( !s[4]  &&  s[3]  && !s[2] &&  s[1] &&           d[3] &&  d[2])                  ||
( !s[4]  &&  s[3]  && !s[2] && !s[1] &&           d[3] &&           d[1] && !d[0])||
( !s[4]  &&  s[3]  && !s[2] && !s[1] &&           d[3] &&          !d[1] &&  d[0])||
( !s[4]  &&  s[3]  && !s[2] &&           s[0] &&  d[3] &&  d[2])                  ||
( !s[4]  &&  s[3]  && !s[2] &&          !s[0] &&  d[3] &&          !d[1] && !d[0])||
( !s[4]  &&  s[3]  && !s[2] &&                    d[3] && !d[2] &&  d[1] &&  d[0])||
( !s[4]  &&  s[3]  &&          !s[1] &&  s[0] &&  d[3] &&  d[2] &&  d[1])         ||
( !s[4]  &&  s[3]  &&          !s[1] && !s[0] &&  d[3] &&  d[2] && !d[1])         ||
( !s[4]  &&  s[3]  &&          !s[1] &&           d[3] &&  d[2] && !d[1] &&  d[0])||
( !s[4]  &&  s[3]  &&                    s[0] &&  d[3] &&  d[2] &&  d[1] &&  d[0])||
( !s[4]  && !s[3]  &&  s[2] &&  s[1] &&  s[0] &&  d[3] && !d[2])                  ||
( !s[4]  && !s[3]  &&  s[2] &&  s[1] &&  s[0] &&  d[3] &&          !d[1]&&  !d[0])||
( !s[4]  && !s[3]  &&  s[2] &&  s[1] &&           d[3] && !d[2] && !d[1])         ||
( !s[4]  && !s[3]  &&  s[2] &&  s[1] &&           d[3] && !d[2] &&          !d[0])||
( !s[4]  && !s[3]  &&  s[2] &&           s[0] &&  d[3] && !d[2] && !d[1]) ;


endmodule
//======================================================================================================