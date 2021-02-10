as yet unclassified
addAvailableCPUs
	"Add the basic CPUs and their icons to
	the drawer"
	self 
		addCPU: (RVCPUBasic example1024)
		named: 'RISC-V Basic CPU';
		addCPU: (RVCPUBasic exampleForBitmapDemo)
		named: 'RISC-V Basic CPU'