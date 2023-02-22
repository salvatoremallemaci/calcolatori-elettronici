				.data
matrice:		.word 154, 123, 109, 86, 4, 0
				.word 412, -23, -231, 9, 50, 0
				.word 123, -24, 12, 55, -45, 0
				.word 0, 0, 0, 0, 0, 0

				.text
				.globl main
				.ent main

main:		
			
				and $t3, $0, $0		# contatore riga
				and $t4, $0, $0 	# contatore colonna
						
				sll $t5, $t3, 2	    # riscalo l'indice i (x 4 byte)
				sll $t6, $t4, 2		# riscalo l'indice j (x 4 byte)
				
				and $t1, $0, $0
				and $t9, $0, $0
				
				addi $t1, $t1, -4

ciclo_riga:	
				addi $t1, $t1, 4
				lw $t2, matrice($t1)
				add $t9, $t9, $t2
		
				addi $t6, $t6, 4
				addi $t4, $t4, 1
			
				bne $t4, 5, ciclo_riga
				
				addi $t1, $t1, 4
				sw $t9, matrice($t1)
				
				
				and $t8, $0, $0		# resetto numero da moltiplicare
				and $t4, $0, $0 	# resetto contatore colonna
				sll $t6, $t4, 2		# resetto indice j
				and $t9, $0, $0		# resetto contatore valore per riga
				
				addi $t3, $t3, 1
				addi $t5, $t5, 4
				bne $t3, 3, ciclo_riga
				
				
				and $t3, $0, $0		# contatore riga
				and $t4, $0, $0 	# contatore colonna
						
				sll $t5, $t3, 2	    # riscalo l'indice i (x 4 byte)
				sll $t6, $t4, 2		# riscalo l'indice j (x 4 byte)
				
				and $t1, $0, $0
				and $t9, $0, $0
				and $t7, $0, $0		# contatore cicli
ciclo_colonna:
				lw $t2, matrice($t1)
				add $t9, $t9, $t2
				j fine

fine:			addi $t3, $t3, 1
				addi $t5, $t5, 4
				addi $t1, $t1, 24
				bne $t3, 3, ciclo_colonna
				
				sw $t9, matrice($t1)
				
				addi $t7, $t7, 1	# ciclo++
				and $t3, $0, $0		# contatore riga
				and $t4, $0, $0 	# contatore colonna
						
				sll $t5, $t3, 2	    # riscalo l'indice i (x 4 byte)
				
				and $t1, $0, $0
				and $t9, $0, $0
				and $t6, $0, $0
				
				mul $t6, $t7, 4		# 4 * numCiclo
				
				
				add $t1, $t1, $t6	# parto dalla posizione desiderata
				bne $t7, 6, ciclo_colonna
				
							
				li $v0, 10
				syscall
				.end main