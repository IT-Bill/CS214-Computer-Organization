.data
	str: .space 50
	
.text
main:
	la $a0, str
	li $a1, 50
	li $v0, 8
	syscall


# cnt
la $s5, str


li $t6, -1 # row
li $t7, -1 # col

row_judge:
	# row cnt
	li $s2, -1

row_big_loop:
	addi $s2, $s2, 1
	bge $s2, 4, col_judge

	# the xor result of row 
	li $s1, 0

	# col cnt
	li $s3, 0
	
	
row_small_loop:
	mul $s4, $s2, 9
	add $s4, $s4, $s3
	add $s4, $s5, $s4
	lb $t1, ($s4)
	
	subi, $t1, $t1, 48
	
	xor $s1, $s1, $t1
	
	addi $s3, $s3, 1
	# continue xor this row
	blt $s3, 9, row_small_loop
	
	#finish and judge
	beqz $s1, row_big_loop
	
	# if reach here, this row is wrong
	move $t6, $s2
	
	
col_judge:	
	# col cnt
	li $s2, -1

col_big_loop:
	addi $s2, $s2, 1
	bge $s2, 8, modify

	# the xor result of col 
	li $s1, 0

	# row cnt
	li $s3, 0
	
col_small_loop:
	# calc the position
	mul $s4, $s3, 9
	add $s4, $s4, $s2
	add $s4, $s5, $s4
	lb $t1, ($s4)
	
	subi, $t1, $t1, 48
	
	xor $s1, $s1, $t1
	
	addi $s3, $s3, 1
	
	blt $s3, 5, col_small_loop
	
	beqz $s1, col_big_loop
	
	move $t7, $s2
	
modify:
	beq $t6, -1, print

	mul $s4, $t6, 9
	add $s4, $s4, $t7
	add $s4, $s5, $s4
	lb $t1, ($s4)
	
	beq $t1, 48, zero_to_one
	beq $t1, 49, one_to_zero


one_to_zero:
	li $t1, 48
	sb $t1, ($s4)
	j print
	
zero_to_one:
	li $t1, 49
	sb $t1, ($s4)
	j print

	
print:
	li $s2, -1

print_big_loop:
	addi $s2, $s2, 1
	bge $s2, 4, exit
	
	li $s3, 0

print_small_loop:

	mul $s4, $s2, 9
	add $s4, $s4, $s3
	add $s4, $s5, $s4
	lb $a0, ($s4)
	
	li $v0, 11
	syscall
	
	addi $s3, $s3, 1
	blt $s3, 8, print_small_loop
	j print_big_loop

exit:
