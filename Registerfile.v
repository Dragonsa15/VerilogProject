module RegisterFile(
    OutputData1,
    OutputData2,
    WriteBackData,
    ReadRegister1,
    ReadRegister2,
    WriteRegister,
    RegWriteEnable,
    clk,
    reset
);

input[4:0] ReadRegister1,ReadRegister2,WriteRegister;
input[31:0] WriteBackData;
output[31:0] OutputData1,OutputData2;
input RegWriteEnable,clk,reset;
wire [31:0] RegSystem [0:31];
wire [31:0]decodedRegister;

decoder d1(decodedRegister,RegWriteEnable,WriteRegister);
register reg0(RegSystem[0],32'b0,clk,1'b0,1'b1);    //$zero register
register reg1(RegSystem[1],WriteBackData,clk,reset,decodedRegister[1]);
register reg2(RegSystem[2],WriteBackData,clk,reset,decodedRegister[2]);
register reg3(RegSystem[3],WriteBackData,clk,reset,decodedRegister[3]);
register reg4(RegSystem[4],WriteBackData,clk,reset,decodedRegister[4]);

register reg5(RegSystem[5],WriteBackData,clk,reset,decodedRegister[5]);
register reg6(RegSystem[6],WriteBackData,clk,reset,decodedRegister[6]);
register reg7(RegSystem[7],WriteBackData,clk,reset,decodedRegister[7]);
register reg8(RegSystem[8],WriteBackData,clk,reset,decodedRegister[8]);
register reg9(RegSystem[9],WriteBackData,clk,reset,decodedRegister[9]);

register reg10(RegSystem[10],WriteBackData,clk,reset,decodedRegister[10]);
register reg11(RegSystem[11],WriteBackData,clk,reset,decodedRegister[11]);
register reg12(RegSystem[12],WriteBackData,clk,reset,decodedRegister[12]);
register reg13(RegSystem[13],WriteBackData,clk,reset,decodedRegister[13]);
register reg14(RegSystem[14],WriteBackData,clk,reset,decodedRegister[14]);

register reg15(RegSystem[15],WriteBackData,clk,reset,decodedRegister[15]);
register reg16(RegSystem[16],WriteBackData,clk,reset,decodedRegister[16]);
register reg17(RegSystem[17],WriteBackData,clk,reset,decodedRegister[17]);
register reg18(RegSystem[18],WriteBackData,clk,reset,decodedRegister[18]);
register reg19(RegSystem[19],WriteBackData,clk,reset,decodedRegister[19]);

register reg20(RegSystem[20],WriteBackData,clk,reset,decodedRegister[20]);
register reg21(RegSystem[21],WriteBackData,clk,reset,decodedRegister[21]);
register reg22(RegSystem[22],WriteBackData,clk,reset,decodedRegister[22]);
register reg23(RegSystem[23],WriteBackData,clk,reset,decodedRegister[23]);
register reg24(RegSystem[24],WriteBackData,clk,reset,decodedRegister[24]);

register reg25(RegSystem[25],WriteBackData,clk,reset,decodedRegister[25]);
register reg26(RegSystem[26],WriteBackData,clk,reset,decodedRegister[26]);
register reg27(RegSystem[27],WriteBackData,clk,reset,decodedRegister[27]);
register reg28(RegSystem[28],WriteBackData,clk,reset,decodedRegister[28]);
register reg29(RegSystem[29],WriteBackData,clk,reset,decodedRegister[29]);

register reg30(RegSystem[30],WriteBackData,clk,reset,decodedRegister[30]);
register reg31(RegSystem[31],WriteBackData,clk,reset,decodedRegister[31]);

IdentifyNeededData i1(OutputData1,ReadRegister1,RegSystem[0],RegSystem[1],RegSystem[2],RegSystem[3],RegSystem[4],RegSystem[5],RegSystem[6],RegSystem[7],RegSystem[8],RegSystem[9],RegSystem[10],
                    RegSystem[11],RegSystem[12],RegSystem[13],RegSystem[14],RegSystem[15],RegSystem[16],RegSystem[17],RegSystem[18],RegSystem[19],RegSystem[20],RegSystem[21],RegSystem[22],
                    RegSystem[23],RegSystem[24],RegSystem[25],RegSystem[26],RegSystem[27],RegSystem[28],RegSystem[29],RegSystem[30],RegSystem[31]);

IdentifyNeededData i2(OutputData2,ReadRegister2,RegSystem[0],RegSystem[1],RegSystem[2],RegSystem[3],RegSystem[4],RegSystem[5],RegSystem[6],RegSystem[7],RegSystem[8],RegSystem[9],RegSystem[10],
                    RegSystem[11],RegSystem[12],RegSystem[13],RegSystem[14],RegSystem[15],RegSystem[16],RegSystem[17],RegSystem[18],RegSystem[19],RegSystem[20],RegSystem[21],RegSystem[22],
                    RegSystem[23],RegSystem[24],RegSystem[25],RegSystem[26],RegSystem[27],RegSystem[28],RegSystem[29],RegSystem[30],RegSystem[31]);

endmodule

module mux32x1(out,in,select);
output out;
input[31:0] in;
input[4:0] select;
wire [31:0] decodedOutput,temp;
wire w1,w2,w3,w4,w5,w6,w7,w8,w11,w12;

decode5to32 d2(select,decodedOutput);
and and0(temp[0],decodedOutput[0],in[0]);
and and1(temp[1],decodedOutput[1],in[1]);
and and2(temp[2],decodedOutput[2],in[2]);
and and3(temp[3],decodedOutput[3],in[3]);
and and4(temp[4],decodedOutput[4],in[4]);

and and5(temp[5],decodedOutput[5],in[5]);
and and6(temp[6],decodedOutput[6],in[6]);
and and7(temp[7],decodedOutput[7],in[7]);
and and8(temp[8],decodedOutput[8],in[8]);
and and9(temp[9],decodedOutput[9],in[9]);

and and10(temp[10],decodedOutput[10],in[10]);
and and11(temp[11],decodedOutput[11],in[11]);
and and12(temp[12],decodedOutput[12],in[12]);
and and13(temp[13],decodedOutput[13],in[13]);
and and14(temp[14],decodedOutput[14],in[14]);

and and15(temp[15],decodedOutput[15],in[15]);
and and16(temp[16],decodedOutput[16],in[16]);
and and17(temp[17],decodedOutput[17],in[17]);
and and18(temp[18],decodedOutput[18],in[18]);
and and19(temp[19],decodedOutput[19],in[19]);

and and20(temp[20],decodedOutput[20],in[20]);
and and21(temp[21],decodedOutput[21],in[21]);
and and22(temp[22],decodedOutput[22],in[22]);
and and23(temp[23],decodedOutput[23],in[23]);
and and24(temp[24],decodedOutput[24],in[24]);

and and25(temp[25],decodedOutput[25],in[25]);
and and26(temp[26],decodedOutput[26],in[26]);
and and27(temp[27],decodedOutput[27],in[27]);
and and28(temp[28],decodedOutput[28],in[28]);
and and29(temp[29],decodedOutput[29],in[29]);

and and30(temp[30],decodedOutput[30],in[30]);
and and31(temp[31],decodedOutput[31],in[31]);

or or1(w1,temp[0],temp[1],temp[2],temp[3]);
or or2(w2,temp[4],temp[5],temp[6],temp[7]);
or or3(w3,temp[8],temp[9],temp[10],temp[11]);
or or4(w4,temp[12],temp[13],temp[14],temp[15]);
or or5(w5,temp[16],temp[17],temp[18],temp[19]);
or or6(w6,temp[20],temp[21],temp[22],temp[23]);
or or7(w7,temp[24],temp[25],temp[26],temp[27]);
or or8(w8,temp[28],temp[29],temp[30],temp[31]);
or or9(g11,w1,w2,w3,w4);
or or10(g12,w5,w6,w7,w8);
or or11(out,g11,g12);
endmodule

module IdentifyNeededData(OutputData,ReadRegister,in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31);
input[4:0] ReadRegister;
output[31:0] OutputData;
input[31:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31;
reg[31:0] BitWiseArray [0:31];
integer i;

always @(*)
begin
for(i=0;i<=31;i++)
BitWiseArray[i] = {in31[i],in30[i],in29[i],in28[i],in27[i],in26[i],in25[i],in24[i],in23[i],in22[i],in21[i],in20[i],in19[i],in18[i],in17[i],in16[i],in15[i],in14[i],in13[i],in12[i],in11[i],in10[i],in9[i],in8[i],in7[i],in6[i],in5[i],in4[i],in3[i],in2[i],in1[i],in0[i]};
end
//Add the implementation of giving in the array values

mux32x1 mux0(OutputData[0],BitWiseArray[0],ReadRegister);
mux32x1 mux1(OutputData[1],BitWiseArray[1],ReadRegister);
mux32x1 mux2(OutputData[2],BitWiseArray[2],ReadRegister);
mux32x1 mux3(OutputData[3],BitWiseArray[3],ReadRegister);
mux32x1 mux4(OutputData[4],BitWiseArray[4],ReadRegister);

mux32x1 mux5(OutputData[5],BitWiseArray[5],ReadRegister);
mux32x1 mux6(OutputData[6],BitWiseArray[6],ReadRegister);
mux32x1 mux7(OutputData[7],BitWiseArray[7],ReadRegister);
mux32x1 mux8(OutputData[8],BitWiseArray[8],ReadRegister);
mux32x1 mux9(OutputData[9],BitWiseArray[9],ReadRegister);

mux32x1 mux10(OutputData[10],BitWiseArray[10],ReadRegister);
mux32x1 mux11(OutputData[11],BitWiseArray[11],ReadRegister);
mux32x1 mux12(OutputData[12],BitWiseArray[12],ReadRegister);
mux32x1 mux13(OutputData[13],BitWiseArray[13],ReadRegister);
mux32x1 mux14(OutputData[14],BitWiseArray[14],ReadRegister);

mux32x1 mux15(OutputData[15],BitWiseArray[15],ReadRegister);
mux32x1 mux16(OutputData[16],BitWiseArray[16],ReadRegister);
mux32x1 mux17(OutputData[17],BitWiseArray[17],ReadRegister);
mux32x1 mux18(OutputData[18],BitWiseArray[18],ReadRegister);
mux32x1 mux19(OutputData[19],BitWiseArray[19],ReadRegister);

mux32x1 mux20(OutputData[20],BitWiseArray[20],ReadRegister);
mux32x1 mux21(OutputData[21],BitWiseArray[21],ReadRegister);
mux32x1 mux22(OutputData[22],BitWiseArray[22],ReadRegister);
mux32x1 mux23(OutputData[23],BitWiseArray[23],ReadRegister);
mux32x1 mux24(OutputData[24],BitWiseArray[24],ReadRegister);

mux32x1 mux25(OutputData[25],BitWiseArray[25],ReadRegister);
mux32x1 mux26(OutputData[26],BitWiseArray[26],ReadRegister);
mux32x1 mux27(OutputData[27],BitWiseArray[27],ReadRegister);
mux32x1 mux28(OutputData[28],BitWiseArray[28],ReadRegister);
mux32x1 mux29(OutputData[29],BitWiseArray[29],ReadRegister);

mux32x1 mux30(OutputData[30],BitWiseArray[30],ReadRegister);
mux32x1 mux31(OutputData[31],BitWiseArray[31],ReadRegister);

endmodule

//creating a d-flip flop
module dflipflop(q, d, clk,WriteEn,reset);
output q;
input d;
input clk;
input WriteEn;
input reset;
reg q;
wire a1,a2;


always @(posedge clk)
    begin
    if(reset)
        q = 0;
    if(WriteEn)
        q = d;
      
    end
    
endmodule

module register(RegOut,RegIn,clk,reset,WriteEn);
input[31:0] RegIn;
input WriteEn,clk,reset;
output[31:0] RegOut;

dflipflop dff0(RegOut[0],RegIn[0],clk,WriteEn,reset);
dflipflop dff1(RegOut[1],RegIn[1],clk,WriteEn,reset);
dflipflop dff2(RegOut[2],RegIn[2],clk,WriteEn,reset);
dflipflop dff3(RegOut[3],RegIn[3],clk,WriteEn,reset);
dflipflop dff4(RegOut[4],RegIn[4],clk,WriteEn,reset);

dflipflop dff5(RegOut[5],RegIn[5],clk,WriteEn,reset);
dflipflop dff6(RegOut[6],RegIn[6],clk,WriteEn,reset);
dflipflop dff7(RegOut[7],RegIn[7],clk,WriteEn,reset);
dflipflop dff8(RegOut[8],RegIn[8],clk,WriteEn,reset);
dflipflop dff9(RegOut[9],RegIn[9],clk,WriteEn,reset);

dflipflop dff10(RegOut[10],RegIn[10],clk,WriteEn,reset);
dflipflop dff11(RegOut[11],RegIn[11],clk,WriteEn,reset);
dflipflop dff12(RegOut[12],RegIn[12],clk,WriteEn,reset);
dflipflop dff13(RegOut[13],RegIn[13],clk,WriteEn,reset);
dflipflop dff14(RegOut[14],RegIn[14],clk,WriteEn,reset);

dflipflop dff15(RegOut[15],RegIn[15],clk,WriteEn,reset);
dflipflop dff16(RegOut[16],RegIn[16],clk,WriteEn,reset);
dflipflop dff17(RegOut[17],RegIn[17],clk,WriteEn,reset);
dflipflop dff18(RegOut[18],RegIn[18],clk,WriteEn,reset);
dflipflop dff19(RegOut[19],RegIn[19],clk,WriteEn,reset);

dflipflop dff20(RegOut[20],RegIn[20],clk,WriteEn,reset);
dflipflop dff21(RegOut[21],RegIn[21],clk,WriteEn,reset);
dflipflop dff22(RegOut[22],RegIn[22],clk,WriteEn,reset);
dflipflop dff23(RegOut[23],RegIn[23],clk,WriteEn,reset);
dflipflop dff24(RegOut[24],RegIn[24],clk,WriteEn,reset);

dflipflop dff25(RegOut[25],RegIn[25],clk,WriteEn,reset);
dflipflop dff26(RegOut[26],RegIn[26],clk,WriteEn,reset);
dflipflop dff27(RegOut[27],RegIn[27],clk,WriteEn,reset);
dflipflop dff28(RegOut[28],RegIn[28],clk,WriteEn,reset);
dflipflop dff29(RegOut[29],RegIn[29],clk,WriteEn,reset);

dflipflop df30(RegOut[30],RegIn[30],clk,WriteEn,reset);
dflipflop dff31(RegOut[31],RegIn[31],clk,WriteEn,reset);

endmodule

module decoder(decodedOutput,ShouldWrite,WriteRegister);

input[4:0] WriteRegister;
input ShouldWrite;
input[31:0] decodedOutput;
wire[31:0] temp;

decode5to32 da(WriteRegister,temp);

assign decodedOutput[0] = 0;
//and and0(decodedOutput[0],temp[0],ShouldWrite);
and and1(decodedOutput[1],temp[1],ShouldWrite);
and and2(decodedOutput[2],temp[2],ShouldWrite);
and and3(decodedOutput[3],temp[3],ShouldWrite);
and and4(decodedOutput[4],temp[4],ShouldWrite);

and and5(decodedOutput[5],temp[5],ShouldWrite);
and and6(decodedOutput[6],temp[6],ShouldWrite);
and and7(decodedOutput[7],temp[7],ShouldWrite);
and and8(decodedOutput[8],temp[8],ShouldWrite);
and and9(decodedOutput[9],temp[9],ShouldWrite);

and and10(decodedOutput[10],temp[10],ShouldWrite);
and and11(decodedOutput[11],temp[11],ShouldWrite);
and and12(decodedOutput[12],temp[12],ShouldWrite);
and and13(decodedOutput[13],temp[13],ShouldWrite);
and and14(decodedOutput[14],temp[14],ShouldWrite);

and and15(decodedOutput[15],temp[15],ShouldWrite);
and and16(decodedOutput[16],temp[16],ShouldWrite);
and and17(decodedOutput[17],temp[17],ShouldWrite);
and and18(decodedOutput[18],temp[18],ShouldWrite);
and and19(decodedOutput[19],temp[19],ShouldWrite);

and and20(decodedOutput[20],temp[20],ShouldWrite);
and and21(decodedOutput[21],temp[21],ShouldWrite);
and and22(decodedOutput[22],temp[22],ShouldWrite);
and and23(decodedOutput[23],temp[23],ShouldWrite);
and and24(decodedOutput[24],temp[24],ShouldWrite);

and and25(decodedOutput[25],temp[25],ShouldWrite);
and and26(decodedOutput[26],temp[26],ShouldWrite);
and and27(decodedOutput[27],temp[27],ShouldWrite);
and and28(decodedOutput[28],temp[28],ShouldWrite);
and and29(decodedOutput[29],temp[29],ShouldWrite);

and and30(decodedOutput[30],temp[30],ShouldWrite);
and and31(decodedOutput[31],temp[31],ShouldWrite);
endmodule

module andfor5(out,a,b,c,d,e);
output out;
input a,b,c,d,e;
wire f1,f2,f3;
and and1(f1,a,b,c,d);
and and2(out,f1,e);
endmodule

module decode5to32(Registerindex,out);
input[4:0] Registerindex;
output[31:0] out;
wire not1,not2,not3,not4,not5;

not A(not1,Registerindex[4]);
not B(not2,Registerindex[3]);
not C(not3,Registerindex[2]);
not D(not4,Registerindex[1]);
not E(not5,Registerindex[0]);


andfor5 and5(out[31],Registerindex[4],Registerindex[3],Registerindex[2],Registerindex[1],Registerindex[0]);
andfor5 and6(out[30],Registerindex[4],Registerindex[3],Registerindex[2],Registerindex[1],not5);
andfor5 and7(out[29],Registerindex[4],Registerindex[3],Registerindex[2],not4,Registerindex[0]);
andfor5 and8(out[28],Registerindex[4],Registerindex[3],Registerindex[2],not4,not5);
andfor5 and9(out[27],Registerindex[4],Registerindex[3],not3,Registerindex[1],Registerindex[0]);

andfor5 and0(out[26],Registerindex[4],Registerindex[3],not3,Registerindex[1],not5);
andfor5 andq(out[25],Registerindex[4],Registerindex[3],not3,not4,Registerindex[0]);
andfor5 andw(out[24],Registerindex[4],Registerindex[3],not3,not4,not5);
andfor5 ande(out[23],Registerindex[4],not2,Registerindex[2],Registerindex[1],Registerindex[0]);
andfor5 andr(out[22],Registerindex[4],not2,Registerindex[2],Registerindex[1],not5);

andfor5 andt(out[21],Registerindex[4],not2,Registerindex[2],not4,Registerindex[0]);
andfor5 andy(out[20],Registerindex[4],not2,Registerindex[2],not4,not5);
andfor5 andu(out[19],Registerindex[4],not2,not3,Registerindex[1],Registerindex[0]);
andfor5 andi(out[18],Registerindex[4],not2,not3,Registerindex[1],not5);
andfor5 ando(out[17],Registerindex[4],not2,not3,not4,Registerindex[0]);

andfor5 andp(out[16],Registerindex[4],not2,not3,not4,not5);
andfor5 anda(out[15],not1,Registerindex[3],Registerindex[2],Registerindex[1],Registerindex[0]);
andfor5 ands(out[14],not1,Registerindex[3],Registerindex[2],Registerindex[1],not5);
andfor5 andd(out[13],not1,Registerindex[3],Registerindex[2],not4,Registerindex[0]);
andfor5 andf(out[12],not1,Registerindex[3],Registerindex[2],not4,not5);

andfor5 andg(out[11],not1,Registerindex[3],not3,Registerindex[1],Registerindex[0]);
andfor5 andh(out[10],not1,Registerindex[3],not3,Registerindex[1],not5);
andfor5 andj(out[9],not1,Registerindex[3],not3,not4,Registerindex[0]);
andfor5 andk(out[8],not1,Registerindex[3],not3,not4,not5);
andfor5 andl(out[7],not1,not2,Registerindex[2],Registerindex[1],Registerindex[0]);

andfor5 andz(out[6],not1,not2,Registerindex[2],Registerindex[1],not5);
andfor5 andx(out[5],not1,not2,Registerindex[2],not4,Registerindex[0]);
andfor5 andc(out[4],not1,not2,Registerindex[2],not4,not5);
andfor5 andv(out[3],not1,not2,not3,Registerindex[1],Registerindex[0]);
andfor5 andb(out[2],not1,not2,not3,Registerindex[1],not5);

andfor5 andn(out[1],not1,not2,not3,not4,Registerindex[0]);
andfor5 andm(out[0],not1,not2,not3,not4,not5);

endmodule

module test();
    wire[31:0] OutputData1;
    wire[31:0] OutputData2;
    reg[31:0] WriteBackData;
    reg[4:0] ReadRegister1;
    reg[4:0] ReadRegister2;
    reg[4:0] WriteRegister;
    reg RegWriteEnable;
    reg clk;
    reg reset;
    RegisterFile r(OutputData1,OutputData2,WriteBackData,ReadRegister1,ReadRegister2,WriteRegister,RegWriteEnable,clk,reset);
    
    
    initial begin
    $dumpfile ("Registers_out.vcd");
	$dumpvars(0, test);

    clk = 0;
    reset = 0;
    ReadRegister1 = 5'b0000;
    ReadRegister2 = 5'b0000;
    RegWriteEnable = 0;


    #20
    RegWriteEnable = 1;
    WriteRegister = 5'b0001;
    WriteBackData = 32'b00000000000000000000000000100001;
    ReadRegister1 = 5'b0000;
    ReadRegister2 = 5'b0000;

    #20;
    ReadRegister1 = 5'b0001;
    ReadRegister2 = 5'b0000;
    RegWriteEnable = 0;

    end
    always
        #10 clk = ~clk;
endmodule
