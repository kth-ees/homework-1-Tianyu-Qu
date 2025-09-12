module csa_8_tb;

  // Inputs
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] sum,
  logic carry;

    CSA_8 dut (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
        $display("Time |     A    |     B    | Carry |  Sum  | Ref(A+B)");
        $display("------------------------------------------------------");

        a=8'd5;   b=8'd10;  #5;  $display("%4t | %8d | %8d |   %b   | %5d | %5d", $time,a,b,carry,sum,a+b);
        a=8'd100; b=8'd50;  #5;  $display("%4t | %8d | %8d |   %b   | %5d | %5d", $time,a,b,carry,sum,a+b);
        a=8'd200; b=8'd100; #5;  $display("%4t | %8d | %8d |   %b   | %5d | %5d", $time,a,b,carry,sum,a+b);
        a=8'hFF;  b=8'h01;  #5;  $display("%4t | %8d | %8d |   %b   | %5d | %5d", $time,a,b,carry,sum,a+b);

        
        a=8'h1F;  b=8'hF1;  #5;  $display("%4t | %8h | %8h |   %b   | %5h | %5h", $time,a,b,carry,sum,(a+b));

        $finish;
    end
  
endmodule
