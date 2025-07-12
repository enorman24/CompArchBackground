`timescale 1ns / 1ps

module and_gate(
    input  logic a,      // two-state logic type
    input  logic b,
    output logic y
);
    // continuous combinational logic
    always_comb y = a & b;
endmodule