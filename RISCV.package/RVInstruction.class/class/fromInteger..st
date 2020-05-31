as yet unclassified
fromInteger: anInteger
	"Attempt to initiaize the relevant RVInstruction
	instance based on the passed in Integer. We
	determine the correct kind of Instruction by first
	checking the opcode, then delegating initialization
	to any relevant parent/abstract classes for instructions
	of a given type (for example RV32IR, which knows which
	actual instructions to make based on funct7 and funct3 values)"
	| opcode foundClass |
	
	"Opcode is the first 7 bits"
	opcode := (2r1111111 bitAnd: anInteger).
	foundClass := OpcodeMapping at: opcode ifAbsent: [ nil ].
	foundClass ifNil: [
		Error signal: 'Invalid opcode: ',(opcode printStringBase: 2 nDigits: 7)].
	^ foundClass fromIntegerWithoutOpcode: anInteger