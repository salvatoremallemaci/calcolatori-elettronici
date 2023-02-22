			.data
			
a1:			.word 6
b1:			.word -2
a2:			.word 4
b2:			.word 3			
			
			.text
			.globl main
			.ent main
			
			
main:		
			subu $sp, $sp, 4	# salva $ra nello stack
			sw $ra, ($sp)
			
			lw $t0, a1
			move $a0, $t0
			
			lw $t1, b1
			move $a1, $t1
			
			lw $t2, a2
			move $a2, $t2
			
			lw $t3, b2
			move $a3, $t3
			
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
			sw $t6, ($sp)
			
			subu $sp, $sp, 4	# salva $t7 nello stack
			sw $t7, ($sp)
			
			jal determinante2x2
			
			move $t5, $v0		# salvo momentaneamente il determinante
								# in $t5
			
			li $v0, 1
			move $a0, $t5		# stampo il determinante
			syscall
			
			lw $t7, ($sp)		# ripristina $t7
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t6, ($sp)		# ripristina $t6
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
			
			.ent determinante2x2

determinante2x2:
	
#			a1    b1			6	-2
#			a2	  b2			4	 3
			
			move $t0, $a0		# in $t0 ho a1
			move $t1, $a1		# in $t1 ho b1
			move $t2, $a2		# in $t2 ho a2
			move $t3, $a3		# in $t3 ho b2
			
			# uso $t4,$t6, $t7 come registri di appoggio
			and $t4, $0, $0
			and $t6, $0, $0
			and $t7, $0, $0
			
			mul $t4, $t0, $t3
			mul $t6, $t2, $t1
			
			sub $t7, $t4, $t6
			
			move $v0, $t7
	
			jr $ra
			
			.end determinante2x2
			
			