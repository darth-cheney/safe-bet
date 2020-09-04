as yet unclassified
testSetImmediateValue
	"Ensure that we can correctly set an integer to
	be the immediate value on an instruction that
	spreads its immediates around, out of order"
	| instruction imm1 imm2 imm3 incoming expected |
	imm1 := RVImmediatePart new
		size: 5;
		partName: 'imm1';
		setTo: 2r11111. "Initial value that should be overwritten"
	imm2 := RVImmediatePart new
		size: 3;
		partName: 'imm2';
		immediateStartIndex: 6;
		setTo: 2r101. "Initial value that should be overwritten"
	imm3 := RVImmediatePart new
		size: 4;
		partName: 'imm3';
		immediateStartIndex: 9;
		setTo: 2r1001. "Initial value that should be overwritten"
	instruction := RVInstruction new.
	
	"Add the immediate parts in complete reverse order"
	instruction addPart: imm3.
	instruction addPart: imm2.
	instruction addPart: imm1.
	
	"The incoming integer to set is bigger than the available bits
	across the instruction's immediates:
		2r11111111111111101100[1010][110][10111]
		  [               dropped           ][imm3][imm2][imm1]"
	incoming := 2r11111111111111101100101011010111.
	expected := 2r101011010111.
	
	"Now actually attempt to set the overall immediate"
	instruction immediateValue: incoming.
	self assert: 2r10111 equals: imm1 asInteger.
	self assert: 2r110 equals: imm2 asInteger.
	self assert: 2r1010 equals: imm3 asInteger.
	self assert: expected equals: instruction immediateValue.
	
	
	