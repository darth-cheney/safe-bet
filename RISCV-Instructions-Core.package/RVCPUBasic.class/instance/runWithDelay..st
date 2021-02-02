as yet unclassified
runWithDelay: delayInMilliseconds
	"Asyncronously run the instructions as a
	separate process"
	"Synchronously run the CPU from the current
	PC with the given delay in milliseconds between
	executions"
	running := true.
	delayInMilliseconds > 0
		ifTrue: [ 
			
			[ 
				[ (self pcValue <= (self memory size - 1)) and: [ running ]]
					whileTrue: [
						self doNextInstruction.
						(Delay forMilliseconds: delayInMilliseconds) wait. ]
			 ] forkNamed: #RISCV_CPU ]
	
		ifFalse: [
			[ 
				[ (self pcValue <= (self memory size - 1)) and: [ running ]]
					whileTrue: [
						self doNextInstruction.
						Processor yield ]
			 ] forkNamed: #RISCV_CPU ]
	