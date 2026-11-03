// Huanhuan Huang 11/2/2026
// debouncer module

module debouncer #(parameter N)(
        input logic clk, 
        input logic reset,
        input logic [N-1:0] keymap, 
        output logic [N-1:0] debounced_keymap
    );
    logic [N-1:0] keymap1, keymap2, keymap3, keymap4, keymap5, keymap6, keymap7, keymap8, keymap9;

    flopren #(N) flopren0(clk, 1'b1, reset, keymap, keymap1);
    flopren #(N) flopren1(clk, 1'b1, reset, keymap1, keymap2);
    flopren #(N) flopren2(clk, 1'b1, reset, keymap2, keymap3);
    flopren #(N) flopren3(clk, 1'b1, reset, keymap3, keymap4);
    flopren #(N) flopren4(clk, 1'b1, reset, keymap4, keymap5);
    flopren #(N) flopren5(clk, 1'b1, reset, keymap5, keymap6);
    flopren #(N) flopren6(clk, 1'b1, reset, keymap6, keymap7);
    flopren #(N) flopren7(clk, 1'b1, reset, keymap7, keymap8);
    flopren #(N) flopren8(clk, 1'b1, reset, keymap8, keymap9);

	always_ff @(posedge clk, negedge reset)
		if (~reset)
			debounced_keymap <= 0;
		else begin
			for (int i = 0; i<16; i=i+1) begin
				if (keymap1[i]==keymap2[i] && keymap2[i]==keymap3[i] && keymap3[i]==keymap4[i] && keymap4[i]==keymap5[i] && keymap5[i]==keymap6[i] && keymap6[i]==keymap7[i] && keymap7[i]==keymap8[i] && keymap8[i]==keymap9[i]) debounced_keymap[i] <= keymap1[i];
			end
		end
endmodule