# axis-usb

USB 2.0 (High-Speed) logic core for FPGAs, using a ULPI PHY, and with AXI-Stream interface.

## Notes

+ The core works, and has been tested on a Tang Primer 20K development board, which has a GoWin FPGA, and a ULPI PHY.

+ There is one known bug, where a one byte USB packet (from a device, to a host) will hang the core, due to a flow-control delays (through a data MUX) causing the `ulpi_encoder` module to misbehave. This will be fixed when I resume work on TART.

+ The development of this core was done in the following repositories:

  - [`misc-verilog-cores`](https://github.com/psuggate/misc-verilog-cores)

  - [`axi-ddr3-lite`](https://github.com/psuggate/axi-ddr3-lite)

  with files merged back into this repository.
  
+ There are probably some missing simulation files, and a complete, synthesisable demo can be found in [`misc-verilog-cores/synth/sipeed-tang-primer-20k`](https://github.com/psuggate/misc-verilog-cores/tree/main/synth/sipeed-tang-primer-20k), along with some Rust code (under `driver/`) for communicating with the development board.

+ Documentation and other usability improvements will be worked on soon.

+ All development was done using Ubuntu, so I have no idea of what the Windows situation is.
