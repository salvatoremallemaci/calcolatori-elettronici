			.data
ora_in: 	.byte 12, 47
ora_out: 	.byte 18, 14
X: 			.byte 1
Y: 			.byte 40

			.text
			.globl main
			.ent main
main:
			sub $sp, $sp, 4
			sw $ra, ($sp)
			
			la $a0, ora_in		# indirizzo di ora_in
			la $a1, ora_out		# indirizzo di ora_out
			lbu $a2, X
			lbu $a3, Y
			jal costoParcheggio
			
			move $t0, $v0
			
			li $v0, 1
			move $a0, $t0		# stampo il costo del parcheggio
			syscall
			
			lw $ra, ($sp)
			addi $sp, $sp,4
			jr $ra
			.end main
			
			.ent costoParcheggio
			
costoParcheggio:
			
			move $t0, $a0		# in $t0 ho l'indirizzo di ora_in
			move $t1, $a1		# in $t1 ho l'indirizzo di ora_out
			move $t2, $a2		# in $t2 ho X
			move $t3, $a3		# in $t3 ho Y
			
			
			lb $t4, ($t0)
			addi $t0, $t0, 1	# in $t4 ho ora di ora_in
			lb $t5, ($t0)		# in $t5 ho min di ora_in
			
			lb $t6, ($t1)		
			addi $t1, $t1, 1	# in $t6 ho ora di ora_out
			lb $t7, ($t1)		# in $t7 ho min di ora_out
			
			bne $t5, 0, incrementa
			bne $t7, 0, incrementa
			j calcola

incrementa:	addi $t4, $t4, 1
			addi $t6, $t6, 1
			
			
calcola:	sub $t8, $t6, $t4
			mul $t8, $t8, 60
			div $t8, $t8, $t3
			mul $t8, $t8, $t2
			
			move $v0, $t8
			
			jr $ra

			.end costoParcheggio