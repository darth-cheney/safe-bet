as yet unclassified
addProgram: aCollection named: aString
	"Add an ObjectIcon that wraps and configures
	the provided program"
	| icon |
	icon := ObjectIcon new.
	icon
		label: aString;
		wrap: aCollection;
		image: (HaikuIconPack getFormFor: #DeviceFloppy inSize: 64).
		
	self addMorphBack: icon
		
		