DIM = 11
			.data
veta:		.word 2, 14, 8, 54, 0, 42, 9, 24, 0, 91, 23
vetb: 		.space 4*DIM

			.text
			.globl main
			.ent main
			
main: 		
			subu $sp, $sp, 4
			sw $ra, ($sp)
			
			la $a0, veta
			la $a1, vetb
			li $a2, DIM
			jal media
			
			lw $ra, ($sp)
			addiu $sp, $sp, 4
		    jr $ra 
			
			.end main
			
			.ent media
			
media:		
			subu $sp, $sp, 4
			sw $s0, ($sp)
			subu $sp, $sp, 4
			sw $s1, ($sp)
			subu $sp, $sp, 4
			sw $s2, ($sp)


			move $s0, $a0	# in $s0 ho indirizzo di $a0
			move $s1, $a1	# in $s1 ho indirizzo di $a1
			move $s2, $a2	# in $s2 ho dim dei vettori ( ES:11 ) 
			addi $t6, $s2, -1
			and $t0, $0, $0	# indice di conteggio 
			and $t7, $0, $0
			
ciclo:		
			and $t3, $0, $0	
			and $t4, $0, $0	# resetto tutto ad ogni giro
			and $t5, $0, $0
			move $s0, $a0	# in $s0 ho indirizzo di $a0
			move $s1, $a1	# in $s1 ho indirizzo di $a1
			
			beq $s2, 1, uno
			beq $s2, 2, due
			beq $s2, 3, tre
			
			
			beq $t0, 0, uguale			
			beq $t0, 1, uguale	# gestisco a parte i=0,i=1,i=DIM
			beq $t0, $t6, uguale_fine
			
			mul $t3, $t0, 4		
			add $s0, $s0, $t3	# aggiorno l'indirizzo
			add $s1, $s1, $t3
			
			lw $t4, -8($s0)
			add $t5, $t5, $t4	
			lw $t4, -4($s0)
			add $t5, $t5, $t4	# vetb[i] = ...
			lw $t4, ($s0)
			add $t5, $t5, $t4
			lw $t4, 4($s0)
			add $t5, $t5, $t4
			
			div $t5, $t5, 4		# divido per 4, calcolandone la media
			
			sw $t5, ($s1)		# memorizzo il valore in vetb
			
			
			addi $t0, $t0, 1	# aggiorno indice ciclo
			
			bne $t0, $s2, ciclo
			
			
			
uguale:		
			mul $t3, $t0, 4
			add $s0, $s0, $t3
			add $s1, $s1, $t3
			lw $t1, ($s0)
			sw $t1, ($s1)
			addi $t0, $t0, 1
			j ciclo
			
uguale_fine:
	
			mul $t3, $t0, 4
			add $s0, $s0, $t3
			add $s1, $s1, $t3
			lw $t1, ($s0)
			sw $t1, ($s1)
			addi $t0, $t0, 1
			j fine	
			
uno:			
			lw $t1, ($s0)
			sw $t1, ($s1)
			j fine

due:		
			lw $t1, ($s0)
			lw $t2, 4($s0)
			sw $t1, ($s1)
			sw $t2, 4($s1)
			j fine
			
tre:		
			lw $t1, ($s0)
			lw $t2, 4($s0)
			lw $t7, 8($s0)
			sw $t1, ($s1)
			sw $t2, 4($s1)
			add $t7, $t7, $t1
			add $t7, $t7, $t2
			div $t7, $t7, 3
			sw $t7, 8($s1)
			j fine

fine: 			
			lw $s2, ($sp)
			addu $sp, $sp, 4
			lw $s1, ($sp)
			addu $sp, $sp, 4
			lw $s0, ($sp)
			addu $sp, $sp, 4
			
			jr $ra
			
			.end media