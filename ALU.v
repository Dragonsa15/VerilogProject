module ALU(Output,CarryOut,InputA,InputB,ALUControl);
output reg [31:0] Output;
input[31:0] InputA,InputB;
input[1:0]ALUControl;
wire [31:0] CarryOuts;
output CarryOut;

/*ALU opcodes
Add 00
Sub 10
Xor 01
*/
always @(*)
begin
    if(ALUControl == 2'b00)
        Output = InputA + InputB;
    else if(ALUControl == 2'b10)
        Output = InputA - InputB;
    else    
        Output = InputA ^ InputB;
end


/*
alu1bit alu0(Output[0],CarryOuts[0],InputA[0],InputB[0],ALUControl[1],ALUControl);
alu1bit alu1(Output[1],CarryOuts[1],InputA[1],InputB[1],CarryOuts[0],ALUControl);
alu1bit alu2(Output[2],CarryOuts[2],InputA[2],InputB[2],CarryOuts[1],ALUControl);
alu1bit alu3(Output[3],CarryOuts[3],InputA[3],InputB[3],CarryOuts[2],ALUControl);
alu1bit alu4(Output[4],CarryOuts[4],InputA[4],InputB[4],CarryOuts[3],ALUControl);

alu1bit alu5(Output[5],CarryOuts[5],InputA[5],InputB[5],CarryOuts[4],ALUControl);
alu1bit alu6(Output[6],CarryOuts[6],InputA[6],InputB[6],CarryOuts[5],ALUControl);
alu1bit alu7(Output[7],CarryOuts[7],InputA[7],InputB[7],CarryOuts[6],ALUControl);
alu1bit alu8(Output[8],CarryOuts[8],InputA[8],InputB[8],CarryOuts[7],ALUControl);
alu1bit alu9(Output[9],CarryOuts[9],InputA[9],InputB[9],CarryOuts[8],ALUControl);

alu1bit alu10(Output[10],CarryOuts[10],InputA[10],InputB[10],CarryOuts[9],ALUControl);
alu1bit alu11(Output[11],CarryOuts[11],InputA[11],InputB[11],CarryOuts[10],ALUControl);
alu1bit alu12(Output[12],CarryOuts[12],InputA[12],InputB[12],CarryOuts[11],ALUControl);
alu1bit alu13(Output[13],CarryOuts[13],InputA[13],InputB[13],CarryOuts[12],ALUControl);
alu1bit alu14(Output[14],CarryOuts[14],InputA[14],InputB[14],CarryOuts[13],ALUControl);

alu1bit alu15(Output[15],CarryOuts[15],InputA[15],InputB[15],CarryOuts[14],ALUControl);
alu1bit alu16(Output[16],CarryOuts[16],InputA[16],InputB[16],CarryOuts[15],ALUControl);
alu1bit alu17(Output[17],CarryOuts[17],InputA[17],InputB[17],CarryOuts[16],ALUControl);
alu1bit alu18(Output[18],CarryOuts[18],InputA[18],InputB[18],CarryOuts[17],ALUControl);
alu1bit alu19(Output[19],CarryOuts[19],InputA[19],InputB[19],CarryOuts[18],ALUControl);

alu1bit alu20(Output[20],CarryOuts[20],InputA[20],InputB[20],CarryOuts[19],ALUControl);
alu1bit alu21(Output[21],CarryOuts[21],InputA[21],InputB[21],CarryOuts[20],ALUControl);
alu1bit alu22(Output[22],CarryOuts[22],InputA[22],InputB[22],CarryOuts[21],ALUControl);
alu1bit alu23(Output[23],CarryOuts[23],InputA[23],InputB[23],CarryOuts[22],ALUControl);
alu1bit alu24(Output[24],CarryOuts[24],InputA[24],InputB[24],CarryOuts[23],ALUControl);

alu1bit alu25(Output[25],CarryOuts[25],InputA[25],InputB[25],CarryOuts[24],ALUControl);
alu1bit alu26(Output[26],CarryOuts[26],InputA[26],InputB[26],CarryOuts[25],ALUControl);
alu1bit alu27(Output[27],CarryOuts[27],InputA[27],InputB[27],CarryOuts[26],ALUControl);
alu1bit alu28(Output[28],CarryOuts[28],InputA[28],InputB[28],CarryOuts[27],ALUControl);
alu1bit alu29(Output[29],CarryOuts[29],InputA[29],InputB[29],CarryOuts[28],ALUControl);

alu1bit alu30(Output[30],CarryOuts[30],InputA[30],InputB[30],CarryOuts[29],ALUControl);
alu1bit alu31(Output[31],CarryOuts[31],InputA[31],InputB[31],CarryOuts[30],ALUControl);
*/

endmodule

module alu1bit(Output,CarryOut,input1,input2,Carryin,ALUControl);
output Output,CarryOut;
input Carryin;
input input1,input2;
input[1:0] ALUControl;
wire sumaddout;
wire XorOut;                

AdderSubtractor a1(sumaddout,input1,input2,Carryin,CarryOut,ALUControl[1]);
xor xor1(XorOut,input1,input2);

mux2to1 muxl(Output,sumaddout,XorOut,ALUControl[0]);

endmodule


module AdderSubtractor(Out,a,b,cin,cout,control);
output Out;
input a,b,cin;
output cout;
input control;
wire outb,notb;

not not1(notb,b);

mux2to1 mux1(outb,b,notb,control);
bit1adder add1(cout,a,outb,cin,Out);

endmodule


module bit1adder(cout,a,b,cin,out);
output out;
input a,b,cin;
output cout;

xor xor1(w1,a,b);
xor xor2(out,w1,cin);
and and1(c1,a,b);
and and2(c2,w1,cin);
or or1(cout,c1,c2);

endmodule


module mux2to1(Out,A,B,select);
output reg Out;
input A,B;
input select;


always @(*)
begin
    if(select == 0)
        Out = A;
    else
        Out = B; 
end

endmodule 

module test();
wire[31:0] Output;
reg[31:0] InputA,InputB;
reg[1:0]ALUControl;
wire [31:0] CarryOuts;
wire CarryOut;


ALU uut(Output,CarryOut,InputA,InputB,ALUControl);

initial begin
$dumpfile ("ALU_out.vcd");
$dumpvars(0,test);


#40
ALUControl = 2'b00;
InputA = 32'd12;
InputB = 32'd4;

#40
ALUControl = 2'b10;
InputA = 32'd20;
InputB = 32'd14;

#40;
end

endmodule
