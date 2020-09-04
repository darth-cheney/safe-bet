as yet unclassified
unsignedImmediateValue
	| bitField writeStream |
	bitField := RVBitfield new size: 13.
	writeStream := bitField writeStream.
	writeStream nextPut: 0. "First bit is always zero"
	self sortedImmediates do: [ :imm |
		writeStream nextPutAll: imm readStream contents ].
	^ bitField asUnsignedInteger
	