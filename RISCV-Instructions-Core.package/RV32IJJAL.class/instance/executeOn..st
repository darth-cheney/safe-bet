as yet unclassified
executeOn: aCPU
	"Execute this instruction on a CPU object"
	| destination immediate bitField signBit |
	destination := aCPU registerNumbered: (self rd asInteger).
	bitField := RVBitfield new size: (aCPU xlen).
	
	"Add the bits of the 20-bit immediate to the new
	bitfield. The last bit is the sign bit."
	immediate := self immediateValue.
	1 to: 20 do: [ :bitIndex | bitField bitAt: bitIndex put: (immediate bitAt: bitIndex)].
	signBit := immediate bitAt: 20.

	"Fill the rest of the bitfield with the sign bit (sign-extension)"
	21 to: bitField size do: [ :bitIndex | bitField bitAt: bitIndex put: signBit ].
	
	"Store next instruction (before the jump) into the dest register., then add the sign-extended offset to the pc to get the target address"
	destination value: ((aCPU registerNamed: #pc) asUnsignedInteger) + 4.
	aCPU incrementPCBy: bitField asSignedInteger.
	