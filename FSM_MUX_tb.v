module top_module_test;

reg [4:0]   In_a ;
reg [4:0]   In_b ;
reg         enable;
reg         sel_a;
reg         load;
reg         rst_ = 1'b1;
reg         clk = 1'b1;

wire [4:0] out;
`define PERIOD 10

always
    #(`PERIOD/2) clk = ~clk;

   
  // Instantiate mux
  top md (.enable(enable), .clk(clk), .out(out), .rst(rst_), .a(In_a), .b(In_b), .sel(sel_a), .load(load));
	

  initial
    begin
        $dumpfile("dump.vcd"); $dumpvars;
       // check reset
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b0_X_X_X_XXXXX_XXXXX; 
      
       // count 4 enabled cycles
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_1_X_XXXXX_XXXXX;   
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_1_X_XXXXX_XXXXX; 
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_1_X_XXXXX_XXXXX; 
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_1_X_XXXXX_XXXXX;             // check disabled

      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_0_X_XXXXX_XXXXX;
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_0_X_XXXXX_XXXXX; 
      
       // count from load
     { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_1_X_XXXXX_XXXXX;              { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_1_X_XXXXX_XXXXX; 

       // check roll-over count
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_1_X_XXXXX_XXXXX; 
      
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_1_X_XXXXX_XXXXX;       

       // check load
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_1_0_0_11010_10110; 
      
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_1_1_1_00110_10110; 

      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_1_0_10101_11101_1; 
      
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_1_01010_00101_0; 
     
      { rst_, enable, load, In_a, In_b, sel_a } = 14'b1_0_0_10101_11101_1;
    end
endmodule
