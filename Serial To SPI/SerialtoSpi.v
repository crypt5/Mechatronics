module SerialtoSpi(OUT,clk);
input clk;
output reg OUT;

reg [31:0]count;

always@(posedge clk)
begin
	if(count==25000000)
		begin
		count=0;
		OUT=~OUT;
	end
	else
		count=count+1;
end

endmodule