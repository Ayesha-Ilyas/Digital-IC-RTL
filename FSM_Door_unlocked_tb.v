module door_unlock_tb;
  // Signals
  reg clk;
  reg reset;
  reg code_in;
  wire roll_no_02;

  // Instantiate the door_unlock module
  door_unlock dut (
    .clk(clk),
    .reset(reset),
    .code_in(code_in),
    .roll_no_02(roll_no_02)
  );

  // Clock generation
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk = 0; 
    forever #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    $display("Starting test...");
    // Initialize inputs
    // Reset the FSM
    code_in=0;
    reset = 1;
    #20 reset = 0; #20

    // Test case 1: Incorrect code, should remain locked
    code_in = 1;
    #10 code_in = 0;
    #10 code_in = 1; // Incorrect code
    #10 code_in = 0; 

    // Test case 2: Correct code, should unlock
    #10 code_in = 0;
    #10 code_in = 1;
    #10 code_in = 0;

    // Wait for some time with the door unlocked
    #50;

    // Test case 3: Lock the door again
    code_in = 1;
    #10 code_in = 0;
    #10

    // End of simulation
    $display("Test completed.");
    $finish;
  end

endmodule
