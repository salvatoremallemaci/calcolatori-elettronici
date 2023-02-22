				.data
vettore:		.word 144, 345, 14, 578, -16, -69, 0
dimensione:		.word 7		
				.text
				.globl main
				.ent main
				
main:			
				la $a0, vettore
				lw $a1, dimensione
				jal massimo
				
				move $a0, $v0

				li $v0, 1
				syscall

				li $v0, 10
				syscall
				.end main
				
				.ent massimo
massimo:		
				and $t1, $0, $0		# in $t1 salvo il max corrente
				and $t2, $0, $0 	# counter ciclo
				lw $t1, ($a0)		# salvo inizialmente come massimo il primo val
ciclo:			
				addi $a0, $a0, 4	
				addi $t2, $t2, 1
				lw $t4, ($a0)
				sgt $t3, $t4, $t1
				beq $t3, 1, aggiorna_max
				bne $t2, $a1, ciclo
				beq $t2, $a1, fine
				
aggiorna_max:	lw $t1, ($a0)
				bne $t2, $a1, ciclo
				
				
				
fine:			move $v0, $t1

				jr $ra 
				.end massimo