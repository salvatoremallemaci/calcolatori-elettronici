			.data
msg:		.asciiz " il numero di bit a 1 nella rappresentazione binaria del numero e': "		
num:		.half 189	
			.text
			.globl main
			.ent main

main:		
			lh $t0, num			# in t0 ho il mio numero
			li $t1, 1			# in t1 ho il numero 1, la maschera
			
			and $t3, $0, $0 	# in t3 ho il res ( adesso azzerato )
			and $t4, $0, $0 	# in t4 ho l'indice ( adesso azzerato ) 
			
ciclo:		and $t2, $t0, $t1 	# in t2 metto il mio numero mascherato bit a bit per iterazione					
			beq $t2, 0, next 	# se è uguale a 0, prossima iterazione
			addi $t3, $t3, 1	# ho trovato un 1, aggiorno risultato
			
next:		sll $t1, $t1, 1		# shifto di una pos la maschera '1'
			addi $t4, $t4, 1	# incremento indice del ciclo 
			bne $t4, 16, ciclo	# continua il ciclo fino a 16 iterazioni
								# ossia il numero di bit che costituiscono
								# la halfword
			
			li $v0, 4 			
			la $a0, msg		
			syscall
			
			li $v0, 1
			move $a0, $t3		# stampo res, ossia il numero di 1
			syscall				# contenuto in $t3
			
			li $v0, 10
			syscall
			.end main
			