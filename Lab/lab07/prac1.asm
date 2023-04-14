.data
	

.text
main:
	li $v0, 7
	syscall
	
	mov.d $f0, $f12

	ldc1 $f2, 1  # old res
	ldc1 $f4, 1  # new res
	lw $s0, 1  # fac cnt
	lw $s1, 1  # fac res
	
loop:
	mul $s1, $s1, $s0
	addi $s0, $s0, 1
	
	