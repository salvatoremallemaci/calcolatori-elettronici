			.data
			
a1:			.word 2
b1:			.word 6		
c1:			.word 7
a2:			.word -3
b2:			.word 5
c2:			.word 14 
a3:			.word -7
b3:			.word -1
c3:			.word 0			
			
			.text
			.globl main
			.ent main	
			
main:		
		#	subu $sp, $sp, 4	# salva $ra nello stack
		#	sw $ra, ($sp)
			
			lw $t0, a1
			move $a0, $t0
			
			lw $t1, b1
			move $a1, $t1
			
			lw $t2, c1
			move $a2, $t2
			
			lw $t3, a2
			move $a3, $t3
			
			lw $t4, b2
			lw $t5, c2
			lw $t6, a3
			lw $t7, b3
			lw $t8, c3
			
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
			
			subu $sp, $sp, 4	# salva $t5 nello stack
			sw $t5, ($sp)
			
			subu $sp, $sp, 4	# salva $t6 nello stack
			sw $t6, ($sp)
			
			subu $sp, $sp, 4	# salva $t7 nello stack
			sw $t7, ($sp)
			
			subu $sp, $sp, 4	# salva $t8 nello stack
			sw $t8, ($sp)
			
						
			subu $sp, $sp, 4	# salvo b2 nello stack
			sw $t4, ($sp)
			
			
			subu $sp, $sp, 4	# salvo c2 nello stack
			sw $t5, ($sp)
			
			
			subu $sp, $sp, 4	# salvo a3 nello stack
			sw $t6, ($sp)
			
			
			subu $sp, $sp, 4	# salvo b3 nello stack
			sw $t7, ($sp)
			
				
			subu $sp, $sp, 4	# salvo c3 nello stack
			sw $t8, ($sp)
			
			
			
			jal determinante3x3
			
			move $t9, $v0		# salvo momentaneamente il determinante
								# in $t9
			
			li $v0, 1
			move $a0, $t9		# stampo il determinante
			syscall
			
			
			addiu $sp, $sp, 20	# ripristino lo stack per
								# i 5 val passati come parametro
				
			lw $t8, ($sp)		# ripristina $t8
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t7, ($sp)		# ripristina $t7
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t6, ($sp)		# ripristina $t6
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t5, ($sp)		# ripristina $t5
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
			
		#	lw $ra, ($sp)		# ripristina $ra
		#	addiu $sp, $sp, 4 	# ripristina $sp
			
		#	jr $ra

			li $v0, 10
			syscall
			.end main
			
			
			
			.ent determinante3x3
			
determinante3x3:

			move $fp, $ra

			move $t0, $a0		# in $t0 ho a1
			move $t1, $a1		# in $t1 ho b1
			move $t2, $a2		# in $t2 ho c1
			move $t3, $a3		# in $t3 ho a2
			
			lw $t4, 16($sp)		# in $t4 ho b2
			lw $t5, 12($sp)		# in $t5 ho c2
			lw $t6, 8($sp)		# in $t6 ho a3
			lw $t7, 4($sp)		# in $t7 ho b3
			lw $t8, ($sp)		# in $t8 ho c3
			
			# salvo i registri $s0-$s3 nello stack
			
			subu $sp, $sp, 4	# salva $s0 nello stack
			sw $s0, ($sp)
			
			subu $sp, $sp, 4	# salva $s1 nello stack
			sw $s1, ($sp)
			
			subu $sp, $sp, 4	# salva $s2 nello stack
			sw $s2, ($sp)
			
			subu $sp, $sp, 4	# salva $s3 nello stack
			sw $s3, ($sp)
			
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
			
			subu $sp, $sp, 4	# salva $t5 nello stack
			sw $t5, ($sp)
			
			subu $sp, $sp, 4	# salva $t6 nello stack
			sw $t6, ($sp)
			
			subu $sp, $sp, 4	# salva $t7 nello stack
			sw $t7, ($sp)
			
			subu $sp, $sp, 4	# salva $t8 nello stack
			sw $t8, ($sp)
			
			
			
			move $a0, $t4
			move $a1, $t5
			move $a2, $t7
			move $a3, $t8
			
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
			
			mul $s0, $t0, $v0	# a_1 * det_1
			
			move $a0, $t3
			move $a1, $t5
			move $a2, $t6
			move $a3, $t8
			
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
			
			mul $s1, $t1, $v0	# b_1 * det_2
			
			move $a0, $t3
			move $a1, $t4
			move $a2, $t6
			move $a3, $t7
			
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
			
			mul $s2, $t2, $v0	# c_1 * det_3
			
			and $s3, $0, $0
			and $s4, $0, $0
			
			sub $s3, $s0, $s1
			
			add $s4, $s3, $s2
			
			move $v0, $s4
			
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
			
			lw $t8, ($sp)		# ripristina $t8
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t7, ($sp)		# ripristina $t7
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t6, ($sp)		# ripristina $t6
			addiu $sp, $sp, 4 	# ripristina $sp
			
			lw $t5, ($sp)		# ripristina $t5
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
			

			jr $fp
			.end determinante3x3
			
			
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
			