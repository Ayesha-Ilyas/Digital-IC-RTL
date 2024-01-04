// Code your testbench here
// or browse Examples
module half_adder_tb;
// Inputs 
reg a; 
reg b; 

// Outputs 
wire sum; 
wire cout;

// Instantiate the Unit Under Test (UUT) 
half_adder uut (
.A(a),
.B(b),
.Sum(sum),
.Cout(cout));

initial begin

$dumpfile("dump.vcd");
$dumpvars;

// Initialize Inputs 
a = 0;
b = 0;
#5; 
a=1; 
b=0;
//for these inputs sum=1,cout=0
#5; 
a=0; 
b=1;
//for these inputs sum=0,cout=1
#5; 
a=1; 
b=1;
#5;
//for these inputs sum=1,cout=1
// Add stimulus here
end 
endmodule