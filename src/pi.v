module jar_pi
(
	input  [7:0] io_in,
	output [7:0] io_out
);
	wire       clk      = io_in[0];
	wire       reset    = io_in[1];
	wire       stream   = io_in[2];
	wire [4:0] io_index = io_in[7:3];

	reg [9:0] index;
	reg [7:0] led_out;
	wire [3:0] hex;
	assign io_out[7:0] = led_out;

	wire v0 = index[9];
	wire v1 = index[8];
	wire v2 = index[7];
	wire v3 = index[6];
	wire v4 = index[5];
	wire v5 = index[4];
	wire v6 = index[3];
	wire v7 = index[2];
	wire v8 = index[1];
	wire v9 = index[0];

	wire n9 = !v9;
	wire n8 = !v8;
	wire n7 = !v7;
	wire n6 = !v6;
	wire n5 = !v5;
	wire n4 = !v4;
	wire n3 = !v3;
	wire n2 = !v2;
	wire n1 = !v1;
	wire n0 = !v0;

	always @(posedge clk) begin
		if (reset) begin
			index <= {io_index, index[9:5]};
		end
		else if (stream) begin
			index <= index + 1;
		end
hex[3] <= (v0&n1&n2&v3&n4&v5&n6&n7&v8&n9) | (v0&v1&v2&v3&n4&v5&n6
	&n7&v8&v9) | (v0&n1&n2&v3&n4&n5&n6&v7&n8&v9) | (v0&v1&n2&v3
	&v5&v6&v7&v8&n9) | (n0&v1&n2&n3&n4&v5&n6&v7&v8&v9) | (n0&n1
	&v2&n3&n4&v5&n6&n7&v8&v9) | (n0&n1&n2&n3&n4&n5&n6&v7&n8
	&v9) | (n0&v1&n2&v3&v4&v5&v6&v7&v8&v9) | (n0&v1&v2&n3&n4&n5&n6
	&v7&n8&n9) | (n0&v1&n2&n3&v4&v5&v6&v7&n8&v9) | (n0&n1&v2&n3
	&v4&v5&v6&v7&n8&v9) | (n0&n1&n2&v3&n4&n5&v6&v7&v8&v9) | (n0&v1
	&n2&v3&n4&n5&v6&n7&n8&n9) | (n0&v1&n2&v3&n4&v5&n6&v7&n8&v9) | (
	n0&n1&v2&v3&n4&n5&n6&v7&v8&v9) | (n0&v1&n2&n3&n4&v5&v6&v7&n8
	&n9) | (n0&v1&v2&v3&n4&v5&n6&n7&n8&v9) | (v0&v1&n2&n3&v4&n5
	&v6&v7&v8&n9) | (v0&n1&n2&n3&v4&n5&v6&n7&n8&v9) | (n0&v1&v2
	&n3&n4&v5&v6&v7&v8&n9) | (v0&v1&n2&n3&v4&n5&n6&v7&v8&v9) | (
	n0&n1&v2&v3&v4&v5&v6&n7&n8&v9) | (v0&v1&v2&n3&v4&n5&v6&v7&n8
	&v9) | (n0&n1&n2&n3&v4&v5&n6&v7&v8&v9) | (v0&n1&v2&n3&v4&v5&n6
	&v7&n8&v9) | (n0&v1&v2&n3&v4&v5&v6&n7&n8&n9) | (n0&v1&v2&v3&v4
	&v5&n6&v7&n8&v9) | (v0&n1&v2&v3&n4&n5&v6&v8&n9) | (n1&n2&v3
	&n4&n5&v6&n7&v8&n9) | (v0&n1&v2&v3&n4&v5&v6&n8&v9) | (n0&n1
	&n2&n3&n4&n5&v6&v7&n9) | (v0&n2&v3&n4&n5&v6&v7&n8&n9) | (
	n0&n1&n2&v3&n4&v5&n7&n8&n9) | (n0&v1&v3&n4&n5&n6&n7&v8&n9) | (
	n0&v1&v2&v3&n4&v5&v6&n7&n8) | (v0&v1&n2&n4&n5&n6&v7&n8&n9) | (
	v0&v1&n2&n3&n4&n5&n6&n8&n9) | (n0&n1&n2&v3&v4&n5&v6&n7&v9) | (
	v1&n2&v3&n4&v5&n6&n7&n8&n9) | (v0&n1&v2&n3&n4&v6&n7&n8&n9) | (
	n0&n1&n2&v3&n4&v5&n6&n8&n9) | (n0&n1&n2&n3&n4&v5&n7&v8
	&n9) | (v0&n2&n3&n4&n5&v6&n7&n8&v9) | (n0&n2&v3&n4&n5&v6
	&v7&v8&n9) | (n0&n2&v3&n4&n5&n6&n7&v8&v9) | (v0&v1&v2&n4&n5
	&n6&v7&v8&v9) | (v0&v1&v2&n4&v5&n6&n7&n8&n9) | (v0&v1&n2&v3&v5
	&n6&n7&n8&v9) | (v0&v2&v3&n4&v5&v6&v7&n8&n9) | (n0&n1&v2&v3
	&n4&v5&v7&v8&n9) | (n0&n2&n3&n4&n5&v6&n7&v8&v9) | (v0&v1&v3
	&v4&n5&v6&n7&n8&n9) | (v0&v1&n2&v3&v4&n5&n6&v7&n8) | (v0&n2
	&v3&v4&n5&v6&v7&v8&v9) | (v0&v1&v2&v3&v4&n5&n6&v7&v8) | (v0&v1&v2
	&v4&n5&v6&n7&v8&n9) | (v0&n1&v2&v3&v5&n6&n7&n8&v9) | (n0&n1
	&v2&v3&n4&n5&v7&n8&v9) | (n0&v1&v2&v3&n5&v6&n7&v8&v9) | (v0&n1
	&v2&n3&v4&v5&v6&n7&n8) | (v0&n1&v2&n3&n5&v6&v7&v8&n9) | (n0
	&v1&v2&v3&v4&v5&n6&n7&n9) | (n0&n1&n2&v3&v5&n6&n7&n8&v9) | (
	n0&n1&n2&n3&v4&n5&n6&n7&v8) | (n0&n1&v2&n3&n4&v5&n7&n8
	&n9) | (n0&n1&n2&n3&v4&v6&n7&v8&n9) | (n0&n1&v2&n3&n4&n6
	&v7&v8&n9) | (v0&v1&n2&n3&v4&n6&n7&n8&n9) | (n0&v2&v3&n4&n5
	&v6&v7&n8&n9) | (n0&n1&n2&v3&v4&n5&n6&v7&n8) | (n1&n2&v3&v4
	&v5&v6&v7&n8&n9) | (v0&v2&v3&v4&v5&v6&v7&v8&v9) | (n0&v1&n2&v3&v4
	&v5&n6&v7&n8) | (v0&v1&v2&n3&v4&v5&n6&v8&n9) | (v0&v1&v2&n3&v4
	&v5&v6&n8&n9) | (n0&v1&v2&v3&v4&v5&n6&v8&n9) | (n0&v1&v3&v4&n5
	&n6&n7&n8&v9) | (v0&n2&n3&v4&v5&v6&v7&n8&n9) | (v0&n1&n3&v4
	&n5&n6&v7&n8&v9) | (n0&n1&v2&n3&v4&v6&n7&v8&v9) | (n0&n1&v2
	&v3&v4&v5&v7&v8&v9) | (n1&n2&n3&v4&n5&n6&v7&v8&n9) | (v0&v1&v2
	&n3&v4&n5&n6&n8&n9) | (v0&v2&n3&v4&n5&n6&n7&v8&v9) | (v1&v2
	&v3&v4&n5&n6&v7&v8&v9) | (n0&n2&n3&v4&v5&v6&v7&v8&n9) | (n0&n1
	&v2&v3&v4&n5&v7&n8&n9) | (n0&v1&n3&v4&n5&n6&v7&v8&n9) | (n0
	&v1&v2&n3&v4&v6&v7&v8&v9) | (n0&n1&v2&n3&n5&n6&n7&n8&v9) | (
	n0&v1&n3&v4&v5&n6&n7&n8&v9) | (v0&v1&n2&n3&n4&v6&n7&v8&n9) | (
	v0&v1&v2&v3&n4&v5&v6&v8&n9) | (v0&n1&n2&n3&n4&v5&n6&n8&v9) | (
	v0&n2&n3&n4&n5&v6&v7&v8&v9) | (n1&n2&n3&n4&v5&v6&v7&v8&n9) | (
	v0&n1&v2&v3&v4&v6&n7&v8&v9) | (v0&n1&v2&v3&n5&n6&n7&v8&n9) | (
	v0&v1&v2&n3&n4&v6&v7&n8&n9) | (n1&v2&v3&n4&n5&n6&n7&n8&v9) | (
	n0&n1&n2&v4&v5&v6&n7&v8&n9) | (n0&n1&v2&n4&v5&n6&n7&n8&n9) | (
	v0&n1&v2&n3&v5&n6&n7&v8&n9) | (n0&v1&v2&n3&n4&n5&v7&v8&v9) | (
	n0&n1&n2&n3&v4&n5&v6&v7&n8) | (n0&v1&v2&n3&v4&n5&n6&n7&n9) | (
	v0&v2&v3&v4&n5&v6&v7&n8&n9) | (n0&n1&n3&v4&v5&v6&v7&v8&n9) | (
	n0&v1&v2&v4&n5&n6&n7&v8&n9) | (v0&n2&n4&v5&v6&v7&v8&n9) | (
	v0&n1&n2&v3&v4&v6&v8&v9) | (v0&v1&v2&v3&v4&v6&n7&n9) | (n0&v1&n2
	&n4&n5&n7&v8&v9) | (v0&n1&v2&v3&v4&v5&v6&v8) | (v0&v1&n3&n4&n6
	&v7&v8&n9) | (v1&n2&v3&v4&n5&n6&n8&n9) | (n1&n3&v4&v5&n6&v7
	&n8&n9) | (n0&v2&v4&n5&v6&n7&n8&v9) | (v0&n1&v2&v3&v4&v5&v6&v7);

