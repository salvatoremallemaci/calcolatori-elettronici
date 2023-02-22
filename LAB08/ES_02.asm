			.data
anni:		.word 1945, 2008, 1800, 2006, 1748, 1600
risultato:	.space 6
lunghezza:	.word 6			

			.text
			.globl main
			.ent main
			
main:		
			sub $sp, $sp, 4
			sw $ra, ($sp)

			la $a0, anni
			la $a1, risultato
			lw $a2, lunghezza

			jal bisestile
			
			lw $ra, ($sp)
			addi $sp, $sp,4
			jr $ra

			.end main
				
			.ent bisestile
bisestile:	

			move $t0, $a0		# in $t0 ho l'indirizzo ad anni (word)
			move $t1, $a1		# in $t1 ho l'indirizzo a res (byte)
			move $t2, $a2		# in $t2 ho lunghezza (= 6)
			and $t7, $0, $0
			addi $t7, $t7, 1	# valore 1 fisso
			and $t3, $0, $0		# contatore ciclo

ciclo:		
			lw $t4, ($t0)		# in $t4 ho anno corrente
			lb $t5, ($t1)		# in $t5 devo settare 1 o 0
			
			div $t6, $t4, 100
			mfhi $t6
			beq $t6, 0, secondo_if
			bne $t6, 0, else_interno
			
secondo_if:
			div $t6, $t4, 400
			mfhi $t6
			beq $t6, 0, anno_bisestile
			bne $t6, 0, anno_no_bisestile
			
else_interno:
			
			div $t6, $t4, 4
			mfhi $t6
			beq $t6, 0, anno_bisestile
			bne $t6, 0, anno_no_bisestile
			
			
anno_bisestile:
			move $t5, $t7
			sb $t5, ($t1)
			j fine
			
anno_no_bisestile:
			and $t5, $0, $0 
			sb $t5, ($t1)
			j fine
			

fine:
			addi $t0, $t0, 4
			addi $t1, $t1, 1
			
			addi $t3, $t3, 1

			bne	$t3, $t2, ciclo 
			

			.end bisestile