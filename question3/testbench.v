//≥Ø¿A≈Ô_E94086042
`timescale 1ns / 1ns

module testbench();

    reg Input[1:0];
    wire Output1, Output2;
    
    AND and1(.a(Input[0]), .b(Input[1]), .c(Output1));  //and gate
    XOR xor1(.a(Input[0]), .b(Input[1]), .c(Output2));  //xor gate
    
    initial begin
        Input[0]=0; Input[1]=0;
        #10 Input[0]=0; Input[1]=1;
        #10 Input[0]=1; Input[1]=1;
        #10 Input[0]=1; Input[1]=0; 
        #10 $finish;
    end
    
endmodule
