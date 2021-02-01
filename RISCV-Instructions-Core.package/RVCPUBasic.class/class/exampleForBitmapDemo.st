as yet unclassified
exampleForBitmapDemo
	"Respond with a 32 bit CPU with 22,500 bytes of memory.
	A bitmap of 11250 bytes will begin at address 11250"
	^ (self new
			memory: (RVMemory size: 22500);
			yourself)