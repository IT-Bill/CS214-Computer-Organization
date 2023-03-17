.data
	str: .space 10
	str_bin: .space 100
.text
main:

la $a0, str
li $a1, 10
li $v0, 8
syscall

la $s1, str

# char cnt
li $s2, 0
# store address
move $s3, $s1
la $s3, str_bin

read_char:
	li $v0, 12
	syscall
	
	beqz $v0, judge

li $s4, 128
store_loop:
	and $s5, $s4, $v0
	sne $s5, $s5, 0
	sb $s5, ($s3)
	
	div $s4, $s4, 2
	addi $s3, $s3, 1
	bnez $s4, store_loop
	j read_char

judge:
	mul $s2, $s2, 8
	addi $s2, $s2, -1
	
	# middle
	div $s4, $s2, 2
	
	# left address
	li $s5, 0
	
judge_loop:
	
	add $t1, $s1, $s5
	# right address
	sub $t2, $s2, $s5
	add $t2, $s1, $t2
	

	lb $t3, ($t1)
	lb $t4, ($t2)
	
	addi $s5, $s5, 1
	bne $t3, $t4, No
	
	
No:

Yes:











