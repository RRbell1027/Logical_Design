module bits4_adder(a, b, s);
    
    input[3:0] a, b;
    output[5:0] s;
    
    reg[2:0] c2;
    wire[3:0] c1;
    wire[4:0] a1, b1, m;
    
    function cout;
        input a,b,cin;
        begin
            cout = (a&b) | (a&cin) | (b&cin);
        end
    endfunction
    
    function sum;
        input a, b, cin;
        begin
            sum = (a^b)^cin;
        end
    endfunction
    
    assign a1 = {a[3], a};
    assign b1 = {b[3], b};
    
    assign c1[0] = cout(a1[0], b1[0], 0);
    assign c1[1] = cout(a1[1], b1[1], c1[0]);
    assign c1[2] = cout(a1[2], b1[2], c1[1]);
    assign c1[3] = cout(a1[3], b1[3], c1[2]);
    assign m[0] = sum(a1[0], b1[0], 0);
    assign m[1] = sum(a1[1], b1[1], c1[0]);
    assign m[2] = sum(a1[2], b1[2], c1[1]);
    assign m[3] = sum(a1[3], b1[3], c1[2]);
    assign m[4] = sum(a1[4], b1[4], c1[3]);

    BCD_transfer BCD(.in(m), .out(s));
    
endmodule