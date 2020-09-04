I represent a No-Operation (NOP) instruction. I do not change any architecturally visible state aside from incrementing the PC  and any applicable performance counters.

I am encoded as an ADDI instruction whose destination, immediate, and source are all 0 or x0.