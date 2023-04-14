.macro print_float(%fr)
	addi $sp, $sp, -8
	swc1 $f12, 4($sp) #B
	sw $v0, 0($sp)
	
	mov.s $f12, %fr #C
	li $v0, 2 #C
	syscall
	
	lw $v0, 0($sp)
	lwc1 $f12, 4($sp)
	addi $sp, $sp, 8 #D
.end_macro

.macro print_string(%str)
	.data
		pstr: .asciiz %str
	.text
		la $a0, pstr
		li $v0, 4
		syscall 
.end_macro

.macro print_int(%int)
	addi $sp, $sp, -8
	sw $a0, 4($sp)
	sw $v0, 0($sp)
	
	mfc1 $a0, %int
	li $v0, 1
	syscall
	
	lw $v0, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
.end_macro


.macro end
	li $v0, 10
	syscall 
.end_macro
