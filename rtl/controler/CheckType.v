//This module is to check if the input is one of the special cases:
//Zeros: Bit 30 to 0 are zeros
//Infinity: The exponent is 11111111 while the fraction is all zeros
//NaN: The exponent is 11111111 but the fraction is NOT all zeros
module CheckType(in,zero,inf,nan);
	input [31:0] in;
	output zero,inf,nan;

	wire fraction_is_zero, exponent_is_zero, exponent_is_ones;

	//Check the fraction
	//Or all bit to see if there is a 1 bit
	or(in1,in[0],in[1]);
	or(in2,in1,in[2]);
	or(in3,in2,in[3]);
	or(in4,in3,in[4]);
	or(in5,in4,in[5]);
	or(in6,in5,in[6]);
	or(in7,in6,in[7]);
	or(in8,in7,in[8]);
	or(in9,in8,in[9]);
	or(in10,in9,in[10]);
	or(in11,in10,in[11]);
	or(in12,in11,in[12]);
	or(in13,in12,in[13]);
	or(in14,in13,in[14]);
	or(in15,in14,in[15]);
	or(in16,in15,in[16]);
	or(in17,in16,in[17]);
	or(in18,in17,in[18]);
	or(in19,in18,in[19]);
	or(in20,in19,in[20]);
	or(in21,in20,in[21]);
	or(fraction_is_not_zero,in21,in[22]);
	not(fraction_is_zero,fraction_is_not_zero);

	//Check the exponent
	//Or all bits
	or(in24,in[23],in[24]);
	or(in25,in24,in[25]);
	or(in26,in25,in[26]);
	or(in27,in26,in[27]);
	or(in28,in27,in[28]);
	or(in29,in28,in[29]);
	or(exponent_is_not_all_zero,in29,in[30]);
	not(exponent_is_zero,exponent_is_not_all_zero);

	//And all bits
	and(ain24,in[23],in[24]);
	and(ain25,ain24,in[25]);
	and(ain26,ain25,in[26]);
	and(ain27,ain26,in[27]);
	and(ain28,ain27,in[28]);
	and(ain29,ain28,in[29]);
	and(exponent_is_ones,ain29,in[30]);

	//Define the type of input
	and(zero,fraction_is_zero,exponent_is_zero);
	and(inf,fraction_is_zero,exponent_is_ones);
	and(nan,fraction_is_not_zero,exponent_is_ones);

endmodule
