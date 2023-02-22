# chiedo in INPUT un numero 
# voglio STAMPARE il VALORE ASSOLUTO di tale numero

			.data
		
		
		
			.text
			.globl main
			.ent main
		
main:	
			li $v0, 5
			syscall
		
			move $a0, $v0
		
			# if ($a0 < 0 )
			#	$a0 = - $a0
			
			#1) uso l'istruzione slt -> set less than
#			slt $t0, $a0,$zero	# se $a0 < $zero, $t0 = 1, altrimenti 0
#			beq $t0, $zero, positivo
			
			#2) uso la pseudoistruzione bge
			bge $a0, $zero, positivo
			
			# inversione del segno
#			subu $a0, $zero, $a0        1^a opzione

#										2^a opzione
			not $a0, $a0				
			addiu $a0, $a0, 1
			
positivo: 	li $v0, 1
			syscall
		
		
			li $v0, 10
			syscall
			.end main