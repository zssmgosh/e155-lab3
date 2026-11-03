// Huanhuan Huang 11/2/2026
// testbench for keymap to key

`timescale 1 ns/1 ns

module keymap_to_key_tb();
	logic clk, reset, disp_en;
	logic [3:0] d1,d0;
	logic [15:0] keymap;
	
	keymap_to_key dut(
		.clk(clk), 
		.reset(reset),
		.disp_en(disp_en),
		.d1(d1),
		.d0(d0),
		.keymap(keymap)
    );
	
	always begin
		// 10ns clk period
		clk = 0; #5;
		clk = 1; #5;
	end
	
	initial begin
		keymap = 16'b0000_0000_0000_0000;
		
		disp_en=1;
		reset = 0;
		#22 reset = 1;
		
		// test 1
			#11
			assert (d1 == 0)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 0)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		// test 2
			#10
			assert (d1 == 0)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 0)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b1000_0000_0000_0000;
		// test 3
			#10
			assert (d1 == 0)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 1)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
				
		keymap = 16'b0100_0000_0000_0000;
		// test 4
			#10
			assert (d1 == 1)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 2)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0010_0000_0000_0000;
		// test 5
			#10
			assert (d1 == 2)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 3)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0001_0000_0000_0000;
		// test 6
			#10
			assert (d1 == 3)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 10)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_1000_0000_0000;
		// test 7
			#10
			assert (d1 == 10)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 4)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0100_0000_0000;
		// test 8
			#10
			assert (d1 == 4)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 5)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0010_0000_0000;
		// test 9
			#10
			assert (d1 == 5)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 6)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0001_0000_0000;
		// test 10
			#10
			assert (d1 == 6)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 11)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0000_1000_0000;
		// test 11
			#10
			assert (d1 == 11)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 7)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0000_0100_0000;
		// test 12
			#10
			assert (d1 == 7)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 8)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0000_0010_0000;
		// test 13
			#10
			assert (d1 == 8)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 9)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0000_0001_0000;
		// test 14
			#10
			assert (d1 == 9)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 12)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0000_0000_1000;
		// test 15
			#10
			assert (d1 == 12)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 14)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0000_0000_0100;
		// test 16
			#10
			assert (d1 == 14)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 0)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0000_0000_0010;
		// test 17
			#10
			assert (d1 == 0)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 15)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0000_0000_0001;
		// test 18
			#10
			assert (d1 == 15)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 13)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0100_101_0100_0110;
		// test 19
			#10
			assert (d1 == 13)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 0)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		reset = 0;
		keymap = 16'b0100_0000_0000_0000;
		// test 20
			#40
			assert (d1 == 0)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 0)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
		
		reset = 1;
		disp_en = 0;
		// test 20
			#40
			assert (d1 == 0)
				$display("PASSED! The d1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d1 behaves incorrectly at time: %0t.", $time);
			assert (d0 == 0)
				$display("PASSED! The d0 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The d0 behaves incorrectly at time: %0t.", $time);
			#100 $stop;
		end
endmodule