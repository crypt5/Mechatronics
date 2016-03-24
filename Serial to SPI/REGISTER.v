module REGISTER(BYTEIN,LOAD,BYTEOUT);
input [7:0]BYTEIN;
input LOAD;
output reg [7:0]BYTEOUT;

always@(posedge LOAD)
begin
	BYTEOUT=BYTEIN;
end

endmodule