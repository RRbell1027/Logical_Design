//≥Ø¿A≈Ô_e94086042
module answer(
    input a,
    input b,
    input c,
    output m
    );
    
    //(~a+c)(a+b+~c)
    assign m = ( ~a | c ) & ( a | b | ~c );
endmodule
