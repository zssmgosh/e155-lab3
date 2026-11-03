// Huanhuan Huang huahuang@hmc.edu 9/18/2026
// Lab 3 top level module

module lab3_hh (
		input logic reset,
        input logic enable,
        input logic [3:0] col,
        output logic[6:0] seg,
        output logic anode1, anode2, 
        output logic[3:0] row
    );
	
	logic clk, int_osc, odd, disp_en, save, fetch;
	logic [3:0] s, d0, d1, key;
    logic [15:0] keymap, debounced_keymap, save_keymap, init_keymap;
    logic [3:0] sync_rows, sync_cols;
	logic [17:0] seg_count, count;
    logic [3:0] scan_count;

	HSOSC #(.CLKHF_DIV(2'b00)) //0b00 is 48MHz
		hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

	counter #(15, 25000) slow_counter(int_osc, reset, enable, count);
	count_to_toggle #(15, 25000) clkToggle(int_osc, reset, count, clk);
	
    // synchronize and debounce keypress input
    synchronizer #(3) synchronizer_col(clk, col, sync_cols);
    synchronizer #(3) synchronizer_row(clk, row, sync_rows);

	scanner scanner(clk, reset, 1'b1, row, scan_count);

    keymap keymapper(clk, reset, scan_count, sync_rows, sync_cols, keymap);
    
    debouncer #(16) debouncer(clk, reset, keymap, debounced_keymap);

    snapshot keymapSaver(clk, reset, save, fetch, save_keymap, init_keymap);
    keypress keypress(clk, reset, debounced_keymap, init_keymap, disp_en, save, fetch, save_keymap);
    keymap_to_key kmtok(clk, reset, disp_en, debounced_keymap, d1, d0);
    
    // time multiplexed dual segment display
    counter #(17, 100000) counter(int_osc, reset, enable, seg_count); //240Hz
	count_to_toggle #(17,100000) anodeToggle(int_osc, reset, seg_count, anode1);

    assign anode2 = ~anode1;

    assign s = anode2 ? d1 : d0;
    display display(s, seg);
endmodule