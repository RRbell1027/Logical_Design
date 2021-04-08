`timescale 1ns / 1ps

module full_adder(
    input a,
    input b,
    input cin,
    output cout,
    output sum
    );
    assign cout = (a&b) | (a&cin) | (b&cin);
    assign sum =  (a^b) ^ cin;
endmodule
