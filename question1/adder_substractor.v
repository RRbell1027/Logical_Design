module adder_substractor(a, b, sub, out);
    
    input[3:0] a, b;    //2��4bits����J
    input sub;  //�@�Ӵ�k���M�[�k���洫�}��
    output out; //�@��5bits����X
    
    reg[4:0] a1, b1, out, c;
    integer i;
    
    //²�檺���[�k��
    task  full_adder;
        input a, b, cin;
        output cout, sum;
        begin
            assign cout = (a&b) | (a&cin) | (b&cin);
            assign sum = (a^b)^cin;
        end
    endtask
    
    always@(a,b,sub) begin
        //a1 �O a �� 5bits �ƭ�
        a1 = {a[3], a};
        //b1 �O b �� 4bits �ƭȻP sub ��XOR���G�A�ت�=>( x^1 = ~x, x^0 = x)
        b1[4] = sub^b[3];
        for(i=0;i<=3;i=i+1) begin
            b1[i] = sub^b[i];
        end
        //�N5bits�����[�k���s�_�ӡAc�@��cout, cin�ϥ�
        full_adder(a1[0],b1[0],sub,c[0],out[0]);
        full_adder(a1[1],b1[1],c[0],c[1],out[1]);
        full_adder(a1[2],b1[2],c[1],c[2],out[2]);
        full_adder(a1[3],b1[3],c[2],c[3],out[3]);
        full_adder(a1[4],b1[4],c[3],c[4],out[4]);
     end
    
endmodule
