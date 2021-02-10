as yet unclassified
initialize
	super initialize.
	self
		color: Color gray;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutInset: 15.
		
	self addBasicPrograms