		.data
msg1: 	.asciiz "Introduci un numero intero positivo: "	
msg2:   .asciiz "Il risultato dell' AND logico e': "
msg3:	.asciiz " Il numero e' pari."
msg4:	.asciiz " Il numero e' dispari."
		.text
		.globl main
		.ent main
		
main:	
		li $v0, 4 			
		la $a0, msg1 		
		syscall 			
		
		li $v0, 5 			 
		syscall
		move $t0, $v0 		# in $t0 ho il numero intero positivo
		
		addi $t1, $t1, 1    # in $t1 ho il valore 1
		
		and $t2, $t0, $t1	# se il res dell'AND e' 0, e' pari, altrimenti e' dispari
			
		li $v0, 4 			
		la $a0, msg2
		syscall 
		
		li $v0, 1
		move $a0, $t2		# stampo res dell'AND
		syscall
		
		beq $t2, $t1, L1
		li $v0, 4 			
		la $a0, msg3	
		syscall 			
		j done
	
L1: 	li $v0, 4 			
		la $a0, msg4	
		syscall

done:	
			
		li $v0, 10
		syscall
		.end main
		