`timescale 1ns/1ps

module Detect(
	input clk_i,
	input rst_n_i,
	input sin,
	output out
)

reg out_r;
reg[1:0] Current_state;
reg[1:0] Next_state;

parameter[1:0] S0;
parameter[1:0] S1;
parameter[1:0] S2;
parameter[1:0] S3;

always@(posedge clk_i or negedge rst_n_i)
begin
	if(!rst_n_i)
		Current_state<=0;
	else
		Current_state<=Next_state;
end

always@(Current or sin)
begin
end
