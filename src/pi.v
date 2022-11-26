module jar_pi
(
	input  [7:0] io_in,
	output [7:0] io_out
);
	wire v0 = io_in[7];
	wire v1 = io_in[6];
	wire v2 = io_in[5];
	wire v3 = io_in[4];
	wire v4 = io_in[3];
	wire v5 = io_in[2];
	wire v6 = io_in[1];
	wire v7 = io_in[0];

	wire [3:0] hex;

	wire n7 = !v7;
	wire n6 = !v6;
	wire n5 = !v5;
	wire n4 = !v4;
	wire n3 = !v3;
	wire n2 = !v2;
	wire n1 = !v1;
	wire n0 = !v0;

	wire [7:0] led_out;
	assign io_out[7:0] = led_out;

	assign hex[3] = (n0&v1&v2&v3&v4&v5&n6&n7)|(n0&n1&n2&n3&n4&v5&n6&v7)|(v0&n1&v2&v3&v4&v5&n6&v7)|(n0&v1&n2&n3&n4&n5&v6&v7)|(v0&n1&n2&v3&n4&n5&v6&v7)|(n0&n1&n2&n3&v4&n5&v6&v7)|(n0&n1&v2&n3&n4&v5&v6&n7)|(n0&n1&v2&v3&n4&v5&v6&v7)|(n0&v1&n2&n3&v4&v5&v6&v7)|(v0&v1&v2&v3&v4&n5&n6&v7)|(n1&v2&v3&n4&v5&n6&n7)|(n0&v1&v2&n3&n4&v5&n6)|(v0&v1&n2&n3&n4&v5&v7)|(v0&v1&v2&n3&v5&n6&n7)|(v0&n1&n2&n4&v5&v6&n7)|(v0&v1&v2&v3&v5&v6&v7)|(n0&v1&n2&v3&n4&n6&n7)|(v0&v1&n2&v3&v5&v6&n7)|(n0&n1&n2&n3&v4&v5&n7)|(n0&n1&v2&n3&n4&n5&v6)|(n0&v1&v3&n4&n5&n6&v7)|(n0&v1&v2&n3&v4&n5&v7)|(v0&v1&n2&n3&v4&v5&n6)|(v0&n1&n3&n4&n5&n6&v7)|(n0&n1&v2&v4&n5&v6&n7)|(n0&v1&n2&n3&v4&v6&n7)|(v0&v2&n3&v4&n5&n6&v7)|(n0&v1&n2&v3&n5&n6&n7)|(v0&n1&v2&v4&n5&v6&v7)|(v0&n1&n2&v3&n5&n6&n7)|(n0&n1&n2&v3&n5&v6&n7)|(n1&v2&v3&v4&v5&v6&n7)|(n0&n1&v2&n3&v4&v5&n6)|(v1&n2&v3&n4&n5&n6&n7)|(n0&v2&v3&v4&n5&v6&n7)|(n0&n1&n2&v4&v5&v6&n7)|(v0&n2&n3&n4&n5&n6&v7);
	assign hex[2] = (n0&v1&n2&v3&v4&v5&n6&n7)|(n0&v1&v2&v3&n4&v5&n6&v7)|(n0&v1&v2&n3&v4&v5&n6&n7)|(n0&v1&n2&n3&n4&v5&n6&v7)|(v0&v1&v2&v3&v4&v5&n6&v7)|(v0&n1&v2&n3&v4&v5&n6&n7)|(v0&n1&v2&v3&v4&v5&v6&v7)|(n0&v1&n2&n3&v4&n5&v6&v7)|(n0&n1&n2&v3&n4&v5&n7)|(v0&v1&v2&v3&v4&v5&n7)|(n0&n1&n3&n4&v5&n6&n7)|(n0&n2&v3&n4&v5&v6&v7)|(v0&v1&n2&v3&n4&v5&n6)|(n1&n2&v3&n4&v5&v6&v7)|(n0&v1&n2&n3&n4&v6&n7)|(n0&v1&v2&v4&v5&n6&v7)|(n0&n1&n2&n4&v5&v6&v7)|(v0&n2&v3&n4&n5&n6&v7)|(n0&n1&v3&n4&n5&v6&v7)|(n0&n1&v2&v3&n5&v6&v7)|(v0&v1&n2&v3&v4&v6&v7)|(n0&n1&v2&v4&n5&n6&v7)|(n0&n2&n3&v4&n5&n6&n7)|(v0&v1&v3&v4&n5&v6&v7)|(v0&v1&n2&v4&n5&v6&n7)|(n0&n1&n2&n3&n5&v6&n7)|(v0&v1&n2&v4&n5&n6&v7)|(v0&v1&v2&n4&n5&v6&n7)|(v0&v1&v2&n3&v4&v6&v7)|(v0&v1&n2&v3&n5&v6&v7)|(v0&v1&v2&n4&n5&n6&n7)|(v0&n1&n2&v3&v4&v5&n7)|(v0&v1&v2&n3&n4&n5&n6)|(n0&n1&n2&v3&v4&v5&v7)|(n0&n1&v3&v4&v5&n6&v7)|(n0&n1&v2&v3&n5&n6&n7)|(v0&n1&n2&n3&v5&n6&v7)|(v0&n1&n2&n3&n4&n5&v6)|(v0&n1&n2&n3&v4&v6&v7)|(v0&n1&v2&v3&n4&v7)|(v0&n1&v2&n4&v6&n7)|(n0&v1&v2&v3&v5&v6)|(v1&v2&n3&n4&n5&v6)|(n1&v2&v3&v4&n6&n7)|(v1&v2&n3&n5&n6&n7)|(n1&n2&v4&v5&n6&v7)|(v0&v1&n3&n5&n6&n7)|(v1&n2&v3&n5&v6&n7)|(n0&n1&v2&n3&v5&v6&v7)|(n0&v2&v3&v4&n5&n6&n7)|(v0&v1&v2&n3&n5&n7);
	assign hex[1] = (n0&v1&v2&v3&n4&v5&n6&v7)|(n0&v1&v2&n3&v4&v5&n6&n7)|(n0&v1&n2&n3&n4&v5&n6&v7)|(v0&v1&v2&v3&v4&v5&n6&v7)|(v0&v2&n3&n4&v5&v6&n7)|(n0&v1&n2&v3&n4&v5&v6&n7)|(v0&v1&n2&n3&n4&v5&n6&n7)|(n0&v1&n2&n3&v4&n5&v6&v7)|(v0&v1&n2&v3&v4&n5&n6&n7)|(v0&v1&v2&n3&n4&v5&v6)|(v0&v1&v3&n4&v5&n6&n7)|(v0&v2&n3&n4&n5&n6&n7)|(n0&n1&n2&n4&v5&v6&n7)|(n1&n2&n3&n4&v5&v6&v7)|(n0&v1&v2&n4&n5&v6)|(n0&n1&v2&n3&v4&v5&v6)|(v0&n1&n2&n3&v4&v5&n7)|(v0&v1&n2&v3&n4&v6&v7)|(n1&n2&v3&v4&v5&n6&n7)|(n0&n2&n3&n4&n5&n6&n7)|(v0&v1&v3&n4&n5&n6&v7)|(v1&n2&v3&v4&v5&n6&v7)|(n0&n1&n2&n3&v4&v5&v7)|(n0&v1&n2&n3&v4&n6&n7)|(v0&n1&v2&v4&n5&v6&n7)|(v0&n1&v2&v3&v4&n5&n6)|(n0&n1&v2&n3&n5&n6&v7)|(v0&n2&n3&v4&n5&n6&n7)|(v0&n2&n3&v4&n5&v6&v7)|(v0&n1&n2&n3&v4&n5&n6)|(v0&v1&v2&n4&n5&v6&n7)|(v0&v1&v2&n3&v4&v6&v7)|(v0&v1&n2&v3&n5&v6&v7)|(v1&n2&n3&n4&n5&v6&n7)|(n0&n1&v2&n3&v4&v6&v7)|(n0&v1&v2&v3&n5&v6&v7)|(n0&v1&v2&n4&v6&n7)|(n0&v1&v2&n4&n5&n7)|(n1&v3&n4&v5&n6&v7)|(v0&v2&n3&v5&n6&v7)|(n0&v2&v4&v5&v6&v7)|(n0&v1&v3&n4&n5&v6)|(n0&n2&v3&v4&n5&v7)|(n0&n2&v4&n5&n6&v7)|(n0&n1&v2&n3&v5&v6&v7)|(n0&v2&v3&v4&n5&n6&n7)|(v0&v1&v2&n3&n5&n7)|(n0&n1&n2&v3&n6);
	assign hex[0] = (v0&v1&v2&n3&v4&n5&v6&v7)|(n0&n1&v2&n3&n4&v5&v6&n7)|(n0&n1&v2&v3&n4&v5&v6&v7)|(v0&v2&n3&n4&v5&v6&n7)|(n0&v1&n2&n3&v4&v5&v6&v7)|(v0&v1&v2&v3&v4&n5&n6&v7)|(n0&v1&n2&v3&n4&v5&v6&n7)|(v0&v1&n2&n3&n4&v5&n6&n7)|(v0&n1&v2&n3&v4&v5&n6&n7)|(v0&n1&v2&v3&v4&v5&v6&v7)|(v0&v1&n2&v3&v4&n5&n6&n7)|(v0&n1&v3&n4&v5&n6&n7)|(n0&v1&v2&n3&n4&v6&v7)|(v1&v2&n3&v4&v5&n6&v7)|(v0&v1&v3&v4&v5&n6&n7)|(v0&v1&v3&n4&v6&n7)|(v0&v1&n2&v3&n4&n6&v7)|(v0&n2&v3&n4&n5&n6&n7)|(v0&n1&v2&n4&n5&v6&v7)|(v0&v1&v2&v3&n5&v6&n7)|(v0&v2&n3&v4&n5&n6&n7)|(v0&n1&v3&v4&n5&v6&v7)|(v0&n1&n3&v4&n5&n6&v7)|(n0&n1&n2&n5&n6&v7)|(n1&v2&v3&v4&v5&v6&n7)|(n0&n1&v2&n3&v4&v5&n6)|(v1&n2&v3&n4&n5&n6&n7)|(n0&v2&v3&v4&n5&v6&n7)|(n0&n1&n2&v4&v5&v6&n7)|(v0&n2&n3&n4&n5&n6&v7)|(v0&v1&v2&n4&n5&n6&n7)|(v0&n1&n2&v3&v4&v5&n7)|(v0&v1&v2&n3&n4&n5&n6)|(v1&n2&n3&n4&n5&v6&n7)|(n0&n1&v2&n3&v4&v6&v7)|(n0&n1&n2&v3&v4&v5&v7)|(n0&v1&v2&v3&n5&v6&v7)|(n0&n1&v3&v4&v5&n6&v7)|(n0&n1&v2&v3&n5&n6&n7)|(v0&n1&n2&n3&v5&n6&v7)|(v0&n1&n2&n3&n4&n5&v6)|(v0&n1&n2&n3&v4&v6&v7)|(n1&v2&v3&n4&n5&v7)|(n0&v1&n3&n4&n6&n7)|(v0&v2&v3&n4&n5&v6)|(n0&v2&n3&v4&v5&v6)|(v0&v1&n3&v5&v6&n7)|(n0&n1&n3&v5&n6&v7)|(n1&n2&n3&n4&n5&v7)|(n0&v1&n2&v3&v4&v6)|(v0&n1&n2&v4&v6&n7)|(n1&n2&v3&v4&n5&v7)|(n0&n1&v4&n5&n6&n7)|(n0&n1&v2&n3&v5&v6&v7)|(n0&v2&v3&v4&n5&n6&n7)|(v0&v1&n4&v5&v6)|(n1&n3&v4&v5&v6)|(n1&n3&v4&v6&n7)|(n0&n1&n2&n3&n6);

	seg7hex seg7hex(.hex(hex), .segments(led_out));

endmodule
