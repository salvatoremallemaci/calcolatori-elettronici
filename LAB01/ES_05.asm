		.data	
		
msg1: 	.asciiz "introduci il primo valore: "
msg2: 	.asciiz "introduci il secondo valore: "	
msg3: 	.asciiz "Effettuo l'inversione: \n"
msg4:   .asciiz "I nuovi valori sono: "
msg5:	.asciiz " "		
		.text
		.globl main
		.ent main
		
main:	
		li $v0, 4 			
		la $a0, msg1 		
		syscall 			

		li $v0, 5 			# syscall 5 (read_int) 
		syscall
		move $t1, $v0 		# primo operando in $t1
		
		li $v0, 4 			
		la $a0, msg2 		
		syscall 
		
		li $v0, 5			# syscall 5 (read_int) 
		syscall
		move $t2, $v0		# primo operando in $t2
		
		li $v0, 4 			
		la $a0, msg3 		
		syscall 
		
		add $t1, $t1, $t2
		sub $t2, $t1, $t2
		sub $t1, $t1, $t2
		
		li $v0, 4 			
		la $a0, msg4 		
		syscall 
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4 			
		la $a0, msg5		
		syscall 
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		li $v0, 10
		syscall
		.end main