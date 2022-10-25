# # ILAs
create_hw_probe -map probe0[63:32]     	fifo_dout_w1[31:0] 	[get_hw_ilas hw_ila_3]
create_hw_probe -map probe0[31:0]     	fifo_dout_w2[31:0] 	[get_hw_ilas hw_ila_3]
create_hw_probe -map probe0[64]     	fifo_empty[0] 		[get_hw_ilas hw_ila_3]
create_hw_probe -map probe0[65]     	fifo_almost_empty[0][get_hw_ilas hw_ila_3]

create_hw_probe -map probe0[31:0]     	fifo_din[31:0]		[get_hw_ilas hw_ila_2]
create_hw_probe -map probe0[32]     	fifo_wr_ack[0]		[get_hw_ilas hw_ila_2]
create_hw_probe -map probe0[33]     	fifo_full[0]		[get_hw_ilas hw_ila_2]
create_hw_probe -map probe0[34]     	fifo_almost_full[0]	[get_hw_ilas hw_ila_2]
