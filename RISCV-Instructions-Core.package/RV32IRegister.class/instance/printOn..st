as yet unclassified
printOn: aStream
	aStream
		nextPutAll: self class name;
		nextPutAll: ' (';
		nextPutAll: self registerName;
		nextPut: $)