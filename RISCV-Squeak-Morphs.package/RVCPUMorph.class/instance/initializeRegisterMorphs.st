as yet unclassified
initializeRegisterMorphs
	model ifNil: [ ^ self ].
	scrollPane scroller removeAllMorphs.
	registerMorphs := OrderedCollection new.
	model registers do: [ :register |
		| row |
		row := Morph new
			layoutPolicy: TableLayout new;
			listDirection: #leftToRight;
			hResizing: #spaceFill;
			vResizing: #shrinkWrap;
			cellInset: 4;
			color: Color transparent.
			
		row addMorphBack: (StringMorph new
			contents: register registerName).
		row addMorphBack: (StringMorph new
			contents: (register value printStringBase: 2 nDigits: 32)).
		row addMorphBack: (StringMorph new
			contents: register value hex asString).
		row addMorphBack: (StringMorph new
			contents: register asSignedInteger asString).
			
		registerMorphs add: row  ].
	
	scrollPane scroller addAllMorphs: registerMorphs