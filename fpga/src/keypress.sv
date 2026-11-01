module keypress(
        input logic clk,
        input logic reset,
        input logic [15:0] keyMap, // , initKeyMap,
		output logic scan_en, disp_en // , save, fetch,
        // output logic [15:0] saveKeyMap
    );
    logic [15:0] initKeyMap;
    logic capture;
    logic any_key;

    assign any_key = $onehot(keyMap); // low-asserted: any column pulled down
	
    typedef enum logic [3:0] {SCAN = 4'b0001, PRESS = 4'b0010,
    HOLD = 4'b0100, MULTIPRESS = 4'b1000} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk, negedge reset)
        if (~reset) state <= SCAN;
        else begin
            state <= nextstate;
            if (state == PRESS) initKeyMap <= keyMap;
        end

    always_comb
        case (state)
            SCAN: nextstate = any_key ? PRESS : SCAN;
            PRESS: nextstate = HOLD;
            HOLD: nextstate = (keyMap == 0) ? SCAN : ( (~any_key)? MULTIPRESS : HOLD);
            MULTIPRESS: nextstate = (keyMap == 0) ? SCAN : ((initKeyMap == keyMap) ? HOLD : ((any_key) ? PRESS : MULTIPRESS));
            default: nextstate = SCAN;
        endcase

    assign disp_en = (state == PRESS);
    assign scan_en = (state == SCAN);
    // assign save = (state == PRESS);
    // assign fetch = (state == MULTIPRESS);
    // assign saveKeyMap = (state == PRESS) ? keyMap: 0;
endmodule