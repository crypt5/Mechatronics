module newClk(clk, newclk, change);
input clk,change;
output reg newclk;

reg [31:0]count;

always@(posedge clk)
begin

	if(change==1)
		begin
		if(count==5200) //104 Micro Seconds (9600) Hz
			begin
			count=0;
			newclk=1;
			end
		else
			begin
			count=count+1;
			newclk=0;
			end
		end
	else
		begin
		if(count==1300) //26 Micro Senonds (9600/4) Hz
			begin
			count=0;
			newclk=1;
			end
		else
			begin
			count=count+1;
			newclk=0;
			end
		end
end

endmodule


module UART_IN (clk, TX_D, RTS, CTS, BYTEOUT, load);
input clk,TX_D,RTS;
output reg CTS,load;
output reg [7:0]BYTEOUT;

reg change=0;
reg [3:0]count=0;
reg [9:0]data_in;

newClk change_clk(clk, newclk, change);

always@(negedge newclk)
begin
	if(RTS==1&&count<=11)
		begin
		change=1;
		CTS=1;
		count=count+1;
		data_in=data_in<<1;
		data_in[0]=TX_D;
		end
	else
		begin
		change=0;
		CTS=0;
		count=0;
		if((data_in[9]==0)&&(data_in[0]==1))
			BYTEOUT=8'hF0;
		else
			BYTEOUT=8'h0F;
		end
end





















endmodule