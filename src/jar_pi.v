module jar_pi
(
	input  [7:0] io_in,
	output [7:0] io_out
);
	wire       clk      = io_in[0];
	wire       reset    = io_in[1];
	wire       stream   = io_in[2];
	wire [4:0] io_index = io_in[7:3];

	reg [8:0] index;
	reg [7:0] led_out;
	wire [3:0] hex;
	assign io_out[7:0] = led_out;

	wire v0 = index[8];
	wire v1 = index[7];
	wire v2 = index[6];
	wire v3 = index[5];
	wire v4 = index[4];
	wire v5 = index[3];
	wire v6 = index[2];
	wire v7 = index[1];
	wire v8 = index[0];

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
			index <= {io_index, index[8:5]};
		end
		else if (stream) begin
			index <= index + 1;
		end
hex[3] <= (v0&v1&n2&n3&n4&n5&v6&n7&n8) | (n0&n1&v2&v3&v4&v5&v6&n7
    &n8) | (n0&v1&n2&v3&v4&v5&v6&n7&v8) | (n0&n1&n2&n3&n4&n5&v6
    &n7&v8) | (v0&n1&n2&v3&v4&v5&v6&n7&v8) | (v0&v1&v2&n3&v4&n6&n7
    &v8) | (n0&v1&n2&n3&v4&n5&n6&v7&v8) | (v0&n1&n2&n3&v4&n5&v6
    &v7&v8) | (v0&n1&v2&v3&v4&v5&v6&v7&v8) | (v0&v1&n2&v3&v4&v5&n6&n7
    &n8) | (v0&n1&n2&n3&v4&v5&v6&n7&n8) | (v0&n1&v2&n3&n4&v5&n6
    &n7&n8) | (v0&v1&n2&n3&v4&v5&v6&v7&n8) | (n0&v1&v2&v3&v4&v5&n6
    &n7&v8) | (v0&n1&v2&n3&v4&n5&v6&n7&v8) | (n0&n1&n2&v3&v4&n5
    &v6&v7&v8) | (v0&v1&v2&v3&n4&n5&v6&v7&v8) | (n0&n1&v2&n3&n4&v5
    &v6&v7&v8) | (n0&n2&v3&v4&n5&v6&n7&n8) | (n0&v1&n2&n3&v4&n6
    &n7&n8) | (n0&n1&v2&n3&v4&n5&n7&n8) | (v0&n1&v2&v3&n4&n5
    &n7&n8) | (n0&n1&n2&n3&n4&v5&v6&n8) | (n0&v1&v2&v3&n4&v6&n7
    &n8) | (n0&n1&v2&n3&v4&n6&n7&n8) | (n0&v1&n2&n3&n5&v6&v7
    &n8) | (n0&n1&n2&v3&v5&n6&v7&n8) | (v0&v1&v2&v3&v4&n5&n6&n8) | (
    n0&n1&v2&v3&n4&n5&v6&n7) | (v1&v2&n3&n4&v5&v6&n7&n8) | (v0
    &n2&v3&v4&n5&n6&n7&v8) | (v0&n1&v2&v3&v4&n5&v6&n7) | (n0&n1
    &n2&n3&v4&n6&v7&n8) | (n1&n2&v3&n4&n5&v6&v7&n8) | (n1&n2
    &v3&v4&v5&v6&v7&n8) | (v0&v1&v2&v3&v4&n5&v7&n8) | (v0&v2&v3&v4&n5
    &v6&n7&v8) | (v0&v1&v2&n3&v4&v5&n6&n7) | (n0&n1&v2&n3&n4&v5
    &v7&n8) | (n0&v1&n2&n4&n5&n6&n7&v8) | (n0&v1&v2&n3&n4&v6&n7
    &v8) | (v0&v1&v3&n4&n5&n6&v7&n8) | (n0&v1&v2&n3&v4&v6&v7&n8) | (
    v0&v2&v3&n4&n5&n6&n7&v8) | (n0&v1&v2&n3&n4&n5&v6&v8) | (n0
    &n1&n2&v3&n4&n5&n6&v7) | (n0&v1&n2&v3&v5&n6&v7&v8) | (n0&n1
    &v2&v3&n4&v5&n6&v8) | (n0&n1&v2&v4&n5&n6&n7&v8) | (v0&v1&n2
    &v3&v5&v6&v7&v8) | (v0&v2&n3&n4&n5&n6&v7&n8) | (n1&v2&n3&n4
    &v5&v6&v7&n8) | (n0&v1&v2&v3&v4&v6&v7&v8) | (n1&n2&n3&n4&v5&n6
    &v7&v8) | (n1&v2&n3&n4&n5&n6&v7&v8) | (v0&v1&v2&n4&v5&n6&v7&v8) | (
    n0&v1&n3&v4&n5&n6&n7&n8) | (v0&v1&n2&v3&n4&n5&n6&n8) | (
    n0&n1&n2&v3&n4&v5&v6&n7) | (n1&v2&n3&v4&n5&n6&n7&n8) | (
    n0&n1&n2&n3&v5&v6&v7&n8) | (n0&n2&v3&v4&v5&v6&v7&n8) | (v0&n2
    &v3&n4&n5&v6&v7&n8) | (n0&v1&n3&n4&n5&n6&n7&v8) | (n0&n1
    &v3&v4&v5&n6&v7&n8) | (v0&v1&n2&n3&n4&v6&v7&v8) | (v1&v3&n4&v5
    &n6&n7&v8) | (v0&n1&n3&n4&n6&v7&v8);

