.data
	di: .word 0x12345678
	#di: .word 0x8192a3b4
	blank: .ascii "\n"
.text
main:
	lw a0, di
	li a7, 34
	ecall
	
	la a0, blank
	li a7, 4
	ecall
	
	la s2, di
	lb s3, (s2)
	lb s4, 1(s2)
	lb s5, 2(s2)
	lb s6, 3(s2)
	
	sb s6, (s2)
	sb s5, 1(s2)
	sb s4, 2(s2)
	sb s3, 3(s2)
	
	lw a0, di
	li a7, 34
	ecall
	
	
	
	