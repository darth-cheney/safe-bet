as yet unclassified
example1024
	"Respond with an example CPU with 1024 bytes of memory"
	^ (self new
			memory: (RVMemory size: 1024);
			yourself)