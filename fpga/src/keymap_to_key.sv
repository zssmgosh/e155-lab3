// Huanhuan Huang 11/2/2026
// decides value to be displayed on seven segment given keymap

module keymap_to_key (input logic clk, reset, disp_en,
        input logic [15:0] keymap,
        output logic [3:0] d1, d0
    );
	logic [3:0] key;

    always_comb begin
        case (keymap)
            16'b0000_0000_0000_0100: key = 4'b0000;
            16'b1000_0000_0000_0000: key = 4'b0001;
            16'b0100_0000_0000_0000: key = 4'b0010;
            16'b0010_0000_0000_0000: key = 4'b0011;
            16'b0000_1000_0000_0000: key = 4'b0100;
            16'b0000_0100_0000_0000: key = 4'b0101;
            16'b0000_0010_0000_0000: key = 4'b0110;
            16'b0000_0000_1000_0000: key = 4'b0111;
            16'b0000_0000_0100_0000: key = 4'b1000;
            16'b0000_0000_0010_0000: key = 4'b1001;
            16'b0001_0000_0000_0000: key = 4'b1010;
            16'b0000_0001_0000_0000: key = 4'b1011;
            16'b0000_0000_0001_0000: key = 4'b1100;
            16'b0000_0000_0000_0001: key = 4'b1101;
            16'b0000_0000_0000_1000: key = 4'b1110;
            16'b0000_0000_0000_0010: key = 4'b1111;
            default: key = 4'b0000;
        endcase
    end
	
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
endmodule