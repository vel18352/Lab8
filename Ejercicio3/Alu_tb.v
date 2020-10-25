module testbench();
    reg [2:0] A; reg [3:0] B; reg [3:0] S; wire zero; wire carry_out; wire [3:0] Y;
    Alu U1(A, B, S, Y, zero, carry_out);
    initial begin
        A=0; B=0; S=0;
        $display("A\tB\tS\tY\tzero\tcarry_out");
        $monitor("%b\t%b\t%b\t%b\t%b\t", A, B, S, Y, zero, carry_out);
        #1 B=2;
	      S=4; A=3'b000;
        #1 B=2;
	      S=4; A=3'b001;
        #1 B=2; S=4; A=3'b010;
        #1 B=8;
	      S=8; A=4'b010;
        #1 B=4; S=3; A=3'b011;
        #1 B=4; S=5; A=3'b011;
        #1 B=4; S=4; A=3'b011;
        #1 B=3; S=5; A=3'b100;
        #1 $finish;
    end
endmodule
