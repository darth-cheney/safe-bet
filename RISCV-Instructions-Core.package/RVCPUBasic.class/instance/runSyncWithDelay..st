as yet unclassified
runSyncWithDelay: delayInMS
	"Synchronously run the CPU from the current
	PC with the given delay in milliseconds between
	executions"
	running := true.
	[ (self pcValue <= (self memory size - 1)) and: [ running ]]
			whileTrue: [
				self doNextInstruction.
				(Delay forMilliseconds: delayInMS) wait. ]