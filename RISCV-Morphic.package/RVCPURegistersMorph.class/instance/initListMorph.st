as yet unclassified
initListMorph
	listBox ifNotNil: [ self removeMorph: listBox ].
	listBox := PluggableMultiColumnListMorph
		on: self
		list: #listOfRegisterItems
		selected: #selectedIndex
		changeSelected: #selectedIndex:.
		
	listBox 
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	listBox hideMenuButton.
	self addMorphBack: listBox