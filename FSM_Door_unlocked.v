module door_unlock (
  input clk,        // Clock input
  input reset,      // Reset input
  input code_in,    // Input for the code
  output roll_no_02   // Output to Roll no.2
);

  // Define the states
  parameter S0 = 2'b00; // State 0: Waiting for '0'
  parameter S1 = 2'b01; // State 1: Waiting for '1'
  parameter S2 = 2'b10; // State 2: Waiting for '0'

  // Define state register
  reg [1:0] next_state;

  // Output register
  reg roll_no_02;

  // State transition and output logic
  always @(posedge clk or posedge reset)
    if (reset) begin
      next_state = S0;
      roll_no_02 = 0;  // Lock the door on reset
    end
    else begin
      case (next_state)
        S0: if (code_in == 1'b0) begin roll_no_02 = 0; next_state = S1;
          end
        else begin
          roll_no_02 = 0; next_state = S0;
        end
        S1: if (code_in == 1'b1) begin roll_no_02 = 0; next_state = S2; 
          end 
        else begin roll_no_02 = 0; next_state = S1;
        end
        S2: if (code_in == 1'b0) begin
              next_state = S0;
              roll_no_02 = 1;  // Unlock the door
            end
            else begin roll_no_02 = 0; next_state = S0;
            end
        default: next_state = S0;
      endcase
    end

endmodule
