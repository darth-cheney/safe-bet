as yet unclassified
signedImmediateValue
	| bitField writeStream |
	bitField := RVBitfield new size: 20.
	writeStream := bitField writeStream.
	1 to: 12 do: [ :index | writeStream nextPut: 0 ]. "Fill lower 12 bits with zeroes per spec"
	self sortedImmediates do: [ :imm | 
		writeStream nextPutAll: imm readStream contents ].
	^ bitField asSignedInteger 