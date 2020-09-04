as yet unclassified
executeOn: aCPU
	"Execute this instruction on a given CPU object"
	| source destination bitField bitStream signBit shiftAmount |
	source := aCPU registerNumbered: self rs1 asInteger.
	destination := aCPU registerNumbered: self rd asInteger.
	bitField := RVBitfield new size: aCPU xlen.
	bitStream := bitField writeStream.
	shiftAmount := RVBitfield new size: 5.
	1 to: 5 do: [ :bitIndex |
		shiftAmount
			bitAt: bitIndex
			put: (self immediateValue bitAt: bitIndex)].
	shiftAmount := shiftAmount asInteger.
	signBit := (source asUnsignedInteger) bitAt: aCPU xlen.
	
	"If the shift amount is greater than or equal to the xlen,
	then we simply fill all of the bits with the sign bit"
	(shiftAmount >= aCPU xlen)
		ifTrue: [
			aCPU xlen timesRepeat: [ bitStream nextPut: signBit ] ]
		ifFalse: [
			(1 + shiftAmount) 
				to: (aCPU xlen)
				do: [ :bitIndex |.
						bitStream nextPut: (source asUnsignedInteger bitAt: bitIndex)].

			(aCPU xlen - (shiftAmount))
				to: aCPU xlen
				do: [ :bitIndex | bitField bitAt: bitIndex put: signBit ]].
	
	
	destination value: bitField asUnsignedInteger.
	aCPU incrementPCBy: 4.
		
	

	
	