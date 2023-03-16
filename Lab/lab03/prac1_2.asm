.data
    array: .half 0x7f00, 0x0001, 0x7f00, 0x0001,0x0011, 0xcbe0,0x2ee0, 0x000a, 0x6162
    .align 2
    sum: .space 4
.text
main: 
    la $t0, array

    li $t1, 0  # counter
    li $t2, 10
    
    li $t3, 0  # sum
    loop: 
        
        lh $s0, ($t0)
        addi $t1, $t1, 1

        beq $t1, $t2, exit
        
        add $t3, $t3, $s0 
        li $t0, 2

        j loop 
    exit:
	    la $t4, sum
	    sw $t3, ($t4)
	    
	    lh $t0, ($t4)
	    lh $t1, 2($t4) 
	    
	    add $t2, $t0, $t1 
	    
	    move $a0, $t2
        li $v0, 1
        syscall
