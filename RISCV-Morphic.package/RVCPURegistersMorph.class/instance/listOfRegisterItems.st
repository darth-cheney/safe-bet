as yet unclassified
listOfRegisterItems
	"Responds with an OrderedCollection of OrderedCollections,
	the second nested collection being the name, binary string,
	hex string, and signed integer (as string) for a given register"
	| outerList |
	outerList := OrderedCollection new.
	model ifNil: [^ {}].
	
	outerList add: (model registers values collect: [:register | 
		register registerName ]).
	outerList add: (model registers values collect: [:register |
		register value printStringBase: 2 nDigits: 32]).
	outerList add: (model registers values collect: [:register |
		register value hex asString]).
	outerList add: (model registers values collect: [:register |
		register asSignedInteger asString]).
	^ outerList