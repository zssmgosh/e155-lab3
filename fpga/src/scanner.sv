// Huanhuan Huang 9/12/2026
// create a scanner to turn on rows of a keypad

module scanner (
            input logic clk, reset, enable,
            output logic[3:0] rowSelect, 
            output logic[3:0] count);
        counter #(3, 15) counter(clk, reset, enable, count);

        assign rowSelect = {count < 4, (count >= 4) && (count < 8), (count >= 8) && (count < 12), count >= 12};
endmodule