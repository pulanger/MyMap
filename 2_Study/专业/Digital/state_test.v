`timescale 1ns/1ps

module Detect(
	input clk_i,
	input rst_n_i,
	input sin,
	output out
);

reg out_r;
reg[1:0] state;

parameter[1:0] S0=2'b00;
parameter[1:0] S1=2'b01;
parameter[1:0] S2=2'b02;
parameter[1:0] S3=2'b03;

always@(posedge clk_i or negedge rst_n_i)
begin
	if(!rst_n_i)
	state<=0;
else
	case(state)
		S0:
			begin
				out_r<=1'b0; 			//output
				state<=(sin==1)?S0:S1; 	//change state
			end
		S1:
			begin
				out_r<=1'b0;
				state<=(sin==1)?S2:S1;
			end
		S2:
			begin
				out_r<=1'b0;
				state<=(sin==1)?S0:S3;
			end
		S3:
			if(sin==1)
				begin
					out_r<=1'b1;
					state<=S2;
				end
			else
				begin
					out_r<=1'b0;
					state<=S1;
				end
	endcase
end
assign out=out_r;
endmodule
