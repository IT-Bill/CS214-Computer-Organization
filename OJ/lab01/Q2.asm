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
	
	#move $s4, $s5

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
	
	move $s4, $s5

col_big_loop:
	addi $s2, $s2, 1
	bge $s2, 8, result

	# the xor result of col 
	li $s1, 0

	# row cnt
	li $s3, 0
	
col_small_loop:
	# calc the position
	mul $s4, $s2, 5
	add $s4, $s4, $s3
	add $s4, $s5, $s4
	lb $t1, ($s4)
	
	subi, $t1, $t1, 48
	
	xor $s1, $s1, $t1
	
	addi $s3, $s3, 1
	
	blt $s3, 5, col_small_loop
	
	beqz $s1, col_big_loop
	
	move $s7, $s2
	
result:
	li $v0, 1
	move $a0, $s6
	syscall
	
	li $v0, 1
	move $a0, $s7
	syscall


	
	






