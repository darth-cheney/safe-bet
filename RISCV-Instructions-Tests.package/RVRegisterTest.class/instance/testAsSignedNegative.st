as yet unclassified
testAsSignedNegative
	"Ensure that we treat a bits value as negative when sending
	#asSignedInteger"
	| register |
	register := RVRegister new. "8 bit register"
	register value: 2r11111111. "Should be -1"
	self assert: register asSignedInteger equals: -1.
	self assert: register asUnsignedInteger equals: 255.