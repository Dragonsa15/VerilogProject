module ControlUnit(Regdst,Branch,Jump,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,SignZero,Opcode);

output reg Regdst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero;
output reg [1:0] ALUOp;
input [5:0] Opcode;

always @(*)
begin
    case (Opcode)
    6'b000000:begin         //R-Type Instruction
    Regdst = 1'b1;
    ALUSrc = 1'b0;
    MemtoReg = 1'b0;
    RegWrite = 1'b1;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    Branch = 1'b0;
    ALUOp = 2'b10;
    Jump = 1'b0;
    SignZero = 1'b0;
    end

    6'b100011:begin         //Load word
    Regdst = 1'b0;
    ALUSrc = 1'b1;
    MemtoReg = 1'b1;
    RegWrite = 1'b1;
    MemRead = 1'b1;
    MemWrite = 1'b0;
    Branch = 1'b0;
    ALUOp = 2'b00;
    Jump = 1'b0;
    SignZero = 1'b0;
    end

    6'b101011:begin         //Store word
    Regdst = 1'bx;
    ALUSrc = 1'b1;
    MemtoReg = 1'bx;
    RegWrite = 1'b0;
    MemRead = 1'b0;
    MemWrite = 1'b1;
    Branch = 1'b0;
    ALUOp = 2'b00;
    Jump = 1'b0;
    SignZero = 1'b0;
    end

    6'b000101:begin     //Branch not equal
    Regdst = 1'b0;
    ALUSrc = 1'b0;
    MemtoReg = 1'b0;
    RegWrite = 1'b0;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    Branch = 1'b1;
    ALUOp = 2'b01;
    Jump = 1'b0;
    SignZero = 1'b0;
    end

    6'b001110:begin         //Xor immediate
    Regdst = 1'b0;
    ALUSrc = 1'b1;
    MemtoReg = 1'b0;
    RegWrite = 1'b1;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    Branch = 1'b0;
    ALUOp = 2'b11;
    Jump = 1'b0;
    SignZero = 1'b1;
    end

    6'b000010 : begin // j - Jump
    Regdst = 1'b0;
    ALUSrc = 1'b0;
    MemtoReg= 1'b0;
    RegWrite= 1'b0;
    MemRead = 1'b0;
    MemWrite= 1'b0;
    Branch = 1'b0;
    ALUOp = 2'b00;
    Jump = 1'b1;
    SignZero= 1'b0;
    end

    default : begin 
    Regdst = 1'b0;
    ALUSrc = 1'b0;
    MemtoReg= 1'b0;
    RegWrite= 1'b0;
    MemRead = 1'b0;
    MemWrite= 1'b0;
    Branch = 1'b0;
    ALUOp = 2'b10;
    Jump = 1'b0;
    SignZero= 1'b0;
    end
    endcase
    end
endmodule

module ALUControlUnit(ALUOp,Function,ALUControlSignal);
output reg[1:0] ALUControlSignal;
input[1:0] ALUOp;
input[5:0] Function;
wire [7:0]ALUControlin;

assign ALUControlin = {ALUOp,Function};
always @(ALUControlin)
begin
    case(ALUControlin)
    8'b00XXXXXX: ALUControlSignal = 2'b00;
    8'b11XXXXXX : ALUControlSignal = 2'b01;
    8'b01XXXXXX : ALUControlSignal = 2'b10;
    8'b10100000 : ALUControlSignal = 2'b00;
    8'b10100010: ALUControlSignal = 2'b10;
    8'b10101010 : ALUControlSignal = 2'b00;
    default : ALUControlSignal = 2'b00;
    endcase
end
endmodule

module JumpControlUnit(ALUOp,Function,JumpControlSignal);
output reg[1:0] JumpControlSignal;
input[1:0] ALUOp;
input[5:0] Function;
wire [7:0]JumpControlin;

assign JumpControlin = {ALUOp,Function};
always @(JumpControlin)
begin
    if(JumpControlin == 8'b10001000)
        JumpControlSignal = 1'b0;
    else
        JumpControlSignal = 1'b0;
end
endmodule
    


/*
module test();
wire Regdst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero;
wire [1:0] ALUOp;
reg [5:0] Opcode;

ControlUnit uut(Regdst,Branch,Jump,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,SignZero,Opcode);

initial begin
#10
Opcode = 6'b000000;
#40;
Opcode = 6'b000011;
#40;
end

endmodule
*/
