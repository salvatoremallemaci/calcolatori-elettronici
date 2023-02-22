			.data
			
numNat:		.word 19			
			
			.text
			.globl main
			.ent main
			
main:		
			subu $sp, $sp, 4	# salva $ra nello stack
			sw $ra, ($sp)

			lw $t0, numNat
			move $a0, $t0
			
			subu $sp, $sp, 4	# salvo $t0 nello stack
			sw $t0, ($sp)
			
			subu $sp, $sp, 4	# salva $t1 nello stack
			sw $t1, ($sp)
			
			subu $sp, $sp, 4	# salva $t2 nello stack
			sw $t2, ($sp)
			
			subu $sp, $sp, 4	# salva $t3 nello stack
			sw $t3, ($sp)
			
			subu $sp, $sp, 4	# salva $t4 nello stack
			sw $t4, ($sp)
			
			subu $sp, $sp, 4	# salva $t6 nello stack
			sw $t4, ($sp)
			
			subu $sp, $sp, 4	# salva $t7 nello stack
			sw $t4, ($sp)
			
			subu $sp, $sp, 4	# salva $t8 nello stack
			sw $t4, ($sp)
			
			jal sequenzaDiCollatz
			
			move $t5, $v0		# salvo momentaneamente il res
								# in $t5
			
			addi $t5, $t5, 1	# sommo 1, poichè c_0 è incluso
			
			li $v0, 1
			move $a0, $t5		# stampo res, ossia il numero di
								# iterazioni affinchè arrivi ad 1
			syscall
			
			lw $t4, ($sp)		# ripristina $t8
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t4, ($sp)		# ripristina $t7
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t4, ($sp)		# ripristina $t6
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t4, ($sp)		# ripristina $t4
			addiu $sp, $sp, 4 	# ripristina $sp
			
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
			
			jr $ra



			.end main
			
			
			.ent sequenzaDiCollatz
sequenzaDiCollatz:
			
			subu $sp, $sp, 4	# salva $ra nello stack
			sw $ra, ($sp)
			
			
			move $t8, $a0
			and $t7, $0, $0		# indice di ciclo, ossia il res
ciclo:		
			move $a1, $t8
			
			jal calcolaSuccessivo
			
			move $t8, $a1
			addi $t7, $t7, 1
			bne $t8, 1, ciclo
			
			lw $ra, ($sp)		# ripristina $ra
			addiu $sp, $sp, 4 	# ripristina $sp
			
			move $v0, $t7
			
			jr $ra
			
			.end sequenzaDiCollatz
			
			
			.ent calcolaSuccessivo

calcolaSuccessivo:
			
			move $t1, $a1		# sposto in t1 il valore pass
								# come parametro tramite a0
			
			li $t2, 1
			and $t3, $t1, $t2	# se il res dell'AND e' 0
								# e' pari, altrimenti e' dispari
			
			beq $t3, 0, pari
#dispari:	
			mul $t4, $t1, 3
			add $t4, $t4, 1
			move $a1, $t4
			j fine
			

pari:		div $a1, $t1, 2		# c_(i+1) = c_(i)/2

fine:
			jr $ra

			.end calcolaSuccessivo