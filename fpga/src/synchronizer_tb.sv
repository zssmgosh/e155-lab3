// Huanhuan Huang 11/2/2026
// testbench for synchronizer

`timescale 1 ns/1 ns

module synchronizer_tb();
	logic clk;
	logic [3:0] d;
	logic [3:0] q;
	
	synchronizer #(3) dut(
		.clk(clk), 
		.d(d),
		.q(q)
    );
	
	always begin
		// 10ns clk period
		clk = 0; #5;
		clk = 1; #5;
	end
	
	initial begin
		d = 4'b0101;
		#10
		d = 4'b1100;
		#10
		
		// test 1
			assert (q == 4'b0101)
				$display("PASSED! The output q behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The output q behaves incorrectly at time: %0t.", $time);
		
		// test 2
			#4
			assert (q == 4'b0101)
				$display("PASSED! The output q behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The output q behaves incorrectly at time: %0t.", $time);
		
		// test 3
			#2
			assert (q == 4'b1100)
				$display("PASSED! The output q behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The output q behaves incorrectly at time: %0t.", $time);
				
			#100 $stop;
		end
endmodule