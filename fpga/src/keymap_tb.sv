// Huanhuan Huang 11/2/2026
// testbench for keymap

`timescale 1 ns/1 ns

module keymap_tb();
	logic clk, reset;
	logic [3:0] rows, cols, count;
	logic [15:0] keymap;
	
	keymap dut(
		.clk(clk), 
		.reset(reset),
		.count(count),	
		.rows(rows),
		.cols(cols),
		.km(keymap)
    );
	
	always begin
		// 10ns clk period
		clk = 0; #5;
		clk = 1; #5;
	end
	
	initial begin
		rows = 4'b0001;
		cols = 4'b0010;
		
		reset = 0;
		#22 reset = 1;
		
		// test 1
			#11
			assert (keymap == 16'b1101_0000_0000_0000)
				$display("PASSED! The keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The keymap behaves incorrectly at time: %0t.", $time);
		
		rows = 4'b0010;
		cols = 4'b1100;
		
		// test 2
			#10
			assert (keymap == 16'b1101_0011_0000_0000)
				$display("PASSED! The keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The keymap behaves incorrectly at time: %0t.", $time);
		
		rows = 4'b0100;
		cols = 4'b0101;
		
		// test 3
			#10
			assert (keymap == 16'b1101_0011_1010_0000)
				$display("PASSED! The keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The keymap behaves incorrectly at time: %0t.", $time);
			
		rows = 4'b1000;
		cols = 4'b1011;
		
		// test 3
			#10
			assert (keymap == 16'b1101_0011_1010_0100)
				$display("PASSED! The keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The keymap behaves incorrectly at time: %0t.", $time);
		
		reset = 0;
		
		rows = 4'b0001;
		cols = 4'b1000;
		
		// test 3
			#10
			assert (keymap == 0)
				$display("PASSED! The keymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The keymap behaves incorrectly at time: %0t.", $time);
			#100 $stop;
		end
endmodule