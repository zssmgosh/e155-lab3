module flopren #(parameter WIDTH=4) (input logic clk, en, reset,
                                     input logic [WIDTH-1:0] d,
                                     output logic [WIDTH-1:0] q);
    always_ff @(posedge clk, negedge reset) 
        if (~reset)
            q <= 0;
        else
            if (en)
                q <= d; 
    
endmodule