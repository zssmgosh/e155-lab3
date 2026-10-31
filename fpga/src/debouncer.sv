module debouncer #(parameter N)(
        input logic clk, 
        input logic reset,
        input logic [N-1:0] keymap, 
        output logic [N-1:0] debounced_keymap
    );
    logic [N-1:0] keymap1, keymap2, keymap3, keymap4, keymap5, keymap6, keymap7, keymap8, keymap9, keymap10;

    flopren #(N) flopren0(clk, 1'b1, reset, keymap, keymap1);
    flopren #(N) flopren1(clk, 1'b1, reset, keymap1, keymap2);
    flopren #(N) flopren2(clk, 1'b1, reset, keymap2, keymap3);
    flopren #(N) flopren3(clk, 1'b1, reset, keymap3, keymap4);
    flopren #(N) flopren4(clk, 1'b1, reset, keymap4, keymap5);
    flopren #(N) flopren5(clk, 1'b1, reset, keymap5, keymap6);
    flopren #(N) flopren6(clk, 1'b1, reset, keymap6, keymap7);
    flopren #(N) flopren7(clk, 1'b1, reset, keymap7, keymap8);
    flopren #(N) flopren8(clk, 1'b1, reset, keymap8, keymap9);
    flopren #(N) flopren9(clk, 1'b1, reset, keymap9, keymap10);

    assign debounced_keymap = (keymap10 == keymap) ? keymap : 0;
endmodule