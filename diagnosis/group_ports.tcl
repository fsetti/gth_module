# # ILAs
create_hw_probe -map probe0[63:32]     	fifo_dout_1[31:0] 	[get_hw_ilas hw_ila_3]
create_hw_probe -map probe0[31:0]     	fifo_dout_2[31:0] 	[get_hw_ilas hw_ila_3]
create_hw_probe -map probe0[64]     	fifo_empty	 		[get_hw_ilas hw_ila_3]
create_hw_probe -map probe0[65]     	fifo_almost_empty	[get_hw_ilas hw_ila_3]

create_hw_probe -map probe0[31:0]     	fifo_din[31:0]		[get_hw_ilas hw_ila_2]
create_hw_probe -map probe0[32]     	fifo_wr_ack			[get_hw_ilas hw_ila_2]
create_hw_probe -map probe0[33]     	fifo_full			[get_hw_ilas hw_ila_2]
create_hw_probe -map probe0[34]     	fifo_almost_full	[get_hw_ilas hw_ila_2]
