# Safe Bet: The RISC-V ISA in Smalltalk #
This repository contains an initial implementation of the RISC-V ISA in Squeak.

## What is this? ##
This repository contains the 32I RISC-V instructions implemented as Smalltalk objects. It also contains basic simulations of a RISC-V CPU and Memory structure, so that you can load collections of these instructions and run them in a simulated environment.
  
This package also contains a series of comprehensive tests for each instruction, including desired execution.
  
Every effort has been made to comply with the [RISC-V Spec](https://riscv.org/specifications/), but there are sure to be errors along the way. Please report as issues if you come across them!
  
## Work So Far ##
This initial version only contains the 32I portion of the unprivileged instruction set, without any of the extensions 
(yet). Future work will include the basic extensions plus the basic 64I instructions.
  
## Future Directions ##
Because this infrastructure allows us to simulate and also produce byte-accurate RISC-V binaries, this package could be the foundation of many things, from a Smalltalk-based RV assembler to a simulation environment for designing custom RISC-V systems.
  
## Name ##
This project is called "Safe Bet" because it's a "Small(talk) RISC"

## Installation ##
In Pharo (>=8), Squeak (>=5.3), and GToolkit, you can load this code by doing the following in a Playground/Workspace:
```smalltalk
Metacello new
  baseline: 'SafeBet';
  repository: 'github://darth-cheney/safe-bet';
  load
```
See the `BaselineOfSafeBet` for more information about platform-specific packages
  
## Examples ##
See the instructions tests methods beginning with `testExecuteOn` to see instructions executing on a CPU instance.
  
Here is an example of running a "program" on a CPU:
```smalltalk
| cpu program |

"Add instantiated RVInstruction objects to the collection below.
You would need to add your own initialized RVInstruction instances
to this collection to comprise a 'program'"
program := OrderedCollection new.

"Create a basic CPU with 1024 bytes of memory"
cpu := RVCPUBasic example1024.

"Add the collection of instructions (a 'program') to the memory
starting at address 0"
cou bootstrap: program.

"Tell the CPU to start interpreting instructions at the current
PC, which will be 0 to start (and the address if the first program
instruction). This will fork a new process named #RISCV_CPU"
cpu run.
```
### Built-in Examples ###
We have provided a single class-side example program/example execution in `RVProgram Examples class >> #exampleAddFiveToSix`. Run this to execute the example program, which will load the constants 5 and 6 into registers, add them, put the result into register `x6`, and then halt the cpu (thus opening a debugger).
