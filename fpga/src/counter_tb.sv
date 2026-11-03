// Huanhuan Huang 11/2/2026
// testbench for counter

`timescale 1 ns/1 ns

module counter_tb();
  logic           clk;    // system clock
  logic           reset;  // active high reset
  logic [4:0]     count;    
  logic           enable;

    counter #(4, 20) dut(
        .int_osc(clk),
        .reset(reset),
		.enable(enable),
        .counter(count)
    );

  // generate clock
  always begin
      clk = 0; #5;
      clk = 1; #5;
  end

  // apply stimuli and check outputs
  initial begin
    enable = 1;
    reset = 0;
    #22 reset = 1;

    // test 1
        #22;                        // wait required time
        assert (count == 2)         // check outputs
            $display("PASSED! The counter behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter behaves incorrectly at time: %0t.", $time); 

    reset = 0;
    #22 reset = 1;
    // test 2
        #211;
        assert (count == 21)
            $display("PASSED! The counter behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter behaves incorrectly at time: %0t.", $time); 			

    // test 3
        #10;
        assert (count == 0)
            $display("PASSED! The counter behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter behaves incorrectly at time: %0t.", $time); 
	
	// test 4
        #40;
        assert (count == 4)
            $display("PASSED! The counter behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter behaves incorrectly at time: %0t.", $time); 

    reset = 0;
    #22 reset = 1;
	enable = 0;

    // test 5
        #100;                        // wait required time
        assert (count == 0)       // check outputs
            $display("PASSED! The counter behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter behaves incorrectly at time: %0t.", $time); 

	reset = 0;
	enable = 1;
	// test 6
        #100;                        // wait required time
        assert (count == 0)       // check outputs
            $display("PASSED! The counter behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter behaves incorrectly at time: %0t.", $time); 

    #100 $stop;
  end
endmodule



