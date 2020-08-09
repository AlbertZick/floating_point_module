module mux_2_1 (out, in_0, in_1, select) ;
output		out ;
input		in_0, in_1, select ;

bufif0		nb_0	(out, in_0, select) ;
bufif1		 b_0	(out, in_1, select) ;

endmodule // mux_2_1
