as yet unclassified
executeOn: aCPU
	"Should be overridden by various instructions.
	This is the main procedure portion of interaction. A given instruction in our
	system should know how to execute itself on a given CPU instance that it
	gets passed.
	The default implementation is to do nothing."
	^ self 