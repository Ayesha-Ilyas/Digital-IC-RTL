module top ( a, b,  clk, rst , enable, load , sel , out );

  input clk, rst, enable, sel, load;
  input [4:0] a;
  input [4:0] b;
  output wire [4:0] out;
  
  wire [4:0] Z1,Z2;
 

  parameter R = 2'b00; // State 0: Waiting for '0'
  parameter M = 2'b01; // State 1: Waiting for '1'
  parameter C = 2'b10; // State 2: Waiting for '0'
  parameter Reg = 2'b11; // State 2: Waiting for '0'
  
  reg [1:0] state;
  
  
  mux m(.a(a), .b(b), .sel(sel), .out(Z1));
  counter c(.counter(Z2), .data(Z1), .clk(clk), .load(load), .enable(enable), .rst(rst));
  Register g(.clk(clk), .rst(rst), .data(Z2), .out(out));

  // State transition and output logic
  always @(posedge clk or negedge rst)
    if (!rst) begin
      state = R;  
    end
    else begin
      case (state)
        R:  state = M;
        
        M:  state = C; 
          
        C: if (enable && Z1==8 )
          begin  state = Reg; 
          end 
        
        else if (load) begin state = Reg;
        end
        else state = C;
        Reg: if (rst) begin
              state = R;
            end
            else begin  state = R;
            end
        default: state = R;
      endcase
    end

endmodule


module mux(out, a, b, sel);

  output reg [4:0] out;
  input[4:0] a, b;
  input sel;
  always @(a or b or sel)
begin
  
  if(sel) 
out = a;
else
out = b;

end

endmodule


module counter(input clk, enable, rst, load, input[4:0] data, output reg [4:0] counter
    );
  
  always @(posedge clk or negedge rst)
begin
  if(!rst)
 counter <= 4'd0;
  else if (load)
 counter <= data;
  else if (enable)
 counter <= counter+1;
else 
  counter <= counter;
end 
endmodule



module Register(clk, rst, data, out);

input             clk;
input             rst;
  input      [4:0] data;
  output reg [4:0] out;

  always @(posedge clk or negedge rst )
begin
  if(!rst)
    out <= 4'b0;
  else
        out <= data;
end

endmodule
