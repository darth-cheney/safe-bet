*RISCV-GToolkit
asBlElement
	"Respond with a representation of this Instruction Part
	as a Bloc Element"
	| container nameEl textWrapper bitElements |
			container :=  BlElement new
				layout: BlLinearLayout vertical;
				background: Color white;
				margin: (BlInsets all: 20);
				constraintsDo: [:c |
					c vertical fitContent.
					c horizontal fitContent ].
			textWrapper := BlElement new
				layout: BlLinearLayout horizontal alignCenter;
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical fitContent ].
			nameEl := BlTextElement new
				text: (self partName asRopedText glamorousRegularFont fontSize: 14).
			
			textWrapper addChild: nameEl.
			
			bitElements := BlElement new
				layout: BlLinearLayout horizontal;
				background: Color white;
				margin: (BlInsets bottom: 20);
				constraintsDo: [ :c |
					c horizontal fitContent.
					c vertical fitContent ].
			bits reverse do: [ :bit |
				bitElements addChild: (BlTextElement new
					margin: (BlInsets left:5);
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical fitContent ];
					text:((bit asString) asRopedText glamorousMonospace fontSize: 48))].
			
			"Add in order to container"
			container addChild: bitElements.
			container addChild: textWrapper.
			^ container
	