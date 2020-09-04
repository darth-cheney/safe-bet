as yet unclassified
nextInstruction
	"Respond with the instance of the next instruction,
	as retrieved from memory at the PC location"
	| address bytes |
	address := self pcValue.
	bytes := self memory bytesAt: address numBytes: (self class xlen / 8).
	^ RVInstruction fromInteger: (bytes reverse asInteger).