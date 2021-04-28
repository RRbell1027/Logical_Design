`timescale 1ns / 1ns

module testbench();

    reg A, B, C;
    wire Q, An;
    
    question q1(.a(A), .b(B), .c(C), .m(Q));    //題目的POS
    answer a1(.a(A), .b(B), .c(C), .m(An));     //答案的SOP
    
    // An和Q全部吻合則成功
    initial begin
        A=0; B=0; C=0;
        #10 A=0; B=0; C=1;
        #10 A=0; B=1; C=0;
        #10 A=0; B=1; C=1;
        #10 A=1; B=0; C=0;
        #10 A=1; B=0; C=1;
        #10 A=1; B=1; C=0;
        #10 A=1; B=1; C=1;
        #10 $finish;
    end

endmodule
