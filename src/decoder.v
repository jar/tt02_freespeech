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
			4'h_0: segments = 7'b0111111;
			4'h_1: segments = 7'b0000110;
			4'h_2: segments = 7'b1011011;
			4'h_3: segments = 7'b1001111;
			4'h_4: segments = 7'b1100110;
			4'h_5: segments = 7'b1101101;
			4'h_6: segments = 7'b1111101;
			4'h_7: segments = 7'b0000111;
			4'h_8: segments = 7'b1111111;
			4'h_9: segments = 7'b1100111;
			4'h_A: segments = 7'b1110111;
			4'h_b: segments = 7'b1111100;
			4'h_c: segments = 7'b1011000;
			4'h_d: segments = 7'b1011110;
			4'h_E: segments = 7'b1111001;
			4'h_F: segments = 7'b1110001;
		endcase
	end
endmodule
