adding
addFiveToSixProgram
	"Add the integer 5 to the integer 6"
	| program load5 shift5 load6 shift6 add |
	
	"The program is just an OrderedCollection of
	instructions"
	program := OrderedCollection new.
	
	"First, we need to load the upper immediate
	to create constant 5. Put result into register
	x1"
	load5 := RV32IULUI new.
	load5 rd setTo: 1.
	load5 imm1 setTo: 5.
	program add: load5.
	
	"Next, we shift the immediate right by 12
	since it's in the upper 20 bits of the register"
	shift5 := RV32IISRLI new.
	shift5 rs1 setTo: 1. "Source register x1"
	shift5 rd setTo: 1. "Dest register also x1"
	shift5 shamt setTo: 12.
	program add: shift5.
	
	"Next, we load the upper immediate
	to create constant 6. Put the result into register
	x2"
	load6 := RV32IULUI new.
	load6 rd setTo: 2. "Dest register x2"
	load6 imm1 setTo: 6.
	program add: load6.
	
	"Now shift right by 12 to get the right value
	in register x2"
	shift6 := RV32IISRLI new.
	shift6 rs1 setTo: 2. "Source register x2"
	shift6 rd setTo: 2. "Dest register also x2"
	shift6 shamt setTo: 12.
	program add: shift6.
	
	"Now actually add the two numbers and store into
	register x6"
	add := RV32IADD new.
	add rs1 setTo: 1. "Source register x1"
	add rs2 setTo: 2. "Other source reg. x2"
	add rd setTo: 6. "Dest register x6"
	program add: add.
	
	"Halt when reached"
	program add: (RV32IEBREAK new).
	
	^ program