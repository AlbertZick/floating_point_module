module bsd_2_bcd (bcd, bsd_2, bsd_1, bsd_0);
output	[23:0]		bcd ;
input	[11:0]		bsd_2, bsd_1, bsd_0 ;

wire	[23:0]		pos_part, neg_part ;
wire	[27:0]		conversion_out ;

assign		pos_part[00] = ~bsd_2[00] & bsd_0[00] ;
assign		pos_part[01] = ~bsd_2[00] & bsd_1[00] ;
assign		pos_part[02] = ~bsd_2[01] & bsd_0[01] ;
assign		pos_part[03] = ~bsd_2[01] & bsd_1[01] ;
assign		pos_part[04] = ~bsd_2[02] & bsd_0[02] ;
assign		pos_part[05] = ~bsd_2[02] & bsd_1[02] ;
assign		pos_part[06] = ~bsd_2[03] & bsd_0[03] ;
assign		pos_part[07] = ~bsd_2[03] & bsd_1[03] ;
assign		pos_part[08] = ~bsd_2[04] & bsd_0[04] ;
assign		pos_part[09] = ~bsd_2[04] & bsd_1[04] ;
assign		pos_part[10] = ~bsd_2[05] & bsd_0[05] ;
assign		pos_part[11] = ~bsd_2[05] & bsd_1[05] ;
assign		pos_part[12] = ~bsd_2[06] & bsd_0[06] ;
assign		pos_part[13] = ~bsd_2[06] & bsd_1[06] ;
assign		pos_part[14] = ~bsd_2[07] & bsd_0[07] ;
assign		pos_part[15] = ~bsd_2[07] & bsd_1[07] ;
assign		pos_part[16] = ~bsd_2[08] & bsd_0[08] ;
assign		pos_part[17] = ~bsd_2[08] & bsd_1[08] ;
assign		pos_part[18] = ~bsd_2[09] & bsd_0[09] ;
assign		pos_part[19] = ~bsd_2[09] & bsd_1[09] ;
assign		pos_part[20] = ~bsd_2[10] & bsd_0[10] ;
assign		pos_part[21] = ~bsd_2[10] & bsd_1[10] ;
assign		pos_part[22] = ~bsd_2[11] & bsd_0[11] ;
assign		pos_part[23] = ~bsd_2[11] & bsd_1[11] ;

assign		neg_part[00] =  bsd_2[00] & bsd_0[00] ;
assign		neg_part[01] =  bsd_2[00] & bsd_1[00] ;
assign		neg_part[02] =  bsd_2[01] & bsd_0[01] ;
assign		neg_part[03] =  bsd_2[01] & bsd_1[01] ;
assign		neg_part[04] =  bsd_2[02] & bsd_0[02] ;
assign		neg_part[05] =  bsd_2[02] & bsd_1[02] ;
assign		neg_part[06] =  bsd_2[03] & bsd_0[03] ;
assign		neg_part[07] =  bsd_2[03] & bsd_1[03] ;
assign		neg_part[08] =  bsd_2[04] & bsd_0[04] ;
assign		neg_part[09] =  bsd_2[04] & bsd_1[04] ;
assign		neg_part[10] =  bsd_2[05] & bsd_0[05] ;
assign		neg_part[11] =  bsd_2[05] & bsd_1[05] ;
assign		neg_part[12] =  bsd_2[06] & bsd_0[06] ;
assign		neg_part[13] =  bsd_2[06] & bsd_1[06] ;
assign		neg_part[14] =  bsd_2[07] & bsd_0[07] ;
assign		neg_part[15] =  bsd_2[07] & bsd_1[07] ;
assign		neg_part[16] =  bsd_2[08] & bsd_0[08] ;
assign		neg_part[17] =  bsd_2[08] & bsd_1[08] ;
assign		neg_part[18] =  bsd_2[09] & bsd_0[09] ;
assign		neg_part[19] =  bsd_2[09] & bsd_1[09] ;
assign		neg_part[20] =  bsd_2[10] & bsd_0[10] ;
assign		neg_part[21] =  bsd_2[10] & bsd_1[10] ;
assign		neg_part[22] =  bsd_2[11] & bsd_0[11] ;
assign		neg_part[23] =  bsd_2[11] & bsd_1[11] ;

sub_nadd_27_bits	conversion	(conversion_out, {3'h0, pos_part}, {3'h0, neg_part}, 1'b1) ;

assign		bcd[23:0] = conversion_out[23:0] ;

endmodule
