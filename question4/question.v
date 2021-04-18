//≥Ø¿A≈Ô_e94086042
module question(
    input a,
    input b,
    input c,
    input d,
    input e,
    output m
    );
    
    // a+b[ac+(b+~c)~d]+e
    assign m = a | ( b & ( ( a & c ) | ( ( b | ~c ) & ~d ) ) ) | e;
endmodule
