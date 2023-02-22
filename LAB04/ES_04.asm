			.data
			
matrice:	.space 40
			.space 40
			.space 40
			.space 40
			.space 40
			.space 40
			.space 40
			.space 40
			.space 40
			.space 40
			
			
			.text
			.globl main
			.ent main
			
main:		
			and $t3, $0, $0		# contatore riga
			and $t4, $0, $0 	# contatore colonna
					
			sll $t5, $t3, 2	    # riscalo l'indice i (x 4 byte)
			sll $t6, $t4, 2		# riscalo l'indice j (x 4 byte)
			
			addi $t0, $t0, 1	# numero di cui calcolare la 'tabellina'
			
			and $t1, $0, $0
			
ciclo_riga:	
			addi $t8, $t8, 1	# numero da moltiplicare
			mul $t9, $t0, $t8
			sw $t9, matrice($t1)
			
			addi $t6, $t6, 4
			addi $t4, $t4, 1
			addi $t1, $t1, 4
			
			bne $t4, 10, ciclo_riga
	
			and $t8, $0, $0		# resetto numero da moltiplicare
			and $t4, $0, $0 	# resetto contatore colonna
			sll $t6, $t4, 2		# resetto indice j
			
			addi $t0, $t0, 1	# aggiorno numero di cui calcolare la 'tabellina'
			
			addi $t3, $t3, 1
			addi $t5, $t5, 4
			bne $t3, 10, ciclo_riga
			
			
			li $v0, 10
			syscall
			.end main