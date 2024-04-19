.data #RISC-V
	#tdata: .byte 0x80
	tdata: .byte -1
	blank: .ascii "\n"
.text
	lb a0,tdata
	li a7,1
	ecall
	lb a0,tdata
	li a7,36
	ecall
	
	la a0, blank
	li a7, 4
	ecall

	lbu a0,tdata
	li a7,1
	ecall
	
	la a0, blank
	li a7, 4
	ecall
	
	lbu a0,tdata
	li a7,36
	ecall

	li a7,10
	ecall

