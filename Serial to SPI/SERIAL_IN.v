module SERIAL_IN(CLK,TX_D,LOAD,BYTEOUT,RESET);
input CLK,TX_D,RESET;
output reg LOAD;
output wire [7:0]BYTEOUT;

reg SLOW_CLK=0;
reg [3:0]count;
reg [9:0]data;

assign BYTEOUT[0]=data[1];
assign BYTEOUT[1]=data[2];
assign BYTEOUT[2]=data[3];
assign BYTEOUT[3]=data[4];
assign BYTEOUT[4]=data[5];
assign BYTEOUT[5]=data[6];
assign BYTEOUT[6]=data[7];
assign BYTEOUT[7]=data[8];


always@(posedge CLK or negedge RESET)
begin
	if(RESET==0)
		begin
		count=0;
		SLOW_CLK=0;
		LOAD=0;
		data=0;
		end
	else
	begin
	if(TX_D==0&&SLOW_CLK==0)
		begin
		LOAD=0;
		SLOW_CLK=1;
		count=count+1;
		data[0]=0;
		end
	else if(SLOW_CLK==1)
		begin
		if(count<9)
			begin
			data[count]=TX_D;
			count=count+1;
			LOAD=0;
			end
		else
			begin
			LOAD=1;
			count=0;
			SLOW_CLK=0;
			end
		end
	else
		begin
			LOAD=0;
			count=0;
		end
	end
end

endmodule