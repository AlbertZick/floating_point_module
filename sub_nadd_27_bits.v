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
