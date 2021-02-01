as yet unclassified
updateBits
	"Stream through each byte of relevant memory and map each bit accordingly"
	| bytes currentVal currentIndex colNum xVal nextForm |
	memory ifNil: [ 
		self stopStepping.
		^ self ].
	colNum := 0.
	nextForm := Form extent: self image extent depth: 1.
	bytes := memory bytesAt: 11249 numBytes: 11250.
	bytes doWithIndex: [ :byte :byteIndex |
		1 to: 8 do: [ :bitIndex |
			currentVal := byte bitAt: bitIndex.
			currentIndex := bitIndex * byteIndex.
			xVal := ((currentIndex) \\ (self form extent x - 1)).
			xVal = 0
				ifTrue: [ colNum := colNum + 1 ].
			currentVal = 0
				ifTrue: [
					nextForm colorAt: ((xVal - 1)@colNum) put: Color white ]
				ifFalse: [
					nextForm colorAt: ((xVal - 1)@colNum) put: Color black ].
			 ] ].
		
	self image: nextForm.
	self changed.
	
	