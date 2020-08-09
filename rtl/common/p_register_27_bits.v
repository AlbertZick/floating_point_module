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
