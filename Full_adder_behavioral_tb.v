module full_adder_behavioral_tb;
// Inputs
reg [2:0] abc;
// Outputs 
wire sum; 
wire carry;
// Instantiate the Unit Under Test (UUT) 
full_adder_behavioral uut (
.abc(abc),
.sum(sum),
.carry(carry));
initial begin

$dumpfile("dump.vcd");
$dumpvars;

// Initialize Inputs 
abc=3'b000;
#10;
abc=3'b001; 
#10;
abc=3'b101; 
#10;
abc=3'b111;
#10;
end 
endmodule
