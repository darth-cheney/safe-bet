as yet unclassified
doNextInstruction
	| nextAddress nextInstruction |
	nextAddress := (self registerNamed: #pc) value.
	nextInstruction := self memory bytesAt: nextAddress numBytes: (self class xlen / 8).
	nextInstruction := RVInstruction fromInteger: (nextInstruction reverse asInteger).
	nextInstruction executeOn: self.