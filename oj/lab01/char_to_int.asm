.data 
	filename: .asciiz "text.txt"
    fill: .space 3
    buffer: .space 400
	
.text
main:
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
    li $a2, 40 # read 40 ascii chars
    syscall
    
    # print string
    #la $a0, buffer 
    #li $v0, 4
    #syscall
    
    la $a0, buffer 
    lb $s1, 1($a0)
    move $a0, $s1
    
    li $s2, 60 # bound
    
    addi $sp, $sp, -4
    sw $ra, ($sp)
    
    blt $a0, $s2, num_to_int 
    bgt $a0, $s2, char_to_int

    li $v0, 1
    syscall
    j exit

# put the num-char in $a0
num_to_int:
	subi $a0, $a0, 48
	lw $ra, ($sp)
    addi $sp, $sp, 4
	
	jr $ra

char_to_int:
	subi $a0, $a0, 87
	lw $ra, ($sp)
    addi $sp, $sp, 4
	jr $ra

exit:
