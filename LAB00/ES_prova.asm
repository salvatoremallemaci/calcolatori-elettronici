	.data
	# dichiarazione dei dati
op1: .byte 3
op2: .byte 2
res: .space 1 

	.text
	# codice 
	.globl main
	.ent main
main: #res = #op1 + #op2 
	# SBGALIATO add res, op1, op2
	lb $t1, op1
	lb $t2, op2
	add $t1, $t1, $t2
	sb $t1, res

	li $v0, 10
	syscall
	.end main
