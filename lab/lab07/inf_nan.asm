.data
	sdata1: .word 0xff7f7fff # 1 1111 1110 111...
	sdata2: .word 0xffff7fff
	fneg1: .float -1

.text 
	lwc1 $f1, sdata1
	mul.s $f12, $f1, $f1  # 0 1111 1111 00000000000...
	
	li $v0, 2  # infinity
	syscall
	
	lwc1 $f2, fneg1
	mul.s $f12, $f12, $f2
	
	li $v0, 2  # -infinity
	syscall
	
	#######################################
	lwc1 $f1, sdata2
	mul.s $f12, $f1, $f1
	
	li $v0, 2 
	syscall
	
	lwc1 $f2, fneg1
	div.s $f12, $f12, $f2
	
	li $v0, 2 
	syscall
	