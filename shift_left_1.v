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
