			.data
			
N:			.word 7				
			
			.text
			.globl main
			.ent main

main:		
			subu $sp, $sp, 4	# salva $ra nello stack
			sw $ra, ($sp)
			
			li $t0, 4
			li $t1, 2			# carico in dei registri t
			li $t2, -5			# i coefficenti del polinomio
			li $t3, 3
			
			subu $sp, $sp, 4	# salva $t0 nello stack
			sw $t0, ($sp)
			
			subu $sp, $sp, 4	# salva $t1 nello stack
			sw $t1, ($sp)
			
			subu $sp, $sp, 4	# salva $t2 nello stack
			sw $t2, ($sp)
			
			subu $sp, $sp, 4	# salva $t3 nello stack
			sw $t3, ($sp)
			
			lw $t4, N
			subu $sp, $sp, 4
			sw $t4, ($sp)		# salvo il 5^ parametro nello stack
			
			and $t4, $0, $0		# ripristino $t4
			
			li $s0, 8
			li $s1, 4
			li $s2, 27			# salvo informazioni utili
			li $s3, 9			# nei registri s
			li $s4, 64
			li $s5, 16
			
			and $a0, $0, $0
			and $a1, $0, $0
			and $a2, $0, $0
			and $a3, $0, $0
			and $t6, $0, $0
			
			# add $a0, $a0, 4
			# add $a1, $a1, 33
			# add $a2, $a2, 114
			# add $a3, $a3, 271
			
			add $t6, $t0, $t1
			add $t7, $t2, $t3
			add $a0, $t6, $t7
			
			mul $t6, $t0, $s0
			add $a1, $a1, $t6
			mul $t6, $t1, $s1
			add $a1, $a1, $t6
			mul $t6, $t2, 2
			add $a1, $a1, $t6
			add $a1, $a1, $t3
			
			mul $t6, $t0, $s2
			add $a2, $a2, $t6
			mul $t6, $t1, $s3	# passo come primi 4 parametri 
			add $a2, $a2, $t6	# p(1), p(2), p(3),p(4)
			mul $t6, $t2, 3
			add $a2, $a2, $t6
			add $a2, $a2, $t3
			
			mul $t6, $t0, $s4
			add $a3, $a3, $t6
			mul $t6, $t1, $s5	# il 5' par e' in cima allo stack
			add $a3, $a3, $t6
			mul $t6, $t2, 4
			add $a3, $a3, $t6
			add $a3, $a3, $t3
		
								
								
			jal polinomio
			
			
			addiu $sp, $sp, 4	# ripristino stack per N
			
			lw $t3, ($sp)		# ripristina $t3
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t2, ($sp)		# ripristina $t2
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t1, ($sp)		# ripristina $t1
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t0, ($sp)		# ripristina $t0
			addiu $sp, $sp, 4 	# ripristina $sp

			lw $ra, ($sp)		# ripristina $ra
			addiu $sp, $sp, 4 	# ripristina $sp
			
			move $t9, $v0
			
			jr $ra
			.end main		
			
			.ent polinomio
polinomio:	
			# carico il 5' parametro dallo stack
			lw $t4, ($sp)		# in $t4 ho N

			# salvo i registri $s0-$s5 nello stack
			
			subu $sp, $sp, 4	# salva $s0 nello stack
			sw $s0, ($sp)
			
			subu $sp, $sp, 4	# salva $s1 nello stack
			sw $s1, ($sp)
			
			subu $sp, $sp, 4	# salva $s2 nello stack
			sw $s2, ($sp)
			
			subu $sp, $sp, 4	# salva $s3 nello stack
			sw $s3, ($sp)
			
			subu $sp, $sp, 4	# salva $s4 nello stack
			sw $s4, ($sp)
			
			subu $sp, $sp, 4	# salva $s5 nello stack
			sw $s5, ($sp)
			
			
			
			
			
			sub $t0, $a1, $a0
			sub $t1, $a2, $a1
			sub $t2, $a3, $a2
			sub $s0, $t1, $t0
			sub $s1, $t2, $t1
			sub $s2, $s1, $s0
			move $v0, $a3
			
								# uso $t5 come indice del ciclo
			sub $t8, $t4, 4		# N - 4 = 7 - 4 = 3

ciclo:		
			add $s1, $s1, $s2
			add $t2, $t2, $s1
			add $v0, $v0, $t2
			addi $t5, $t5, 1	# incremento indice del ciclo
			bne $t5, $t8, ciclo	# ripeto il ciclo 3 volte
			

			lw $s5, ($sp)		# ripristina $s5
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $s4, ($sp)		# ripristina $s4
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $s3, ($sp)		# ripristina $s3
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $s2, ($sp)		# ripristina $s2
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $s1, ($sp)		# ripristina $s1
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $s0, ($sp)		# ripristina $s0
			addiu $sp, $sp, 4 	# ripristina $sp
			
			jr $ra
			.end polinomio