hex[2] <= (n0&n1&n2&v3&n4&n5&v6&n7&v8&v9) | (v0&v1&v2&n3&n4&v5&v6
	&v7&v8&n9) | (n0&n1&n2&v3&n4&n5&n6&v7&n8&v9) | (n0&v1&v2&n3
	&n4&v5&v6&n7&v8&n9) | (n0&v1&v2&n3&n4&n5&n6&n7&v8&v9) | (n0
	&n1&n2&n3&v4&n5&v6&n7&n8&v9) | (n0&n1&v2&n3&v4&v5&n6&v7&n8
	&v9) | (v0&n1&n2&n3&n4&n5&n6&n7&v8&v9) | (v0&v1&n2&n3&n4&v5
	&v6&v7&v8&v9) | (n0&v1&n2&v3&v4&n5&v6&v7&v8&v9) | (v0&v1&n2&n3
	&v4&n5&n6&v7&v8&n9) | (n0&n1&v2&n3&v4&v5&v6&v7&v8&v9) | (n0&v1
	&v2&n3&v4&n5&n6&n7&v8&v9) | (n0&n1&v2&n3&v4&n5&v6&v7&n8&n9) | (
	v0&v1&n2&n3&n4&v6&n7&n8&n9) | (v0&n1&n2&n4&v5&v6&v7&n8&n9) | (
	v0&v1&v2&n3&n4&v5&n6&n7&v8) | (v0&v1&n3&n4&n5&v6&v7&v8&n9) | (
	v0&n1&n3&n4&v5&v6&n7&n8&v9) | (v0&n1&v2&n4&n5&v6&v7&v8&v9) | (
	v0&n1&v2&n3&n4&v5&v6&v8&v9) | (v0&v1&v2&n4&n5&v6&n7&n8&v9) | (
	n0&n1&v2&v3&n4&v5&v6&v8&v9) | (n0&n1&n2&n4&n5&v6&n7&n8&n9) | (
	v0&n1&v2&n3&n4&n5&v6&v7&n8) | (v0&n1&n3&n4&v5&n6&n7&n8&n9) | (
	v0&v1&v2&n3&n4&n5&n6&n7&n8) | (n0&n1&v2&v3&n4&v6&n7&n8&v9) | (
	n0&n1&n2&n4&v5&n6&v7&v8&v9) | (n0&n1&v2&n3&n4&n5&v6&v8&v9) | (
	n0&n1&v2&v3&n4&v5&n6&v7&n8) | (n0&n2&v3&n4&v5&v6&v7&n8&n9) | (
	n0&v1&n2&n3&n4&n6&v7&v8&n9) | (n0&n1&n2&n3&v4&v5&v6&n7&v9) | (
	v0&v1&v2&v3&v4&v5&n6&v7&v9) | (v0&v1&v3&v4&v5&n6&v7&v8&n9) | (n0
	&n1&v2&v3&v4&v5&v6&v7&n9) | (n0&n1&n2&v3&v4&n5&v6&n8&n9) | (
	n0&v1&v2&v3&v4&v5&v6&v7&v9) | (n0&n1&v2&v3&v4&v6&n7&v8&v9) | (v0
	&n1&v2&v3&n5&n6&v7&n8&n9) | (n0&n1&n2&n3&v5&n6&n7&v8&v9) | (
	n0&v1&n2&n3&v4&v6&n7&v8&v9) | (v1&n2&v3&v4&n5&n6&v7&v8&v9) | (
	n0&v1&n2&n3&n5&v6&v7&v8&v9) | (v0&n1&v2&n3&v4&v5&v6&v7&n8) | (
	v0&v2&v3&v4&v5&v6&n7&n8&v9) | (v0&v1&n3&v4&n5&v6&v7&n8&n9) | (
	n0&v1&v2&n3&n5&v6&n7&v8&n9) | (n0&n1&v3&v4&v5&v6&v7&n8&v9) | (
	v1&n2&n3&v4&n5&v6&n7&n8&n9) | (n0&v1&v2&v3&n5&n6&v7&v8&n9) | (
	n0&v1&n2&n3&v4&v5&n6&v8&n9) | (n0&v1&v2&v3&v4&v5&n7&n8&v9) | (
	v0&v2&n3&v4&v5&n6&n7&v8&v9) | (n0&n1&v2&n3&v5&n6&n7&n8&v9) | (
	v0&v1&n2&n3&n4&n5&n6&n7&v8&n9) | (v0&v1&n2&n3&n4&v5&n6&n7
	&n8&n9) | (v0&v1&v2&v3&v4&v5&v6&v7&v8&n9) | (v0&n1&v2&n3&v4&n5
	&v6&v7&n8&v9) | (v0&v1&v3&n4&n5&v6&n7&v8&n9) | (v0&v1&n2&v3&n4
	&n6&n7&v8&v9) | (v0&n1&n2&v3&n5&v6&v7&v8&n9) | (n0&v1&n2&n4
	&v5&v6&v7&v8&n9) | (v0&v1&v3&v4&v5&v6&n7&v8&v9) | (v0&v1&n2&v3&v4
	&v5&v6&n8&n9) | (n0&v1&n2&n4&n5&v6&v7&n8&n9) | (v0&n1&v2&v3
	&v5&n6&n7&v8&n9) | (n0&n1&n2&v3&v4&n5&n6&n7&v8) | (n0&v1&v2
	&v3&n4&n5&v7&v8&v9) | (v0&v1&v2&n3&v4&n5&v6&n7&v9) | (v0&n2&n3
	&n4&n5&n6&v7&n8&v9) | (n0&v1&v3&v4&v5&v6&n7&v8&n9) | (v0&n2
	&v3&v4&n5&n6&v7&v8&n9) | (n0&v1&n2&n3&v4&n5&n6&n7&n9) | (
	n0&v1&v2&n4&n5&v6&v7&n8&v9) | (n0&n2&n3&n4&n5&n6&v7&v8&v9) | (
	n0&n1&v2&v3&v4&n5&v6&v8&v9) | (v0&n1&v2&v3&v4&n6&v7&n8&n9) | (
	v0&v1&v2&v4&n5&n6&n7&n8&v9) | (v0&n1&v2&n3&v4&n5&n7&n8&n9) | (
	n0&v1&n2&n3&v5&n6&v7&n8&v9) | (v1&v2&n3&v4&v5&n6&v7&n8&n9) | (
	v0&n2&v3&n4&n5&v6&n7&n8&n9) | (v0&v2&v3&n4&v5&v6&n7&v8&v9) | (
	n0&n1&n2&n3&n4&v5&v6&v7&v9) | (v0&n1&n2&v3&v4&v6&n7&n8&n9) | (
	v0&v1&n2&v4&n5&v6&n7&v8&n9) | (n0&v1&v2&n4&n5&v6&n7&v8&n9) | (
	n0&n1&v2&n3&n4&v5&v6&v7&n9) | (n0&v1&v3&n4&n5&n6&n7&n8&n9) | (
	n0&n1&v2&n3&n4&n5&n6&n7&v8) | (v0&n1&v2&v3&n5&n6&n7&v8&v9) | (
	n0&v1&v2&n3&n4&v5&v6&v8&v9) | (n0&n1&v2&v3&n4&v5&n6&n8&v9) | (
	v0&n1&n2&n3&v4&v6&v7&v8&v9) | (n0&n1&v2&v3&v4&v5&n6&n7&n9) | (
	v0&v1&n3&v4&v5&v6&v7&v8&n9) | (v0&v1&v2&v4&v5&v6&n7&n8&v9) | (n1
	&n2&v3&v4&n5&v6&v7&n8&v9) | (v1&v2&n3&n4&v5&v6&v7&n8&v9) | (n0
	&n2&v3&v4&n5&n6&n7&v8&v9) | (n0&n1&v2&v3&v4&n5&n6&n7&n8) | (
	n0&n1&v3&v4&n5&n6&n7&n8&n9) | (v0&v1&v2&v4&v5&n6&n7&n8&n9) | (
	v0&v2&n3&v4&n5&v6&n7&v8&v9) | (n0&n1&n2&n3&v5&v6&v7&n8&v9) | (
	v0&n2&n3&v4&v5&n6&v7&v8&v9) | (v0&v1&v2&n3&v4&n5&v7&v8&v9) | (
	v0&n1&v2&n3&v4&n6&n7&n8&v9) | (v0&v1&v2&n3&v4&v5&n6&v7&n8) | (
	n0&v1&n3&v4&v5&v6&v7&n8&n9) | (n0&n2&n3&v4&v5&n6&n7&n8&n9) | (
	v0&n1&n2&v3&n4&n5&v7&v8) | (v0&n1&v2&v3&n4&v5&n6&v8) | (v0&v1
	&n3&n4&v6&n7&v8&v9) | (v0&n1&n2&n3&n4&n6&v8&n9) | (v0&n1&n2
	&n4&n6&n7&n8&n9) | (n1&n2&v3&n4&n5&n6&v8&n9) | (n0&n1&v3
	&n4&v5&n7&v8&n9) | (v0&n2&n4&v5&n6&n7&v8&v9) | (n0&v1&n2&v3
	&v5&v6&n7&v9) | (v0&n1&n2&v3&n5&v6&n8&v9) | (v0&n1&n2&n3&v6
	&n7&v8&n9) | (v0&n1&v2&v3&v4&n5&n6&v7) | (v0&v1&v3&n5&n6&n7
	&v8&n9) | (v1&n2&v3&n4&n5&n6&n8&v9) | (v0&v1&v2&n4&v5&n6&v7
	&n8) | (n0&v1&v2&n3&n4&n5&n7&n9) | (n0&v1&n2&n3&n4&n6&n7
	&n8) | (n0&v1&n2&v3&v5&n6&n7&v8) | (n0&n1&v2&v3&n5&v6&n7&n9) | (
	n0&v1&v2&v3&n4&n5&n6&n8) | (v0&n1&n2&v3&v5&v7&n8&v9) | (n0
	&n2&n3&n4&v5&n6&v7&n9) | (v0&v1&v2&n3&n4&n6&n8&v9) | (n0&n2
	&n3&n4&n5&n7&v8&n9) | (v1&n2&v3&v5&n6&n7&v8&v9) | (n1&n2&v3
	&v4&v5&n6&v7&v9) | (n0&n1&n2&v3&v4&v5&v7&v8) | (v0&v2&v3&v4&n5
	&v6&v7&v9) | (n0&n1&n3&n4&v6&v7&n8&v9) | (n0&v1&v2&n4&v5&n6
	&n8&n9) | (n1&v3&v4&n5&n6&n7&v8&v9) | (v0&v1&n2&n3&v4&n6&v7
	&n8) | (v0&n1&v2&v4&n5&n6&n8&n9) | (n0&n1&v2&n3&v4&v5&n6&v8) | (
	n0&n2&v4&v5&v6&n7&n8&n9) | (n0&n1&n3&v4&v5&v6&n8&n9) | (n1
	&n2&n3&n5&n6&v7&n8&n9) | (n1&v2&n3&v4&n5&n6&v8&n9) | (n1
	&v2&n3&v5&n6&v7&v8&v9) | (n0&v2&v3&n5&n6&n7&n8&n9) | (v1&n2
	&n3&v4&n5&v7&n8&v9) | (n0&v2&n3&v5&n6&v7&v8&v9) | (n0&v1&n2
	&v3&n4&v5&v7&v8&v9) | (v0&n1&n2&v4&v5&v6&n7&n8&v9) | (v0&v1&v2
	&n3&v4&v5&v6&n7&v8) | (v0&n1&n2&n3&v4&n6&n7&n8&n9) | (v0&n1
	&n2&n3&v4&n5&v7&n8&n9) | (n0&v1&n3&v4&n5&v6&v7&n8&v9) | (v0
	&v1&v2&v3&n4&n6&v8&n9) | (v0&n1&v2&n3&n4&n5&n6&v9) | (v0&n1
	&n2&v3&n6&n7&n8&v9) | (v0&n1&v2&n3&n4&n5&n8&v9) | (n0&v2&v3
	&n4&v5&n7&v8&v9) | (v1&v2&n3&n4&v5&n6&v7&v9) | (n0&n1&v2&v3&v4
	&n5&n7&n9) | (v0&n2&v3&v5&v6&v7&n8&v9) | (n1&n2&n3&v4&n5&v7
	&v8&v9) | (v0&n2&v3&v4&v5&v6&n7&n9) | (v0&n1&n2&v4&v5&n6&n7&n9) | (
	n0&v1&v2&v3&n4&v5&v8&n9) | (v0&v1&n2&v4&n5&n7&n8&v9) | (n0&v1
	&v2&n4&v5&v7&n8&n9) | (v0&n1&v4&n5&n6&v7&n8&n9) | (v2&n3&n4
	&n5&n6&v7&n8&v9);

