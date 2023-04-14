.data
	str: .space 10
	.align 2
	bin: .space 100
	
	str_yes: .asciiz " is a binary palindrome"
	str_no: .asciiz " is not a binary palindrome"
	
	str_dec: .asciiz "\nthe ASCII code is "
	str_bin: .asciiz "\nthe binary code is "
	
	# speparator
	spep: .asciiz "-"
.text
main:

la $a0, str
li $a1, 7
li $v0, 8
syscall

la $s1, str

# char cnt
li $s2, 0
# store address
la $s3, bin

read_char:
	lb $v0, ($s1)

	# if \0, then start to judge
	beq $v0, 10, judge
	
	addi $s1, $s1, 1
	addi $s2, $s2, 1

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
	# !!! add the speparator
	li $s5, -1
	sb $s5, ($s3)

	# replace the last char of str to \0
	sb $zero, ($s1)
	
	
	# $s2 store the number of bytes
	mul $s2, $s2, 8
	move $t5, $s2
	addi $s2, $s2, -1
	
	
	
	# middle
	div $s4, $s2, 2
	
	# left address
	li $s5, 0
	
	la $s1, bin
	
judge_loop:
	
	add $t1, $s1, $s5
	# right address
	sub $t2, $s2, $s5
	add $t2, $s1, $t2
	
	lb $t3, ($t1)
	lb $t4, ($t2)
	
	addi $s5, $s5, 1
	bne $t3, $t4, no
	
	# continue to judge
	ble $s5, $s4, judge_loop
	
	# Yes
	j yes

yes:
	la $s1, str_yes
	j print

no:
	la $s1, str_no
	j print

print:
	la $a0, str
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 4
	syscall
	
	la $a0, str_dec
	li $v0, 4
	syscall


print_dec:
	la $t0, str
	
print_dec_loop:
	lb $a0, ($t0)
	
	li $v0, 1
	syscall
	
	# whether next char is 0
	lb $a0, 1($t0)
	beqz $a0, print_bin
	
	# print -
	la $a0, spep
	li $v0, 4
	syscall
	
	addi $t0, $t0, 1
	j print_dec_loop
	
print_bin:
	la $a0, str_bin
	li $v0, 4
	syscall

	la $t0, bin
	li $t1, -1
print_bin_loop:
	addi $t1, $t1, 1
	lb $a0, ($t0)
	li $v0, 1
	syscall
	
	addi $t0, $t0, 1
	beq $t1, 7, print_spep
	j print_bin_loop


print_spep:
	lb $a0, ($t0)
	beq $a0, -1, exit

	la $a0, spep
	li $v0, 4
	syscall
	
	li $t1, -1
	j print_bin_loop

exit:
