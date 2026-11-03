// Huanhuan Huang 11/2/2026
// testbench for debouncer

`timescale 1 ns/1 ns

module debouncer_tb();
	logic clk, reset;
	logic [15:0] keymap;
	logic [15:0] debounced_keymap;
	
	debouncer #(16) dut(
		.clk(clk), 
		.reset(reset), 
		.keymap(keymap), 
		.debounced_keymap(debounced_keymap)
    );
	
	always begin
		// 10ns clk period
		clk = 0; #5;
		clk = 1; #5;
	end
	
	initial begin
		keymap = 16'b0000_0000_0001_0000;
		
		reset = 0;
		#22 reset = 1;
		
		// test 1
			assert (debounced_keymap == 0)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
		
		// test 2
			#83
			assert (debounced_keymap == 0)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
		
		// test 3
			#11
			assert (debounced_keymap == 16'b0000_0000_0001_0000)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
				
		// test 4
			#9
			keymap = 16'b0000_1111_0000_0000;
			#10
			assert (debounced_keymap == 16'b0000_0000_0001_0000)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
		
		// test 5
			#79
			assert (debounced_keymap == 16'b0000_0000_0001_0000)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
		
		// test 6
			#2
			assert (debounced_keymap == 16'b0000_1111_0000_0000)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
		
		#8 reset = 0;
		#22 reset = 1;
		
		keymap = 16'b0100_0000_0000_0010;
		#12
		keymap = 16'b0101_1100_0000_0000;
		#12
		keymap = 16'b0010_1111_0011_0101;
		
		// test 7
			#66
			assert (debounced_keymap == 0)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
		
		// test 8
			#21
			assert (debounced_keymap == 16'b0000_1100_0000_0000)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
				
		// test 9
			#11
			assert (debounced_keymap == 16'b0010_1111_0011_0101)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
		
		#30 reset = 0;
		// test 10
			#30
			assert (debounced_keymap == 0)
				$display("PASSED! The debounced keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The debounced keymap behaves incorrectly at time: %0t.", $time);
				
			#100 $stop;
		end
endmodule