/*
	  ---1---
	 |       |
	 6       2
	 |       |
	  ---7---
	 |       |
	 5       3
	 |       |
	  ---4---
*/

module seg7hex (
	input wire [3:0] hex,
	output reg [6:0] segments
);
	always @(*) begin
		case(hex)
			//                   7654321
			4'd00: segments = 7'b0111111; // 0
			4'd01: segments = 7'b0000110; // 1
			4'd02: segments = 7'b1011011; // 2
			4'd03: segments = 7'b1001111; // 3
			4'd04: segments = 7'b1100110; // 4
			4'd05: segments = 7'b1101101; // 5
			4'd06: segments = 7'b1111101; // 6
			4'd07: segments = 7'b0000111; // 7
			4'd08: segments = 7'b1111111; // 8
			4'd09: segments = 7'b1100111; // 9
			4'd10: segments = 7'b1110111; // A
			4'd11: segments = 7'b1111100; // b
			4'd12: segments = 7'b1011000; // c
			4'd13: segments = 7'b1011110; // d
			4'd14: segments = 7'b1111001; // E
			4'd15: segments = 7'b1110001; // F
		endcase
	end
endmodule
