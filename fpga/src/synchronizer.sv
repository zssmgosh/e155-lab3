module synchronizer #(parameter N)(
        input logic clk, 
        input logic [N:0] d,
        output logic [N:0] q
    );
    logic [N:0] n1;
    always_ff @(posedge clk) begin
        n1 <= d;
        q <= n1;
        end
endmodule