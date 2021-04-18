//���A��_e94086042
`timescale 1ns / 1ns

module testbench();
    
    reg [3:0] Input[1:0];  //2��4bits����J��
    wire[4:0] M;    //1��5bits����X��
    reg sub;    //�[�k���P��k�����洫�}��(1�O��k���A0�O�[�k��)
    
    adder_substractor s1(.a(Input[1]), .b(Input[0]), .out(M), .sub(sub));
    
    initial begin
    Input[1] = 4'b0000; Input[0] = 4'b1011; // 0, -5
    #10 Input[1] = 4'b0001; Input[0] = 4'b1010; // 1, -6
    #10 Input[1] = 4'b0010; Input[0] = 4'b1001; // 2, -7
    #10 Input[1] = 4'b0011; Input[0] = 4'b0000; // 3, 0
    #10 Input[1] = 4'b0100; Input[0] = 4'b0001; // 4, 1
    #10 Input[1] = 4'b0101; Input[0] = 4'b0010; // 5, 2
    #10 Input[1] = 4'b0110; Input[0] = 4'b0011; // 6, 3
    #10 Input[1] = 4'b0111; Input[0] = 4'b0100; // 7, 4
    #10 Input[1] = 4'b1100; Input[0] = 4'b0101; // -4, 5
    #10 Input[1] = 4'b1111; Input[0] = 4'b0110; // -1, 6
    end
    
    //�C�ӿ�J�ճ���2�ӿ�X( Input[1] + Input[0] , Input[1] - Input[0] )
    always@(Input[0],Input[1]) begin
        sub = 0;
        #5 sub = 1;
    end
    
endmodule
