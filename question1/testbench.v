`timescale 10ns / 10ps

module testbench();
    
    reg [3:0] Input[1:0];
    wire[4:0] M,S;
    
    bits4_adder t1(.a(Input[1]), .b(Input[0]), .m(M));
    bits4_subtractor t2(.a(Input[1]), .b(Input[0]), .m(S));
    
    initial begin
    Input[1] = 4'b0110; Input[0] = 4'b1010;
    #10 Input[1] = 4'b0000; Input[0] = 4'b1100;
    #10 Input[1] = 4'b0100; Input[0] = 4'b1001;
    #10 Input[1] = 4'b0010; Input[0] = 4'b0001;
    #10 Input[1] = 4'b1011; Input[0] = 4'b0011;
    #10 Input[1] = 4'b1010; Input[0] = 4'b1111;
    #10 Input[1] = 4'b1110; Input[0] = 4'b1101;
    #10 Input[1] = 4'b0111; Input[0] = 4'b1110;
    #10 Input[1] = 4'b0000; Input[0] = 4'b0011;
    #10 Input[1] = 4'b0010; Input[0] = 4'b1000;
    end
endmodule
