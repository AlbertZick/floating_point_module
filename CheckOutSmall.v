//This module is to check if the result is too small
module CheckOutSmall(in,out);
input [31:0] in;
output [31:0] out;

//Compare to 0111001, which is 10e-7
Comparator C7(in[30],1'b0,1'b1,lt7,,et7);
Comparator C6(in[29],1'b1,et7,lt6,,et6);
Comparator C5(in[28],1'b1,et6,lt5,,et5);
Comparator C4(in[27],1'b1,et5,lt4,,et4);
Comparator C3(in[26],1'b1,et4,lt3,,et3);
Comparator C2(in[25],1'b0,et3,lt2,,et2);
Comparator C1(in[24],1'b0,et2,lt1,,et1);
Comparator C0(in[23],1'b1,et1,lt0,,);

or(lt76,lt6,lt7);
or(lt54,lt4,lt5);
or(lt32,lt2,lt3);
or(lt10,lt1,lt0);
or(lt7654,lt76,lt54);
or(lt3210,lt32,lt10);
or(lt,lt7654,lt3210);

mux21 #32 M0(in,32'b0,lt,out);


endmodule
