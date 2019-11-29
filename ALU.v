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


//The above code has the same implementation as the whole code below except for the test bench

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
