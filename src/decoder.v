/*
	  ---1---
	 |       |
	 6       2
	 |       |
	  ---7---
	 |       |
	 5       3
	 |       |   _
	  ---4---   |8|
*/

module decoder (
	input wire [3:0] hex,
	output wire [7:0] segments
);
	wire v0 = hex[3];
	wire v1 = hex[2];
	wire v2 = hex[1];
	wire v3 = hex[0];

	wire n0 = !v0;
	wire n1 = !v1;
	wire n2 = !v2;
	wire n3 = !v3;

	assign segments[7] = (v0&n1&v2&n3);
	assign segments[6] = (v0&n1&n2) | (n0&v1&n3) | (n0&n1&v2) | (n0&v1&n2&v3);
	assign segments[5] = (v0&n1&n2) | (n0&v1&n3) | (n0&v1&n2&v3) | (n1&n2&n3);
	assign segments[4] = (n0&v2&n3) | (n1&n2&n3);
	assign segments[3] = (n0&v2&n3) | (n0&n1&v2) | (n0&v1&n2&v3) | (n1&n2&n3);
	assign segments[2] = (n0&v2&v3) | (n0&v1&n3) | (n0&v1&n2&v3) | (n1&n2);
	assign segments[1] = (n0&n2&n3) | (n0&v2&v3) | (n0&n1&v2) | (n1&n2);
	assign segments[0] = (v0&n1&n2) | (n0&v2&v3) | (n0&v2&n3) | (n0&v1&n2&v3) | (n1&n2&n3);
endmodule
