					.data
			
vettore_riga:		.word 34, -3, 2, 5
vettore_colonna:	.word 2, -21, 7, 4

matrice:			.space 16
					.space 16
					.space 16
					.space 16
					
					.text
					.globl main
					.ent main
			
main:		
					# la $t0, matrice
					
					
					and $t3, $0, $0		# contatore riga
					and $t4, $0, $0 	# contatore colonna
					
					sll $t5, $t3, 2	    # riscalo l'indice i (x 4 byte)
					sll $t6, $t4, 2		# riscalo l'indice j (x 4 byte)
					
					and $t1, $0, $0
					
ciclo_riga:		
					lw $t8, vettore_riga($t5)
					lw $t9, vettore_colonna($t6)	
					mul $t7, $t8, $t9
					sw $t7, ,matrice($t1)					
					addi $t6, $t6, 4
					addi $t4, $t4, 1
					addi $t1, $t1, 4
					bne $t4, 4, ciclo_riga 
					
					
					and $t4, $0, $0 	# resetto contatore colonna
					sll $t6, $t4, 2		# resetto indice j
					
					addi $t3, $t3, 1
					addi $t5, $t5, 4
					bne $t3, 4, ciclo_riga

					li $v0, 10
					syscall
					.end main