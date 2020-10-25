module ROM( input wire [11:0] A, output wire [7:0] B);

  reg [7:0] memory_read [0:4095];

  assign B = memory_read[A];

  initial begin
      memory_read[0] = 8'hE1;
      memory_read[1] = 8'h5A;
      memory_read[2] = 8'hFA;
      memory_read[3] = 8'hC7;
      memory_read[4] = 8'h5A;
      memory_read[5] = 8'h33;
      memory_read[6] = 8'h8E;
      memory_read[7] = 8'h14;
      
  end
  initial begin
    $readmemb("rom_programm.list", memory_read);
  end
endmodule


/* La Rom tiene 1 entrada de 12 bits en la cual se especifica la direccion
del archivo a utilizar y a partir de ello este tiene una salida de 8 bits
dando asi la informacion de la direccion seleccionada; un array es la 
inicializacion de la memoria el cual se encarga de leer el dato 
almacenado para ser leido posteriormente*/
