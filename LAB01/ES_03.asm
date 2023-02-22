		.data
op1:	.byte 150
op2:	.byte 100

		.text
		.globl main
		.ent main

main:	
		lbu $t0, op1		# istruzioni per binario puro o per CA2
		lbu $t1, op2		# in questo caso usiamo istruzioni per unsigned
		
		add $t2, $t0, $t1	# qui potrebbe usare add o addu, tanto abbiamo già
							# caricato i byte come unsigned in memoria.
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		li $v0, 10
		syscall
		.end main
		