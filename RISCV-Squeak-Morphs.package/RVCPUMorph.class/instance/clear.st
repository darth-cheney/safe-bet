as yet unclassified
clear
	"Clear all register values in the CPU and update the display"
	model ifNil: [ ^ self ].
	model registers do: [ :register | register value: 0 ].
	self initializeRegisterMorphs.