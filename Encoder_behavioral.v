//Encoder 8:3

//module encoder_8to3 (
  input [7:0] in,   // 8-bit input
  output [2:0] out  // 3-bit output
);

  wire [7:0] in_and;  // AND gate outputs for each input bit

  // Generate the AND gate outputs for each input bit
  generate
    genvar i;
    for (i = 0; i < 8; i = i + 1) begin
      and #(1) u_and (
        .A(in[i]),
        .B(1'b1),
        .Z(in_and[i])
      );
    end
  endgenerate

  // Priority encoder logic
  always @(*) begin
    out[0] = (in_and[7]) ? 3'b000 :
             (in_and[6]) ? 3'b001 :
             (in_and[5]) ? 3'b010 :
             (in_and[4]) ? 3'b011 :
             (in_and[3]) ? 3'b100 :
             (in_and[2]) ? 3'b101 :
             (in_and[1]) ? 3'b110 :
                           3'b111;
    out[1] = (in_and[7]) ? 1'b0 :
             (in_and[6]) ? 1'b0 :
             (in_and[5]) ? 1'b0 :
             (in_and[4]) ? 1'b0 :
             (in_and[3]) ? 1'b0 :
             (in_and[2]) ? 1'b0 :
             (in_and[1]) ? 1'b0 :
                           1'b1;
    out[2] = (in_and[7]) ? 1'b0 :
             (in_and[6]) ? 1'b0 :
             (in_and[5]) ? 1'b0 :
             (in_and[4]) ? 1'b0 :
             (in_and[3]) ? 1'b0 :
             (in_and[2]) ? 1'b1 :
             (in_and[1]) ? 1'b1 :
                           1'b0;
  end

endmodule

module encoder_8to3 (
  input [7:0] in,   // 8-bit input
  output [2:0] out  // 3-bit output
);

  wire [7:0] in_and;  // AND gate outputs for each input bit

  // Generate the AND gate outputs for each input bit
  generate
    genvar i;
    for (i = 0; i < 8; i = i + 1) begin
      and #(1) u_and (
        .A(in[i]),
        .B(1'b1),
        .Z(in_and[i])
      );
    end
  endgenerate

  // Priority encoder logic
  always @(*) begin
    out[0] = (in_and[7]) ? 3'b000 :
             (in_and[6]) ? 3'b001 :
             (in_and[5]) ? 3'b010 :
             (in_and[4]) ? 3'b011 :
             (in_and[3]) ? 3'b100 :
             (in_and[2]) ? 3'b101 :
             (in_and[1]) ? 3'b110 :
                           3'b111;
    out[1] = (in_and[7]) ? 1'b0 :
             (in_and[6]) ? 1'b0 :
             (in_and[5]) ? 1'b0 :
             (in_and[4]) ? 1'b0 :
             (in_and[3]) ? 1'b0 :
             (in_and[2]) ? 1'b0 :
             (in_and[1]) ? 1'b0 :
                           1'b1;
    out[2] = (in_and[7]) ? 1'b0 :
             (in_and[6]) ? 1'b0 :
             (in_and[5]) ? 1'b0 :
             (in_and[4]) ? 1'b0 :
             (in_and[3]) ? 1'b0 :
             (in_and[2]) ? 1'b1 :
             (in_and[1]) ? 1'b1 :
                           1'b0;
  end

endmodule
