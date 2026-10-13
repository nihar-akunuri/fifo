# Synchronous FIFO in Verilog

This repository contains a compact Verilog implementation of a first-in, first-out (FIFO) buffer and a simple testbench. A FIFO stores words in arrival order, allowing a producer to write data and a consumer to read it later.

## Design overview

The main module, `fifo`, has parameters for data width and storage depth, with clocked write and read operations.

### Interface

| Signal | Direction | Description |
|---|---|---|
| `clk` | Input | Clock for read/write operations. |
| `rst` | Input | Reset request for the storage array. |
| `w_en` | Input | Write enable. |
| `r_en` | Input | Read enable. |
| `d_in[WIDTH-1:0]` | Input | Data word to write. |
| `full` | Output | Full-status flag. |
| `empty` | Output | Empty-status flag. |
| `d_out[WIDTH-1:0]` | Output | Data word read from the FIFO. |

## Files

| File | Purpose |
|---|---|
| `fifo.v` | FIFO storage array, read/write pointers, and status-flag logic. |
| `tb_fifo.v` | Generates a clock and applies reset plus a basic write/read stimulus. |

## Current implementation notes

- The default parameters are `WIDTH = 8` and `DEPTH = 8`.
- The current read/write pointers are fixed at 3 bits, so the implementation is effectively tailored to an eight-entry FIFO despite the depth parameter.
- The testbench exercises only a small example transaction; it is not a comprehensive self-checking regression.
- Full/empty boundary handling should be verified carefully before relying on this FIFO in a larger design.

## Simulation

Compile `fifo.v` and `tb_fifo.v`, then select `tb_fifo` as the simulation top. The testbench toggles the clock every 2 time units and applies reset and a sample data transfer.

## Possible improvements

- Derive pointer width from `DEPTH` and support non-power-of-two depths if required.
- Implement robust full/empty tracking, including simultaneous read/write and wraparound cases.
- Add checks for ordering, overflow, underflow, and reset behavior.

## Tools

- Verilog HDL
- Event-driven digital logic simulation
