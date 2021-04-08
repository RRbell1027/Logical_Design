`timescale 10ns / 10ps

module testbench();

    reg Input[1:0];
    wire Output1, Output2;
    
    AND and1(.a(Input[0]), .b(Input[1]), .c(Output1));
    XOR xor1(.a(Input[0]), .b(Input[1]), .c(Output2));
    
    initial begin
        Input[0]=0; Input[1]=0;
        #10 Input[0]=0; Input[1]=1;
        #10 Input[0]=1; Input[1]=1;
        #10 Input[0]=1; Input[1]=0; 
    end
    
endmodule
