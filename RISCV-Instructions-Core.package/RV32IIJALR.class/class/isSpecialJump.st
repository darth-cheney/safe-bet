as yet unclassified
isSpecialJump
	"Respond true only if the instruction is a Jump sub-type of I-type
	instructions. We need this because JALR (and possibly future others?)
	are I-type in format, but have a different opcode. This means they can also
	have the same funt3 value as existing I-types, so we need to differentiate"
	^ true