hex[2] <= (v0&v1&n2&v3&v4&n5&v6&n7&n8) | (n0&n1&n2&v3&n4&v5&n6&n7
    &v8) | (n0&n1&v2&v3&v4&n5&v6&n7&v8) | (n0&n1&v2&n3&n4&n5&v6
    &n7&v8) | (n0&v1&n2&v3&n4&v5&v6&n7&n8) | (v0&n1&v2&v3&n4&n5
    &v6&v7&v8) | (n0&n1&v2&n3&n4&v5&n6&v7&v8) | (n0&v1&n2&v3&v4&v5
    &v6&v7&v8) | (v0&n1&v2&v3&n4&v5&v6&v7&v8) | (n0&n1&v2&v3&n4&v5
    &n7&n8) | (n0&n1&n3&n4&v5&n6&n7&n8) | (n0&n1&n2&n4&n5
    &v6&n7&n8) | (n0&v1&v2&v3&v4&v5&v6&n8) | (n1&v2&n3&v4&v5&v6&n7
    &n8) | (n0&v1&v2&n3&v4&n5&v6&n7) | (n0&n1&v2&v3&v5&v6&n7&v8) | (
    n0&v1&n3&v4&n5&n6&n7&v8) | (v0&n1&n2&v3&n4&v6&n7&v8) | (n0
    &n1&n2&v3&v4&v5&n6&v8) | (n0&v1&v2&n3&v5&n6&n7&v8) | (n0&n1
    &v2&n3&n4&n5&v7&n8) | (v0&v1&v2&v3&v4&n6&n7&v8) | (v0&v1&v2&v3
    &v4&v5&v6&v8) | (v0&n1&n2&n3&n4&n5&v6&v7) | (v0&n1&n2&v3&v5&n6
    &v7&v8) | (v0&v1&n2&n4&v5&n6&v7&n8) | (n0&n1&n3&v4&n5&v6&v7
    &v8) | (n0&v1&v2&n3&v4&v5&v7&v8) | (v0&v1&v2&n4&n5&v6&v7&n8) | (
    v0&n1&v2&v3&n5&n6&v7&v8) | (n0&n1&n2&v4&n5&n6&v7&v8) | (v0&v1
    &n2&n4&n5&n6&v7&v8) | (v0&n1&n2&n4&v5&v6&v7&v8) | (n0&v1&v2
    &v4&v5&n6&v7&v8) | (v0&n1&v2&n3&n4&n5&n6&n7&n8) | (v1&n2&n3
    &v4&v5&v6&n7&n8) | (v0&n1&n3&n4&v5&v6&n7&n8) | (n0&v2&n3&n4
    &v5&n6&n7&n8) | (v0&n1&n2&v3&v4&n5&v7&n8) | (v0&n1&n2&v4&n5
    &v6&n7&v8) | (v0&n1&n3&v4&v5&v6&v7&n8) | (v1&v2&v3&v4&v5&v6&n7
    &v8) | (v0&v1&n2&n4&v5&v6&n7&v8) | (v0&v2&v3&v4&v5&n6&v7&n8) | (
    v0&n1&n2&n4&n5&n6&v7&n8) | (n0&n1&n2&v3&n4&v6&v7&v8) | (n0
    &v1&v2&v3&n4&v5&v7&v8) | (n1&n2&n3&n4&n5&v6&v7&v8) | (v0&n2&v3
    &v4&v5&v6&n7&n8) | (n1&n2&v3&v4&n5&n6&n7&n8) | (n0&v1&n2&n3
    &v4&v5&v6&n8) | (v0&v1&v2&n3&n4&n5&n7&n8) | (v0&v1&v2&n3&n4
    &v6&v7&v8) | (n0&v1&v2&v3&v4&n5&n6&n8) | (n0&v1&n2&n3&n4&v6
    &n7&v8) | (n0&v1&v2&v3&n4&n5&n6&n7) | (n0&n1&n2&n3&v4&v5&v6
    &v8) | (n0&n1&n2&v4&v5&v6&n7&v8) | (n0&v1&n2&n3&n4&n5&n6&v7) | (
    n0&v1&n2&n3&n4&v5&v7&v8) | (v1&v2&n3&v4&n5&n6&v7&n8) | (n0
    &n2&v3&v4&v5&n7&n8) | (v0&n1&n2&v3&n6&n7&n8) | (v0&v1&n3&v4
    &n5&n7&n8) | (n0&v1&n2&v3&n5&v7&n8) | (n1&n2&n3&v4&n5&v6
    &n8) | (v0&n1&n2&n3&n5&n6&n7) | (n0&n2&n3&v5&v6&n7&v8) | (
    n0&v1&n2&v3&v4&n5&v8) | (v0&v1&n2&n3&n4&n6&n8) | (v0&v2&n3
    &n4&n5&n7&v8) | (v1&v2&n4&n5&n6&n7&n8) | (v0&v1&n3&n4&v6&n7
    &v8) | (v0&n1&v2&v3&v4&v5&n6) | (n1&n2&n3&n4&n6&v7&n8) | (n0
    &v2&n3&v4&n6&v7&n8) | (v1&v2&n3&v5&n6&v7&n8) | (n0&n1&v2&v3
    &v4&v6&v7) | (n0&v2&v3&n4&n5&n6&v7) | (v0&v1&n3&v4&v5&n6&v7) | (
    v0&n1&v2&v4&v5&n6&v8) | (v1&n2&v4&n5&v6&v7&v8) | (v0&n1&v2&v4&n5
    &n6&v7) | (n0&n1&v3&v4&v5&n6&n7&n8) | (n0&v2&v3&n4&n5&n6&n7
    &n8) | (v0&n1&v2&n3&v4&v6&v7&v8) | (n0&v1&v2&v3&n4&n6&n8) | (
    v1&v2&n3&v4&n6&v7&v8) | (v0&v1&v2&n3&v4&v6&n8) | (v0&v1&n2&n3
    &v4&v6&v8);

