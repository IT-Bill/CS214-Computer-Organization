.data #MIPS
    str1: .ascii "\nWelcome " 
    sid: .space 9
    str2: .asciz "to RISC-V World"
.text

	la a0, sid
	li a1, 9
	li a7, 8
	ecall 
	
	li s1, 32
	sb s1, 8(a0)
	
	li a7, 4
	la a0, str1
	ecall
