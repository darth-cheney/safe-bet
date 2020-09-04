as yet unclassified
initialize
	super initialize.
	
	funct7 setTo: self class funct7. "0"
	funct7 isWriteable: false. "Cannot be modified"
	funct3 setTo: self class funct3. "2r010"
	funct3 isWriteable: false. "Cannot be modified"