hex[1] <= (n0&v1&n2&v3&n4&v5&n6&n7&n8&v9) | (v0&n1&v2&v3&v4&v5&v6&n7
	&n8&n9) | (n0&v1&n2&v3&v4&n5&n6&v7&v8) | (n0&n1&n2&v3&n4&n5
	&v6&n7&v8&v9) | (v0&v1&v2&n3&n4&v5&v6&v7&v8&n9) | (n0&n1&n2&v3
	&n4&n5&n6&v7&n8&v9) | (n0&v1&v2&n3&n4&v5&v6&n7&v8&n9) | (n0
	&v1&v2&n3&n4&n5&n6&n7&v8&v9) | (n0&n1&n2&n3&v4&n5&v6&n7&n8
	&v9) | (n0&n1&v2&n3&v4&v5&n6&v7&n8&v9) | (v0&n1&n2&n3&n4&n5
	&v6&v7&v8&n9) | (v0&n1&v2&v3&n4&v5&v6&v7&v8&v9) | (v0&n1&n2&v3
	&n4&n5&n6&v7&n8&n9) | (n0&n1&v2&v3&n4&v5&v6&n7&n8&n9) | (
	n0&v1&v2&v3&n4&n5&v6&n7&n8&v9) | (n0&n1&v2&v3&n4&v5&n6&v7&v8
	&v9) | (n0&v1&v2&n3&v4&n5&n6&v7&n8&n9) | (v0&v1&v3&n4&n5&n6
	&n7&n8&n9) | (v0&v1&n2&n4&v5&v6&v7&n8&n9) | (n0&n1&n2&n3
	&n4&n5&v6&v7&v9) | (n0&n1&n2&v3&n4&n5&v6&n8&n9) | (v0&n1&n2
	&v3&v4&n5&n6&v7&v9) | (n0&v1&v2&v3&n4&n5&v6&v8&n9) | (v0&v1&v2
	&n3&n4&v6&n7&n8&n9) | (n0&n1&v2&n4&n5&v6&n7&v8&v9) | (n0
	&n1&v2&n3&n4&n5&v6&v7&n9) | (v0&n1&n2&n3&n5&n6&n7&v8&n9) | (
	n0&n1&v2&n3&n4&n5&v6&n7&n8) | (n0&n1&n2&n3&n4&n6&v7&v8
	&n9) | (n0&n1&n2&n3&n4&n6&n7&n8&n9) | (n0&v1&n2&n3&n4
	&n5&n7&n8&v9) | (n0&v1&v2&n3&n4&v5&n6&v8&n9) | (n0&v1&n2&v3
	&n5&n6&v7&v8&n9) | (v0&n1&v2&n3&v4&v5&v6&v8&n9) | (v0&v1&v2&n3
	&v4&n5&v6&n7&n8) | (v0&v1&v2&v4&n5&v6&v7&v8&n9) | (n0&v1&v2&n3
	&n4&v5&n7&n8&v9) | (v0&v1&n2&n3&v5&n6&v7&n8&n9) | (v0&n1&v2
	&n3&v4&v5&n6&n7&n8) | (v0&n1&v2&n3&v5&n6&v7&v8&n9) | (n0&n1
	&v2&v3&v5&n6&n7&n8&v9) | (n0&n1&v2&n3&v4&v6&n7&v8&n9) | (n0
	&n1&v2&n3&v4&v5&v6&n7&n8) | (n0&v1&v2&n3&v4&v5&n6&n7&v8) | (
	n0&v2&n3&n4&v5&v6&v7&n8&n9) | (n0&n2&v3&v4&v5&n6&n7&n8&n9) | (
	n0&v1&v2&v3&v4&n5&n6&v7&n8) | (n0&n1&n2&v4&v5&n6&v7&n8&v9) | (
	n0&n1&v2&v4&n5&n6&v7&v8&n9) | (v0&v1&v2&n3&v4&n6&v7&n8&v9) | (
	n0&n2&n3&v4&n5&n6&n7&n8&v9) | (n0&v1&v2&n3&v4&n6&v7&v8&v9) | (
	v0&v1&n2&n3&n4&n5&n6&n7&v8&n9) | (v0&v1&n2&n3&n4&v5&n6&n7
	&n8&n9) | (v0&v1&v2&v3&v4&v5&v6&v7&v8&n9) | (v0&n1&v2&n3&v4&n5
	&v6&v7&n8&v9) | (v0&v1&v3&n4&n5&v6&n7&v8&n9) | (v0&v1&n2&v3&n4
	&n6&n7&v8&v9) | (v0&n1&n2&v3&n5&v6&v7&v8&n9) | (n0&v1&n2&n4
	&v5&v6&v7&v8&n9) | (v0&v1&v3&v4&v5&v6&n7&v8&v9) | (v0&v1&n2&v3&v4
	&v5&v6&n8&n9) | (n0&v1&n2&n4&n5&v6&v7&n8&n9) | (v0&n1&v2&v3
	&v5&n6&n7&v8&n9) | (n0&n1&n2&v3&v4&n5&n6&n7&v8) | (n0&v1&v2
	&v3&n4&n5&v7&v8&v9) | (v0&v1&v2&n3&v4&n5&v6&n7&v9) | (v0&n2&n3
	&n4&n5&n6&v7&n8&v9) | (n0&v1&v3&v4&v5&v6&n7&v8&n9) | (v0&n2
	&v3&v4&n5&n6&v7&v8&n9) | (n0&v1&n2&n3&v4&n5&n6&n7&n9) | (
	n0&v1&v2&n4&n5&v6&v7&n8&v9) | (n0&n2&n3&n4&n5&n6&v7&v8&v9) | (
	n0&n1&v2&v3&v4&n5&v6&v8&v9) | (v0&n1&v2&v3&v4&n6&v7&n8&n9) | (
	v0&v1&v2&v4&n5&n6&n7&n8&v9) | (v0&n1&v2&n3&v4&n5&n7&n8&n9) | (
	n0&v1&n2&n3&v5&n6&v7&n8&v9) | (v1&v2&n3&v4&v5&n6&v7&n8&n9) | (
	v0&n1&n3&n4&v5&v6&n7&v8&n9) | (v1&n2&v3&n4&v5&v6&n7&v8&n9) | (
	n0&n1&v3&n4&n5&n6&n7&v8&n9) | (n1&n2&n3&n4&v5&v6&n7&v8&v9) | (
	v0&v1&v2&n3&n4&n5&n7&v8&n9) | (v1&n2&v3&n4&n5&n6&n7&n8&n9) | (
	v0&n1&n2&v3&v5&n6&v7&v8&v9) | (n0&n1&n2&n3&n4&v5&n7&n8&v9) | (
	n0&v1&v2&v3&v4&v5&v6&n7&n9) | (v0&v1&v3&v4&v5&n6&n7&n8&n9) | (
	v0&v1&n2&n3&v5&n6&n7&n8&v9) | (n0&v1&v2&v3&v5&v6&n7&v8&v9) | (
	v0&v1&n3&v4&v5&v6&v7&v8&v9) | (n0&n1&n2&v4&v5&v6&n7&n8&n9) | (
	n0&v1&v2&n4&v5&n6&v7&n8&v9) | (v0&v1&v2&n3&v4&n5&n6&v8&n9) | (
	n0&v2&v3&n4&n5&n6&v7&n8&n9) | (n0&v1&v3&v4&n5&n6&v7&v8&n9) | (
	n0&v1&v2&v4&v5&n6&v7&v8&v9) | (v0&n1&n2&v3&n4&n7&n8&n9) | (
	n0&v1&n2&n4&v5&v6&n7&v8) | (v0&n1&v3&n4&n5&v7&v8&v9) | (v0&n2
	&v3&n4&n5&n6&v8&v9) | (v0&n1&n3&n4&n5&n7&v8&n9) | (v0&v1&n2
	&v3&v4&n5&n7&v9) | (v1&n2&v3&n4&n5&v6&n8&v9) | (v0&v1&v2&v3&n4
	&n6&v7&n8) | (v1&v3&n4&v5&v6&v7&v8&v9) | (n0&n1&n2&n4&v6&n7
	&n8&v9) | (v0&n1&n2&n3&n4&v7&n8&n9) | (v1&n2&n3&n4&v5&n7
	&v8&v9) | (v0&n1&n2&n3&v4&v5&v7&v9) | (v0&n2&v3&v4&v5&n6&v7&n9) | (
	v0&n1&v3&v4&n5&v6&n8&v9) | (v0&v1&n2&n3&n6&n7&v8&v9) | (n0&n1
	&n2&v3&v5&n7&v8&v9) | (v0&n1&n2&n3&v5&n6&v8&v9) | (v0&v2&v3&n4
	&n5&v7&n8&n9) | (v0&n2&v4&v5&v6&n7&v8&n9) | (n0&n1&n2&v3&v5
	&n6&v8&n9) | (n1&n3&n4&n5&n6&v7&v8&v9) | (v0&v2&v3&v4&n5&n6
	&n7&v9) | (n2&n3&n4&v5&v6&n7&n8&n9) | (n1&n3&n4&v5&v6&v7&n8
	&n9) | (v0&n1&n3&v4&v5&n7&v8&v9) | (n0&v1&v3&v5&v6&v7&v8&n9) | (
	n0&n2&n4&v5&v6&v7&n8&v9) | (v0&v1&n2&v4&v6&v7&n8&v9) | (n1&n2
	&v3&n5&n6&n7&n8&n9) | (v1&n2&n3&n4&n6&v7&n8&v9) | (v0&v1&v2
	&v3&v5&n6&n8&v9) | (n1&n2&n3&v4&n5&v6&v7&v8) | (v0&v2&n4&n5
	&n6&v7&n8&n9) | (n1&v3&v4&v5&n6&n7&v8&n9) | (v0&v2&v3&n5&v6
	&n7&n8&v9) | (v0&v1&v2&n3&v6&v7&v8&v9) | (n0&n2&n3&n4&v5&n6
	&v7&n8) | (n0&n1&n2&v4&v6&v7&v8&v9) | (v0&n1&n3&v4&n5&v7&v8&v9) | (
	v1&n2&n3&v4&v5&v6&n7&n8) | (n0&v1&n2&n3&n6&n7&v8&n9) | (n0
	&n2&v3&v4&n5&n6&v8&n9) | (n0&v1&n3&v4&n5&v6&v8&n9) | (v1&v2
	&v3&v4&v5&v6&v7&n8) | (n0&v1&v3&v4&v6&v7&n8&n9) | (v1&n2&v4&v5
	&n6&v7&v8&n9) | (n0&v1&v4&v5&v6&n7&n8&v9) | (v0&v2&v3&v5&n6&v7
	&n8&v9) | (n0&v2&v3&n5&v6&n7&n8&n9) | (n2&v3&v4&n5&v6&v7&n8
	&n9) | (n0&v1&n2&n3&n5&v7&n8&n9) | (v2&n3&n4&v5&n6&v7&n8
	&v9) | (n1&v2&v4&n5&n6&n7&n8&n9) | (n0&v2&v3&v5&v6&v7&n8&v9) | (
	n0&n1&v2&v4&n5&v7&n8&v9) | (n0&v2&v3&v5&n6&v7&n8&n9) | (n0
	&v1&n2&v3&n4&v5&v7&v8&v9) | (v0&n1&n2&v4&v5&v6&n7&n8&v9) | (v0
	&v1&v2&n3&v4&v5&v6&n7&v8) | (v0&n1&n2&n3&v4&n6&n7&n8&n9) | (
	v0&n1&n2&n3&v4&n5&v7&n8&n9) | (n0&v1&n3&v4&n5&v6&v7&n8&v9) | (
	v0&v1&v2&v3&n4&n6&v8&n9) | (v0&n1&v2&n3&n4&n5&n6&v9) | (v0&n1
	&n2&v3&n6&n7&n8&v9) | (v0&n1&v2&n3&n4&n5&n8&v9) | (n0&v2&v3
	&n4&v5&n7&v8&v9) | (v1&v2&n3&n4&v5&n6&v7&v9) | (n0&n1&v2&v3&v4
	&n5&n7&n9) | (v0&n2&v3&v5&v6&v7&n8&v9) | (n1&n2&n3&v4&n5&v7
	&v8&v9) | (v0&v1&n3&n4&n6&n7&n8&v9) | (n0&v1&n2&v4&n5&v6&v7
	&n8) | (n1&v2&v3&v4&n5&n6&v7&v8) | (n2&n3&v4&n5&v6&n7&v8&v9) | (
	n0&v1&v3&n4&v6&v7&v9);

