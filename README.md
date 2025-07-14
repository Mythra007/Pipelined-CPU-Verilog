# Pipelined-CPU-Verilog
A simple pipelined CPU design in Verilog with basic control logic and memory units.
# Pipelined CPU Design (Verilog)

This project implements a basic pipelined CPU in Verilog with the following features:

- **Instruction Fetch (IF)**
- **Instruction Decode (ID)**
- **Execution (EX)**
- **Memory Access (MEM)**
- **Write Back (WB)**

## Supported Instructions

- `LOAD Rx, Mem[Addr]`
- `OUT Rx`
- `ADD`, `SUB`, `COMPARE`, `JUMP` (under `SPECIAL` opcode)

## Files Overview

| File                | Description                                 |
|---------------------|---------------------------------------------|
| `cpu_top.v`         | Top module integrating all units            |
| `control_unit.v`    | Generates control signals                   |
| `data_memory.v`     | Simple RAM used as memory                   |
| `output_module.v`   | Sends selected result to output             |
| `flags.v`           | Sets Zero/Negative flags                    |
| `testbench.v`       | Used to simulate the CPU                    |
| `program.txt`       | Program instructions loaded into memory     |
| `IF_ID.v`, etc.     | Pipeline registers for each stage           |

## Running the Project

1. Open in **Vivado**
2. Load source files from `srcs/`
3. Run simulation on `testbench.v`
4. Observe waveforms using simulation tools

## Status

- [x] Basic pipelining implemented
- [x] Conditional operations tested
- [ ] Hazard detection not implemented (yet)

## Future Improvements

- Add hazard detection
- Expand instruction set
- Better testbench automation
- Memory-Mapped I/O
- Cache Integration
- FPGA Implementation
- GUI-Based Instruction Entry (Advanced)

---

> Built as part of a learning project using Verilog and Vivado.

