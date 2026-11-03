module keymap(input logic clk, reset,
              input logic [3:0] count,
              input logic [3:0] rows, cols,
              output logic [15:0] km);
        flopren #(4) flopr1(clk, (rows[0]), reset, ~cols, km[15:12]);
        flopren #(4) flopr2(clk, (rows[1]), reset, ~cols, km[11:8]);
        flopren #(4) flopr3(clk, (rows[2]), reset, ~cols, km[7:4]);
        flopren #(4) flopr4(clk, (rows[3]), reset, ~cols, km[3:0]);
endmodule