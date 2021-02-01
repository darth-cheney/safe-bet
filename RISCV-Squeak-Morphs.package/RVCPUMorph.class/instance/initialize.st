as yet unclassified
initialize
	| buttonArea |
	super initialize.
	registerMorphs := {}.
	scrollPane := ScrollPane new.
	scrollPane scroller
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color white.
	scrollPane
		hResizing: #spaceFill;
		vResizing: #spaceFill.
		
	self
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color white.
		
	"Create the controller buttons"
	clearButton := PluggableButtonMorph new
		label: 'Clear All';
		model: self;
		action: #clear.
		
	resetButton := PluggableButtonMorph new
		label: 'Reset PC';
		model: self;
		action: #resetPC.
		
	nextButton := PluggableButtonMorph new
		label: 'Step';
		model: self;
		action: #stepInstruction.
		
	buttonArea := Morph new
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		color: Color transparent;
		cellInset: 2;
		addAllMorphs: { nextButton. resetButton. clearButton }.
		
	self
		addMorphBack: scrollPane;
		addMorphBack: buttonArea
	
		