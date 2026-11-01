// Huanhuan Huang 9/12/2026
// create a scanner to turn on rows of a keypad

module scanner (
            input logic clk, reset, enable,
            output logic[3:0] rowSelect, 
            output logic[3:0] count);
        // logic [3:0] count;
        counter #(3, 12) counter(clk, reset, enable, count);

        assign rowSelect = {count < 3, (count >= 3) && (count < 6), (count >= 6) && (count < 9), count >= 9};
        // assign odd = (count == 1 | count == 3 | count == 5 | count == 10 );
endmodule