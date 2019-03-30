module flipflop	(q, d, clk, n_rst) ;
input 			d, clk, n_rst ;
output logic 	q ;

always_ff @(posedge clk) begin
	if (n_rst == 0)
		q <= 0;
	else
		q <= d;
end
endmodule
//===============================

module counter_4_bits (
	output	logic[3:0]	count,
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
//===============================


//===============================
module counter_to_13 (
	output	logic[3:0]	count,
	input				clk, n_rst
) ;

wire	d_0, d_1, d_2, d_3 ;

assign	d_0 = (~count[0]) |
				(  ( count[3] & count[2] & (~count[1]) & (count[0]) ) ) ;
assign	d_1 = (count[1] ^ count[0]) & 
				( ~ ( count[3] & count[2] & (~count[1]) & (count[0]) ) ) ;
assign	d_2 = (count[2] ^ ( count[0] & count[1] )) | 
				(  ( count[3] & count[2] & (~count[1]) & (count[0]) ) ) ;
assign	d_3 = (count[3] ^ ( count[0] & count[1] & count[2] )) | 
				(  ( count[3] & count[2] & (~count[1]) & (count[0]) ) ) ;

flipflop	ff_0	(count[0], d_0, clk, n_rst) ;
flipflop	ff_1	(count[1], d_1, clk, n_rst) ;
flipflop	ff_2	(count[2], d_2, clk, n_rst) ;
flipflop	ff_3	(count[3], d_3, clk, n_rst) ;

endmodule


//===============================
module s_register_27_bits (out, in, clk, n_rst) ;
output	[26:0]	out ;
input			in, clk, n_rst ;

flipflop 	ff_00	(out[00], in     , clk, n_rst) ;
flipflop 	ff_01	(out[01], out[00], clk, n_rst) ;
flipflop 	ff_02	(out[02], out[01], clk, n_rst) ;
flipflop 	ff_03	(out[03], out[02], clk, n_rst) ;
flipflop 	ff_04	(out[04], out[03], clk, n_rst) ;
flipflop 	ff_05	(out[05], out[04], clk, n_rst) ;
flipflop 	ff_06	(out[06], out[05], clk, n_rst) ;
flipflop 	ff_07	(out[07], out[06], clk, n_rst) ;
flipflop 	ff_08	(out[08], out[07], clk, n_rst) ;
flipflop 	ff_09	(out[09], out[08], clk, n_rst) ;
flipflop 	ff_10	(out[10], out[09], clk, n_rst) ;
flipflop 	ff_11	(out[11], out[10], clk, n_rst) ;
flipflop 	ff_12	(out[12], out[11], clk, n_rst) ;
flipflop 	ff_13	(out[13], out[12], clk, n_rst) ;
flipflop 	ff_14	(out[14], out[13], clk, n_rst) ;
flipflop 	ff_15	(out[15], out[14], clk, n_rst) ;
flipflop 	ff_16	(out[16], out[15], clk, n_rst) ;
flipflop 	ff_17	(out[17], out[16], clk, n_rst) ;
flipflop 	ff_18	(out[18], out[17], clk, n_rst) ;
flipflop 	ff_19	(out[19], out[18], clk, n_rst) ;
flipflop 	ff_20	(out[20], out[19], clk, n_rst) ;
flipflop 	ff_21	(out[21], out[20], clk, n_rst) ;
flipflop 	ff_22	(out[22], out[21], clk, n_rst) ;
flipflop 	ff_23	(out[23], out[22], clk, n_rst) ;
flipflop 	ff_24	(out[24], out[23], clk, n_rst) ;
flipflop 	ff_25	(out[25], out[24], clk, n_rst) ;
flipflop 	ff_26	(out[26], out[25], clk, n_rst) ;

endmodule // register_27_bits
//===================================


//===============================
//
module p_register_27_bits (out, in, clk, n_rst) ;
output	[26:0]	out ;
input	[26:0]	in ;
input			clk, n_rst ;

flipflop 	ff_00	(out[00], in[00], clk, n_rst) ;
flipflop 	ff_01	(out[01], in[01], clk, n_rst) ;
flipflop 	ff_02	(out[02], in[02], clk, n_rst) ;
flipflop 	ff_03	(out[03], in[03], clk, n_rst) ;
flipflop 	ff_04	(out[04], in[04], clk, n_rst) ;
flipflop 	ff_05	(out[05], in[05], clk, n_rst) ;
flipflop 	ff_06	(out[06], in[06], clk, n_rst) ;
flipflop 	ff_07	(out[07], in[07], clk, n_rst) ;
flipflop 	ff_08	(out[08], in[08], clk, n_rst) ;
flipflop 	ff_09	(out[09], in[09], clk, n_rst) ;
flipflop 	ff_10	(out[10], in[10], clk, n_rst) ;
flipflop 	ff_11	(out[11], in[11], clk, n_rst) ;
flipflop 	ff_12	(out[12], in[12], clk, n_rst) ;
flipflop 	ff_13	(out[13], in[13], clk, n_rst) ;
flipflop 	ff_14	(out[14], in[14], clk, n_rst) ;
flipflop 	ff_15	(out[15], in[15], clk, n_rst) ;
flipflop 	ff_16	(out[16], in[16], clk, n_rst) ;
flipflop 	ff_17	(out[17], in[17], clk, n_rst) ;
flipflop 	ff_18	(out[18], in[18], clk, n_rst) ;
flipflop 	ff_19	(out[19], in[19], clk, n_rst) ;
flipflop 	ff_20	(out[20], in[20], clk, n_rst) ;
flipflop 	ff_21	(out[21], in[21], clk, n_rst) ;
flipflop 	ff_22	(out[22], in[22], clk, n_rst) ;
flipflop 	ff_23	(out[23], in[23], clk, n_rst) ;
flipflop 	ff_24	(out[24], in[24], clk, n_rst) ;
flipflop 	ff_25	(out[25], in[25], clk, n_rst) ;
flipflop 	ff_26	(out[26], in[26], clk, n_rst) ;

endmodule // register_27_bits
//===================================


//===================================
//
module shift_left_2 (out, in) ;
output	[26:0]		out ;
input	[26:0]		in ;

assign		 out[1:0] = 2'b00 ;
buf		b_00	(out[02], in[00]) ;
buf		b_01	(out[03], in[01]) ;
buf		b_02	(out[04], in[02]) ;
buf		b_03	(out[05], in[03]) ;
buf		b_04	(out[06], in[04]) ;
buf		b_05	(out[07], in[05]) ;
buf		b_06	(out[08], in[06]) ;
buf		b_07	(out[09], in[07]) ;
buf		b_08	(out[10], in[08]) ;
buf		b_09	(out[11], in[09]) ;
buf		b_10	(out[12], in[10]) ;
buf		b_11	(out[13], in[11]) ;
buf		b_12	(out[14], in[12]) ;
buf		b_13	(out[15], in[13]) ;
buf		b_14	(out[16], in[14]) ;
buf		b_15	(out[17], in[15]) ;
buf		b_16	(out[18], in[16]) ;
buf		b_17	(out[19], in[17]) ;
buf		b_18	(out[20], in[18]) ;
buf		b_19	(out[21], in[19]) ;
buf		b_20	(out[22], in[20]) ;
buf		b_21	(out[23], in[21]) ;
buf		b_22	(out[24], in[22]) ;
buf		b_23	(out[25], in[23]) ;
buf		b_24	(out[26], in[24]) ;

endmodule // shift_left_2
//===============================

//===================================
//
module shift_left_1 (out, in) ;
output	[26:0]		out ;
input	[26:0]		in ;

assign		 	 out[00] = 1'b0 ;
buf		b_01	(out[01], in[00]) ;
buf		b_02	(out[02], in[01]) ;
buf		b_03	(out[03], in[02]) ;
buf		b_04	(out[04], in[03]) ;
buf		b_05	(out[05], in[04]) ;
buf		b_06	(out[06], in[05]) ;
buf		b_07	(out[07], in[06]) ;
buf		b_08	(out[08], in[07]) ;
buf		b_09	(out[09], in[08]) ;
buf		b_10	(out[10], in[09]) ;
buf		b_11	(out[11], in[10]) ;
buf		b_12	(out[12], in[11]) ;
buf		b_13	(out[13], in[12]) ;
buf		b_14	(out[14], in[13]) ;
buf		b_15	(out[15], in[14]) ;
buf		b_16	(out[16], in[15]) ;
buf		b_17	(out[17], in[16]) ;
buf		b_18	(out[18], in[17]) ;
buf		b_19	(out[19], in[18]) ;
buf		b_20	(out[20], in[19]) ;
buf		b_21	(out[21], in[20]) ;
buf		b_22	(out[22], in[21]) ;
buf		b_23	(out[23], in[22]) ;
buf		b_24	(out[24], in[23]) ;
buf		b_25	(out[25], in[24]) ;
buf		b_26	(out[26], in[25]) ;

endmodule // shift_left_1
//===================================

//===================================
//
module mux_2_1 (out, in_0, in_1, select) ;
output		out ;
input		in_0, in_1, select ;

bufif0		nb_0	(out, in_0, select) ;
bufif1		 b_0	(out, in_1, select) ;

endmodule // mux_2_1
//===================================

//===============================
//
module mux_2_1_5_bits (out, in_0, in_1, select);
output	[4:0]	out ;
input	[4:0]	in_0, in_1 ;
input			select ;

bufif0		nb_0	(out[0], in_0[0], select) ;
bufif0		nb_1	(out[1], in_0[1], select) ;
bufif0		nb_2	(out[2], in_0[2], select) ;
bufif0		nb_3	(out[3], in_0[3], select) ;
bufif0		nb_4	(out[4], in_0[4], select) ;

bufif1		b_0		(out[0], in_1[0], select) ;
bufif1		b_1		(out[1], in_1[1], select) ;
bufif1		b_2		(out[2], in_1[2], select) ;
bufif1		b_3		(out[3], in_1[3], select) ;
bufif1		b_4		(out[4], in_1[4], select) ;

endmodule // mux_2_1_5_bits
//===============================



//===================================
//
module mux_2_1_27_bits (out, in_0, in_1, select);
output	[26:0]	out ;
input	[26:0]	in_0, in_1 ;
input			select ;

bufif0		nb_00	(out[00], in_0[00], select) ;
bufif0		nb_01	(out[01], in_0[01], select) ;
bufif0		nb_02	(out[02], in_0[02], select) ;
bufif0		nb_03	(out[03], in_0[03], select) ;
bufif0		nb_04	(out[04], in_0[04], select) ;
bufif0		nb_05	(out[05], in_0[05], select) ;
bufif0		nb_06	(out[06], in_0[06], select) ;
bufif0		nb_07	(out[07], in_0[07], select) ;
bufif0		nb_08	(out[08], in_0[08], select) ;
bufif0		nb_09	(out[09], in_0[09], select) ;
bufif0		nb_10	(out[10], in_0[10], select) ;
bufif0		nb_11	(out[11], in_0[11], select) ;
bufif0		nb_12	(out[12], in_0[12], select) ;
bufif0		nb_13	(out[13], in_0[13], select) ;
bufif0		nb_14	(out[14], in_0[14], select) ;
bufif0		nb_15	(out[15], in_0[15], select) ;
bufif0		nb_16	(out[16], in_0[16], select) ;
bufif0		nb_17	(out[17], in_0[17], select) ;
bufif0		nb_18	(out[18], in_0[18], select) ;
bufif0		nb_19	(out[19], in_0[19], select) ;
bufif0		nb_20	(out[20], in_0[20], select) ;
bufif0		nb_21	(out[21], in_0[21], select) ;
bufif0		nb_22	(out[22], in_0[22], select) ;
bufif0		nb_23	(out[23], in_0[23], select) ;
bufif0		nb_24	(out[24], in_0[24], select) ;
bufif0		nb_25	(out[25], in_0[25], select) ;
bufif0		nb_26	(out[26], in_0[26], select) ;

bufif1		b_00	(out[00], in_1[00], select) ;
bufif1		b_01	(out[01], in_1[01], select) ;
bufif1		b_02	(out[02], in_1[02], select) ;
bufif1		b_03	(out[03], in_1[03], select) ;
bufif1		b_04	(out[04], in_1[04], select) ;
bufif1		b_05	(out[05], in_1[05], select) ;
bufif1		b_06	(out[06], in_1[06], select) ;
bufif1		b_07	(out[07], in_1[07], select) ;
bufif1		b_08	(out[08], in_1[08], select) ;
bufif1		b_09	(out[09], in_1[09], select) ;
bufif1		b_10	(out[10], in_1[10], select) ;
bufif1		b_11	(out[11], in_1[11], select) ;
bufif1		b_12	(out[12], in_1[12], select) ;
bufif1		b_13	(out[13], in_1[13], select) ;
bufif1		b_14	(out[14], in_1[14], select) ;
bufif1		b_15	(out[15], in_1[15], select) ;
bufif1		b_16	(out[16], in_1[16], select) ;
bufif1		b_17	(out[17], in_1[17], select) ;
bufif1		b_18	(out[18], in_1[18], select) ;
bufif1		b_19	(out[19], in_1[19], select) ;
bufif1		b_20	(out[20], in_1[20], select) ;
bufif1		b_21	(out[21], in_1[21], select) ;
bufif1		b_22	(out[22], in_1[22], select) ;
bufif1		b_23	(out[23], in_1[23], select) ;
bufif1		b_24	(out[24], in_1[24], select) ;
bufif1		b_25	(out[25], in_1[25], select) ;
bufif1		b_26	(out[26], in_1[26], select) ;

endmodule // mux_2_1
//===================================

//===================================
//
module f_a	(output s, cout, 
			input	in_0, in_1, cin
);

wire	w ;

assign	w = in_0 ^ in_1 ;
assign	s = w ^ cin ;
assign	cout = (w & cin) | (in_0 & in_1) ;

endmodule
//===================================

//===================================
//
module sub_nadd_27_bits (out, in_0, in_1, select);
output	[27:0]	out ;
input	[26:0]	in_1, in_0 ;
input			select ;

wire 	[26:0]		w ;
wire	[26:0]		in ;

assign			in[26:0] = ({27{select}} ^ in_1[26:0]) ;

f_a		m_00	(out[00], w[00], in_0[00], in[00], select) ;
f_a		m_01	(out[01], w[01], in_0[01], in[01], w[00]) ;
f_a		m_02	(out[02], w[02], in_0[02], in[02], w[01]) ;
f_a		m_03	(out[03], w[03], in_0[03], in[03], w[02]) ;
f_a		m_04	(out[04], w[04], in_0[04], in[04], w[03]) ;
f_a		m_05	(out[05], w[05], in_0[05], in[05], w[04]) ;
f_a		m_06	(out[06], w[06], in_0[06], in[06], w[05]) ;
f_a		m_07	(out[07], w[07], in_0[07], in[07], w[06]) ;
f_a		m_08	(out[08], w[08], in_0[08], in[08], w[07]) ;
f_a		m_09	(out[09], w[09], in_0[09], in[09], w[08]) ;
f_a		m_10	(out[10], w[10], in_0[10], in[10], w[09]) ;
f_a		m_11	(out[11], w[11], in_0[11], in[11], w[10]) ;
f_a		m_12	(out[12], w[12], in_0[12], in[12], w[11]) ;
f_a		m_13	(out[13], w[13], in_0[13], in[13], w[12]) ;
f_a		m_14	(out[14], w[14], in_0[14], in[14], w[13]) ;
f_a		m_15	(out[15], w[15], in_0[15], in[15], w[14]) ;
f_a		m_16	(out[16], w[16], in_0[16], in[16], w[15]) ;
f_a		m_17	(out[17], w[17], in_0[17], in[17], w[16]) ;
f_a		m_18	(out[18], w[18], in_0[18], in[18], w[17]) ;
f_a		m_19	(out[19], w[19], in_0[19], in[19], w[18]) ;
f_a		m_20	(out[20], w[20], in_0[20], in[20], w[19]) ;
f_a		m_21	(out[21], w[21], in_0[21], in[21], w[20]) ;
f_a		m_22	(out[22], w[22], in_0[22], in[22], w[21]) ;
f_a		m_23	(out[23], w[23], in_0[23], in[23], w[22]) ;
f_a		m_24	(out[24], w[24], in_0[24], in[24], w[23]) ;
f_a		m_25	(out[25], w[25], in_0[25], in[25], w[24]) ;
f_a		m_26	(out[26], w[26], in_0[26], in[26], w[25]) ;

assign			out[27] = w[26] ;

endmodule
//===================================

