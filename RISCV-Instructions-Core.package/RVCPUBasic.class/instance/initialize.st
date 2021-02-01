as yet unclassified
initialize
	super initialize.
	self initializeRegisters.
	subscribers := OrderedCollection new.