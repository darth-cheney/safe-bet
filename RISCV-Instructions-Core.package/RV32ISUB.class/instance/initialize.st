as yet unclassified
initialize
	super initialize.
	
	"See class comment for specification"
	self funct7 setTo: self class funct7. "2r0100000"
	self funct7 isWriteable: false. "Cannot be modified"
	self funct3 setTo: self class funct3. "0"
	self funct3 isWriteable: false. "Cannot be modified"