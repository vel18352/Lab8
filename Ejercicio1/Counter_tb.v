module testbench();
    reg clk;
    reg enabled;
    reg reset;
    reg load;
    reg [11:0] entry;
    wire [11:0] out;
    Counter U1(clk, enabled, reset, load, entry, out);
    always
        #2 clk = ~clk;
    initial begin
        clk=0;
        reset=0; enabled=0; entry=0; load=0;
        $display("clk\tenabled\treset\tload\tentry\tout");
        $monitor("%d\t%d\t%d\t%d\t%h\t%h\t", clk, enabled, reset,load, entry, out);
        #4 reset = 1;
        #4 reset = 0;
        #4 clk = 1;
        #4 clk = 1;
        #4 clk = 1;
		    #1 enabled = 1;
        #4 clk = 1;
        #4 clk = 1;
        #4 clk = 1;
        #4 clk = 1;
        #4 clk = 1;
		    #1 enabled =0;
		    #1 entry = 0;
		    #2 load =1;
		    #2 load =0;
        #4 clk = 1;
        #4 clk = 1;
		    #1 enabled =1;
        #4 clk = 1;
        #4 clk = 1;
        #4 clk = 1;
        #4 clk = 1;
    end
    initial
      #100 $finish;
    initial begin
      $dumpfile("Counter_tb.vcd");
      $dumpvars(0,testbench);
    end
endmodule
