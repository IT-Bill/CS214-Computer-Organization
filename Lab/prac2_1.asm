.data #MIPS
       m1:.half 256 #multiplicand
       m2:.half 10000 #multiplier
.text
       lh $t0,m1
       lh $t1,m2
       li $t2, 0
loop:
       li $s1,1
       and $s2,$s1,$t1 #to determine the lowest bit of $s1
       beq $s2, 0, jumpAdd
       add $t2, $t0, $t2
jumpAdd:
       sll $t0,$t0,1
       srl $t1,$t1,1
       addi $a0,$a0,1
       addi $a1,$0,16 #4 is the length of 9 in binary
       blt $a0,$a1,loop
       add $a0,$0,$t2
       li $v0,34
       syscall