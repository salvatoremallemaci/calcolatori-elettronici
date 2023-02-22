DIM = 4
			 .data
matrice: 	.word 126, -988, 65, 52
			.word 7, 0, 2, 643
			.word 66, 532, 43, 9254
			.word 5, -51, 4352, -452
			.text
			.globl main
			.ent main
main: 		subu $sp, $sp, 4
			sw $ra, ($sp)
			la $a0, matrice
			li $a1, DIM
			jal calcolaTrasp
			lw $ra, ($sp)
			addiu $sp, $sp, 4
		    jr $ra 
			
			
			
			
			.end main
			
			
			
			.ent calcolaTrasp
calcolaTrasp:
			sub $sp, $sp, 4
			sw $s0, ($sp)
			move $t0, $a0	 # indirizzo matrice
			move $t1, $a1	 # dim di riga (matrice quadrata)
			
			mul $t2, $t1, 4	 # offset di movimento (16)
			mul $t6, $t2, 4	 # dim max matrice di word
			sub $t6, $t6, 4
			move $t8, $t6
			and $t3, $0, $0	 # indice ciclo_stack
			sub $s0, $t1, 1
			
			sub $t0, $t0, 4
ciclo_stack:
			subu $sp, $sp, 4
			add $t0, $t0, 4
			lw $t5, ($t0)
			sw $t5, ($sp)
			addi $t3, $t3, 4
			bne $t3, 64, ciclo_stack
			
			move $t0, $a0		# resetto $t0, con indirizzo iniziale
			and $t3, $0, $0		# indice ciclo colonna
			and $t7, $0, $0		# indice riga
			sub $t7, $t7, 1
			
ciclo_colonna:
			
			add $t0, $t0, $t6
			lw $t5, ($sp)
			sw $t5, ($t0)
			addu $sp, $sp, 4
			sub $t6, $t6, $t2
			addi $t3, $t3, 1
			move $t0, $a0
			bne $t3, $t1, ciclo_colonna
			
			addi $t7, $t7, 1
			beq $t7, $t1, fine
ciclo_riga:	
			and $t3, $0, $0
			move $t9, $t8
			move $t0, $a0
			mul $t4, $t7, 4
			add $t4, $t4, $t1
			sub $t9, $t9, $t4
			move $t6, $t9
			bne $t7, $s0, ciclo_colonna
			
fine:		
			lw $s0, ($sp)
			addu $sp, $sp, 4
			j $ra
			.end calcolaTrasp