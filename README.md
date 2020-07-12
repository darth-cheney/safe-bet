# Safe Bet: The RISC-V ISA in Smalltalk #
This repository contains an initial implementation of the RISC-V ISA in Squeak.

## What is this? ##
This repository contains the 32I RISC-V instructions implemented as Smalltalk objects. It also contains basic simulations of a RISC-V CPU and Memory structure, so that you can load collections of these instructions and run themin a simulated environment.
  
This package also contains a series of comprehensive tests for each instruction, including desired execution.
  
Every effort has been made to comply with the [RISC-V Spec](https://riscv.org/specifications/), but there are sure to be errors along the way. Please report as issues if you come across them!
  
## Work So Far ##
This initial version only contains the 32I portion of the unprivileged instruction set, without any of the extensions 
(yet). Future work will include the basic extensions plus the basic 64I instructions.
  
## Future Directions ##
Because this infrastructure allows us to simulate and also produce byte-accurate RISC-V binaries, this package could be the foundation of many things, from a Smalltalk-based RV assembler to a simulation environment for designing custom RISC-V systems.
