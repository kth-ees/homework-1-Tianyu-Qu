module multiplier #(parameter N = 4) (
    input  logic [N-1:0] a, b,
    output logic [2*N-1:0] product
);
    
    logic [2*N-1:0] acc [0:N];
    assign acc[0] = '0;

    genvar i;
generate
    for (i=0; i<N; i++) begin : gen_mul
    
    	logic [2*N-1:0] addend;
    	assign addend = b[i] ? ( { {N{1'b0}}, a } << i ) : '0;

    	logic [N-1:0] sum_lo, sum_hi;
    	logic c_mid, c_top;

    	rca #(.W(N)) add_lo (
      	.X   (acc[i][N-1:0]),
      	.Y   (addend[N-1:0]),
      	.cin (1'b0),
      	.S   (sum_lo),
      	.cout(c_mid)
    	);

    	rca #(.W(N)) add_hi (
      	.X   (acc[i][2*N-1:N]),
      	.Y   (addend[2*N-1:N]),
      	.cin (c_mid),
      	.S   (sum_hi),
      	.cout(c_top)
    	);

    	assign acc[i+1] = {sum_hi, sum_lo};
    end
endgenerate


    assign product = acc[N];
endmodule
