as yet unclassified
bitmapDrawProgramLooping
	"This program assumes a memory of at least 22500 bytes, with
	some kind of memory mapped bitmap display reading from byte
	11249 up to the end. This is enough for a 300x300 1 bit depth 
	display."
	
	| currentInstruction program |
	"Registers:"
	"x3 - The bitmap pattern to store"
	"x4 - Bitmap area start address"
	"x5 - Current address index"
	"x6 - Maximum address"

	program := OrderedCollection new.
	currentInstruction := nil.

	"(1)"
	"ADDI -1 to get a register full of set bits. This will be the pattern"
	currentInstruction := RV32IIADDI new.
	currentInstruction immediateValue: -1.
	currentInstruction rs1 setTo: 0.
	currentInstruction rd setTo: 3.
	program add: currentInstruction.

	"(2)"
	"Load the lower bits of the bitmap start address in the upper
	part of the register.
	The bits, in the upper 20, are 2r00000010101111110001000000000000"
	"lui 2r00000010101111110001000000000000, x4"
	currentInstruction := RV32IULUI new.
	currentInstruction immediateValue: 2r00000010101111110001000000000000.
	currentInstruction rd setTo: 4.
	program add: currentInstruction.	

	"(3)"
	"Shift the bits right by 12"
	"srli 8, x4, x4"
	currentInstruction := RV32IISRLI new.
	currentInstruction immediateValue: 12.
	currentInstruction rs1 setTo: 4.
	currentInstruction rd setTo: 4.
	program add: currentInstruction.

	"Start address is now loaded"

	"(4)"
	"Put the current address to load into x5."
	"add x4, x0, x5"
	currentInstruction := RV32IADD new.
	currentInstruction rs1 setTo: 4.
	currentInstruction rs2 setTo: 0.
	currentInstruction rd setTo: 5.
	program add: currentInstruction.

	"(5)"
	"Add the start address to itself and store the result, which is the limit,
	into x6"
	"add x4, x4, x6"
	currentInstruction := RV32IADD new.
	currentInstruction rs1 setTo: 4.
	currentInstruction rs2 setTo: 4.
	currentInstruction rd setTo: 6.
	program add: currentInstruction.

	"(6)"
	"Subtract 4 bytes from the limit, since we will be trying to store
	4 byte values each time"
	currentInstruction := RV32IIADDI new.
	currentInstruction immediateValue: -4.
	currentInstruction rs1 setTo: 6.
	currentInstruction rd setTo: 6.
	program add: currentInstruction.

	"(7)"
	"Store the entire contents of register x3 into the memory address at the current index"
	"sw 0, x5, x3"
	currentInstruction := RV32ISSW new.
	currentInstruction immediateValue: 0.
	currentInstruction rs1 setTo: 5.
	currentInstruction rs2 setTo: 3.
	program add: currentInstruction.

	"(8)"
	"Increment the index address by 4"
	"addi 4, x5, x5"
	currentInstruction := RV32IIADDI new.
	currentInstruction immediateValue: 4.
	currentInstruction rs1 setTo: 5.
	currentInstruction rd setTo: 5.
	program add: currentInstruction.

	"(9)"
	"If the next index in x5 is less than the limit in x6, then 
	jump back to instruction 7  from (-3 * 4)"
	"blt -12, x6, x5"
	currentInstruction := RV32IBBLT new.
	currentInstruction immediateValue: -8.
	currentInstruction rs2 setTo: 6.
	currentInstruction rs1 setTo: 5.
	program add: currentInstruction.

	"(10)"
	"Loop back to the draw point and start over"
	currentInstruction := RV32IBBEQ new.
	currentInstruction rs1 setTo: 0.
	currentInstruction rs2 setTo: 0.
	currentInstruction immediateValue: -24.
	program add: currentInstruction.
	

	^ program