as yet unclassified
immediateValue
	"For I-type instructions, the RISC-V spec lists the
	resulting immediate as a sign-extended value, where
	the final immediate bit is the sign bit and should be extended
	to the full length of the rest of the bits as if it is a full 32 bits.
	For example, an immediate of:
		2r100001011010.
	Becomes:
	     2r11111111111111111111100001011010"
	| rawValue signBit |
	rawValue := super immediateValue.
	rawValue negative ifTrue: [ ^ rawValue ].
	"If we get here, we assume the immediate was set
	as an unsigned value and must be translated to signed"
	signBit := self immediateSignBit.
	13 to: 32 do: [ :index | rawValue := rawValue bitAt: index put: signBit ].
	^ rawValue
	