//≥Ø¿A≈Ô_e94086042
module question(
    input a,
    input b,
    input c,
    output m
    );
    
    //(~a*~b*~c)+(~a*b*~c)+(~a*b*c)+(a*~b*c)+(abc)
    assign m = ( ~a & ~b & ~c ) | ( ~a & b & ~c ) | ( ~a & b & c ) | ( a & ~b & c ) | ( a & b & c );


endmodule
