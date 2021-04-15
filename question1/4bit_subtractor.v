`timescale 1ns / 1ps

module bits4_subtractor(
    input[3:0] a, b,
    output[4:0] m
    );
    
    wire[4:0] a1,b1;
    wire[3:0] c;
    
    assign a1 = {a[3],a};
    assign b1 = {~b[3], ~b};
    
    full_adder t1(.a(a1[0]), .b(b1[0]), .cin(1), .cout(c[0]), .sum(m[0]));
    full_adder t2(.a(a1[1]), .b(b1[1]), .cin(c[0]), .cout(c[1]), .sum(m[1]));
    full_adder t3(.a(a1[2]), .b(b1[2]), .cin(c[1]), .cout(c[2]), .sum(m[2]));
    full_adder t4(.a(a1[3]), .b(b1[3]), .cin(c[2]), .cout(c[3]), .sum(m[3]));
    full_adder t5(.a(a1[4]), .b(b1[4]), .cin(c[3]), .cout(), .sum(m[4]));
    
endmodule
