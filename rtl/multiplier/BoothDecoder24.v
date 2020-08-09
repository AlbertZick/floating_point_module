module BoothDecoder24(inA,inB,a,b,c,d,e,f,g,h,i,j,k,l,m);
	input [22:0] inA, inB;
	output [25:0] a,b,c,d,e,f,g,h,i,j,k,l,m;

	BoothDecoder BD1(inA,{inB[1:0],1'b0},a);
	BoothDecoder BD2(inA,inB[3:1],b);
	BoothDecoder BD3(inA,inB[5:3],c);
	BoothDecoder BD4(inA,inB[7:5],d);
	BoothDecoder BD5(inA,inB[9:7],e);
	BoothDecoder BD6(inA,inB[11:9],f);
	BoothDecoder BD7(inA,inB[13:11],g);
	BoothDecoder BD8(inA,inB[15:13],h);
	BoothDecoder BD9(inA,inB[17:15],i);
	BoothDecoder BD10(inA,inB[19:17],j);
	BoothDecoder BD11(inA,inB[21:19],k);
	BoothDecoder BD12(inA,{1'b1,inB[22:21]},l);
	BoothDecoder BD13(inA,3'b001,m);

endmodule