as yet unclassified
addBasicPrograms
	"Add the programs we will be using for the demo"
	self
		addProgram: RVProgramExamples addFiveToSixProgram
		named: 'Add Five to Six';
		addProgram: RVProgramExamples bitmapDrawProgram
		named: 'Basic Bitmap';
		addProgram: RVProgramExamples bitmapDrawProgramRotation
		named: 'Bitmap with Pattern'