as yet unclassified
initialize
	super initialize.
	selectedIndex := 0.
		
	self
		color: Color white;
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill.