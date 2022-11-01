//------------------------------------------------------------------------------
//  (c) Copyright 2013-2018 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------


`timescale 1ps/1ps

// =====================================================================================================================
// This example design top module instantiates the example design wrapper; slices vectored ports for per-channel
// assignment; and instantiates example resources such as buffers, pattern generators, and pattern checkers for core
// demonstration purposes
// =====================================================================================================================

module gth_unit_example_top (

  // Differential reference clock inputs
  input  wire mgtrefclk1_x0y3_p,
  input  wire mgtrefclk1_x0y3_n,

  // Serial data ports for transceiver channel 0
  input  wire ch0_gthrxn_in,
  input  wire ch0_gthrxp_in,
  output wire ch0_gthtxn_out,
  output wire ch0_gthtxp_out,

  // User-provided ports for reset helper block(s)
  //input  wire hb_gtwiz_reset_clk_freerun_in,
  input  wire hb_gtwiz_reset_clk_freerun_in_p,
  input  wire hb_gtwiz_reset_clk_freerun_in_n,
  input  wire hb_gtwiz_reset_all_in,

  // PRBS-based link status ports
  input  wire link_down_latched_reset_in,
  output wire link_status_out,
  output reg  link_down_latched_out = 1'b1

);


  // ===================================================================================================================
  // PER-CHANNEL SIGNAL ASSIGNMENTS
  // ===================================================================================================================

  // The core and example design wrapper vectorize ports across all enabled transceiver channel and common instances for
  // simplicity and compactness. This example design top module assigns slices of each vector to individual, per-channel
  // signal vectors for use if desired. Signals which connect to helper blocks are prefixed "hb#", signals which connect
  // to transceiver common primitives are prefixed "cm#", and signals which connect to transceiver channel primitives
  // are prefixed "ch#", where "#" is the sequential resource number.

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gthrxn_int;
  assign gthrxn_int[0:0] = ch0_gthrxn_in;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gthrxp_int;
  assign gthrxp_int[0:0] = ch0_gthrxp_in;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gthtxn_int;
  assign ch0_gthtxn_out = gthtxn_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gthtxp_int;
  assign ch0_gthtxp_out = gthtxp_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_reset_int;
  wire [0:0] hb0_gtwiz_userclk_tx_reset_int;
  assign gtwiz_userclk_tx_reset_int[0:0] = hb0_gtwiz_userclk_tx_reset_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_srcclk_int;
  wire [0:0] hb0_gtwiz_userclk_tx_srcclk_int;
  assign hb0_gtwiz_userclk_tx_srcclk_int = gtwiz_userclk_tx_srcclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_usrclk_int;
  wire [0:0] hb0_gtwiz_userclk_tx_usrclk_int;
  assign hb0_gtwiz_userclk_tx_usrclk_int = gtwiz_userclk_tx_usrclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_usrclk2_int;
  wire [0:0] hb0_gtwiz_userclk_tx_usrclk2_int;
  assign hb0_gtwiz_userclk_tx_usrclk2_int = gtwiz_userclk_tx_usrclk2_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_active_int;
  wire [0:0] hb0_gtwiz_userclk_tx_active_int;
  assign hb0_gtwiz_userclk_tx_active_int = gtwiz_userclk_tx_active_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_reset_int;
  wire [0:0] hb0_gtwiz_userclk_rx_reset_int;
  assign gtwiz_userclk_rx_reset_int[0:0] = hb0_gtwiz_userclk_rx_reset_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_srcclk_int;
  wire [0:0] hb0_gtwiz_userclk_rx_srcclk_int;
  assign hb0_gtwiz_userclk_rx_srcclk_int = gtwiz_userclk_rx_srcclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_usrclk_int;
  wire [0:0] hb0_gtwiz_userclk_rx_usrclk_int;
  assign hb0_gtwiz_userclk_rx_usrclk_int = gtwiz_userclk_rx_usrclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_usrclk2_int;
  wire [0:0] hb0_gtwiz_userclk_rx_usrclk2_int;
  assign hb0_gtwiz_userclk_rx_usrclk2_int = gtwiz_userclk_rx_usrclk2_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_active_int;
  wire [0:0] hb0_gtwiz_userclk_rx_active_int;
  assign hb0_gtwiz_userclk_rx_active_int = gtwiz_userclk_rx_active_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_clk_freerun_int;
  wire [0:0] hb0_gtwiz_reset_clk_freerun_int = 1'b0;
  assign gtwiz_reset_clk_freerun_int[0:0] = hb0_gtwiz_reset_clk_freerun_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_all_int;
  wire [0:0] hb0_gtwiz_reset_all_int = 1'b0;
  assign gtwiz_reset_all_int[0:0] = hb0_gtwiz_reset_all_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_tx_pll_and_datapath_int;
  wire [0:0] hb0_gtwiz_reset_tx_pll_and_datapath_int;
  assign gtwiz_reset_tx_pll_and_datapath_int[0:0] = hb0_gtwiz_reset_tx_pll_and_datapath_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_tx_datapath_int;
  wire [0:0] hb0_gtwiz_reset_tx_datapath_int;
  assign gtwiz_reset_tx_datapath_int[0:0] = hb0_gtwiz_reset_tx_datapath_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_rx_pll_and_datapath_int;
  wire [0:0] hb0_gtwiz_reset_rx_pll_and_datapath_int = 1'b0;
  assign gtwiz_reset_rx_pll_and_datapath_int[0:0] = hb0_gtwiz_reset_rx_pll_and_datapath_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_rx_datapath_int;
  wire [0:0] hb0_gtwiz_reset_rx_datapath_int = 1'b0;
  assign gtwiz_reset_rx_datapath_int[0:0] = hb0_gtwiz_reset_rx_datapath_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_rx_cdr_stable_int;
  wire [0:0] hb0_gtwiz_reset_rx_cdr_stable_int;
  assign hb0_gtwiz_reset_rx_cdr_stable_int = gtwiz_reset_rx_cdr_stable_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_tx_done_int;
  wire [0:0] hb0_gtwiz_reset_tx_done_int;
  assign hb0_gtwiz_reset_tx_done_int = gtwiz_reset_tx_done_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_rx_done_int;
  wire [0:0] hb0_gtwiz_reset_rx_done_int;
  assign hb0_gtwiz_reset_rx_done_int = gtwiz_reset_rx_done_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [31:0] gtwiz_userdata_tx_int;
  wire [31:0] hb0_gtwiz_userdata_tx_int;
  assign gtwiz_userdata_tx_int[31:0] = hb0_gtwiz_userdata_tx_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [31:0] gtwiz_userdata_rx_int;
  wire [31:0] hb0_gtwiz_userdata_rx_int;
  assign hb0_gtwiz_userdata_rx_int = gtwiz_userdata_rx_int[31:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtrefclk00_int;
  wire [0:0] cm0_gtrefclk00_int;
  assign gtrefclk00_int[0:0] = cm0_gtrefclk00_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] qpll0outclk_int;
  wire [0:0] cm0_qpll0outclk_int;
  assign cm0_qpll0outclk_int = qpll0outclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] qpll0outrefclk_int;
  wire [0:0] cm0_qpll0outrefclk_int;
  assign cm0_qpll0outrefclk_int = qpll0outrefclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rx8b10ben_int;
  wire [0:0] ch0_rx8b10ben_int = 1'b1;
  assign rx8b10ben_int[0:0] = ch0_rx8b10ben_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxcommadeten_int;
  wire [0:0] ch0_rxcommadeten_int = 1'b1;
  assign rxcommadeten_int[0:0] = ch0_rxcommadeten_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxmcommaalignen_int;
  wire [0:0] ch0_rxmcommaalignen_int = 1'b1;
  assign rxmcommaalignen_int[0:0] = ch0_rxmcommaalignen_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxpcommaalignen_int;
  wire [0:0] ch0_rxpcommaalignen_int = 1'b1;
  assign rxpcommaalignen_int[0:0] = ch0_rxpcommaalignen_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] tx8b10ben_int;
  wire [0:0] ch0_tx8b10ben_int = 1'b1;
  assign tx8b10ben_int[0:0] = ch0_tx8b10ben_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [15:0] txctrl0_int;
  wire [15:0] ch0_txctrl0_int;
  assign txctrl0_int[15:0] = ch0_txctrl0_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [15:0] txctrl1_int;
  wire [15:0] ch0_txctrl1_int;
  assign txctrl1_int[15:0] = ch0_txctrl1_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [7:0] txctrl2_int;
  wire [7:0] ch0_txctrl2_int;
  assign txctrl2_int[7:0] = ch0_txctrl2_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtpowergood_int;
  wire [0:0] ch0_gtpowergood_int;
  assign ch0_gtpowergood_int = gtpowergood_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxbyteisaligned_int;
  wire [0:0] ch0_rxbyteisaligned_int;
  assign ch0_rxbyteisaligned_int = rxbyteisaligned_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxbyterealign_int;
  wire [0:0] ch0_rxbyterealign_int;
  assign ch0_rxbyterealign_int = rxbyterealign_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxcommadet_int;
  wire [0:0] ch0_rxcommadet_int;
  assign ch0_rxcommadet_int = rxcommadet_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [15:0] rxctrl0_int;
  wire [15:0] ch0_rxctrl0_int;
  assign ch0_rxctrl0_int = rxctrl0_int[15:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [15:0] rxctrl1_int;
  wire [15:0] ch0_rxctrl1_int;
  assign ch0_rxctrl1_int = rxctrl1_int[15:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [7:0] rxctrl2_int;
  wire [7:0] ch0_rxctrl2_int;
  assign ch0_rxctrl2_int = rxctrl2_int[7:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [7:0] rxctrl3_int;
  wire [7:0] ch0_rxctrl3_int;
  assign ch0_rxctrl3_int = rxctrl3_int[7:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxpmaresetdone_int;
  wire [0:0] ch0_rxpmaresetdone_int;
  assign ch0_rxpmaresetdone_int = rxpmaresetdone_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxprgdivresetdone_int;
  wire [0:0] ch0_rxprgdivresetdone_int;
  assign ch0_rxprgdivresetdone_int = rxprgdivresetdone_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] txpmaresetdone_int;
  wire [0:0] ch0_txpmaresetdone_int;
  assign ch0_txpmaresetdone_int = txpmaresetdone_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] txprgdivresetdone_int;
  wire [0:0] ch0_txprgdivresetdone_int;
  assign ch0_txprgdivresetdone_int = txprgdivresetdone_int[0:0];


  // ===================================================================================================================
  // BUFFERS
  // ===================================================================================================================

  // Buffer the hb_gtwiz_reset_all_in input and logically combine it with the internal signal from the example
  // initialization block as well as the VIO-sourced reset
  wire hb_gtwiz_reset_all_vio_int;
  wire hb_gtwiz_reset_all_buf_int;
  wire hb_gtwiz_reset_all_init_int;
  wire hb_gtwiz_reset_all_int;

  // IBUF ibuf_hb_gtwiz_reset_all_inst (
  //   .I (hb_gtwiz_reset_all_in),
  //   .O (hb_gtwiz_reset_all_buf_int)
  // );

  assign hb_gtwiz_reset_all_int = hb_gtwiz_reset_all_buf_int || hb_gtwiz_reset_all_init_int || hb_gtwiz_reset_all_vio_int;

  // Globally buffer the free-running input clock
  wire hb_gtwiz_reset_clk_freerun_buf_int;
  wire hb_gtwiz_reset_clk_freerun_in_buff;

  BUFG bufg_clk_freerun_inst (
    .I (hb_gtwiz_reset_clk_freerun_in_buff),
    .O (hb_gtwiz_reset_clk_freerun_buf_int)
  );

  
  IBUFDS bufds_clk_freerun_inst (
     .I (hb_gtwiz_reset_clk_freerun_in_p),
     .IB (hb_gtwiz_reset_clk_freerun_in_n),
     .O   (hb_gtwiz_reset_clk_freerun_in_buff)
  );

  //MMCM input clock
  wire mmcm_clk_in;
  
  BUFG_GT mmcm_ckl_inst (
    .O                  (mmcm_clk_in)
    ,.CE                (1'b1)
    ,.CEMASK            (1'b0)
    ,.CLR               (1'b0)
    ,.CLRMASK           (1'b0)
    ,.DIV               (3'b000)
    ,.I                 (mgtrefclk1_div2_x0y3_int)
);
  
  // Instantiate a differential reference clock buffer for each reference clock differential pair in this configuration,
  // and assign the single-ended output of each differential reference clock buffer to the appropriate PLL input signal

  // Differential reference clock buffer for MGTREFCLK1_X0Y3
  wire mgtrefclk1_x0y3_int;
  wire mgtrefclk1_div2_x0y3_int;

  IBUFDS_GTE3 #(
    .REFCLK_EN_TX_PATH  (1'b0),
    .REFCLK_HROW_CK_SEL (2'b00),
    .REFCLK_ICNTL_RX    (2'b00)
  ) IBUFDS_GTE3_MGTREFCLK1_X0Y3_INST (
    .I     (mgtrefclk1_x0y3_p),
    .IB    (mgtrefclk1_x0y3_n),
    .CEB   (1'b0),
    .O     (mgtrefclk1_x0y3_int),
    .ODIV2 (mgtrefclk1_div2_x0y3_int)
  );

  assign cm0_gtrefclk00_int = mgtrefclk1_x0y3_int;


  // ===================================================================================================================
  // USER CLOCKING RESETS
  // ===================================================================================================================

  // The TX user clocking helper block should be held in reset until the clock source of that block is known to be
  // stable. The following assignment is an example of how that stability can be determined, based on the selected TX
  // user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.
  assign hb0_gtwiz_userclk_tx_reset_int = ~(&txprgdivresetdone_int && &txpmaresetdone_int);

  // The RX user clocking helper block should be held in reset until the clock source of that block is known to be
  // stable. The following assignment is an example of how that stability can be determined, based on the selected RX
  // user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.
  assign hb0_gtwiz_userclk_rx_reset_int = ~(&rxprgdivresetdone_int && &rxpmaresetdone_int);


  // ===================================================================================================================
  // PRBS STIMULUS, CHECKING, AND LINK MANAGEMENT
  // ===================================================================================================================

  // PRBS stimulus
  // -------------------------------------------------------------------------------------------------------------------

  // PRBS-based data stimulus module for transceiver channel 0
  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_stimulus_8b10b example_stimulus_inst0 (
    .gtwiz_reset_all_in          (hb_gtwiz_reset_all_int || ~hb0_gtwiz_reset_rx_done_int ),
    .gtwiz_userclk_tx_usrclk2_in (hb0_gtwiz_userclk_tx_usrclk2_int),
    .gtwiz_userclk_tx_active_in  (hb0_gtwiz_userclk_tx_active_int),
    .txctrl0_out                 (ch0_txctrl0_int),
    .txctrl1_out                 (ch0_txctrl1_int),
    .txctrl2_out                 (ch0_txctrl2_int),
    .txdata_out                  (hb0_gtwiz_userdata_tx_int)
  );

  // PRBS checking
  // -------------------------------------------------------------------------------------------------------------------

  // Declare a signal vector of PRBS match indicators, with one indicator bit per transceiver channel
  wire [0:0] prbs_match_int;


  // PRBS-based data checking module for transceiver channel 0
  gth_unit_example_checking_8b10b example_checking_inst0 (
    .gtwiz_reset_all_in          (hb_gtwiz_reset_all_int || ~hb0_gtwiz_reset_rx_done_int ),
    .gtwiz_userclk_rx_usrclk2_in (hb0_gtwiz_userclk_rx_usrclk2_int),
    .gtwiz_userclk_rx_active_in  (hb0_gtwiz_userclk_rx_active_int),
    .rxctrl0_in                  (ch0_rxctrl0_int),
    .rxctrl1_in                  (ch0_rxctrl1_int),
    .rxctrl2_in                  (ch0_rxctrl2_int),
    .rxctrl3_in                  (ch0_rxctrl3_int),
    .rxdata_in                   (hb0_gtwiz_userdata_rx_int),
    .prbs_match_out              (prbs_match_int[0])
  );

  // PRBS match and related link management
  // -------------------------------------------------------------------------------------------------------------------

  // Perform a bitwise NAND of all PRBS match indicators, creating a combinatorial indication of any PRBS mismatch
  // across all transceiver channels
  wire prbs_error_any_async = ~(&prbs_match_int);
  wire prbs_error_any_sync;

  // Synchronize the PRBS mismatch indicator the free-running clock domain, using a reset synchronizer with asynchronous
  // reset and synchronous removal
  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_reset_synchronizer reset_synchronizer_prbs_match_all_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .rst_in (prbs_error_any_async),
    .rst_out(prbs_error_any_sync)
  );

  // Implement an example link status state machine using a simple leaky bucket mechanism. The link status indicates
  // the continual PRBS match status to both the top-level observer and the initialization state machine, while being
  // tolerant of occasional bit errors. This is an example and can be modified as necessary.
  localparam ST_LINK_DOWN = 1'b0;
  localparam ST_LINK_UP   = 1'b1;
  reg        sm_link      = ST_LINK_DOWN;
  reg [6:0]  link_ctr     = 7'd0;

  always @(posedge hb_gtwiz_reset_clk_freerun_buf_int) begin
    case (sm_link)
      // The link is considered to be down when the link counter initially has a value less than 67. When the link is
      // down, the counter is incremented on each cycle where all PRBS bits match, but reset whenever any PRBS mismatch
      // occurs. When the link counter reaches 67, transition to the link up state.
      ST_LINK_DOWN: begin
        if (prbs_error_any_sync !== 1'b0) begin
          link_ctr <= 7'd0;
        end
        else begin
          if (link_ctr < 7'd67)
            link_ctr <= link_ctr + 7'd1;
          else
            sm_link <= ST_LINK_UP;
        end
      end

      // When the link is up, the link counter is decreased by 34 whenever any PRBS mismatch occurs, but is increased by
      // only 1 on each cycle where all PRBS bits match, up to its saturation point of 67. If the link counter reaches
      // 0 (including rollover protection), transition to the link down state.
      ST_LINK_UP: begin
        if (prbs_error_any_sync !== 1'b0) begin
          if (link_ctr > 7'd33) begin
            link_ctr <= link_ctr - 7'd34;
            if (link_ctr == 7'd34)
              sm_link  <= ST_LINK_DOWN;
          end
          else begin
            link_ctr <= 7'd0;
            sm_link  <= ST_LINK_DOWN;
          end
        end
        else begin
          if (link_ctr < 7'd67)
            link_ctr <= link_ctr + 7'd1;
        end
      end
    endcase
  end

  // Synchronize the latched link down reset input and the VIO-driven signal into the free-running clock domain
  wire link_down_latched_reset_vio_int;
  wire link_down_latched_reset_sync;

  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_bit_synchronizer bit_synchronizer_link_down_latched_reset_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   ( link_down_latched_reset_in || link_down_latched_reset_vio_int),
    .o_out  (link_down_latched_reset_sync)
  );

  // Reset the latched link down indicator when the synchronized latched link down reset signal is high. Otherwise, set
  // the latched link down indicator upon losing link. This indicator is available for user reference.
  always @(posedge hb_gtwiz_reset_clk_freerun_buf_int) begin
    if (link_down_latched_reset_sync)
       link_down_latched_out <= 1'b0;
     else if (!sm_link)
       link_down_latched_out <= 1'b1;
  end

  // Assign the link status indicator to the top-level two-state output for user reference
  assign link_status_out = sm_link;


  // ===================================================================================================================
  // INITIALIZATION
  // ===================================================================================================================

  // Declare the receiver reset signals that interface to the reset controller helper block. For this configuration,
  // which uses the same PLL type for transmitter and receiver, the "reset RX PLL and datapath" feature is not used.
  wire hb_gtwiz_reset_rx_pll_and_datapath_int = 1'b0;
  wire hb_gtwiz_reset_rx_datapath_int;

  // Declare signals which connect the VIO instance to the initialization module for debug purposes
  wire       init_done_int;
  wire [3:0] init_retry_ctr_int;

  // Combine the receiver reset signals form the initialization module and the VIO to drive the appropriate reset
  // controller helper block reset input
  wire hb_gtwiz_reset_rx_pll_and_datapath_vio_int;
  wire hb_gtwiz_reset_rx_datapath_vio_int;
  wire hb_gtwiz_reset_rx_datapath_init_int;

  assign hb_gtwiz_reset_rx_datapath_int = hb_gtwiz_reset_rx_datapath_init_int || hb_gtwiz_reset_rx_datapath_vio_int;

  // The example initialization module interacts with the reset controller helper block and other example design logic
  // to retry failed reset attempts in order to mitigate bring-up issues such as initially-unavilable reference clocks
  // or data connections. It also resets the receiver in the event of link loss in an attempt to regain link, so please
  // note the possibility that this behavior can have the effect of overriding or disturbing user-provided inputs that
  // destabilize the data stream. It is a demonstration only and can be modified to suit your system needs.
  gth_unit_example_init example_init_inst (
    .clk_freerun_in  (hb_gtwiz_reset_clk_freerun_buf_int),
    .reset_all_in    (hb_gtwiz_reset_all_int),
    .tx_init_done_in (gtwiz_reset_tx_done_int),
    .rx_init_done_in (gtwiz_reset_rx_done_int),
    .rx_data_good_in (sm_link),
    .reset_all_out   (hb_gtwiz_reset_all_init_int),
    .reset_rx_out    (hb_gtwiz_reset_rx_datapath_init_int),
    .init_done_out   (init_done_int),
    .retry_ctr_out   (init_retry_ctr_int)
  );


  // ===================================================================================================================
  // VIO FOR HARDWARE BRING-UP AND DEBUG
  // ===================================================================================================================

  // Synchronize gtpowergood into the free-running clock domain for VIO usage
  wire [0:0] gtpowergood_vio_sync;

  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_bit_synchronizer bit_synchronizer_vio_gtpowergood_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (gtpowergood_int[0]),
    .o_out  (gtpowergood_vio_sync[0])
  );

  // Synchronize txprgdivresetdone into the free-running clock domain for VIO usage
  wire [0:0] txprgdivresetdone_vio_sync;

  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_bit_synchronizer bit_synchronizer_vio_txprgdivresetdone_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (txprgdivresetdone_int[0]),
    .o_out  (txprgdivresetdone_vio_sync[0])
  );

  // Synchronize rxprgdivresetdone into the free-running clock domain for VIO usage
  wire [0:0] rxprgdivresetdone_vio_sync;

  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_bit_synchronizer bit_synchronizer_vio_rxprgdivresetdone_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (rxprgdivresetdone_int[0]),
    .o_out  (rxprgdivresetdone_vio_sync[0])
  );

  // Synchronize txpmaresetdone into the free-running clock domain for VIO usage
  wire [0:0] txpmaresetdone_vio_sync;

  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_bit_synchronizer bit_synchronizer_vio_txpmaresetdone_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (txpmaresetdone_int[0]),
    .o_out  (txpmaresetdone_vio_sync[0])
  );

  // Synchronize rxpmaresetdone into the free-running clock domain for VIO usage
  wire [0:0] rxpmaresetdone_vio_sync;

  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_bit_synchronizer bit_synchronizer_vio_rxpmaresetdone_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (rxpmaresetdone_int[0]),
    .o_out  (rxpmaresetdone_vio_sync[0])
  );

  // Synchronize gtwiz_reset_tx_done into the free-running clock domain for VIO usage
  wire [0:0] gtwiz_reset_tx_done_vio_sync;

  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_bit_synchronizer bit_synchronizer_vio_gtwiz_reset_tx_done_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (gtwiz_reset_tx_done_int[0]),
    .o_out  (gtwiz_reset_tx_done_vio_sync[0])
  );

  // Synchronize gtwiz_reset_rx_done into the free-running clock domain for VIO usage
  wire [0:0] gtwiz_reset_rx_done_vio_sync;

  (* DONT_TOUCH = "TRUE" *)
  gth_unit_example_bit_synchronizer bit_synchronizer_vio_gtwiz_reset_rx_done_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (gtwiz_reset_rx_done_int[0]),
    .o_out  (gtwiz_reset_rx_done_vio_sync[0])
  );


  // Instantiate the VIO IP core for hardware bring-up and debug purposes, connecting relevant debug and analysis
  // signals which have been enabled during Wizard IP customization. This initial set of connected signals is
  // provided as a convenience and example, but more or fewer ports can be used as needed; simply re-customize and
  // re-generate the VIO instance, then connect any exposed signals that are needed. Signals which are synchronous to
  // clocks other than the free-running clock will require synchronization. For usage, refer to Vivado Design Suite
  // User Guide: Programming and Debugging (UG908)
  gth_unit_vio_0 gth_unit_vio_0_inst (
    .clk (hb_gtwiz_reset_clk_freerun_buf_int)
    ,.probe_in0 (link_status_out)
    ,.probe_in1 (link_down_latched_out)
    ,.probe_in2 (init_done_int)
    ,.probe_in3 (init_retry_ctr_int)
    ,.probe_in4 (gtpowergood_vio_sync)
    ,.probe_in5 (txprgdivresetdone_vio_sync)
    ,.probe_in6 (rxprgdivresetdone_vio_sync)
    ,.probe_in7 (txpmaresetdone_vio_sync)
    ,.probe_in8 (rxpmaresetdone_vio_sync)
    ,.probe_in9 (gtwiz_reset_tx_done_vio_sync)
    ,.probe_in10 (gtwiz_reset_rx_done_vio_sync)
    ,.probe_out0 (hb_gtwiz_reset_all_vio_int)
    ,.probe_out1 (hb0_gtwiz_reset_tx_pll_and_datapath_int)
    ,.probe_out2 (hb0_gtwiz_reset_tx_datapath_int)
    ,.probe_out3 (hb_gtwiz_reset_rx_pll_and_datapath_vio_int)
    ,.probe_out4 (hb_gtwiz_reset_rx_datapath_vio_int)
    ,.probe_out5 (link_down_latched_reset_vio_int)
  );


  // ===================================================================================================================
  // EXAMPLE WRAPPER INSTANCE
  // ===================================================================================================================

  // Instantiate the example design wrapper, mapping its enabled ports to per-channel internal signals and example
  // resources as appropriate
  gth_unit_example_wrapper example_wrapper_inst (
    .gthrxn_in                               (gthrxn_int)
   ,.gthrxp_in                               (gthrxp_int)
   ,.gthtxn_out                              (gthtxn_int)
   ,.gthtxp_out                              (gthtxp_int)
   ,.gtwiz_userclk_tx_reset_in               (gtwiz_userclk_tx_reset_int)
   ,.gtwiz_userclk_tx_srcclk_out             (gtwiz_userclk_tx_srcclk_int)
   ,.gtwiz_userclk_tx_usrclk_out             (gtwiz_userclk_tx_usrclk_int)
   ,.gtwiz_userclk_tx_usrclk2_out            (gtwiz_userclk_tx_usrclk2_int)
   ,.gtwiz_userclk_tx_active_out             (gtwiz_userclk_tx_active_int)
   ,.gtwiz_userclk_rx_reset_in               (gtwiz_userclk_rx_reset_int)
   ,.gtwiz_userclk_rx_srcclk_out             (gtwiz_userclk_rx_srcclk_int)
   ,.gtwiz_userclk_rx_usrclk_out             (gtwiz_userclk_rx_usrclk_int)
   ,.gtwiz_userclk_rx_usrclk2_out            (gtwiz_userclk_rx_usrclk2_int)
   ,.gtwiz_userclk_rx_active_out             (gtwiz_userclk_rx_active_int)
   ,.gtwiz_reset_clk_freerun_in              ({1{hb_gtwiz_reset_clk_freerun_buf_int}})
   ,.gtwiz_reset_all_in                      ({1{hb_gtwiz_reset_all_int}})
   ,.gtwiz_reset_tx_pll_and_datapath_in      (gtwiz_reset_tx_pll_and_datapath_int)
   ,.gtwiz_reset_tx_datapath_in              (gtwiz_reset_tx_datapath_int)
   ,.gtwiz_reset_rx_pll_and_datapath_in      ({1{hb_gtwiz_reset_rx_pll_and_datapath_int}})
   ,.gtwiz_reset_rx_datapath_in              ({1{hb_gtwiz_reset_rx_datapath_int}})
   ,.gtwiz_reset_rx_cdr_stable_out           (gtwiz_reset_rx_cdr_stable_int)
   ,.gtwiz_reset_tx_done_out                 (gtwiz_reset_tx_done_int)
   ,.gtwiz_reset_rx_done_out                 (gtwiz_reset_rx_done_int)
   ,.gtwiz_userdata_tx_in                    (gtwiz_userdata_tx_int)
   ,.gtwiz_userdata_rx_out                   (gtwiz_userdata_rx_int)
   ,.gtrefclk00_in                           (gtrefclk00_int)
   ,.qpll0outclk_out                         (qpll0outclk_int)
   ,.qpll0outrefclk_out                      (qpll0outrefclk_int)
   ,.rx8b10ben_in                            (rx8b10ben_int)
   ,.rxcommadeten_in                         (rxcommadeten_int)
   ,.rxmcommaalignen_in                      (rxmcommaalignen_int)
   ,.rxpcommaalignen_in                      (rxpcommaalignen_int)
   ,.tx8b10ben_in                            (tx8b10ben_int)
   ,.txctrl0_in                              (txctrl0_int)
   ,.txctrl1_in                              (txctrl1_int)
   ,.txctrl2_in                              (txctrl2_int)
   ,.gtpowergood_out                         (gtpowergood_int)
   ,.rxbyteisaligned_out                     (rxbyteisaligned_int)
   ,.rxbyterealign_out                       (rxbyterealign_int)
   ,.rxcommadet_out                          (rxcommadet_int)
   ,.rxctrl0_out                             (rxctrl0_int)
   ,.rxctrl1_out                             (rxctrl1_int)
   ,.rxctrl2_out                             (rxctrl2_int)
   ,.rxctrl3_out                             (rxctrl3_int)
   ,.rxpmaresetdone_out                      (rxpmaresetdone_int)
   ,.rxprgdivresetdone_out                   (rxprgdivresetdone_int)
   ,.txpmaresetdone_out                      (txpmaresetdone_int)
   ,.txprgdivresetdone_out                   (txprgdivresetdone_int)
);


//Add ILAs
  wire        ila_clk;
  wire [31:0] ila_trig_0;
  wire [31:0] ila_trig_1;
  wire [31:0] ila_trig_2;
  wire [15:0] ila_trig_3;
  wire [15:0] ila_trig_4;
  wire [7:0]  ila_trig_5;
  wire [7:0]  ila_trig_6;

  //assign rx_ila_clk = gtrefclk00_int;
  assign ila_clk             = hb0_gtwiz_userclk_rx_usrclk2_int;
  assign ila_trig_0[31:0]    =  hb0_gtwiz_userdata_tx_int;
  assign ila_trig_1[31:0]    =  hb0_gtwiz_userdata_rx_int;
  assign ila_trig_2[31:30]   =  prbs_match_int[0];
  assign ila_trig_2[29:28]   =  ch0_rxbyteisaligned_int;
  assign ila_trig_2[27:26]   =  ch0_rxbyterealign_int;
  assign ila_trig_2[25:24]   =  ch0_rxcommadet_int;
  assign ila_trig_2[23:22]   =  rxcommadeten_int; 
  assign ila_trig_3[15:0]    =  ch0_rxctrl0_int;
  assign ila_trig_4[15:0]    =  ch0_rxctrl1_int;
  assign ila_trig_5[7:0]     =  ch0_rxctrl2_int;
  assign ila_trig_6[7:0]     =  ch0_rxctrl3_int;
  
  
txrx_ila ila_ex (
  .clk(ila_clk),
  .probe0(ila_trig_0), // input [15 : 0] PROBE0
  .probe1(ila_trig_1), // input [15 : 0] PROBE1
  .probe2(ila_trig_2),
  .probe3(ila_trig_3),
  .probe4(ila_trig_4),
  .probe5(ila_trig_5),
  .probe6(ila_trig_6)
);


 wire [31:0]  fifo_din;
 assign fifo_din = hb0_gtwiz_userdata_tx_int; //first block
 wire fifo_wr_en    ;
 wire fifo_rd_en    ;
 wire [31:0]  fifo_dout;
 wire fifo_full;
 wire fifo_almost_full  ;
 wire fifo_empty        ;
 wire fifo_almost_empty ;
 wire [10:0] fifo_rd_data_count;
 wire [9:0] fifo_wr_data_count;
 wire fifo_wr_rst_busy  ;
 wire fifo_rd_rst_busy  ;
 wire fifo_wr_ack;
 wire fifo_valid;
 wire fifo_underflow;
 
 assign fifo_wr_en = ~gtwiz_userclk_tx_reset_int;
 assign fifo_rd_en = ~fifo_almost_empty;
 
 //adding FIFO
 fifo_generator_0 fifo (
    .rst                (gtwiz_userclk_rx_reset_int)
    ,.wr_clk            (gtwiz_userclk_tx_usrclk2_int)
    ,.rd_clk            (gtwiz_userclk_rx_usrclk2_int)
    ,.din               (fifo_din)
    ,.wr_en             (fifo_wr_en)
    ,.rd_en             (fifo_rd_en)
    ,.dout              (fifo_dout)
    ,.full              (fifo_full)
    ,.almost_full       (fifo_almost_full)
    ,.valid             (fifo_valid)
    ,.underflow         (fifo_underflow)
    ,.empty             (fifo_empty)
    ,.almost_empty      (fifo_almost_empty)
    ,.rd_data_count     (fifo_rd_data_count)
    ,.wr_data_count     (fifo_wr_data_count)
    ,.wr_rst_busy       (fifo_wr_rst_busy)
    ,.rd_rst_busy       (fifo_rd_rst_busy)
    ,.wr_ack            (fifo_wr_ack)
    );
 

  wire [79:0]  ila_fifo_rd_0;
  assign ila_fifo_rd_0[63:0]  =  fifo_dout;
  assign ila_fifo_rd_0[64]     =  fifo_empty;
  assign ila_fifo_rd_0[65]     =  fifo_almost_empty;
  
fifo_rd_ila rd_fifo_ila (
    .clk(wiz_clk_hlf)
    ,.probe0(ila_fifo_rd_0)
);


wire wiz_clk_same ;
wire wiz_clk_dbl;
wire wiz_clk_hlf;
wire wiz_locked;

clk_wiz_0 clock_generator (
  // Clock out ports  
  .clk_same         (wiz_clk_same)
  ,.clk_double       (wiz_clk_dbl)
  ,.clk_half         (wiz_clk_hlf)
  // Status and control signals               
  ,.reset            (gtwiz_userclk_tx_reset_int)
  ,.locked           (wiz_locked)
 // Clock in ports
  ,.clk_in1          (mmcm_clk_in)
  );

 wire [31:0] check_txdata_fifo;
 wire berr_fifo_full;
 wire berr_fifo_almost_full  ;
 wire berr_fifo_empty        ;
 wire berr_fifo_almost_empty ;
 wire berr_fifo_wr_rst_busy  ;
 wire berr_fifo_rd_rst_busy  ;
 wire berr_fifo_wr_ack;
 wire berr_fifo_valid;
 wire berr_fifo_underflow;
 
 wire berr_rd_en = ( (~ch0_rxcommadet_int[0]) && ch0_rxbyteisaligned_int );
 wire berr_wr_en = ( (~txctrl2_int[0]) &&  gtwiz_userdata_tx_int !== 32'b0) ;
 
berr_fifo fifo_berr( 
  .wr_rst             (gtwiz_userclk_tx_reset_int)
  ,.wr_clk            (gtwiz_userclk_tx_usrclk2_int)
  ,.rd_rst            (gtwiz_userclk_rx_reset_int)
  ,.rd_clk            (gtwiz_userclk_rx_usrclk2_int)
  ,.din               (hb0_gtwiz_userdata_tx_int)
  ,.wr_en             (berr_wr_en)
  ,.rd_en             (berr_rd_en)
  ,.dout              (check_txdata_fifo)
  ,.full              (berr_fifo_full)
  ,.almost_full       (berr_fifo_almost_full)
  ,.valid             (berr_fifo_valid)
  ,.underflow         (berr_fifo_underflow)
  ,.empty             (berr_fifo_empty)
  ,.almost_empty      (berr_fifo_almost_empty)
  ,.wr_ack            (berr_fifo_wr_ack)
);    


  integer nbits_tot = 0;
  integer nbits_unmatched = 0;

  always @(posedge gtwiz_userclk_rx_usrclk2_int && berr_rd_en == 1'b1) begin
      nbits_tot <= nbits_tot + 1;
      if ( check_txdata_fifo != gtwiz_userdata_rx_int )begin
          nbits_unmatched <= nbits_unmatched + 1;
      end
  end

  wire [63:0]  ila_fifo_0;
  wire [63:0]  ila_fifo_1;


  assign ila_fifo_0[31:0]  =  check_txdata_fifo;
  assign ila_fifo_0[63:32] =  gtwiz_userdata_rx_int;
  assign ila_fifo_1[31:0]  =  nbits_tot;
  assign ila_fifo_1[63:32] =  nbits_unmatched;
  
  
fifo_ila ila_fifo (
  .clk(gtwiz_userclk_rx_usrclk2_int),
  .probe0(ila_fifo_0), // input [15 : 0] PROBE0
  .probe1(ila_fifo_1) // input [15 : 0] PROBE1
);



endmodule