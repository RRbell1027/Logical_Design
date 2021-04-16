module bits4_substrator(a, b, s);
    
    input[3:0] a,b;
    output[5:0] s;
    
    reg[4:0] c, m;
    wire[4:0] a1, b1;
    integer i;
    
    function cout;
    input a, b, cin;
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
    assign b1 = {~b[3], ~b};
    
    always@* begin
        c[0] = 1'b1;
        for(i=1;i<=4;i=i+1) begin
            c[i] = cout(a1[i-1], b1[i-1], c[i-1]);
        end
        for(i=0;i<=4;i=i+1) begin
            m[i] = sum(a1[i], b1[i], c[i]);
        end
    end
    
    BCD_transfer BCD(.in(m), .out(s));
    
endmodule