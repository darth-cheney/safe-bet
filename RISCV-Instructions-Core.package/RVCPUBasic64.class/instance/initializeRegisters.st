as yet unclassified
initializeRegisters
	"Initialize the registers with the appropriate names and xlen values."
	
	"Start with the basic numeric registers, indexed starting at 0."
	| nextName |
	registers := OrderedDictionary new.
	0 to: 31 do: [ :num |
		nextName := ('x', (num asInteger printString)).
		registers
			at: nextName
			put: (RV64IRegister new
					registerName: nextName;
					yourself) ].
	registers at: #pc put: (RV64IRegister new registerName: #pcl yourself).