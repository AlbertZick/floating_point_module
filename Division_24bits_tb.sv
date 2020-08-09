module Division_24bits_tb();

logic			clk, en, n_rst, finish ;
logic	[22:0]	dividend, divisor ;
logic	[24:0]	quotient ;
shortreal		z, d, q ;
logic	[22:0]	temp ;

Divider m_divider	( quotient, finish, dividend, divisor, clk, en, n_rst ) ;

/*initial begin
	clk = 0 ; 
	en = 0 ;
	n_rst = 0 ;

	divisor 	= 23'h680000 ;
	dividend 	= 23'h7d6000 ;

	#20 ;
	#5 en = 1 ; 
	//#20 n_rst = 1 ;
	#300 ;
	$finish ;
end*/


initial begin
	#20;
	clk = 0 ;
	en = 1 ;
	//n_rst = 0 ;


	z = 1.632 ;
	d = 1.012 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;
	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ;
	divisor[22:0] 	=	temp[22:0] ;
	temp[22:0]		=	$shortrealtobits(q) ;
	//#20 n_rst = 1 ;
	#280 ;
	n_rst = 0 ;
	z = 1.832 ;
	d = 1.00 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;
	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ;
	divisor[22:0] 	=	temp[22:0] ;
	temp[22:0]		=	$shortrealtobits(q) ;
	//#20 n_rst = 1 ;
	#280 ;
	n_rst = 0 ;
	z = 1.999999 ;
	d = 1.9999 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;
	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ;
	divisor[22:0] 	=	temp[22:0] ;
	temp[22:0]		=	$shortrealtobits(q) ;
	//#20 n_rst = 1 ;
	#280 ;
	n_rst = 0 ;
	z = 1.000 ;
	d = 1.9999 ;
	q = z / d ;
	temp[22:0] = $shortrealtobits(z) ;
	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] = $shortrealtobits(d) ;
	divisor[22:0] 	=	temp[22:0] ;
	temp[22:0]		=	$shortrealtobits(q) ;
	//#20 n_rst = 1 ;
	#280 ;
	n_rst = 0 ;
	z = 1.004 ; d = 1.1654 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ; divisor[22:0] 	=	temp[22:0] ;
	temp[22:0]		=	$shortrealtobits(q) ;
	//#20 n_rst = 1 ;
	#280 ;
	//
	n_rst = 0 ;
	z = 1.1125 ; d = 1.245 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ;	divisor[22:0] 	=	temp[22:0] ;
	temp[22:0]		=	$shortrealtobits(q) ;
	//#20 n_rst = 1 ;
	#280 ;
	//
	n_rst = 0 ;
	z = 1.832 ; d = 1.945 ;
	q = z / d ;
	temp[22:0] 		= $shortrealtobits(z) ;	dividend[22:0] 	=	temp[22:0] ;
	temp[22:0] 		= $shortrealtobits(d) ;	divisor[22:0] 	=	temp[22:0] ;
	temp[22:0]		=	$shortrealtobits(q) ;
	//#20 n_rst = 1 ;
	#280 ;
	//

	$finish ;
end


always begin
	clk++ ;
	#10 ;
end


endmodule


