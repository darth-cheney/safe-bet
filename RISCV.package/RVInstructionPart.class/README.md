I represent a sub-part of a RISC-V Instruction. Sub-parts are portions of the instruction that have a particular name and/or meaning. Examples include 'opcode', 'rd' (desination register), and divisions of immediates.
  
I have the ability to set my value based on an incoming integer, though I will use a generated bitmask to zero any bits in the integer that are beyond my size. For example, assume a part corresponding to a register, such as a destination register. Register references in RISC-V instructions are 5 bits long. So we would:
  
RVInstructionPart new
	size: 5;
	name: 'rd'.

Then let's say then we have an integer that contains our 5 bits (starting at the least significant bit), but that there are other bits set for whatever reason. RVInstructionPart will always create a bitmask that sets the bits we do not care about to 0. Therefore an incoming integer such as:

"Incoming integer to set"
2r00100000010000100000000000000101 "32-bit int:  541196293"

Will be masked with a bitmask determined by the part's size, such as:

"Bitmask generated for instruction part of size 5"
2r00000000000000000000000000011111 "32-bit int: 31"

Resulting in an internal partValue of:

"Instruction part value (as a 32 bit int) becomes:"
2r00000000000000000000000000000101 "32-bit int: 5"

Note also that RVInstructionParts contain a start index. By default, this is set to the first position (1). It is designed to be used by consuming RVInstructions to determine at what index point inside of themselves the given part should begin. The end index is, of course, determined by the size of the part.
