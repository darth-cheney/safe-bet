adding
addFiveToSixProgram
	"Add the integer 5 to the integer 6"
	| program load5 load6 add break |
	
	"Simpler add five to six program"
	program := OrderedCollection new.

	"Load 5 into register x1 by
	adding the immediate value 5 to register x0 (always 0)"
	load5 := RV32IIADDI new.
	load5 immediateValue: 5.
	load5 rs1 setTo: 0. "Add to x0, which is always 0"
	load5 rd setTo: 1. "put in register x1"
	program add: load5.

	"Load 6 into register x2 by
	adding the immediate value 6 to register x0 (always 0)"
	load6 := RV32IIADDI new.
	load6 immediateValue: 6.
	load6 rs1 setTo: 0.
	load6 rd setTo: 2.
	program add: load6.

	"Add numbers in registers x1 and x2
	and store result in x3"
	add := RV32IADD new.
	add rs1 setTo: 1.
	add rs2 setTo: 2.
	add rd setTo: 3.
	program add: add.

	"Halt the CPU and open an inspector on it"
	break := RV32IEBREAK new.
	program add: break.
	
	^ program