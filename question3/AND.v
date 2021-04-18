//≥Ø¿A≈Ô_e94086042
`timescale 1ns / 1ps

module AND(
    input a,
    input b,
    output c
    );
    
    wire w1;
    
    //NAND¬‡AND
    nand n1(w1,a,b);
    nand n2(c,w1,w1);
endmodule
