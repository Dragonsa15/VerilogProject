module InstructionMemory(instruction,address);
    input[31:0] address;
    output[31:0] instruction;
    reg[31:0] instruction;
    reg[31:0] instrMem[999:0];

    always @(address)
    begin
        instruction = instrMem[address/4];  
    end

    initial 
    begin
        $readmemb("instruction.txt",instrMem);
    end
    
endmodule

module InstrSimulation;

reg[31:0] addr;
wire[31:0] instr;

InstructionMemory uut(instr,addr);

initial begin
$monitor("Address: %h Instruction: %b",addr,instr);
addr = 32'd0;
#1000 addr = 32'd4;
#1000 addr = 32'd8;
$finish;
end

endmodule