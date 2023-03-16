.data #RISC-V
	td: .word 0x12345678
	td12: .byte 0x12
	td34: .byte 0x34
	td56: .byte 0x56
	td78: .byte 0x78
	
.text
	la $a1, td
	lb $a2, td