// Huanhuan Huang 11/2/2026
// testbench for snapshot

`timescale 1 ns/1 ns

module snapshot_tb();
	logic clk, reset, save, fetch;
	logic [15:0] mapin, mapout;
	
	snapshot dut(
		.clk(clk), 
		.reset(reset),
		.save(save),	
		.fetch(fetch),
		.mapin(mapin),
		.mapout(mapout)
    );
	
	always begin
		// 10ns clk period
		clk = 0; #5;
		clk = 1; #5;
	end
	
	initial begin
		mapin = 16'b0000_0000_0000_1110;
		save = 0;
		fetch = 0;
		reset = 0;
		#22 reset = 1;
		
		// test 1
			#11
			assert (mapout == 0)
				$display("PASSED! The mapout behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The mapout behaves incorrectly at time: %0t.", $time);
		save = 1;
		// test 2
			#10
			assert (mapout == 16'b0000_0000_0000_1110)
				$display("PASSED! The mapout behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The mapout behaves incorrectly at time: %0t.", $time);
		
		mapin = 16'b1100_1111_0000_1010;
		// test 3
			#10
			assert (mapout == 16'b1100_1111_0000_1010)
				$display("PASSED! The mapout behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The mapout behaves incorrectly at time: %0t.", $time);
		
		mapin = 16'b0101_0011_1010_1111;
		save = 0;
		fetch = 1;
		// test 4
			#10
			assert (mapout == 16'b1100_1111_0000_1010)
				$display("PASSED! The mapout behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The mapout behaves incorrectly at time: %0t.", $time);
		
		// test 5
			#10
			assert (mapout == 16'b1100_1111_0000_1010)
				$display("PASSED! The mapout behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The mapout behaves incorrectly at time: %0t.", $time);
		
		save = 1;
		// test 6
			#10
			assert (mapout == 16'b0101_0011_1010_1111)
				$display("PASSED! The mapout behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The mapout behaves incorrectly at time: %0t.", $time);
		
		reset = 0;
		// test 7
			#10
			assert (mapout == 0)
				$display("PASSED! The mapout behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The mapout behaves incorrectly at time: %0t.", $time);
		
			#100 $stop;
		end
endmodule
		