as yet unclassified
initialize
	super initialize.
	
	"See class comment for description of structure"
	
	self funct7 setTo: self class funct7. "2r0000000"
	self funct7 isWriteable: false. "Cannot be modified"
	self funct3 setTo: self class funct3. "2r101"
	self funct3 isWriteable: false. "Cannot be modified"
	