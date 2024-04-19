.include "macro_print_str.asm"
.data
	str1: .asciiz "str1:"
	fd1: .float 1.0
	dd1: .double 2.0
	
.text
main:
	lwc1 $f12, fd1
	li $v0, 2
	syscall
	
	cvt.d.s $f0, $f12
	ldc1 $f2, dd1
	c.le.d $f0, $f2
	
	bc1t printLe
	j printGt
	
printLe:
	print_string(" LessOrEqual ")
	j printSecondData

printGt:
	print_string(" LargerThen ")

printSecondData:
	ldc1 $f12, dd1
	li $v0, 3
	syscall
	
	end