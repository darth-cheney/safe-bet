as yet unclassified
stepInstruction
	"Tell the CPU to execute the next instruction and update the  display"
	model ifNil: [ ^ self ].
	model doNextInstruction