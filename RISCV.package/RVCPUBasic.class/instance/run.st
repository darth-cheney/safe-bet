as yet unclassified
run
	"Begin executing instructions, starting at the location given by the current
	program counter register"
	[
		[ self pcValue <= (self memory size - 1)]
			whileTrue: [
				self doNextInstruction.
				self incrementPCBy: (self class xlen / 8).
				(Delay forMilliseconds: self tickSpeed) wait. ]
	] forkNamed: #RISCV_CPU
