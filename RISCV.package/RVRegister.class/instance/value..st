as yet unclassified
value: anInteger
	"Note that we will trim the incoming integer to only
	have the same bitsize as the class-side xlen. We will
	also take only the lower xlen bits.
	Note: We have not implemented this trimming yet."
	value := anInteger.
	