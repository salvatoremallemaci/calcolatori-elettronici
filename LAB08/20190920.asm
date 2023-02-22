.data
vet	 		 .word 15, 64, 9, 2, 4, 5, 9, 1, 294, 52, -4, 5
			 .text
			 .globl main
			 .ent main
main: 		 subu $sp, $sp, 4
			 sw $ra, 0($sp)

			 la $a0, vet # indirizzo di vet
			 li $a1, 12 # dimensione di vet
			 jal monotono
			 lw $ra, 0($sp)
			 addiu $sp, $sp, 4
			 jr $ra 
			 
			 .end main
			 
			 .ent monotono
monotono:	
			subu $sp, $sp, 4
			sw $s0, ($sp)
			subu $sp, $sp, 4
			sw $s1, ($sp)
			
			
			move $s0, $a0	# in $s0 ho indirizzo vettore
			move $s1, $a1	# in $s1 ho dim vettore
			and $t0, $0, $0	# max corrente
			and $t1, $0, $0 # max 
			
			and $t2, $0, $0	# pos corrente
			and $t3, $0, $0	# pos
			
			and $t4, $0, $0 # indice 
			and $t6, $0, $0	# indice ciclo
			addi $s1, $s1, -1
			
ciclo:		
			move $s0, $a0
			mul $t7, $t6, 4
			add $s0, $s0, $t7
			
			lw $t8, ($s0)
			lw $t9, 4($s0)
			
			
			
			bgt $t8, $t9, ricomincia
			
			
			addi $t6, $t6, 1
			bne $t6, $s1, ciclo

ricomincia:	
			
			
			
			lw $s1, ($sp)
			addu $sp, $sp, 4
			lw $s0, ($sp)
			addu $sp, $sp, 4
			
			j $ra
			
			 .end monotono