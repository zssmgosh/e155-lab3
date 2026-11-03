// Huanhuan Huang 11/2/2026
// FSM that saves a snapshot of a keymap and returns it when asked for

module snapshot(input logic clk, reset,
                input logic save, fetch,
                input logic [15:0] mapin,
                output logic [15:0] mapout);
    
    typedef enum logic [1:0] {SCAN = 2'b01, SAVE =2'b10} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk)
        if (~reset) begin 
            state <= SCAN; 
            mapout <= 0; 
        end
        else begin 
            state <= nextstate;
            if(nextstate == SAVE)
                mapout <= mapin;
        end
            
    always_comb begin
        case(state)
            SCAN: if (save) nextstate = SAVE; else  nextstate = SCAN;
            SAVE: if (fetch) nextstate = SCAN; else nextstate = SAVE;
            default: nextstate = SCAN;
        endcase
    end
    
endmodule