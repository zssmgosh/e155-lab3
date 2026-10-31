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
	
	logic clk, int_osc, scan_en, odd, disp_en, save, fetch;
	logic [3:0] s, d0, d1, key;
    logic [15:0] debouncedKeyMap;
    logic [3:0] sync_rows, sync_cols;
	logic [17:0] dualSegCount, count;

	HSOSC #(.CLKHF_DIV(2'b00)) //0b00 is 48MHz
		hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

	counter #(15, 25000) slow_counter(int_osc, reset, enable, count, clk);
    // synchronize and debounce keypress input
    synchronizer #(3) synchronizerCol(clk, col, sync_col);
    synchronizer #(3) synchronizerRow(clk, row, sync_row);

	scanner scanner(clk, reset, scan_en, row, odd);

    keymap keymapper(clk, reset, odd, sync_rows, sync_cols, keyMap);
    
    debouncer #(16) debouncer(clk, reset, keyMap, debouncedKeyMap);

    keypress keypress(clk, reset, debouncedKeyMap, initKeyMap, scan_en, disp_en, save, fetch, saveKeyMap);
    snapshot keymapSaver(clk, reset, save, fetch, saveKeyMap, initKeyMap);

    keymap_to_key kmtok(debouncedKeyMap, key);
    always_ff @(posedge clk, negedge reset)
        if (~reset) begin
            d1 <= 0;
            d0 <= 0;
        end
        else
            if (disp_en) begin
                d1 <= d0;
                d0 <= key;
            end

    // time multiplexed dual segment display
    counter #(17, 100000) counter(int_osc, reset, enable, dualSegCount); //240Hz

    always_ff @(posedge clk, negedge reset) 
        if (~reset)
            anode1 <= 0;
        else
            if (dualSegCount > 100000)
                anode1 <= ~anode1;
    assign anode2 = ~anode1;

    assign s = anode1 ? d1 : d0;
    display display(s, seg);
endmodule