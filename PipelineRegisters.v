module IF(instruction,temp_pc,clk,reset,WriteEn,pipelinedInstruction,pipelinedTemp_pc);
input[31:0] instruction;
input[31:0] temp_pc;
input clk,reset,WriteEn;
output reg [31:0] pipelinedInstruction;
output reg [31:0] pipelinedTemp_pc;

always @(posedge clk)
    begin
    if(reset)
    begin
        pipelinedInstruction = 32'b0;
        pipelinedTemp_pc = 32'b0;
    end  
    if(WriteEn)
    begin
        pipelinedInstruction = instruction;
        pipelinedTemp_pc = temp_pc;
    end
    end
    
endmodule

module ID(Regdst,Branch,Jump,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,OutputData1,OutputData2,SignExtendedA,ReadRegister2,WriteRegister,temp_pc,clk,reset,WriteEn,
            p_Regdst,p_Branch,p_Jump,p_MemRead,p_MemtoReg,p_ALUOp,p_MemWrite,p_ALUSrc,p_RegWrite,p_OutputData1,p_OutputData2,p_SignExtendedA,p_ReadRegister2,p_WriteRegister,p_temp_pc);

input[31:0] OutputData1,OutputData2,SignExtendedA;
input Regdst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump;
input[4:0] WriteRegister,ReadRegister2;
input [1:0] ALUOp;
input [31:0] temp_pc;
input clk,reset,WriteEn;

output reg p_Regdst,p_ALUSrc,p_MemtoReg,p_RegWrite,p_MemRead,p_MemWrite,p_Branch,p_Jump;
output reg [31:0] p_OutputData1,p_OutputData2,p_SignExtendedA;
output reg [4:0] p_WriteRegister,p_ReadRegister2;
output reg [1:0] p_ALUOp;
output reg [31:0] p_temp_pc;


always @(posedge clk)
    begin
    if(reset)
    begin
        p_Regdst = 1'b0;
        p_ALUSrc = 1'b0;
        p_MemtoReg = 1'b0;
        p_RegWrite = 1'b0;
        p_MemRead = 1'b0;
        p_MemWrite = 1'b0;
        p_Branch = 1'b0;
        p_Jump = 1'b0;
        p_OutputData1 = 32'b0;
        p_OutputData2 = 32'b0;
        p_SignExtendedA = 32'b0;
        p_WriteRegister = 5'b0;
        p_ReadRegister2 = 5'b0;
        p_ALUOp = 2'b0;
        p_temp_pc = 32'b0;
    end  
    if(WriteEn)
    begin
        p_Regdst = Regdst;
        p_ALUSrc = ALUSrc;
        p_MemtoReg = MemtoReg;
        p_RegWrite = RegWrite;
        p_MemRead = MemRead;
        p_MemWrite = MemWrite;
        p_Branch = Branch;
        p_Jump = Jump;
        p_OutputData1 = OutputData1;
        p_OutputData2 = OutputData2;
        p_SignExtendedA = SignExtendedA;
        p_WriteRegister = WriteRegister;
        p_ReadRegister2 = ReadRegister2;
        p_ALUOp = ALUOp;
        p_temp_pc = temp_pc;
    end
    end

endmodule

module Ex(Branch,Jump,MemRead,MemtoReg,MemWrite,RegWrite,OutputALU,MemWriteData,temp_pc,WriteBackReg,clk,reset,WriteEn,
        p_Branch,p_Jump,p_MemRead,p_MemtoReg,p_MemWrite,p_RegWrite,p_OutputALU,p_MemWriteData,p_temp_pc,p_WriteBackReg);

input[31:0] OutputALU,MemWriteData;
input MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump;
input[4:0] WriteBackReg;
input [31:0] temp_pc;
input clk,reset,WriteEn;

output reg p_MemtoReg,p_RegWrite,p_MemRead,p_MemWrite,p_Branch,p_Jump,p_SignZero;
output reg [31:0] p_OutputALU,p_MemWriteData;
output reg [4:0] p_WriteBackReg;
output reg [31:0] p_temp_pc;

always @(posedge clk)
    begin
    if(reset)
    begin
        p_MemtoReg = 1'b0;
        p_RegWrite = 1'b0;
        p_MemRead = 1'b0;
        p_MemWrite = 1'b0;
        p_Branch = 1'b0;
        p_Jump = 1'b0;
        p_OutputALU = 32'b0;
        p_WriteBackReg = 5'b0;
        p_temp_pc = 32'b0;
    end  
    if(WriteEn)
    begin
        p_MemtoReg = MemtoReg;
        p_RegWrite = RegWrite;
        p_MemRead = MemRead;
        p_MemWrite = MemWrite;
        p_Branch = Branch;
        p_Jump = Jump;
        p_OutputALU = OutputALU;
        p_WriteBackReg = WriteBackReg;
        p_temp_pc = temp_pc;
    end
    end

endmodule

module Mem(MemtoReg,RegWrite,OutputALU,DataOutput,WriteBackReg,clk,reset,WriteEn,
            p_MemtoReg,p_RegWrite,p_OutputALU,p_DataOutput,p_WriteBackReg);

input MemtoReg,RegWrite;
input[31:0] OutputALU,DataOutput;
input[4:0] WriteBackReg;
input clk,reset,WriteEn;



output reg p_MemtoReg,p_RegWrite;
output reg [31:0] p_OutputALU,p_DataOutput;
output reg [4:0] p_WriteBackReg;

always @(posedge clk)
    begin
    if(reset)
    begin
        p_MemtoReg = 1'b0;
        p_RegWrite = 1'b0;
        p_OutputALU = 32'b0;
        p_DataOutput = 32'b0;
        p_WriteBackReg = 5'b0;
    end  
    if(WriteEn)
    begin
        p_MemtoReg = MemtoReg;
        p_RegWrite = RegWrite;
        p_OutputALU = OutputALU;
        p_DataOutput = DataOutput;
        p_WriteBackReg = WriteBackReg;
    end
    end

endmodule
