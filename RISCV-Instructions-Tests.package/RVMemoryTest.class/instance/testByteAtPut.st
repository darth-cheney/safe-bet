as yet unclassified
testByteAtPut
	"Test the ability to store a value at the given index"
	| memory |
	memory := RVMemory size: 1024.
	memory byteAt: 5 put: 255.
	
	self assert: ((memory instVarNamed: #mapping) includesKey: 5).
	self assert: ((memory instVarNamed: #mapping) at: 5) equals: 255.