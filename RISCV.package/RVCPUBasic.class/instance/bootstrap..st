as yet unclassified
bootstrap: instructions
	"Write the bytes of the incoming instructions to the beginning
	of this CPU's memory structure"
	| currentIndex |
	currentIndex := 0.
	instructions do: [ :instruction |
		self memory bytesAt: currentIndex put: instruction asByteArray. 
		currentIndex := currentIndex + (instruction asByteArray size)]