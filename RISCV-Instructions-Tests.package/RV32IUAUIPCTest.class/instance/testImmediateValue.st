as yet unclassified
testImmediateValue
	"Ensure that we are setting and retrieving the correct
	immediate value for this instruction.
	AUIPC requires an upper 20bit immediate"
	| instruction incoming |
	incoming := 2r11111111111111111111000000000000.
	instruction := RV32IUAUIPC new.
	instruction immediateValue: incoming.
	
	self assert: instruction imm1 asInteger equals: 2r11111111111111111111.
	self assert: instruction immediateValue equals: incoming.