module adder_substractor(a, b, sub, out);
    
    input[3:0] a, b;    //2個4bits的輸入
    input sub;  //一個減法器和加法器交換開關
    output out; //一個5bits的輸出
    
    reg[4:0] a1, b1, out, c;
    integer i;
    
    //簡單的全加法器
    task  full_adder;
        input a, b, cin;
        output cout, sum;
        begin
            assign cout = (a&b) | (a&cin) | (b&cin);
            assign sum = (a^b)^cin;
        end
    endtask
    
    always@(a,b,sub) begin
        //a1 是 a 的 5bits 數值
        a1 = {a[3], a};
        //b1 是 b 的 4bits 數值與 sub 的XOR結果，目的=>( x^1 = ~x, x^0 = x)
        b1[4] = sub^b[3];
        for(i=0;i<=3;i=i+1) begin
            b1[i] = sub^b[i];
        end
        //將5bits的全加法器連起來，c作為cout, cin使用
        full_adder(a1[0],b1[0],sub,c[0],out[0]);
        full_adder(a1[1],b1[1],c[0],c[1],out[1]);
        full_adder(a1[2],b1[2],c[1],c[2],out[2]);
        full_adder(a1[3],b1[3],c[2],c[3],out[3]);
        full_adder(a1[4],b1[4],c[3],c[4],out[4]);
     end
    
endmodule
