module question(
    input a,
    input b,
    input c,
    output m
    );

    assign m = ( ~a & ~b & ~c ) | ( ~a & b & ~c ) | ( ~a & b & c ) | ( a & ~b & c ) | ( a & b & c );

endmodule
