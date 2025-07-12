module testbench;
    // use logic instead of reg/wire
    logic a, b;
    logic y;

    // instantiate the DUT
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // dump all signals for GTKWave
        $dumpfile("waveform.vcd");
        $dumpvars(0, testbench);

        // loop through all 4 input combinations
        for (int i = 0; i < 4; i++) begin
            {a, b} = i;                  // pack i[1:0] into {a,b}
            #10;
            $display(
                "Time %0t: a=%b, b=%b => y=%b",
                $time, a, b, y
            );
            // optional self-check
            assert (y === (a & b))
                else $error("Mismatch at time %0t", $time);
        end
        
        $finish;
    end
endmodule