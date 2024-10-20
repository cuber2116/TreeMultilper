module testBench();

    logic [4:0] A, B;
    logic [9:0] P;
    logic C;

    top_level_multiplier trun(.A(A), .B(B), .P(P), .C(C));

    initial begin
        $monitor("Time: %0t | A = %b (%0d), B = %b (%0d) | P = %b (%0d), Carry = %b",
                 $time, A, A, B, B, P, P, C);

        A = 5'b00001;
        B = 5'b00010;
        #10;
        
        A = 5'b00110;
        B = 5'b00101;
        #10;

        A = 5'b00000;
        B = 5'b01101;
        #10;

        A = 5'b11111;
        B = 5'b11111;
        #10;

        $finish;
    end

endmodule