hex[0] <= (n0&n1&n2&v3&n4&n5&v6&v7&v8&v9) | (n0&v1&n2&v3&n4&n5&v6
	&n7&n8&n9) | (n0&v1&n2&v3&n4&v5&n6&v7&n8&v9) | (n0&n1&v2&v3
	&n4&n5&n6&v7&v8&v9) | (n0&v1&n2&n3&n4&v5&v6&v7&n8&n9) | (n0
	&v1&v2&v3&n4&v5&n6&n7&n8&v9) | (v0&v1&n2&n3&v4&n5&v6&v7&v8&n9) | (
	v0&n1&n2&n3&v4&n5&v6&n7&n8&v9) | (n0&v1&v2&n3&n4&v5&v6&v7&v8
	&n9) | (v0&v1&n2&n3&v4&n5&n6&v7&v8&v9) | (n0&n1&v2&v3&v4&v5&v6
	&n7&n8&v9) | (v0&v1&v2&n3&v4&n5&v6&v7&n8&v9) | (n0&n1&n2&n3
	&v4&v5&n6&v7&v8&v9) | (v0&n1&v2&n3&v4&v5&n6&v7&n8&v9) | (n0&v1
	&v2&n3&v4&v5&v6&n7&n8&n9) | (n0&v1&v2&v3&v4&v5&n6&v7&n8&v9) | (
	v0&n1&n2&n3&n4&n5&v6&v7&v8&n9) | (v0&n1&v2&v3&n4&v5&v6&v7&v8
	&v9) | (v0&n1&n2&n3&n4&n5&n6&n7&v8&v9) | (v0&n1&n2&v3&n4&n5
	&n6&v7&n8&n9) | (v0&v1&n2&n3&n4&v5&v6&v7&v8&v9) | (n0&n1&v2
	&v3&n4&v5&v6&n7&n8&n9) | (n0&v1&v2&v3&n4&n5&v6&n7&n8&v9) | (
	n0&n1&v2&v3&n4&v5&n6&v7&v8&v9) | (n0&v1&n2&v3&v4&n5&v6&v7&v8
	&v9) | (v0&v1&n2&n3&v4&n5&n6&v7&v8&n9) | (n0&n1&v2&n3&v4&v5
	&v6&v7&v8&v9) | (n0&v1&v2&n3&v4&n5&n6&n7&v8&v9) | (n0&n1&v2&n3
	&v4&n5&v6&v7&n8&n9) | (n0&v1&v2&n3&v4&n5&n6&v7&n8&n9) | (n0
	&v1&n2&v3&n4&v5&v6&n7&n8) | (v0&n1&v3&n4&v5&n6&v7&n8&v9) | (
	v0&n1&n3&n4&n5&n6&v7&v8&v9) | (v0&n1&v2&v3&n4&n5&v7&n8&v9) | (
	v0&n1&n2&v3&n5&n6&n7&n8&v9) | (v0&n1&n2&n3&v4&n6&n7&v8&v9) | (
	n0&n2&n3&n4&n5&n6&n7&v8&v9) | (n0&n1&n2&v3&v4&v5&n7&v8&v9) | (
	n0&v1&v3&v4&n5&v6&n7&v8&n9) | (n1&n2&v3&v4&n5&v6&v7&v8&n9) | (
	v1&n2&v3&v4&v5&v6&v7&v8&n9) | (v0&v1&v2&v3&v4&n5&n7&n8&n9) | (
	n0&v1&n2&v3&v5&v6&v7&n8&v9) | (v0&v1&v2&v4&v5&n6&n7&v8&v9) | (
	n1&v2&v3&v4&n5&v6&n7&v8&v9) | (v1&n2&v3&v4&n5&n6&n7&n8&v9) | (
	v0&v1&v2&v3&v4&n5&v7&n8&v9) | (n0&n1&v3&v4&n5&v6&v7&n8&v9) | (
	n0&v1&v2&n3&n5&v6&n7&v8&v9) | (v1&n2&n3&v4&v5&v6&v7&v8&v9) | (
	n1&v2&n3&v4&v5&v6&n7&v8&v9) | (v1&n2&n3&v4&n5&n6&n7&n8&n9) | (
	n1&v2&n3&v4&n5&n6&n7&v8&v9) | (n1&n2&n3&v4&n5&n6&v7&n8&v9) | (
	n0&n1&v2&n3&v5&n6&v7&n8&n9) | (v0&v1&n2&n3&n4&n5&n6&n7&v8
	&n9) | (v0&v1&n2&n3&n4&v5&n6&n7&n8&n9) | (v0&v1&v2&v3&v4&v5
	&v6&v7&v8&n9) | (v0&n1&v2&n3&v4&n5&v6&v7&n8&v9) | (v0&v1&n2&n3
	&n4&v6&n7&v8&n9) | (v0&v1&v2&v3&n4&v5&v6&v8&n9) | (v0&n1&n2&n3
	&n4&v5&n6&n8&v9) | (v0&n2&n3&n4&n5&v6&v7&v8&v9) | (n1&n2&n3
	&n4&v5&v6&v7&v8&n9) | (v0&n1&v2&v3&v4&v6&n7&v8&v9) | (v0&n1&v2
	&v3&n5&n6&n7&v8&n9) | (v0&v1&v2&n3&n4&v6&v7&n8&n9) | (n1&v2
	&v3&n4&n5&n6&n7&n8&v9) | (n0&n1&n2&v4&v5&v6&n7&v8&n9) | (
	n0&n1&v2&n4&v5&n6&n7&n8&n9) | (v0&n1&v2&n3&v5&n6&n7&v8&n9) | (
	n0&v1&v2&n3&n4&n5&v7&v8&v9) | (n0&n1&n2&n3&v4&n5&v6&v7&n8) | (
	n0&v1&v2&n3&v4&n5&n6&n7&n9) | (v0&v2&v3&v4&n5&v6&v7&n8&n9) | (
	n0&n1&n3&v4&v5&v6&v7&v8&n9) | (n0&v1&v2&v4&n5&n6&n7&v8&n9) | (
	v0&n1&n3&n4&v5&v6&n7&v8&n9) | (v1&n2&v3&n4&v5&v6&n7&v8&n9) | (
	v0&n2&v3&n4&n5&v6&n7&n8&n9) | (v0&v2&v3&n4&v5&v6&n7&v8&v9) | (
	n0&n1&n2&n3&n4&v5&v6&v7&v9) | (n0&n1&v3&n4&n5&n6&n7&v8&n9) | (
	n1&n2&n3&n4&v5&v6&n7&v8&v9) | (v0&v1&v2&n3&n4&n5&n7&v8&n9) | (
	v1&n2&v3&n4&n5&n6&n7&n8&n9) | (v0&n1&n2&v3&v5&n6&v7&v8&v9) | (
	v0&n1&n2&v3&v4&v6&n7&n8&n9) | (v0&v1&n2&v4&n5&v6&n7&v8&n9) | (
	n0&v1&v2&n4&n5&v6&n7&v8&n9) | (n0&n1&v2&n3&n4&v5&v6&v7&n9) | (
	n0&v1&v3&n4&n5&n6&n7&n8&n9) | (n0&n1&v2&n3&n4&n5&n6&n7
	&v8) | (n0&n1&n2&n3&n4&v5&n7&n8&v9) | (v0&n1&v2&v3&n5&n6&n7
	&v8&v9) | (n0&v1&v2&v3&v4&v5&v6&n7&n9) | (n0&v1&v2&n3&n4&v5&v6
	&v8&v9) | (n0&n1&v2&v3&n4&v5&n6&n8&v9) | (v0&n1&n2&n3&v4&v6
	&v7&v8&v9) | (v0&v1&v3&v4&v5&n6&n7&n8&n9) | (v0&v1&n2&n3&v5&n6
	&n7&n8&v9) | (n0&v1&v2&v3&v5&v6&n7&v8&v9) | (v0&v1&n3&v4&v5&v6
	&v7&v8&v9) | (n0&n1&v2&v3&v4&v5&n6&n7&n9) | (v0&v1&n3&v4&v5&v6
	&v7&v8&n9) | (n0&n1&n2&v4&v5&v6&n7&n8&n9) | (v0&v1&v2&v4&v5&v6
	&n7&n8&v9) | (n0&v1&v2&n4&v5&n6&v7&n8&v9) | (n1&n2&v3&v4&n5
	&v6&v7&n8&v9) | (v1&v2&n3&n4&v5&v6&v7&n8&v9) | (v0&v1&v2&n3&v4
	&n5&n6&v8&n9) | (n0&v2&v3&n4&n5&n6&v7&n8&n9) | (n0&v1&v3&v4
	&n5&n6&v7&v8&n9) | (n0&n2&v3&v4&n5&n6&n7&v8&v9) | (n0&n1&v2
	&v3&v4&n5&n6&n7&n8) | (n0&n1&v3&v4&n5&n6&n7&n8&n9) | (v0
	&v1&v2&v4&v5&n6&n7&n8&n9) | (v0&v2&n3&v4&n5&v6&n7&v8&v9) | (
	n0&n1&n2&n3&v5&v6&v7&n8&v9) | (v0&n2&n3&v4&v5&n6&v7&v8&v9) | (
	v0&v1&v2&n3&v4&n5&v7&v8&v9) | (v0&n1&v2&n3&v4&n6&n7&n8&v9) | (
	v0&v1&v2&n3&v4&v5&n6&v7&n8) | (n0&v1&v2&v4&v5&n6&v7&v8&v9) | (
	n0&v1&n3&v4&v5&v6&v7&n8&n9) | (n0&n2&n3&v4&v5&n6&n7&n8&n9) | (
	v0&v1&n2&v3&n4&v5&n7&v8) | (v0&v1&n2&v3&n4&n5&v7&v9) | (v0&v1
	&n2&n4&n5&v6&v7&n9) | (v0&n1&v2&v3&n4&n5&n7&n9) | (v0&v1&v2
	&v3&n4&v5&n7&n9) | (n0&n1&n2&v3&n4&v5&v6&v8) | (v0&v1&n2&v3
	&v4&v5&v6&n7) | (v0&n2&v3&n4&n5&v6&v8&v9) | (v0&n1&n2&v3&v4&v5
	&n6&n7) | (v0&n1&v2&n3&n4&n5&n6&n9) | (v1&v3&n4&n5&v6&n7
	&v8&v9) | (v0&v2&v3&n4&n5&n6&n7&v8) | (v0&v1&n2&n3&n5&v6&n7
	&v9) | (v0&v1&v3&n4&v5&v7&n8&n9) | (v0&n1&n2&v3&n6&n7&v8&n9) | (
	v0&v1&n3&n4&v5&n6&v8&v9) | (n1&v2&n3&n4&n5&v6&n7&v9) | (n0
	&n1&v2&n3&n4&v6&n7&v8) | (v0&v1&n2&v3&v4&n7&v8&n9) | (v0&v1&n2
	&n3&n4&v7&n8&n9) | (v0&n1&n3&n4&v5&v7&n8&n9) | (n1&v2&v3&n4
	&n5&v7&v8&n9) | (v1&n2&n4&v5&v6&v7&n8&v9) | (v0&n2&v3&v5&v6&v7
	&v8&v9) | (n0&v1&n2&n3&v5&v6&n7&v9) | (v0&n1&n2&n3&v4&v5&v6&n8) | (
	n2&v3&n4&v5&n6&v7&v8&n9) | (n0&n2&v3&n4&n6&n7&n8&n9) | (
	n1&n2&n3&n4&v6&v7&n8&v9) | (v1&n2&v3&v4&v6&n7&v8&v9) | (v1&v2
	&n3&n4&n5&n6&v7&n9) | (v0&v2&n4&n5&n6&n7&n8&v9) | (v1&n2
	&n4&n5&n6&v7&n8&v9) | (n0&v2&v3&n4&v5&n6&v8&n9) | (v1&n2&n3
	&v5&v6&n7&v8&n9) | (v1&v2&n4&v5&n6&v7&v8&v9) | (v0&n1&v2&v3&v4
	&v7&v8&v9) | (v0&n2&v3&v4&n6&v7&v8&v9) | (n0&n1&v2&v3&v4&v5&n6
	&v8) | (n0&n1&n3&v4&v5&n6&n7&v9) | (n0&n1&n2&n3&v6&n7&n8
	&n9) | (v1&v2&v3&n5&v6&v7&v8&v9) | (n1&v2&v3&v4&v5&n7&v8&n9) | (
	n0&v1&n2&n3&n5&v6&n8&v9) | (n0&n1&n2&v4&n5&v7&v8&v9) | (v1
	&v3&v4&n5&v6&v7&n8&n9) | (v0&v2&v3&v4&n6&v7&v8&n9) | (n0&v1&v2
	&v3&v4&n6&v8&v9) | (n0&v1&n2&n3&n6&n7&n8&n9) | (n1&v2&n3&v4
	&n5&v6&n7&n8) | (n0&n2&v3&n5&n6&v7&n8&n9) | (n0&n2&n3&v4
	&n5&n6&v7&v8) | (n0&v1&v2&n3&v4&v5&v8&n9) | (v0&v2&n3&v4&v5&n7
	&n8&v9) | (v0&v2&n3&v4&n6&v7&v8&v9) | (n0&v1&v2&n3&n6&n7&n8
	&v9) | (v2&n3&v4&v5&n6&n7&v8&n9) | (n0&v1&n2&v3&n4&v5&v7&v8&v9) | (
	v0&n1&n2&v4&v5&v6&n7&n8&v9) | (v0&v1&v2&n3&v4&v5&v6&n7&v8) | (
	v0&n1&n2&n3&v4&n6&n7&n8&n9) | (v0&n1&n2&n3&v4&n5&v7&n8&n9) | (
	n0&v1&n3&v4&n5&v6&v7&n8&v9) | (v0&n1&v2&v3&v4&v5&v6&v7) | (v0&n2
	&v3&v4&v5&v6&n7&n9) | (v0&n1&n2&v4&v5&n6&n7&n9) | (v0&v1&n3
	&n4&n6&n7&n8&v9) | (n0&v1&v2&v3&n4&v5&v8&n9) | (v0&v1&n2&v4
	&n5&n7&n8&v9) | (n0&v1&n2&v4&n5&v6&v7&n8) | (n1&v2&v3&v4&n5
	&n6&v7&v8) | (n0&v1&v2&n4&v5&v7&n8&n9) | (v0&n1&v4&n5&n6&v7
	&n8&n9) | (n2&n3&v4&n5&v6&n7&v8&v9) | (v2&n3&n4&n5&n6&v7&n8
	&v9) | (v0&v1&v2&n4&v5&v6&n7) | (v0&n1&v2&n4&v5&v6&n9) | (v0&n1
	&n2&n3&v5&v7&n9) | (n0&n1&n2&n3&n4&n5&n8) | (v1&n4&v5&n6
	&n7&v8&n9) | (v0&n1&v3&v4&v5&n8&n9) | (v0&n1&v5&v6&v7&n8&n9) | (
	n0&n1&n3&n4&n5&n8&v9) | (n0&v1&v4&v5&n6&n7&n9) | (n0&n1
	&n3&n5&v6&v7&v8) | (n0&n1&n3&n5&v6&v8&n9) | (v0&v2&v4&n5&v6
	&n7&n8) | (v2&n3&n4&v6&n7&n8&v9) | (v1&v2&n5&v6&v7&n8&n9) | (
	v2&v3&v5&v6&v7&n8&n9) | (n0&v1&v2&n3&v5&n8&v9) | (v2&v4&n5&v6
	&n7&n8&n9) | (n0&v2&v4&n5&v7&v8&n9) | (v2&n3&v4&n5&v7&v8&n9);
	end

	seg7hex seg7hex(.hex(hex), .segments(led_out));

endmodule
