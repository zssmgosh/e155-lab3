module count_to_toggle #(parameter N, MAX_COUNT)(
						input logic clk, reset,
						input logic [N:0] count,
						output logic toggle);
	always_ff @(posedge clk, negedge reset) 
        if (~reset)
            toggle <= 0;
        else
            if (count > MAX_COUNT)
                toggle <= ~toggle;
endmodule