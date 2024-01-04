module full_adder_behavioral(abc, sum, carry);
input [2:0] abc; //abc is 3 bit input whereas a[0]=a,a[1]=b,a[2]=c (input carry)
output sum,carry; 
reg sum,carry;
always@(abc) //always block makes this behavioral modeling
begin
{carry, sum} = abc[0] + abc[1] + abc[2]; 
end
endmodule
