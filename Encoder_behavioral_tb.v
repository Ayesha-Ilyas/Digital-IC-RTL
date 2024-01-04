//Encoder8:3_behavioral
module testbench_encoder_8to3;

  // Inputs
  reg [7:0] in;
  
  // Outputs
  wire [2:0] out;

  // Instantiate the 8:3 encoder module
  encoder_8to3 encoder (
    .in(in),
    .out(out)
  );

  // Initialize signals
  initial begin
    $dumpfile("dump.vcd");
$dumpvars;

    // Test case 1: Input 5 (binary 0101) should produce output "010"
    in = 8'b0101;

    // Display the input value
    $display("Input: in = %b", in);

    // Wait for a while
    #10;

    // Display the output
    $display("Output: out = %b", out);

    // Test case 2: Input 3 (binary 0011) should produce output "011"
    in = 8'b0011;

    // Display the input value
    $display("Input: in = %b", in);

    // Wait for a while
    #10;

    // Display the output
    $display("Output: out = %b", out);

    // End simulation
    $finish;
  end

endmodule
