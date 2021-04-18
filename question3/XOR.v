//³¯ÀAÅï_e94086042
`timescale 1ns / 1ps

module XOR(
    input a,
    input b,
    output c
    );
    
    wire w1,w2,w3;
    
    //NANDÂàXOR
    nand n1(w1,a,b);
    nand n2(w2,a,w1);
    nand n3(w3,b,w1);
    nand n4(c,w2,w3);
endmodule
