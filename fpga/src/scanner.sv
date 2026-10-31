// Huanhuan Huang 9/12/2026
// create a scanner to turn on rows of a keypad

module scanner (
            input logic clk, reset, enable,
            output logic[3:0] rowSelect, 
            output logic odd);
        logic [2:0] count;
        counter #(2, 8) counter(clk, reset, enable, count);

        assign rowSelect = {count < 2, (count >= 2) && (count < 4), (count >= 4) && (count < 6), count >= 6};
        assign odd = (count == 1 | count == 3 | count == 5 | count == 7 );
endmodule