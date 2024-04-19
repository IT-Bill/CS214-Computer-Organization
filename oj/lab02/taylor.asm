.data
	
	unit: .float 1.0
	factor: .float 1.0
	sign: .float -1.0
	zero: .float 0.0
	n: .asciiz "\n"
.text
main:
	# read op
	li $v0, 6
	syscall

	# judge whether op is an integer or float
	mov.s $f8, $f0
	ceil.w.s $f3, $f0
	floor.w.s $f4, $f0
	
	# read x to $f0
	li $v0, 6
	syscall
	
	c.eq.s 1, $f3, $f4
	bc1t 1, op_int
	j op_threshold
	

op_int:
	mfc1 $t0, $f3  # store the final num of term
	mov.s $f7, $f0  # store x
	mov.s $f1, $f0  # store term
	li $s0, 0  # term cnt
	lwc1 $f2, zero  # result
	lwc1 $f3, unit  # divide
	lwc1 $f4, unit  # plus tool

op_int_loop:

	# judge whether plus or minus
	div $s1, $s0, 2
	mfhi $s1
	beqz $s1, op_int_loop_plus
	sub.s $f2, $f2, $f1
	j op_int_loop_bp1
op_int_loop_plus:
	add.s $f2, $f2, $f1
	
# break point
op_int_loop_bp1:
	# divide x
	# square
	mul.s $f1, $f1, $f7
	mul.s $f1, $f1, $f7
	
	add.s $f3, $f3, $f4
	div.s $f1, $f1, $f3
	add.s $f3, $f3, $f4
	div.s $f1, $f1, $f3
	


	# judge continue?
	addi $s0, $s0, 1
	bne $s0, $t0, op_int_loop
	
	# end
	j exit



op_threshold:
	mov.s $f7, $f0  # store x
	mov.s $f1, $f0  # store term
	mov.s $f0, $f8  # store the threshold
	li $s0, 0  # term cnt
	lwc1 $f2, zero  # result
	lwc1 $f3, unit  # divide
	lwc1 $f4, unit  # plus tool
	
op_threshold_loop:
	# judge whether plus or minus
	div $s1, $s0, 2
	mfhi $s1
	beqz $s1, op_threshold_loop_plus
	sub.s $f2, $f2, $f1
	j op_threshold_loop_bp1
	
op_threshold_loop_plus:
	add.s $f2, $f2, $f1
	
op_threshold_loop_bp1:
	# judge continue?
	
	c.lt.s 1, $f1, $f0
	bc1t 1, exit
	
	mul.s $f1, $f1, $f7
	mul.s $f1, $f1, $f7
	add.s $f3, $f3, $f4
	div.s $f1, $f1, $f3
	add.s $f3, $f3, $f4
	div.s $f1, $f1, $f3

	addi $s0, $s0, 1
	j op_threshold_loop


exit:
	li $v0, 2
	mov.s $f12, $f2
	syscall
	li $v0, 10
	syscall


	


