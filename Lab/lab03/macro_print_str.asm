.data
    array: .word 0x7f00, 0x0001, 0x7f00, 0x0001,0x0011, 0xcbe0,0x2ee0, 0x000a,0x6162
    
.text
main: 
    la $t0, array

    li $t1, 0  # counter
    li $t2, 8
    
    li $t3, 0  # sum
    loop: 
        
        lw $s0, ($t0)
        addi $t1, $t1, 1

        beq $t1, $t2, exit
        
        add $t3, $t3, $s0 
        addi $t0, $t0, 4

        j loop 
    exit:
	    lw $a0, 0($t3)
        li $v0, 1
        syscall