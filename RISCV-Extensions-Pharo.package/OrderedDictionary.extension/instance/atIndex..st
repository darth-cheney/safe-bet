*RISCV-Extensions-Pharo
atIndex: anInteger
	| key |
	key := self keyAtIndex: anInteger.
	^ key -> (self at: key)