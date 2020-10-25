module Counter (input wire clk, input wire enabled, input wire reset, input wire load, input wire [11:0] entry, output reg [11:0] out);

always @ (posedge clk or posedge reset) begin
  
  if (reset) begin
  out <= 12'b0;
  end
  else if (load) begin
  out <= entry;
  end
  else if (enabled) begin
  out <= out + 1;
    end

end

endmodule
/* En el momento que el clk envie un flanco positivo activara el enable
en el primer if ; aca es donde empieza a sumarle al counter  mientras el segundo
se encarga de cargar un valor si existe mientras el ultimo if lo reiniciara*/
