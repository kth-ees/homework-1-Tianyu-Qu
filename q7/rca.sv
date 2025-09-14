
module rca #(parameter W = 5) (
    input  logic [W-1:0] X,
    input  logic [W-1:0] Y,
    input  logic         cin,
    output logic [W-1:0] S,
    output logic         cout
);
    logic [W:0] c;
    assign c[0] = cin;

    genvar i;
    generate
        for (i=0; i<W; i++) begin : G_FA
            full_adder fa (
                .a    (X[i]),
                .b    (Y[i]),
                .c_in (c[i]),
                .s    (S[i]),
                .c_out(c[i+1])
            );
        end
    endgenerate

    assign cout = c[W];
endmodule
