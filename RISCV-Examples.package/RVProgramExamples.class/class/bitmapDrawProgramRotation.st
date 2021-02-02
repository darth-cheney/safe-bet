as yet unclassified
bitmapDrawProgramRotation
	| currentInstruction program |
	
	program := OrderedCollection new.
	currentInstruction := nil.

	"Our initial pattern should be:"
	"2r11110000111100001111000011110000 top and bottom
	 2r10010000100100001001000010010000 two middle"

	"Registers:"
	"x1 - Source pattern top/bottom"
	"x2 - Source pattern middle"
	"x3 - [empty]"
	"x4 - [empty]"
	"x5 - [empty]"
	"x6 - Start address of bitmap segment"
	"x7 - Next word address for bitmap drawing"
	"x8 - Max bitmap address"
	"x9 - Right shift cache"
	"x10 - left shift cache"

	"(1)"
	"Load upper bits of top/bottom pattern into x1"	
	currentInstruction := RV32IULUI new.
	currentInstruction immediateValue: 2r11110000111100001111000000000000.
	currentInstruction rd setTo: 1.
	program add: currentInstruction.

	"(2)"
	"Load lower bits to top/bottom pattern of x1"
	currentInstruction := RV32IIORI new.
	currentInstruction immediateValue: 2r000011110000.
	currentInstruction rs1 setTo: 1.
	currentInstruction rd setTo: 1.
	program add: currentInstruction.

	"(3)"
	"Load upper bits of middle pattern into x2"
	currentInstruction := RV32IULUI new.
	currentInstruction immediateValue: 2r10010000100100001001000000000000.
	currentInstruction rd setTo: 2.
	program add: currentInstruction.

	"(4)"
	"Load the lower bits of the middle pattern into x2"
	currentInstruction := RV32IIORI new.
	currentInstruction immediateValue: 2r000010010000.
	currentInstruction rs1 setTo: 2.
	currentInstruction rd setTo: 2.
	program add: currentInstruction.

	"(5)"
	"Load max shift amount (32) into register x5"
	"When this number is reached, the program will reset
	 the shift amount in x3 back to zero"
	currentInstruction := RV32IIADDI new.
	currentInstruction immediateValue: 32.
	currentInstruction rs1 setTo: 0.
	currentInstruction rd setTo: 5.
	program add: currentInstruction.

	"(6)"
	"Set current shift amount to zero in x3"
	currentInstruction := RV32IAND new.
	currentInstruction rs1 setTo: 0.
	currentInstruction rs2 setTo: 0.
	currentInstruction rd setTo: 3.
	program add: currentInstruction.

	"(7)"
	"Load the start address of the bitmap segment into the upper bits of x6"
	"11249 (2r10101111110001)"
	currentInstruction := RV32IULUI new.
	currentInstruction immediateValue: 2r10101111110001000000000000.
	currentInstruction rd setTo: 6.
	program add: currentInstruction.

	"(8)"
	"Shift start address right by 12 so it's the correct number"
	currentInstruction := RV32IISRLI new.
	currentInstruction immediateValue: 12.
	currentInstruction rs1 setTo: 6.
	currentInstruction rd setTo: 6.
	program add: currentInstruction.

	"(9)"
	"Set next word for bitmap write to be the start address in x7"
	currentInstruction := RV32IIANDI new.
	currentInstruction immediateValue: -1.
	currentInstruction rs1 setTo: 6.
	currentInstruction rd setTo: 7.
	program add: currentInstruction.

	"(10)"
	"Load the max write address into x8"
	currentInstruction := RV32IADD new.
	currentInstruction rs1 setTo: 6.
	currentInstruction rs2 setTo: 6.
	currentInstruction rd setTo: 8.
	program add: currentInstruction.


	"Begin Draw Program"

	"(11)(D.1)"
	"Store the top pattern at the current draw address"
	currentInstruction := RV32ISSW new.
	currentInstruction rs1 setTo: 7.
	currentInstruction rs2 setTo: 1.
	currentInstruction immediateValue: 0.
	program add: currentInstruction.

	"(12)(D.2)"
	"Store a middle pattern at current draw address + 4"
	currentInstruction := RV32ISSW new.
	currentInstruction rs1 setTo: 7.
	currentInstruction rs2 setTo: 2.
	currentInstruction immediateValue: 4.
	program add: currentInstruction.

	"(13)(D.3)"
	"Store another middle pattern at current draw address + 8"
	currentInstruction := RV32ISSW new.
	currentInstruction rs1 setTo: 7.
	currentInstruction rs2 setTo: 2.
	currentInstruction immediateValue: 8.
	program add: currentInstruction.

	"(14)(D.4)"
	"Increment the current draw address + 12"
	currentInstruction := RV32IIADDI new.
	currentInstruction immediateValue: 12.
	currentInstruction rs1 setTo: 7.
	currentInstruction rd setTo: 7.
	program add: currentInstruction.

	"(15)(D.4)"
	"If the current draw address is less than the max,
	loop back to the beginning of the draw section"
	currentInstruction := RV32IBBLT new.
	currentInstruction rs1 setTo: 7.
	currentInstruction rs2 setTo: 8.
	currentInstruction immediateValue: -16.
	program add: currentInstruction.

	"Begin shift part of program"
	"(16)(S.1)"
	"Increment the shift amount"
	currentInstruction := RV32IIADDI new.
	currentInstruction immediateValue: 1.
	currentInstruction rs1 setTo: 3.
	currentInstruction rd setTo: 3.
	program add: currentInstruction.

	"(17)(S.2)"
	"Shift the top pattern right by one and store in x9"
	currentInstruction := RV32IISRLI new.
	currentInstruction immediateValue: 1.
	currentInstruction rs1 setTo: 1.
	currentInstruction rd setTo: 9.
	program add: currentInstruction.

	"(18)(S.3)"
	"Shift the top pattern left by 31 (loop around)
	and store in x10"
	currentInstruction := RV32IISLLI new.
	currentInstruction immediateValue: 31.
	currentInstruction rs1 setTo: 1.
	currentInstruction rd setTo: 10.
	program add: currentInstruction.

	"(19)(S.4)"
	"Store the AND of these two shifts back into x1 as the new pattern"
	currentInstruction := RV32IOR new.
	currentInstruction rs1 setTo: 9.
	currentInstruction rs2 setTo: 10.
	currentInstruction rd setTo: 1.
	program add: currentInstruction.

	"(20)(S.5)"
	"Shift middle pattern right by 1 and store in x9"
	currentInstruction := RV32IISRLI new.
	currentInstruction immediateValue: 1.
	currentInstruction rs1 setTo: 2.
	currentInstruction rd setTo: 9.
	program add: currentInstruction.

	"(21)(S.6)"
	"Shift middle pattern left by 31 (loop around)
	and store in x10"
	currentInstruction := RV32IISLLI new.
	currentInstruction immediateValue: 31.
	currentInstruction rs1 setTo: 2.
	currentInstruction rd setTo: 10.
	program add: currentInstruction.

	"(22)(S.7)"
	"AND x9 and x10 then store as new middle pattern"
	currentInstruction := RV32IOR new.
	currentInstruction rs1 setTo: 9.
	currentInstruction rs2 setTo: 10.
	currentInstruction rd setTo: 2.
	program add: currentInstruction.

	"(22)(S.8)"
	"Loop back to draw instructions"
	currentInstruction := RV32IBBEQ new.
	currentInstruction rs1 setTo: 0.
	currentInstruction rs2 setTo: 0.
	currentInstruction immediateValue: -56.
	program add: currentInstruction.
	
	^ program