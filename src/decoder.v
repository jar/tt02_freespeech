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

module seg7hex (
	input wire [3:0] hex,
	output reg [7:0] segments
);
	always @(*) begin
		case(hex)
			//                   87654321
			4'd00: segments = 8'b00111111; // 0
			4'd01: segments = 8'b00000110; // 1
			4'd02: segments = 8'b01011011; // 2
			4'd03: segments = 8'b01001111; // 3
			4'd04: segments = 8'b01100110; // 4
			4'd05: segments = 8'b01101101; // 5
			4'd06: segments = 8'b01111101; // 6
			4'd07: segments = 8'b00000111; // 7
			4'd08: segments = 8'b01111111; // 8
			4'd09: segments = 8'b01100111; // 9
			4'd10: segments = 8'b10000000; // .
			default: segments = 8'b00000000; // [blank]
		endcase
	end
endmodule
