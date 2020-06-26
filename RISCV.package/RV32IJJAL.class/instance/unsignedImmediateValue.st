as yet unclassified
unsignedImmediateValue
	| bitField writeStream |
	bitField := RVBitfield new size: 21.
	writeStream := bitField writeStream.
	writeStream nextPut: 0. "Begin with 0 as first bit always (two-byte aligned)"
	self sortedImmediates do: [ :imm |
		writeStream nextPutAll: imm readStream contents ].
	^ bitField asUnsignedInteger 