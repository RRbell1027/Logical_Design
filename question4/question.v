module question(
    input a,
    input b,
    input c,
    input d,
    input e,
    output m
    );
    
    assign m = a | ( b & ( ( a & c ) | ( ( b | ~c ) & ~d ) ) ) | e;
endmodule
