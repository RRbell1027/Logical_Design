module adder_substractor(a, b, sub, overflow, out);
    
    input[3:0] a, b;    //2?4bits??
    input sub;  //????????????
    output out, overflow; //5bits???
    
    reg[3:0] out, c;
    reg overflow;
    integer i;
    
    //???
    task  full_adder;
        input a, b, cin;
        output cout, sum;
        begin
            assign cout = (a&b) | (a&cin) | (b&cin);
            assign sum = (a^b)^cin;
        end
    endtask
    
    always@(a,b,sub) begin
        full_adder(a[0],b[0]^sub,sub,c[0],out[0]);
        full_adder(a[1],b[1]^sub,c[0],c[1],out[1]);
        full_adder(a[2],b[2]^sub,c[1],c[2],out[2]);
        full_adder(a[3],b[3]^sub,c[2],c[3],out[3]);
	overflow = c[3]^c[2];
     end
    
endmodule
