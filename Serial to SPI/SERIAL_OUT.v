module SERIAL_OUT(CLK,BYTEIN,RX_D,LOAD);
input CLK,LOAD;
input [7:0]BYTEIN;
output reg RX_D;

reg [9:0]data;
reg new_data=0;
reg [3:0]count;

always@(posedge CLK)
begin
	if(count<10&&new_data==1)
		begin
		RX_D=data[count];
		count=count+1;
		end
	
//	
//	if(count==10)
//		new_data=0;
//		

	if(LOAD==1&&new_data==0)
		begin
		count=0;
		new_data=1;
		data[0]=0;
		data[1]=BYTEIN[0];
		data[2]=BYTEIN[1];
		data[3]=BYTEIN[2];
		data[4]=BYTEIN[3];
		data[5]=BYTEIN[4];
		data[6]=BYTEIN[5];
		data[7]=BYTEIN[6];
		data[8]=BYTEIN[7];
		data[9]=1;
		end
end

endmodule

