module ZeroExtend(out,in);
input[15:0] in;
output[31:0] out;
assign out = {{16{1'b0}},in};
endmodule

module SignExtend(out,in);
input[15:0] in;
output[31:0] out;
assign out = {{16{in[15]}},in};
endmodule

module ShiftLeft(out,in);
input[31:0] in;
output[31:0] out;
assign out = {in[29:0],2'b00};
endmodule