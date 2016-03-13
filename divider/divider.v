module divider(
    input clk,
    input [7:0] numerator,
    input [7:0] denominator,
    input reset,
    output reg [7:0] quotient,
    output reg [7:0] remainder,
    output reg ready
    );
	
	reg [14:0] divisor;
	reg [2:0] shift;

	always @(posedge clk) begin
		if (reset) begin
			remainder <= numerator;
			divisor <= denominator << 7;
			shift <= 7;
			quotient <= 0;
			ready <= 0;
		end else if (!ready) begin
			if (divisor <= remainder) begin
				remainder <= remainder - divisor;
				quotient <= quotient + (1 << shift);
			end
			divisor <= divisor >> 1;
			shift <= shift - 1;
			if (shift <= 0) begin
				ready <= 1;
			end
		end
	end

endmodule
