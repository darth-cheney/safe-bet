as yet unclassified
addCPU: aCPU named: aString
	self addMorphBack: (RVCPUIcon new
		label: aString,'(', ((aCPU memory size / 1000) roundTo: 1) asString, 'k)';
		wrap: aCPU;
		yourself)