hex[1] <= (v0&n1&v2&n3&v4&n5&n6&n7&v8) | (v0&v1&n2&n3&n4&n5&n6&v7
    &v8) | (v0&v1&n2&v3&v4&n5&v6&n7&n8) | (n0&n1&n2&v3&n4&v5&n6
    &n7&v8) | (n0&n1&v2&v3&v4&n5&v6&n7&v8) | (n0&n1&v2&n3&n4&n5
    &v6&n7&v8) | (v0&n1&v2&v3&n4&n5&v6&v7&v8) | (v0&v1&n2&v3&n4&n5
    &v6&n7&n8) | (n0&n1&v2&n3&n4&v5&n6&v7&v8) | (n0&v1&v2&n3&v4
    &v5&n6&n7&n8) | (v0&n1&n2&v3&n4&n5&n7&n8) | (n0&v1&v3&n4
    &n5&n6&n7&n8) | (n0&v1&n2&n3&n4&v5&v6&n8) | (n0&v1&n2&v3
    &v4&v5&n6&n7) | (n1&v2&v3&v4&n5&n6&n7&n8) | (n0&n1&n2&n3
    &n5&v6&v7&n8) | (n0&v1&n2&n3&n4&v5&n6&n7) | (n0&v1&n2&v3&v5
    &n6&v7&n8) | (v0&v1&v2&v3&n4&n5&v6&n7) | (v0&v1&v2&n3&n4&v5&n6
    &n8) | (n1&n2&v3&n4&n5&n6&n7&v8) | (v0&v1&n2&n3&v4&n6&n7
    &v8) | (v0&v1&n3&v4&n5&v6&n7&v8) | (n0&n1&n2&n3&n4&v5&v6&v8) | (
    v0&n1&n2&n3&n4&n6&n7&v8) | (n1&n2&v3&n4&v5&v6&v7&n8) | (v0
    &v1&n2&v3&n5&v6&v7&v8) | (v0&v1&n2&v3&v4&n5&n6&v7) | (v0&v1&n2
    &n3&v4&n5&v6&v7) | (n0&v1&v2&v4&n5&n6&n7&v8) | (n0&n2&n3&n4
    &n5&v6&v7&v8) | (n0&v1&v2&v3&n4&n5&v6&v7) | (n0&v1&v2&n3&v4&n5
    &v7&v8) | (v0&v1&v3&v4&n5&v6&v7&v8) | (v0&n1&v2&n4&n5&v6&v7&n8) | (
    n0&v1&n3&n4&v5&n6&v7&v8) | (v0&n1&v2&n3&n4&n5&n6&n7&n8) | (
    v1&n2&n3&v4&v5&v6&n7&n8) | (v0&n1&n3&n4&v5&v6&n7&n8) | (n0
    &v2&n3&n4&v5&n6&n7&n8) | (v0&n1&n2&v3&v4&n5&v7&n8) | (v0&n1
    &n2&v4&n5&v6&n7&v8) | (v0&n1&n3&v4&v5&v6&v7&n8) | (v1&v2&v3&v4
    &v5&v6&n7&v8) | (v0&v1&n2&n4&v5&v6&n7&v8) | (v0&v2&v3&v4&v5&n6
    &v7&n8) | (v0&n1&n2&n4&n5&n6&v7&n8) | (n0&n1&n2&v3&n4&v6
    &v7&v8) | (n0&v1&v2&v3&n4&v5&v7&v8) | (n1&n2&n3&n4&n5&v6&v7&v8) | (
    v0&v1&v2&n3&n4&v6&v7&v8) | (n0&n1&n3&n4&n5&n6&n7&n8) | (v1
    &v2&n3&n4&n5&v6&n7&n8) | (n0&v1&v3&n4&n5&v6&v7&n8) | (v0&n1
    &n3&v4&v5&v6&n7&v8) | (n0&v2&n3&n4&n5&n6&v7&n8) | (v0&v2&v3
    &n4&n5&v6&v7&n8) | (n0&n1&v2&v3&n5&n6&v7&v8) | (n1&n2&v3&n4
    &v5&n6&v7&v8) | (v0&v1&v2&v4&v5&n6&v7&v8) | (v0&n1&n2&n3&n5&v6
    &n7) | (v0&v2&v3&v4&v5&v6&n8) | (n1&n2&v4&v5&n6&n7&n8) | (v0
    &n2&v3&n4&v5&v7&n8) | (n0&v1&v3&n4&v6&n7&v8) | (v1&v2&v4&n5&v6
    &n7&n8) | (n0&v2&v3&n5&n6&v7&n8) | (n0&n2&v4&n5&v6&n7&v8) | (
    v0&v3&v4&v5&n6&n7&v8) | (n1&v2&n4&v5&v6&n7&n8) | (v0&n2&n3&v4
    &n6&v7&n8) | (n1&v2&v3&n5&v6&v7&n8) | (v0&v2&n3&n4&v5&n7&v8) | (
    n0&n1&n3&v4&v5&n6&v8) | (n1&v2&v3&n4&n5&v7&n8) | (n0&n1&v2
    &v4&n5&v7&n8) | (n1&n3&n4&v5&n6&n7&v8) | (v2&n3&v4&v5&v6&n7
    &v8) | (n0&n1&v3&v5&v6&v7&v8) | (v0&n1&n2&n3&v4&n6&v7) | (v0&v1
    &v2&n3&v5&v6&v7) | (v0&n1&v2&n3&v4&v5&v7) | (n0&n1&v2&v4&n6&v7
    &v8) | (n0&n1&v3&v4&v5&n6&n7&n8) | (n0&v2&v3&n4&n5&n6&n7&n8) | (
    v0&n1&v2&n3&v4&v6&v7&v8) | (n0&v1&v2&v3&n4&n6&n8) | (v0&v1&v2
    &v3&v5&n7&n8) | (v1&v2&n3&v4&n6&v7&v8) | (v0&n1&v3&n4&v5&v6&n7) | (
    n0&n1&n2&n3&v4&n7) | (v0&v2&n3&v5&v6&v8);

