as yet unclassified
manualProgram1
	"Respond with a collection of instructions representing the
	following simple program:
		1. Add the values in x1 and x2 and store result in x2.
		2. Check of x2 is GTE than the value in x3.
			ifTrue: Jump to #4
			ifFalse: Continue to next instruction
		3. Jump to first instruction
		4. NO-OP
	The program is designed to accumulate some value up to
	a point (specified in x3 register) at which point it executes a
	NO-OP instruction"
	| add bge jalr nop |
	
	add := RV32IADD new.
	add rs1 setTo: 1. "x1"
	add rs2 setTo: 2. "x2"
	add rd setTo: 2. "x2"
	
	bge := RV32IBBGE new.
	bge rs1 setTo: 2. "x2"
	bge rs2 setTo: 3. "x3"
	bge immediateValue: 8. "Jumps an extra instruction further down if true"
	
	jalr := RV32IIJALR new.
	jalr rd setTo: 0. "x0 - we don't store the incremented result"
	jalr rs1 setTo: 0. "x0 - We add the immediate to constant 0"
	jalr immediateValue: 0. "Gives us a jump address of 0, the add instruction"
	
	nop := RV32INOP new.
	
	^ {add. bge. jalr. nop}