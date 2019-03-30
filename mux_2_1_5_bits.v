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
