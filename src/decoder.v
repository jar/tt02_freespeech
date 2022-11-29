/*
	  ---0---
	 |       |
	 5       1
	 |       |
	  ---6---
	 |       |
	 4       2
	 |       |   _
	  ---3---   |7|
*/

module decoder (
	input wire [3:0] code,
	output wire [7:0] segments
);
	wire d = code[3];
	wire c = code[2];
	wire b = code[1];
	wire a = code[0];

	assign segments[7] = (d&!c&b&!a);
	assign segments[6] = (d&!c&!b) | (!d&c&!a) | (!d&!c&b) | (!d&c&!b&a);
	assign segments[5] = (d&!c&!b) | (!d&c&!a) | (!d&c&!b&a) | (!c&!b&!a);
	assign segments[4] = (!d&b&!a) | (!c&!b&!a);
	assign segments[3] = (!d&b&!a) | (!d&!c&b) | (!d&c&!b&a) | (!c&!b&!a);
	assign segments[2] = (!d&b&a) | (!d&c&!a) | (!d&c&!b&a) | (!c&!b);
	assign segments[1] = (!d&!b&!a) | (!d&b&a) | (!d&!c&b) | (!c&!b);
	assign segments[0] = (d&!c&!b) | (!d&b&a) | (!d&b&!a) | (!d&c&!b&a) | (!c&!b&!a);
endmodule
