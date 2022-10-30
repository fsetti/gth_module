# ODMB7/5 Development

This repository contains the most up to date version of firmware for optical communication. Currently the firmware has only been tested on the KCU105 board, for the future we expect to add the ODMB5 and ODMB7 boards to the list.

## Structure

### KCU105 firmware
The top modules of KCU105 firmwares are contained in [gth_unit_example_top.v](/imports/gth_unit_example_top.v).
Their project may also contain different set of files and IPs, managed by different Vivado projects, [gth_unit_ex.xpr](gth_unit_ex.xpr) for the KCU105 board.

#### I/O signals naming convention
- The naming of the signals in the top modules follow the signal names that connected directly to the FPGA in the respective schematics as much as possible, except when they can be
  improved to give more clarity. In such case (e.g. `C_TDO` --> `DCFEB_TDO`, `DONE` --> `DCFEB_DONE`), the actual signal name is listed in the comment of the top file.

- The position of the pin (which Bank it is connected to) shall be attached as comment in the entity declaration.

- Every connected signal is assigned a corresponding signal in the top module entity declaration to keep the record, even if they are unused. An exception is made to the `EMCCLK` 
  pin and the primary PROM programming pins.

### Simulation testbench
The HDL code specific for simulation are under the [simulation](/simulation) folder. This will contain the simulation wrapper for KCU105 firmware. LUTs are used to provide VME commands to the KCU105.

