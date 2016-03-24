module REGISTER(RTS,CTS,BYTEIN,LOAD,BYTEOUT);
input [7:0]BYTEIN;
input LOAD,RTS;
output wire CTS;
output reg [7:0]BYTEOUT;

reg full=0;

assign CTS=RTS&(!full);

always@(posedge LOAD)
begin
	BYTEOUT=BYTEIN;
	full=1;
end

endmodule