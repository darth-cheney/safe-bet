as yet unclassified
runSyncWithDelay: delayInMS
	"Synchronously run the CPU from the current
	PC with the given delay in milliseconds between
	executions"
	running := true.
	delayInMS > 0
		ifTrue: [ 
		 	[ (self pcValue <= (self memory size - 1)) and: [ running ]]
			whileTrue: [
				self doNextInstruction.
				(Delay forMilliseconds: delayInMS) wait. ] ]
		ifFalse: [
			[ (self pcValue <= (self memory size - 1)) and: [ running ]]
			whileTrue: [
				self doNextInstruction ]]