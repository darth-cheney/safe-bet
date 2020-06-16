as yet unclassified
doNextInstruction
	| nextInstruction |
	nextInstruction := self nextInstruction.
	nextInstruction executeOn: self.