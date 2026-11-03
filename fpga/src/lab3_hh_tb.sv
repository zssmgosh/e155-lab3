// Huanhuan Huang 11/2/2026
// testbench for top level

`timescale 1 ns/1 ns

module lab3_hh_tb();
	logic reset, enable, anode1, anode2;
    logic [3:0] col, row;
    logic[6:0] seg;
	
	lab3_hh dut(
		.reset(reset),
		.enable(enable),
		.row(row),
		.col(col),
		.seg(seg),
		.anode1(anode1),
		.anode2(anode2)
    );
	
	
	initial begin
		col = 4'b0010;
		enable = 0;
		reset = 0;
		#22 reset = 1;
		
		// test 1
			assert (anode1 == 0)
				$display("PASSED! The anode1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The anode1 behaves incorrectly at time: %0t.", $time);
			assert (anode2 == 1)
				$display("PASSED! The anode2 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The anode2 behaves incorrectly at time: %0t.", $time);
			assert (seg == ~7'b0111111)
				$display("PASSED! The seg behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The seg behaves incorrectly at time: %0t.", $time);
			assert (row == 4'b1000)
				$display("PASSED! The row behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The row behaves incorrectly at time: %0t.", $time);
		
		enable = 1;
		col = 4'b0010;
		#1041667
		// test 2
			assert (anode1 == 0)
				$display("PASSED! The anode1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The anode1 behaves incorrectly at time: %0t.", $time);
			assert (anode2 == 1)
				$display("PASSED! The anode2 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The anode2 behaves incorrectly at time: %0t.", $time);
			assert (seg == ~7'b0111111)
				$display("PASSED! The seg behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The seg behaves incorrectly at time: %0t.", $time);
			assert (row == 4'b1000)
				$display("PASSED! The row behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The row behaves incorrectly at time: %0t.", $time);
		
		col = 4'b1000;
		#2083334
		// test 3
			assert (anode1 == 1)
				$display("PASSED! The anode1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The anode1 behaves incorrectly at time: %0t.", $time);
			assert (anode2 == 0)
				$display("PASSED! The anode2 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The anode2 behaves incorrectly at time: %0t.", $time);
			assert (seg == ~7'b0111111)
				$display("PASSED! The seg behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The seg behaves incorrectly at time: %0t.", $time);
			assert (row == 4'b1000)
				$display("PASSED! The row behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The row behaves incorrectly at time: %0t.", $time);
		
		col = 4'b0000;
		#2083334
		// test 4
			assert (anode1 == 0)
				$display("PASSED! The anode1 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The anode1 behaves incorrectly at time: %0t.", $time);
			assert (anode2 == 1)
				$display("PASSED! The anode2 behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The anode2 behaves incorrectly at time: %0t.", $time);
			assert (seg == ~7'b0111111)
				$display("PASSED! The seg behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The seg behaves incorrectly at time: %0t.", $time);
			assert (row == 4'b0100)
				$display("PASSED! The row behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The row behaves incorrectly at time: %0t.", $time);
				
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#4166668
		col = 4'b1111;
		#12500004
		col = 4'b1101;
		#2166668
		
		assert (seg == ~7'b1110001)
				$display("PASSED! The seg behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The seg behaves incorrectly at time: %0t.", $time);
		#100 $stop;
		end
endmodule
		