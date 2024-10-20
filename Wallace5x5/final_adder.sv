module final_adder(a, b, s, carry_out);

    input logic [9:0] a, b;
    output logic [9:0] s;
    output logic carry_out;

    logic [9:0] gen;
	logic [9:0] prop;
	logic [10:0] carry;

    assign gen = a & b;
	assign prop = a | b;
	
    assign carry[0] = 1'b0;
    assign carry[1] = gen[0] | (prop[0] & carry[0]);
    assign carry[2] = gen[1] | (prop[1] & carry[1]);
    assign carry[3] = gen[2] | (prop[2] & carry[2]);
    assign carry[4] = gen[3] | (prop[3] & carry[3]);
    assign carry[5] = gen[4] | (prop[4] & carry[4]);
    assign carry[6] = gen[5] | (prop[5] & carry[5]);
    assign carry[7] = gen[6] | (prop[6] & carry[6]);
    assign carry[8] = gen[7] | (prop[7] & carry[7]);
    assign carry[9] = gen[8] | (prop[8] & carry[8]);
	assign carry_out = gen[9] | (prop[9] & carry[9]);
    assign s = a ^ b ^ carry[9:0];

endmodule
