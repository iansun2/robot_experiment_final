module DEC_7SEG(iHex_digit, oHEX);

input   [3:0] iHex_digit;  /* digital input */
output  [7:0] oHEX;        /* output to 7-seg display */

reg     [7:0] segment_data;

always @(iHex_digit) begin
// Case statement implements a logic truth table using gates
   case (iHex_digit)
        4'b0000: segment_data = 8'b_0011_1111;  // "0" (0x3F)
        4'b0001: segment_data = 8'b_0000_0110;  // "1" (0x06)
        4'b0010: segment_data = 8'b_0101_1011;  // "2" (0x5B)
        4'b0011: segment_data = 8'b_0100_1111;  // "3" (0x4F)
        4'b0100: segment_data = 8'b_0110_0110;  // "4" (0x66)
        4'b0101: segment_data = 8'b_0110_1101;  // "5" (0x6D)
        4'b0110: segment_data = 8'b_0111_1101;  // "6" (0x7D)
        4'b0111: segment_data = 8'b_0000_0111;  // "7" (0x07)
        4'b1000: segment_data = 8'b_0111_1111;  // "8" (0x7F)
        4'b1001: segment_data = 8'b_0110_1111;  // "9" (0x6F)
        4'b1010: segment_data = 8'b_0000_0000;  
        default: segment_data = 8'b_0100_0000;  // "-"  
    endcase
end
/* extract segment data bits and invert */
/* LED driver circuit is inverted */
assign oHEX  = ~segment_data;
endmodule