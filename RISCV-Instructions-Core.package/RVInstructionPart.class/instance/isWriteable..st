as yet unclassified
isWriteable: aBoolean
	"Sets whether or not this part is writeable.
	If it is, methods like #setTo: and #setFrom:startingAt: will
	be able to set this part's bits. Otherwise, such methods will
	have no effect on the part. We use this when setting specific
	instruction instances based on an integer value, where certain
	parts (like funct7 or funct3, for example) are always static for
	specific instruction types."
	writeable := aBoolean