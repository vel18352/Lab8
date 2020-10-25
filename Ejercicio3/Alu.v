module Alu (input [3:0] A, B, input [2:0] S,output [3:0] Y, output carry_out, zero);

  reg [4:0] temp;

  assign Y = temp [3:0];
  assign carry_out = temp [4];
  assign zero = (temp[3:0] == 0);

  always @ (A, B, S) begin
    case (S)
      3'b000: temp = A;
      3'b001: temp = A-B;
      3'b010: temp = B;
      3'b011: temp = A+B;
      3'b100: temp[3:0] = ~(A&B);
      default: temp = 0;
    endcase
  end

endmodule

/* Una alu es un circuito el cual permite realizar operaciones
logicas y aritmeticas; en este caso utilizando 4 bits y un operador
de 3 bits se realizan los procesos aritmeticos y logicos como Sumar, Restar, etc. 
dependiendo de la operacion seleccionada*/

