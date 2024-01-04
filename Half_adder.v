// Code your design here
module half_adder(A,B,Sum,Cout); 
input A,B;
output Sum; 
output Cout;
assign Sum = A^B; // "^" is XOR bitwise operator
assign Cout = A & B; // "&" is AND bitwise operator 
endmodule