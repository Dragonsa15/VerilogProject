module BusChose(Out,A,B,select);
output reg [31:0] Out;
input[31:0] A,B;
input select;


always @(*)
begin
    if(select == 0)
        Out = A;
    else
        Out = B; 
end

endmodule 

module RegisterChose(Out,A,B,select);
output reg [5:0] Out;
input[5:0] A,B;
input select;


always @(*)
begin
    if(select == 0)
        Out = A;
    else
        Out = B; 
end

endmodule 

