as yet unclassified
initialize
	super initialize.
	self
		color: Color gray;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 30.
		
	self addAvailableCPUs