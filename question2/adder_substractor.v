module adder_substractor(a, b, sub, out);

    input a, b, sub;
    output out;
    
    wire[3:0] a, b;
    wire sub;
    reg[4:0] c, m; 
    reg[4:0] a1, b1;
    reg[8:0] out;
    integer i;
    
    task full_adder;
        input a, b, cin;
        output cout, sum;
        begin
            cout = (a&b) | (a&cin) | (b&cin);
            sum = (a^b)^cin;
        end
    endtask
    
    always @* begin
        a1 = {a[3], a};
        b1[4] = sub^b[3];
        for(i=0;i<=3;i=i+1) begin
            b1[i] = sub^b[i];
        end
        full_adder(.a(a1[0]), .b(b1[0]), .cin(sub), .cout(c[0]), .sum(m[0]));
        full_adder(.a(a1[1]), .b(b1[1]), .cin(c[0]), .cout(c[1]), .sum(m[1]));
        full_adder(.a(a1[2]), .b(b1[2]), .cin(c[1]), .cout(c[2]), .sum(m[2]));
        full_adder(.a(a1[3]), .b(b1[3]), .cin(c[2]), .cout(c[3]), .sum(m[3]));
        full_adder(.a(a1[4]), .b(b1[4]), .cin(c[3]), .cout(c[4]), .sum(m[4]));
        
        
        //BCD
        out[8] = m[4];
        full_adder(.a(m[0]^m[4]), .b(0), .cin(m[4]), .cout(c[0]), .sum(out[0]));
        full_adder(.a(m[1]^m[4]), .b(0), .cin(c[0]), .cout(c[1]), .sum(out[1]));
        full_adder(.a(m[2]^m[4]), .b(0), .cin(c[1]), .cout(c[2]), .sum(out[2]));
        full_adder(.a(m[3]^m[4]), .b(0), .cin(c[2]), .cout(out[4]), .sum(out[3]));
        out[7:5] = 2'b000;
        
        if((out[4] | (out[3]&(out[2]|out[1]))) == 1) begin
            //OUT = OUT +9'd6;
            full_adder(.a(out[0]), .b(0), .cin(0), .cout(c[0]), .sum(out[0]));
            full_adder(.a(out[1]), .b(1), .cin(c[0]), .cout(c[1]), .sum(out[1]));
            full_adder(.a(out[2]), .b(1), .cin(c[1]), .cout(c[2]), .sum(out[2]));
            full_adder(.a(out[3]), .b(0), .cin(c[2]), .cout(c[3]), .sum(out[3]));
            full_adder(.a(out[4]), .b(0), .cin(c[3]), .cout(out[5]), .sum(out[4]));
        end
    end
endmodule