hex[0] <= (v0&n1&v2&v3&v4&v5&v6&v7&n8) | (n0&v1&v2&v3&n4&v5&n6&v7&v8) | (
    v0&v1&n2&v3&v4&v5&n6&n7&n8) | (v0&n1&n2&n3&v4&v5&v6&n7&n8) | (
    v0&n1&v2&n3&n4&v5&n6&n7&n8) | (v0&v1&n2&n3&v4&v5&v6&v7&n8) | (
    n0&v1&v2&v3&v4&v5&n6&n7&v8) | (v0&n1&v2&n3&v4&n5&v6&n7&v8) | (
    n0&n1&n2&v3&v4&n5&v6&v7&v8) | (v0&v1&v2&v3&n4&n5&v6&v7&v8) | (
    n0&n1&v2&n3&n4&v5&v6&v7&v8) | (n0&v1&n2&v3&n4&v5&v6&n7&n8) | (
    v0&v1&n2&v3&n4&n5&v6&n7&n8) | (n0&v1&v2&n3&v4&v5&n6&n7&n8) | (
    n0&v1&n2&v3&v4&v5&v6&v7&v8) | (v0&n1&v2&v3&n4&v5&v6&v7&v8) | (n0
    &v1&n2&v4&n5&v6&n7&n8) | (v0&n1&n3&n4&n5&v6&n7&v8) | (n0&v2
    &v3&n4&v5&v6&n7&v8) | (v0&n1&v2&n3&v4&v5&n6&n7) | (n0&v1&n2
    &n4&v5&n6&n7&v8) | (v0&n1&n2&v3&v4&v5&v7&v8) | (v0&n1&v2&v3&n4
    &n5&n6&v8) | (v0&v2&v3&n4&v5&n6&v7&n8) | (v0&n1&v2&v4&v5&v6&n7
    &v8) | (n0&n1&v2&v3&n4&n5&v7&v8) | (v1&n2&v3&n4&n5&n6&v7&v8) | (
    n1&n2&n3&n4&n5&n6&v7&v8) | (n0&v1&n2&v4&v5&n6&v7&v8) | (n1
    &v2&v3&v4&v5&n6&v7&v8) | (v0&v1&n2&n4&v5&n6&v7&v8) | (v0&v1&v2&n4
    &v5&v6&v7&v8) | (v0&n1&v2&n4&v5&n6&v7&v8) | (v0&n1&v2&n3&n4&n5
    &n6&n7&n8) | (n0&v1&n3&v4&n5&n6&n7&n8) | (v0&v1&n2&v3&n4
    &n5&n6&n8) | (n0&n1&n2&v3&n4&v5&v6&n7) | (n1&v2&n3&v4&n5
    &n6&n7&n8) | (n0&n1&n2&n3&v5&v6&v7&n8) | (n0&n2&v3&v4&v5&v6
    &v7&n8) | (v0&n2&v3&n4&n5&v6&v7&n8) | (n0&v1&n3&n4&n5&n6&n7
    &v8) | (n0&n1&v3&v4&v5&n6&v7&n8) | (v0&v1&n2&n3&n4&v6&v7&v8) | (
    v0&n2&v3&v4&v5&v6&n7&n8) | (n1&n2&v3&v4&n5&n6&n7&n8) | (n0
    &v1&n2&n3&v4&v5&v6&n8) | (v0&v1&v2&n3&n4&n5&n7&n8) | (n0&v1
    &v2&v3&v4&n5&n6&n8) | (n0&n1&n3&n4&n5&n6&n7&n8) | (n0&v1
    &n2&n3&n4&v6&n7&v8) | (n0&v1&v2&v3&n4&n5&n6&n7) | (n0&n1
    &n2&n3&v4&v5&v6&v8) | (v1&v2&n3&n4&n5&v6&n7&n8) | (n0&n1&n2
    &v4&v5&v6&n7&v8) | (n0&v1&v3&n4&n5&v6&v7&n8) | (v0&n1&n3&v4&v5
    &v6&n7&v8) | (n0&v1&n2&n3&n4&n5&n6&v7) | (n0&v1&n2&n3&n4
    &v5&v7&v8) | (v1&v2&n3&v4&n5&n6&v7&n8) | (n0&v2&n3&n4&n5&n6
    &v7&n8) | (v0&v2&v3&n4&n5&v6&v7&n8) | (n0&n1&v2&v3&n5&n6&v7
    &v8) | (n1&n2&v3&n4&v5&n6&v7&v8) | (v0&v1&v2&v4&v5&n6&v7&v8) | (
    n0&n1&n2&v5&n6&n7&n8) | (v0&v1&n2&v3&v5&v6&n7) | (v0&n1&n2
    &n5&n6&n7&n8) | (n0&v1&n2&n3&v5&v7&n8) | (v1&v3&n4&v5&n6&n7
    &n8) | (v0&v1&v3&n4&v5&v6&n8) | (n0&n1&n2&n3&n6&n7&v8) | (
    v0&v1&n2&v3&v4&v7&n8) | (n0&n2&v3&v4&n5&n6&v8) | (v0&v1&n2&n3
    &n4&n5&v6) | (n0&n1&n2&v3&n4&v6&v8) | (n1&v2&n4&n5&v6&n7&n8) | (
    v1&v2&v4&v5&v6&n7&n8) | (v0&v1&n2&n5&n6&n7&v8) | (v1&v2&n3&v4
    &n5&n7&v8) | (v0&n1&n2&n4&v5&n7&v8) | (v0&n2&v4&v5&n6&n7&v8) | (
    n0&v1&v3&v4&n5&n6&v7) | (v2&n3&v4&n5&v6&v7&n8) | (v0&v1&n3&n4
    &v5&n6&v8) | (n1&n2&v3&n4&n5&v6&v7) | (n0&n1&v3&n4&v5&v6&v7) | (
    n0&n1&v2&n3&v4&v5&v7) | (v0&v2&n3&v4&n6&v7&n8) | (v1&v2&v3&v4
    &n6&v7&n8) | (v0&v1&v2&v3&n5&n6&v7) | (n0&v1&v2&n4&v6&v7&n8) | (
    v0&v1&n3&n4&v5&n6&v7) | (v0&n1&n2&v4&v5&n6&v7) | (n0&n1&v3&v4
    &v5&n6&n7&n8) | (n0&v2&v3&n4&n5&n6&n7&n8) | (v0&n1&v2&n3
    &v4&v6&v7&v8) | (v0&v1&v2&v3&v5&n7&n8) | (v0&v1&v2&n3&v4&v6&n8) | (
    v0&n1&v3&n4&v5&v6&n7) | (v0&v1&n2&n3&v4&v6&v8) | (v0&v1&n3&v6
    &n7&n8) | (n0&n1&n2&n3&n4&n7) | (v0&v3&v4&n5&n6&n8) | (n0
    &n2&n4&v5&v7&n8) | (n2&n3&v4&v5&n6&v8) | (v0&v1&v4&n5&v6&v8) | (
    v0&v4&n5&n6&v7&n8) | (n0&v1&v2&n5&v6&v7) | (n0&n2&n4&v5&v6&v7);

	end

	seg7hex seg7hex(.hex(hex), .segments(led_out));

endmodule
