.data
	tolerance: .float 0.00001
	divider: .float 2
.text
main:
	li $v0, 6
	syscall
	
	mov.s $f1, $f0  # number
	lwc1 $f2, tolerance
	lwc1 $f3, divider
	
	div.s $f4, $f1, $f3  # init  Xn
	
loop:
	# X(n+1)
	div.s $f5, $f1, $f4
	add.s $f5, $f4, $f5
	div.s $f5, $f5, $f3
	
	sub.s $f6, $f5, $f4
	mov.s $f4, $f5  # X(n+1) <- X(n)
	
	abs.s $f6, $f6
	c.lt.s $f6, $f2
	bc1f loop

result:
	li $v0, 2
	mov.s $f12, $f5
	syscall
	
	
	
