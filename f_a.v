module f_a	(output s, cout, 
			input	in_0, in_1, cin
);

wire	w ;

assign	w = in_0 ^ in_1 ;
assign	s = w ^ cin ;
assign	cout = (w & cin) | (in_0 & in_1) ;

endmodule
