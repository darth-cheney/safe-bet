as yet unclassified
testManualProgram1
	"Test the step-by-step running of the program.
	The registers will be set to the following values:
		x1 = 3
		x2 = 0
		x3 = 22
	We expect the program to loop 2 times."
	| cpu nextInstruction |
	cpu := RVCPUBasic example1024.
	cpu bootstrap: self manualProgram1.
	(cpu registerNamed: #x1) value: 3.
	(cpu registerNamed: #x2) value: 0.
	(cpu registerNamed: #x3) value: 5.
	
	nextInstruction := cpu nextInstruction.
	self assert: nextInstruction class equals: RV32IADD.
	nextInstruction executeOn: cpu.
	self assert: (cpu registerNamed: #x2) value equals: 3.
	self assert: cpu pcValue equals: 4.
	
	nextInstruction := cpu nextInstruction.
	self assert: nextInstruction class equals: RV32IBBGE.
	nextInstruction executeOn: cpu.
	self assert: cpu pcValue equals: 8.
	
	nextInstruction := cpu nextInstruction.
	self assert: nextInstruction class equals: RV32IIJALR.
	nextInstruction executeOn: cpu.
	self assert: cpu pcValue equals: 0.
	
	nextInstruction := cpu nextInstruction.
	self assert: nextInstruction class equals: RV32IADD.
	nextInstruction executeOn: cpu.
	self assert: (cpu registerNamed: #x2) value equals: 6.
	self assert: cpu pcValue equals: 4.
	
	nextInstruction := cpu nextInstruction.
	self assert: nextInstruction class equals: RV32IBBGE.
	nextInstruction executeOn: cpu.
	self assert: cpu pcValue equals: 12.
	
	nextInstruction := cpu nextInstruction.
	self assert: nextInstruction class equals: RV32INOP

	