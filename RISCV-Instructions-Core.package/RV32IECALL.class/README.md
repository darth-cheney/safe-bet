I represent an instruction that is used to make a service request to the execution environment.

The RISCV spec states: "The EEI will define how parameters for the service request are passed, but usually these will be in defined locations in the integer register file."

I am a SYSTEM type instruction, which means  "used to access system functionality that might require privileged access and are encoded using the I-type instruction format. These can be divided into two main classes: those that atomically read-modify-write control and status registers (CSRs), and all other potentially privileged instructions." (according to spec)

Though I am encoded as an I-type instruction, I am not here represented as a subclass of RV32II. This is because my attributes are all static values and there is no need for inheritence here.

The RISCV Spec lists ECALL as:
[000000000000][00000 ][   000       ][00000][1110011   ]
[   funct12         ][   rs1   ][   funct3   ][   rd   ][   opcode   ]