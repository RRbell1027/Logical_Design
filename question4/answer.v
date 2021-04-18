//³¯ÀAÅï_e94086042
module answer(
    input a,
    input b,
    input c,
    input d,
    input e,
    output m
    );
    
    // a+(b* ~d)+e
    assign m = a | ( b & ~d ) | e;
endmodule
