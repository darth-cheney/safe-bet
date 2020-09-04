as yet unclassified
initialize
	super initialize.
	
	"NOP is an ADDI with all registers and immediate
	set to 0"
	self immediateValue: 0.
	self rd setTo: 0.
	self rs1 setTo: 0.