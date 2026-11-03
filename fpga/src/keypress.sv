module keypress(
        input logic clk,
        input logic reset,
        input logic [15:0] keymap, init_keymap,
		output logic disp_en, save, fetch,
        output logic [15:0] save_keymap
    );
    logic capture;
    logic any_key;

    assign any_key = $onehot(keymap); // low-asserted: any column pulled down
	
    typedef enum logic [3:0] {SCAN = 4'b0001, PRESS = 4'b0010,
    HOLD = 4'b0100, MULTIPRESS = 4'b1000} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk, negedge reset)
        if (~reset) state <= SCAN;
        else begin
            state <= nextstate;
        end

    always_comb
        case (state)
            SCAN: nextstate = any_key ? PRESS : SCAN;
            PRESS: nextstate = HOLD;
            HOLD: nextstate = (keymap == 0) ? SCAN : ( (~any_key)? MULTIPRESS : HOLD);
            MULTIPRESS: nextstate = (keymap == 0) ? SCAN : ((init_keymap == keymap) ? HOLD : ((any_key) ? PRESS : MULTIPRESS));
            default: nextstate = SCAN;
        endcase

    assign disp_en = (state == PRESS);
    assign save = (state == PRESS);
    assign fetch = (state == MULTIPRESS);
    assign save_keymap = (state == PRESS) ? keymap: 0;
endmodule