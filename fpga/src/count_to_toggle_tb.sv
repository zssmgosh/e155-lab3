// Huanhuan Huang 11/2/2026
// testbench for count to toggle

`timescale 1 ns/1 ns

module count_to_toggle_tb();
	logic clk, reset, toggle;
	logic [4:0] count;
	
	count_to_toggle #(4,20) dut(
		.clk(clk), 
		.reset(reset),
		.count(count),	
		.toggle(toggle)
    );
	
	always begin
		// 10ns clk period
		clk = 0; #5;
		clk = 1; #5;
	end
	
	initial begin
		reset = 0;
		#22 reset = 1;
		
		count = 3;
		// test 1
			#11
			assert (toggle == 0)
				$display("PASSED! The toggle behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The toggle behaves incorrectly at time: %0t.", $time);
		
		count = 25;
		// test 2
			#10
			assert (toggle == 1)
				$display("PASSED! The toggle behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The toggle behaves incorrectly at time: %0t.", $time);
		
		// test 3
			#10
			assert (toggle == 0)
				$display("PASSED! The toggle behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The toggle behaves incorrectly at time: %0t.", $time);
		
		// test 4
			#10
			assert (toggle == 1)
				$display("PASSED! The toggle behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The toggle behaves incorrectly at time: %0t.", $time);
		
		count = 19; 
		// test 5
			#40
			assert (toggle == 1)
				$display("PASSED! The toggle behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The toggle behaves incorrectly at time: %0t.", $time);
		
		reset = 0;
		count = 30;
		// test 6
			#100
			assert (toggle == 0)
				$display("PASSED! The toggle behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The toggle behaves incorrectly at time: %0t.", $time);
				
			#100 $stop;
		end
endmodule
		