`timescale 1ns/1ps
module tb_decoder;

    logic [3:0] binary;
    logic [15:0] one_hot;


    decoder uut (
        .binary(binary),
        .one_hot(one_hot)
    );

    initial begin
        $display("Time | Binary | One-Hot Output");
        $display("-------------------------------");

        for (int i = 0; i < 16; i++) begin
            binary = i;
            #10; 
            $display("%4t | %b | %016b", $time, binary, one_hot);
        end

        $stop;
    end

endmodule

