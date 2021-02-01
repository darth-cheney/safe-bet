as yet unclassified
resetPC
	"Reset the program counter manually and update the display"
	model ifNil: [ ^ self ].
	model incrementPCBy: (model pcValue * -1).
	self initializeRegisterMorphs