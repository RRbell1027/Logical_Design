//陳錦麟_e94086042
`timescale 1ns / 1ns

module testbench();
    
    reg A,B,C,D,E;
    wire Q,An;
    
    question q1(.a(A), .b(B), .c(C), .d(D), .e(E), .m(Q));  //問題
    answer a1(.a(A), .b(B), .c(C), .d(D), .e(E), .m(An));   //答案的SOP
    
    //Q和An吻合即成功
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
        #10 $finish;
    end
endmodule
