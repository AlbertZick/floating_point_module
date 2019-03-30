module ShiftLeft(in,shamt,out);
	input [25:0] in;
	input shamt;
	output [25:0] out;
	wire sn;

	not (sn,shamt);

bufif1 (out[25],in[25],sn);
bufif1 (out[25],in[24],shamt);

bufif1 (out[24],in[24],sn);
bufif1 (out[24],in[23],shamt);

bufif1 (out[23],in[23],sn);
bufif1 (out[23],in[22],shamt);

bufif1 (out[22],in[22],sn);
bufif1 (out[22],in[21],shamt);

bufif1 (out[21],in[21],sn);
bufif1 (out[21],in[20],shamt);

bufif1 (out[20],in[20],sn);
bufif1 (out[20],in[19],shamt);

bufif1 (out[19],in[19],sn);
bufif1 (out[19],in[18],shamt);

bufif1 (out[18],in[18],sn);
bufif1 (out[18],in[17],shamt);

bufif1 (out[17],in[17],sn);
bufif1 (out[17],in[16],shamt);

bufif1 (out[16],in[16],sn);
bufif1 (out[16],in[15],shamt);

bufif1 (out[15],in[15],sn);
bufif1 (out[15],in[14],shamt);

bufif1 (out[14],in[14],sn);
bufif1 (out[14],in[13],shamt);

bufif1 (out[13],in[13],sn);
bufif1 (out[13],in[12],shamt);

bufif1 (out[12],in[12],sn);
bufif1 (out[12],in[11],shamt);

bufif1 (out[11],in[11],sn);
bufif1 (out[11],in[10],shamt);

bufif1 (out[10],in[10],sn);
bufif1 (out[10],in[09],shamt);

bufif1 (out[09],in[09],sn);
bufif1 (out[09],in[08],shamt);

bufif1 (out[08],in[08],sn);
bufif1 (out[08],in[07],shamt);

bufif1 (out[07],in[07],sn);
bufif1 (out[07],in[06],shamt);

bufif1 (out[06],in[06],sn);
bufif1 (out[06],in[05],shamt);

bufif1 (out[05],in[05],sn);
bufif1 (out[05],in[04],shamt);

bufif1 (out[04],in[04],sn);
bufif1 (out[04],in[03],shamt);

bufif1 (out[03],in[03],sn);
bufif1 (out[03],in[02],shamt);

bufif1 (out[02],in[02],sn);
bufif1 (out[02],in[01],shamt);

bufif1 (out[01],in[01],sn);
bufif1 (out[01],in[00],shamt);

bufif1 (out[00],in[00],sn);
bufif1 (out[00],1'b0,shamt);

endmodule