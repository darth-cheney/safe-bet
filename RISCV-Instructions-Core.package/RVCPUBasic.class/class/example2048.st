as yet unclassified
example2048
	"Respond with an example CPU with 2048 bytes of memory"
	^ (self new
			memory: (RVMemory size: 2048);
			yourself)