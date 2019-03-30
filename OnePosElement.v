module OnePosElement(have1in,in,have1out,out);
	input have1in,in;
	output have1out,out;
	wire hn;

not(hn,have1in);
and(outa,hn,in);
or(have1out,have1in,outa);
assign out = outa;

endmodule
