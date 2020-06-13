as yet unclassified
initialize
	"A mapping of opcode value to instruction type"
	OpcodeMapping := {
		2r0110011 -> RV32IR.
		2r0010011 -> RV32II.
		2r0000011 -> RV32IIL. "This is not a true RiscV instruction type, but a necessity in our hierarchy"
		2r1100111 -> RV32II. "The Jump (JALR) specialized I-type"
		2r0100011 -> RV32IS.
		2r1100011 -> RV32IB.
	} asDictionary