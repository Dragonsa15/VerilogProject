module DataMemory(ReadData,address,WriteData,WriteEnable,clk);

reg [7:0] DataSystem [1023:0];
input[31:0]WriteData,address;
output reg [31:0] ReadData;
input WriteEnable;
input clk;

always @(posedge clk)
begin
    if(WriteEnable)
    begin
        DataSystem[address] = WriteData[31:24];
        DataSystem[address+1] = WriteData[23:16];
        DataSystem[address+2] = WriteData[15:8];
        DataSystem[address+3] = WriteData[7:0];
    end
end

always @(address or DataSystem[address] or DataSystem[address + 1] or DataSystem[address + 2] or DataSystem[address + 3])
begin
    ReadData = {DataSystem[address],DataSystem[address+1],DataSystem[address+2],DataSystem[address+3]};
end

endmodule

module test();
reg[31:0]WriteData,address;
wire [31:0] ReadData;
reg WriteEnable;
reg clk;

DataMemory uut(ReadData,address,WriteData,WriteEnable,clk);


initial begin
$dumpfile ("DataMemory_out.vcd");
$dumpvars(0,test);


clk = 0;
address = 32'b1;
WriteEnable = 1;
WriteData = 32'd12;

#25
address = 32'b0;
WriteEnable = 0;

#40
address = 32'b1 + 2;

end
always
    #20 clk = ~clk;
endmodule