as yet unclassified
immediateValue
	"Respond with the value of the immediate for this
	instruction.
	Senders should check #hasImmediate first, as
	instructions without immediates will respond with 0.
	We select and sort all immediate parts and then compute
	the actual bits, responding with the resulting Integer value.
	Note that the result will be signed or unsigned depending on
	the given Instruction's response to the #isSignedImmediate
	message"
	self isSignedImmediate
		ifTrue: [ ^ self signedImmediateValue ]
		ifFalse: [ ^ self unsignedImmediateValue ]