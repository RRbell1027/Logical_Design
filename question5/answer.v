module answer(
    input a,
    input b,
    input c,
    output m
    );
    
    assign m = ( ~a | c ) & ( a | b | ~c );
endmodule
