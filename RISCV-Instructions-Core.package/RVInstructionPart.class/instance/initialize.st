as yet unclassified
initialize
	super initialize.
	
	"By default, we set the size to be 1"
	self size: 1.	
		
	"By default, all parts are writeable"
	self isWriteable: true.
	
	"By default, we set the start to be 1"
	start := 1.