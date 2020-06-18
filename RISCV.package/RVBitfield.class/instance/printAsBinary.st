as yet unclassified
printAsBinary
	"Respond with a string representation of the binary
	structure of the bitfield. Note: we reverse the bits array,
	since the binary representation starts on the right."
	^ ( String streamContents: [ :s |
			bits reverseDo: [ :bit | 
				s nextPutAll: bit asString ]])