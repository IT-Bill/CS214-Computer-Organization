.data
	float1: .float 1.0
	float2: .float -1.0

.text
main:


	lwc1 $f0, float1
	lwc1 $f1, float2
	
	add.s $f12, $f0, $f1

	li $v0, 3
	syscall
	
	#seq $a0, $f12, $zero
	li $v0, 1
	syscall