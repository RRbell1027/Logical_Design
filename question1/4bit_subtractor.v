`timescale 1ns / 1ps

module bits4_subtractor(
    input a,
    input b,
    output m
    );
    
    wire[3:0] a,b,c,w;
    reg[3:0] m;
    
    full_adder t1(.a(a[0]), .b(~b[0]), .cin(1), .cout(c[0]), .sum(w[0]));
    full_adder t2(.a(a[1]), .b(~b[1]), .cin(c[0]), .cout(c[1]), .sum(w[1]));
    full_adder t3(.a(a[2]), .b(~b[2]), .cin(c[1]), .cout(c[2]), .sum(w[2]));
    full_adder t4(.a(a[3]), .b(~b[3]), .cin(c[2]), .cout(c[3]), .sum(w[3]));
    
    //§PÂ_overflow
    always@* begin
        if( ( ~a[3]&b[3]&w[3] ) | ( a[3]&~b[3]&~w[3] ) ) begin
            m = 4'bzzzz;
        end else begin
            m = w;
        end
    end
    
endmodule
