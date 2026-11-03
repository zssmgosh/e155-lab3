// Huanhuan Huang 11/2/2026
// testbench for keypress FSM

`timescale 1 ns/1 ns

module keypress_tb();
	logic clk, reset, disp_en, save, fetch;
	logic [15:0] keymap, initkeymap, savekeymap;
	
	keypress dut(
		.clk(clk), 
		.reset(reset),
		.disp_en(disp_en),	
		.save(save),
		.fetch(fetch),
		.keymap(keymap),
		.init_keymap(initkeymap),
		.save_keymap(savekeymap)
    );
	
	always begin
		// 10ns clk period
		clk = 0; #5;
		clk = 1; #5;
	end
	
	initial begin
		keymap = 16'b0000_0000_0000_0000;
		
		reset = 0;
		#22 reset = 1;
		
		// test 1
			#11
			assert (disp_en == 0)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 0)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 0)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 0)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0110_0000_0000_0000;
		// test 2
			#10
			assert (disp_en == 0)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 0)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 0)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 0)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0010_0000_0000;
		// test 3
			#10
			assert (disp_en == 1)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 1)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 0)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 16'b0000_0010_0000_0000)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
		initkeymap = 16'b0000_0010_0000_0000;
		// test 4
			#10
			assert (disp_en == 0)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 0)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 0)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 0)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
				
		// test 5
			#10
			assert (disp_en == 0)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 0)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 0)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 0)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0010_0110_0000;
		// test 6
			#10
			assert (disp_en == 0)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 0)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 1)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 0)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
		// test 7
			#10
			assert (disp_en == 0)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 0)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 1)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 0)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
		keymap = 16'b0000_0000_0100_0000;
		// test 8
			#10
			assert (disp_en == 1)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 1)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 0)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 16'b0000_0000_0100_0000)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
		initkeymap = 16'b0000_0000_0100_0000;
		keymap = 16'b0011_0000_0100_0010;
		// test 9
			#20
			assert (disp_en == 0)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 0)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 1)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 0)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
		keymap = 0;
		// test 9
			#20
			assert (disp_en == 0)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 0)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 0)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 0)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
		reset = 0;
		// test 10
			#20
			assert (disp_en == 0)
				$display("PASSED! The display enable behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The display enable behaves incorrectly at time: %0t.", $time);
			assert (save == 0)
				$display("PASSED! save behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! save behaves incorrectly at time: %0t.", $time);
			assert (fetch == 0)
				$display("PASSED! fetch behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! fetch behaves incorrectly at time: %0t.", $time);
			assert (savekeymap == 0)
				$display("PASSED! The savekeymap behaves as desired at time: %0t.", $time);
			else
				$error("FAILED! The savekeymap behaves incorrectly at time: %0t.", $time);
		
			#100 $stop;
		end
endmodule