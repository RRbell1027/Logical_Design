module answer(
    input a,
    input b,
    input c,
    input d,
    input e,
    output m
    );
    
    assign m = a | ( b & ~d ) | e;
endmodule
