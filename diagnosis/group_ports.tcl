# # ILAs
create_hw_probe -map probe0[63:32]     	fifo_dout_w1[31:0] 	[get_hw_ilas hw_ila_3]
create_hw_probe -map probe0[31:0]     	fifo_dout_w2[31:0] 	[get_hw_ilas hw_ila_3]
create_hw_probe -map probe0[64]     	fifo_empty[0] 		[get_hw_ilas hw_ila_3]
create_hw_probe -map probe0[65]     	fifo_almost_empty[0][get_hw_ilas hw_ila_3]

create_hw_probe -map probe0[31:0]     	tx_data_out[31:0]	[get_hw_ilas hw_ila_2]
create_hw_probe -map probe0[63:32]     	rx_data_in[31:0]	[get_hw_ilas hw_ila_2]
create_hw_probe -map probe1[31:0]     	nBitsTot[31:0]		[get_hw_ilas hw_ila_2]
create_hw_probe -map probe1[63:32]     	nBitsUnmtch[31:0]	[get_hw_ilas hw_ila_2]
