.data
    music: .word 13, 13, 13, 12, 10, 10
.text
main:
	la $1, music
	addi $7, $0, 0  # cnt
    addi $3, $0, 6  # total
    
play_loop:
	lw $27, 0($1)
	jal play
	addi $1, $1, 4
	addi $7, $7, 1
	beq $7, $3, main
	
	move $a0, $27
	li $v0, 1
	syscall
	j play_loop


play:
	# $27
	addi $4, $0, 3
	addi $5, $0, 0
repeat:
	addi $5, $5, 1
	bne $4, $5, repeat
	jr $ra


