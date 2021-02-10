as yet unclassified
acceptDroppingMorph: aMorph event: evt
	self wrappedObject bootstrap: aMorph wrappedObject.
	afterDropBlock ifNotNil: [
		afterDropBlock cull: aMorph ]
	