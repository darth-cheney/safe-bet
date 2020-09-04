*RISCV-GToolkit
asBlElement
	 | container |
	 container := BlElement new
	 	layout: BlLinearLayout horizontal;
	 	constraintsDo: [ :c |
	 		c horizontal fitContent.
	 		c vertical fitContent ].
	 partsCollection reverseDo: [ :item | container addChild: item asBlElement ].
	 ^ container