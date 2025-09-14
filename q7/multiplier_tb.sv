`timescale 1ns/1ps
module multiplier_tb;
  localparam N = 4;

  logic [N-1:0]     a, b;
  logic [2*N-1:0]   product;
  

  multiplier #(.N(N)) dut (
    .a(a), .b(b), .product(product)
  );

  initial begin
    $display(" time |  a |  b | product |  exp ");
    $display("----------------------------------");

    a=0;   b=0;   #5; 
    a=3;   b=5;   #5; 
    a=9;   b=7;   #5; 
    a=15;  b=15;  #5;


    for (int i=0; i<10; i++) begin
      a = $urandom_range(0, (1<<N)-1);
      b = $urandom_range(0, (1<<N)-1);
      #5; 

    end

    $finish;
  end
endmodule

