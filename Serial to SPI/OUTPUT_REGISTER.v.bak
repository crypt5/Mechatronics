module OUTPUT_REGISTER(BYTEIN,LOAD,BYTEOUT,HAS_DATA);
input [7:0]BYTEIN;
input LOAD;
output reg [7:0]BYTEOUT;
output reg HAS_DATA;

always@(posedge LOAD)
begin
	BYTEOUT=BYTEIN;
	HAS_DATA=1;
end

endmodule