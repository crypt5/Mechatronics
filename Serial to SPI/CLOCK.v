module CLOCK(clk_50,CONST_9600,SAMPLE,CHANGE,RESET);
input clk_50,CHANGE,RESET;
output reg CONST_9600,SAMPLE;

reg [15:0]count;
reg [15:0]const_count;

always@(posedge clk_50 or negedge RESET)
begin
	if(RESET==0)
		begin
		count=0;
		const_count=0;
		CONST_9600=0;
		SAMPLE=0;
		end

	if(CHANGE)
		begin
		if(count<5200)
			begin
			count=count+1;
			SAMPLE=0;
			end
		else
			begin
			count=0;
			SAMPLE=1;
			end
		end
	else
		begin
		if(count<1300)
			begin
			count=count+1;
			SAMPLE=0;
			end
		else
			begin
			count=0;
			SAMPLE=1;
			end
		end
		
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

endmodule