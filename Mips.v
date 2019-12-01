module mips();
integer pc;
//reg[31:0] address;
wire [31:0] instruction;
//reg[4:0] ReadRegister1,ReadRegister2,WriteRegister;
wire[4:0] WriteRegister;
//reg[31:0] WriteBackData;
wire[31:0] OutputData1,OutputData2;
wire [31:0] OutputALU;
wire [1:0] ALUOp;
//reg[31:0] InputA,InputB;
wire [1:0] ALUControl;
wire CarryOut;
wire [31:0]WriteBackData;
wire[31:0] ReadData;
//reg [5:0] Opcode;
wire isZero;
wire Regdst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero;
wire Mem_RegWrite;
reg clk;
reg [31:0] w1,w3;
wire [31:0] w2;
integer no_of_clock;
always @(posedge clk)
begin
    //if(no_of_clock == 5)
    begin
        w1 = (pc + 4);
        if(Branch && ~isZero)
            w3 = w1 + w2;
        else
            w3 = w1;
        pc = w3;
        no_of_clock = 0;
    end
    no_of_clock += 1; 
end

InstructionMemory P1(instruction,pc);
wire[31:0] p_instruction,p_pc;
IF PipReg1(instruction,pc,clk,reset,1'b1,p_instruction,p_pc);
wire [4:0] WriteBackReg;
RegisterFile P2(
    OutputData1,
    OutputData2,
    WriteBackData,
    p_instruction[25:21],
    p_instruction[20:16],
    WriteBackReg,
    Mem_RegWrite,
    clk,
    reset
);
ControlUnit C1(Regdst,Branch,Jump,MemRead,MemtoReg,ALUControl,MemWrite,ALUSrc,RegWrite,SignZero,p_instruction[31:26]);
wire [31:0] ZeroExtendedA,SignExtendedA,ExtensionA,ALUBusB;
ZeroExtend Z1(ZeroExtendedA,p_instruction[15:0]);
SignExtend Z2(SignExtendedA,p_instruction[15:0]);
ExtendChose E1(ExtensionA,SignExtendedA,ZeroExtendedA,SignZero);
wire p_Regdst,p_Branch,p_Jump,p_MemRead,p_MemtoReg,p_MemWrite,p_ALUSrc,p_RegWrite;
wire [31:0] p_OutputData1,p_OutputData2,p_SignExtendedA;
wire [4:0] p_ReadRegister2,p_WriteRegister;
wire [31:0] p_temp_pc;
wire [1:0] p_ALUControl;
ID PipReg2(Regdst,Branch,Jump,MemRead,MemtoReg,ALUControl,MemWrite,ALUSrc,RegWrite,OutputData1,OutputData2,ExtensionA,p_instruction[20:16],p_instruction[15:11],p_pc,clk,reset,1'b1,
            p_Regdst,p_Branch,p_Jump,p_MemRead,p_MemtoReg,p_ALUControl,p_MemWrite,p_ALUSrc,p_RegWrite,p_OutputData1,p_OutputData2,p_SignExtendedA,p_ReadRegister2,p_WriteRegister,p_temp_pc);

BusChose B1(ALUBusB,p_OutputData2,p_SignExtendedA,p_ALUSrc);
ShiftLeft S1(w2,p_SignExtendedA);
ALUControlUnit AL1(ALUControl,p_SignExtendedA[5:0],ALUOp);
ALU P3(OutputALU,CarryOut,p_OutputData1,ALUBusB,ALUOp,isZero);
wire [4:0] temp_WriteBackReg;
RegisterChose R1(temp_WriteBackReg,p_ReadRegister2,p_WriteRegister,p_Regdst);

wire Ex_MemtoReg,Ex_RegWrite,Ex_MemRead,Ex_MemWrite,Ex_Branch,Ex_Jump,Ex_SignZero;
wire [31:0] Ex_OutputALU,Ex_MemWriteData;
wire [4:0] Ex_WriteBackReg;
wire [31:0] Ex_temp_pc;

Ex PipReg3(p_Branch,p_Jump,p_MemRead,p_MemtoReg,p_MemWrite,p_RegWrite,OutputALU,p_OutputData2,p_temp_pc,temp_WriteBackReg,clk,reset,1'b1,
            Ex_Branch,Ex_Jump,Ex_MemRead,Ex_MemtoReg,Ex_MemWrite,Ex_RegWrite,Ex_OutputALU,Ex_MemWriteData,Ex_temp_pc,Ex_WriteBackReg);


wire [31:0] DataOutput;
DataMemory P4(DataOutput,Ex_OutputALU,Ex_MemWriteData,Ex_MemWrite,clk);


wire Mem_MemtoReg;
wire [31:0] Mem_OutputALU,Mem_DataOutput;
wire [4:0] Mem_WriteBackReg;

Mem PipReg4(Ex_MemtoReg,Ex_RegWrite,Ex_OutputALU,DataOutput,temp_WriteBackReg,clk,reset,1'b1,
            Mem_MemtoReg,Mem_RegWrite,Mem_OutputALU,Mem_DataOutput,WriteBackReg);

WriteBackChose W1(WriteBackData,Mem_OutputALU,Mem_DataOutput,Mem_MemtoReg);

initial begin
    pc = -4;
    clk = 0;
    no_of_clock = 0;
    $dumpfile ("Mips_out.vcd");
	$dumpvars(0, mips);
end

always
    #50 clk = ~clk;
endmodule