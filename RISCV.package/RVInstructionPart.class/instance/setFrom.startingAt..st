as yet unclassified
setFrom: anInteger startingAt: anIndex
	"Set the bits of this part to those of the incoming
	integer, starting at some index of bits on that 
	integer."
	1 to: (self size) do: [ :myIndex |
		| adjustedIndex |
		self isWriteable ifTrue: [
			adjustedIndex := anIndex + (myIndex - 1).
			self 
				bitAt: myIndex 
				put: (anInteger bitAt: adjustedIndex)] ]