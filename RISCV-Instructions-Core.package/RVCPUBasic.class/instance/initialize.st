as yet unclassified
initialize
	super initialize.
	self initializeRegisters.
	running := false.
	subscribers := OrderedCollection new.