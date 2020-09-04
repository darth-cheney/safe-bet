as yet unclassified
applyToImmediate: anInteger
	"See comment in #applyToImmediate:startingAt:" 
	^ self
			applyToImmediate: anInteger
			startingAt: self immediateStartIndex. 