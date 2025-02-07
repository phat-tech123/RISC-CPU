module ACC(
	input wire clk,
	input wire ACCwrite,
	input wire [7:0] in,
	output reg [7:0] out
);

reg ACCwriteTEMP;

always@(posedge clk) begin
	ACCwriteTEMP = ACCwrite;
end

always@(posedge clk) begin
	if(ACCwriteTEMP)
		out <= in;
	else
		out <= out;
end

endmodule
