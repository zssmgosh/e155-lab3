// Huanhuan Huang 11/2/2026
// testbench for enabled flop

`timescale 1 ns/1 ns

module flopren_tb();
  logic           clk;    // system clock
  logic           reset;  // active high reset
  logic			  en;
  logic [4:0]     d;    
  logic [4:0]     q;

    flopren #(4) dut(
        .clk(clk),
        .reset(reset),
		.en(en),
        .d(d),
		.q(q)
    );

  // generate clock
  always begin
      clk = 0; #5;
      clk = 1; #5;
  end

  initial begin
	d = 4'b1011;
    en = 1;
    reset = 0;
    #22 reset = 1;

    // test 1
        #22;                        
        assert (q == 4'b1011)         
            $display("PASSED! The flop behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The flop behaves incorrectly at time: %0t.", $time); 
	
	reset = 0;
	// test 2
        #22;                        
        assert (q == 4'b0)         
            $display("PASSED! The flop behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The flop behaves incorrectly at time: %0t.", $time); 
	
	reset = 1;
	d = 4'b0110;
	// test 3
        #22;                        
        assert (q == 4'b0110)         
            $display("PASSED! The flop behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The flop behaves incorrectly at time: %0t.", $time); 
			
	en = 0;
	d = 4'b0011;
	// test 4
        #22;                        
        assert (q == 4'b0110)         
            $display("PASSED! The flop behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The flop behaves incorrectly at time: %0t.", $time); 
		#100 $stop;
	end
endmodule