module MEM_32_BYTE(LOAD,BYTEIN,ADDR,BYTEOUT,READ,RTS,CTS,FULL,RESET);
input LOAD,RTS,READ,RESET;
input [7:0]BYTEIN;
input [4:0]ADDR;
output wire CTS;
output reg FULL=0;
output reg [7:0]BYTEOUT;

reg [7:0]mem[31:0];
reg [7:0]load_count;

assign CTS=RTS&(!FULL);

always@(posedge LOAD or negedge RESET)
begin
	if(RESET==0)
		begin
		load_count=0;
		FULL=0;
		end
	else
		begin
		
		if(load_count<32)
			begin
			mem[load_count]=BYTEIN;
			load_count=load_count+1;
			FULL=0;
			end
		else
			begin
			FULL=1;
			end
			
		end
end

always@(posedge READ)
begin
	BYTEOUT=mem[ADDR];
end

endmodule