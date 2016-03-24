module SERIAL_IN(clk_50,TX_D,RTS,CTS,LOAD,BYTEOUT);
input clk_50,TX_D,RTS;
output reg CTS,LOAD;
output wire [7:0]BYTEOUT;

reg change=0;
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

CLK_RESET newClk(clk_50,change,CLK);

always@(posedge CLK)
begin
CTS=RTS;
	if(TX_D==0&&change==0)
		begin
		LOAD=0;
		change=1;
		count=count+1;
		data[0]=0;
		end
	else if(change==1)
		begin
		if(count==10)
			begin
			change=0;
			if(data[0]==0&&data[9]==1)
				LOAD=1;
			else
				LOAD=0;
			end
		else
			begin
			data[count]=TX_D;
			count=count+1;
			end
		end
	
end

endmodule



module CLK_RESET(clk_50,SLOW,CLK);
input clk_50,SLOW;
output reg CLK;

reg [15:0]count;


always@(posedge clk_50)
begin
	if(SLOW)
		begin
		if(count<5200)
			begin
			count=count+1;
			CLK=0;
			end
		else
			begin
			count=0;
			CLK=1;
			end
		end
	else
		begin
		if(count<1300)
			begin
			count=count+1;
			CLK=0;
			end
		else
			begin
			count=0;
			CLK=1;
			end
		end
end

endmodule