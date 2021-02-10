as yet unclassified
addCustomMenuItems: aMenu hand: aHand
	aMenu addLine.
	aMenu add: 'Icon Label...' action: [ 
		| response |
		response := UIManager default
			request: 'New icon label...'
			initialAnswer: aMenu defaultTarget label.
		aMenu defaultTarget label: response ].
	aMenu addLine.
	aMenu add: 'See CPU Registers' action: [
		self wrappedObject asMorph openInWindowLabeled: 'RISC-V CPU' ].
	
	self wrappedObject memory size > 20000
		ifTrue: [
			aMenu add: 'Open Bitmap Display' action: [
				RVBitmapDisplayMorphAligned new
					memory: self wrappedObject memory;
					openInWindowLabeled: '320x320 Display' ] ].
			
	self wrappedObject running
		ifTrue: [
			aMenu add: 'Halt CPU' action: [ self wrappedObject running: false ]]
		ifFalse: [
			aMenu
				add: 'Run'
				action: [ self wrappedObject runWithDelay: 0 ];
				add: 'Run with delay...'
				action: [
					| response |
					response := UIManager default
						request: 'Step time in ms'
						initialAnswer: '200'.
					self wrappedObject runWithDelay: (response asInteger) ];
				add: 'Run Synchronously'
				action: [ self wrappedObject runSync ];
				add: 'Run sync with delay...'
				action: [
					| response |
					response := UIManager default
						request: 'Step time in ms'
						initialAnswer: '100'.
					self wrappedObject runSyncWithDelay: response asInteger]]