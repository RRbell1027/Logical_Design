module BCD_transfer(in, out);

    input[4:0] in;
    output[5:0] out;
    
    reg[5:0] out;
    reg[2:0] c;
    
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

    always@* begin
        if( ( (~in[4] & in[3]) & (in[2]|in[1]) ) == 1'b1) begin          
            c[0] = 1'b0;
            c[1] = cout(in[1], 1, 0);
            c[2] = cout(in[2], 1, c[1]);
            out[0] = in[0];
            out[1] = sum(in[1], 1, c[0]);
            out[2] = sum(in[2], 1, c[1]);
            out[3] = sum(in[3], 0, c[2]);
            out[4] = cout(in[3], 0, c[2]);
            out[5] = in[4];      
        end else if( ( (in[4] & ~in[3]) & (~in[2]|~in[1]) ) == 1'b1) begin
            c[0] = cout(~in[0], 0, 1);
            c[1] = cout(~in[1], 1, c[0]);
            c[2] = cout(~in[2], 0, c[1]);
            out[0] = sum(~in[0], 0, 1);
            out[1] = sum(~in[1], 1, c[0]);
            out[2] = sum(~in[2], 1, c[1]);
            out[3] = sum(~in[3], 0, c[2]);
            out[4] = cout(~in[3], 0, c[2]);
            out[5] = in[4];
        end else if( ( in[4] & (in[3]|(in[2]&in[1])) ) == 1'b1) begin
            c[0] = cout(~in[0], 0, 1);
            c[1] = cout(~in[1], 0, c[0]);
            c[2] = cout(~in[2], 0, c[1]);
            out[0] = sum(~in[0], 0, 1);
            out[1] = sum(~in[1], 0, c[0]);
            out[2] = sum(~in[2], 0, c[1]);
            out[3] = sum(~in[3], 0, c[2]);
            out[4] = 1'b0;
            out[5] = in[4];
        end else begin
            c = 3'b000;
            out = {in[4], 1'b0, in[3:0]};
        end
    end
  
endmodule