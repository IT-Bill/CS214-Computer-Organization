.data 
	#filename: .asciiz "data.txt"
	filename: .space 100
    buffer: .space 4000
	int: .word 0
.text
main:
	# read filename
	la $a0, filename
	li $v0, 8
	li $a1, 18
	syscall

	# open file
    li $v0, 13
    la $a0, filename 
    li $a1, 0 # 0 for read
    li $a2, 0
    syscall
    move $s6, $v0 # save file descriptor
    
    # read file
    li $v0, 14
    move $a0, $s6 # load file descriptor
    la $a1, buffer # save read content to buffer space
    li $a2, 201 # read ascii chars
    syscall

    la $s6, buffer
    # shift 20-bit to get address
    addi $s6, $s6, 24
    
    # the total sum
    li $t1, 0
    
    # length
    li $t4, 0

get_4_bit_sum:

    # the 4-bit sum
    li $t2, 0
    
    # the power cnt
    li $t3, 3
    
accumulate:
	mul $t2, $t2, 16

    lb $a0, ($s6)
    addi $t4, $t4, 1
    
    blt $a0, 60, num_to_int 
    bgt $a0, 60, char_to_int

multi:
	add $t2, $t2, $a0 
    
    addi $t3, $t3, -1
    addi $s6, $s6, 1
    bge $t3, 0, accumulate
    
    # have read 4-bit, add to the total sum
    add $t1, $t1, $t2
    
    # whether end of file
	lb $a0, ($s6)
	bnez $a0, get_4_bit_sum
	

# the last 2 sum
addi $t1, $t1, 17
addi $t4, $t4, -16
div $t4, $t4, 2
add $t1, $t1, $t4

# shift right 16 bits
#srl $t2, $t1, 16

# shift left 16 bits and right 16 bits
#sll $t1, $t1, 16
#srl $t1, $t1, 16
#add $t1, $t1, $t2

li $t2, 65535
div $t3, $t1, 65536
mul $t4, $t3, 65536
ble $t1, $t2, last

wrap:
	subu $t1, $t1, $t4
	addu $t1, $t1, $t3

last:
	
	subu $t1, $t2, $t1
	#move $a0, $t1
	addu $a0, $zero, $t1
	li $v0, 34
	syscall
	j exit


# put the num-char in $a0
num_to_int:
	subi $a0, $a0, 48
	jal multi

char_to_int:
	subi $a0, $a0, 87
	jal multi

exit:
