as yet unclassified
initialize
	super initialize.
	
	self funct7 setTo: self class funct7.
	self funct7 isWriteable: false.
	
	self funct3 setTo: self class funct3.
	self funct3 isWriteable: false.