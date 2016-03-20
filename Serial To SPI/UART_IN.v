module newClk(clk, newclk, change);
input clk,change;
output reg newclk;

reg [15:0]count;

always@(posedge clk)
begin

	if(change==1) // Use the Slower CLock
		begin
		if(count==1)//5200) //104 Micro Seconds (9600) Hz
			begin
			count=1;
			newclk=1;
			end
		else
			begin
			count=count+1;
			newclk=0;
			end
		end
		
	else // Use the faster CLock
		begin
		if(count==1)//1300) //26 Micro Senonds (9600/4) Hz
			begin
			count=1;
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


module UART_IN (clk, newclk, TX_D, RTS, CTS, BYTEOUT, load);
input clk,TX_D,RTS;
output reg CTS,load;
output reg [7:0]BYTEOUT;

output newclk;

reg [9:0]data;

reg change=0;
reg [3:0]count=0;


newClk change_CLK(clk, newclk, change);


always@(posedge newclk)
begin
	CTS=1;
	
	if(TX_D==0&&change==0)//Start Bit
		change=1;
		
	if(count>-1&&count<11&&change==1)
		begin
		data=data>>1;
		data[9]=TX_D;
		end
		
	if(count==10&&change==1)
		begin
		count=11;
		change=0;
		BYTEOUT=8'b11000011;
		end
	else if(change==1)
		count=count+1;
end





















endmodule