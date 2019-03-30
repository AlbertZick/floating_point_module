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
