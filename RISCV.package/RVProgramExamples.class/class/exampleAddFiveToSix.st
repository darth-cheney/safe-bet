as yet unclassified
exampleAddFiveToSix
	"Add the loaded constants 5 to 6.
	See class method #addFiveToSixProgram for the
	actual instructions"
	| cpu program |
	program := self addFiveToSixProgram.
	
	"Create a 32-bit CPU with 1024 bytes memory"
	cpu := RVCPUBasic example1024.
	
	"Load instructions into memory starting at
	address 0"
	cpu bootstrap: program.
	
	"Run CPU starting at 0"
	cpu runSync.