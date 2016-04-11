module CLOCK(clk_50,CONST_9600,RESET);
input clk_50,RESET;
output reg CONST_9600;

reg [15:0]const_count;

always@(posedge clk_50 or negedge RESET)
begin
	if(RESET==0)
		begin
		const_count=0;
		CONST_9600=0;
		end
	else
	begin
		
	if(const_count<5200)
		begin
		const_count=const_count+1;
		CONST_9600=0;
		end
	else
		begin
		const_count=0;
		CONST_9600=1;
		end
	end
end

endmodule