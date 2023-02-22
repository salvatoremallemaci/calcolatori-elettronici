		.data
		
var:	.word 0x3ffffff0   # = 1073741808
		
		.text
		.globl main
		.ent main
		
main:	
		lw $t0, var
		add $t1, $t0, $t0
		sw $t1, var
		
		li $v0, 1
		lw $a0, var
		syscall
		
		addiu $t2, $t1, 40
		
		li $v0, 1
		move $a0, $t2
		syscall
	
	
	#	addiu $t2, $t2, 40
	#	addu $t3, $t1, $t2
		
	#	li $v0, 1
	#	move $a0, $t3
	#	syscall
		
		
		li $v0, 10
		syscall
		.end main
		