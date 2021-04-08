`timescale 10ns / 10ps

module testbench();
    
    reg A,B,C,D,E;
    wire Q,An;
    
    question q1(.a(A), .b(B), .c(C), .d(D), .e(E), .m(Q));
    answer a1(.a(A), .b(B), .c(C), .d(D), .e(E), .m(An));
    
    initial begin
        A=1; B=0; C=0; D=0; E=0;
        #10 A=0; B=0; C=0; D=0; E=0;
        #10 A=0; B=0; C=0; D=1; E=0;
        #10 A=0; B=0; C=1; D=0; E=0;
        #10 A=0; B=0; C=1; D=1; E=0;
        #10 A=0; B=1; C=0; D=0; E=0;
        #10 A=0; B=1; C=0; D=1; E=0;
        #10 A=0; B=1; C=1; D=0; E=0;
        #10 A=0; B=1; C=1; D=1; E=0;
        #10 A=0; B=0; C=0; D=0; E=1;
    end
endmodule
