			.data
			
msg1:		.asciiz "Introdurre stringa in input: "	
msg2:		.asciiz "La stringa inserita e' palindroma."
msg3:		.asciiz "La stringa inserita non e' palindroma"
			
			
			.text
			.globl main
			.ent main
		
		
main:	
		
			and $t1, $0, $0		# contatore che indica la lunghezza della stringa
			
			la $a0, msg1
			li $v0, 4
			syscall
			
ciclo:		li $v0, 12			# introduco il carattere
			syscall				
			beq $v0, '\n', fine
			addi $t1, $t1, 1	# mi segno che ho letto un carattere
			addi $sp, $sp, -4	# alloco spazio in stack per il carattere
			sw $v0, ($sp)		# memorizzo il carattere nello stack
			j ciclo
			
fine:	
			and $t2, $0, $0		# indice iniziale
			and $t3, $0, $0		# indice finale
			and $t8, $0, $0
			and $t4, $0, $0		# risultato finale, in cui memorizzo la differenza
								# tra il carattere iniziale e finale
								
			and $t5, $0, $0		# contatore nuovo ciclo
			
			move $t0, $sp		# mi salvo la posizione finale dello stack
			mul $t7, $t1, 4		
			addu $t0, $t0, $t7	# posizione iniziale stack
controllo:	
			addi $t0, $t0, -4	# aggiorno stack inverso
			
			lw $t6, ($sp)		# ultimo carattere inserito
			lw $t8, ($t0)		# primo carattere inserito
			sub $t9, $t6, $t8
			
			addu $t4, $t4, $t9

			bne $t4, 0, sbagliato			
			
			addi $sp, $sp, 4	# aggiorno stack normale
			
			addi $t5, $t5, 1	# ho controllato un carattere
			bne $t5, $t1, controllo
	
			
			la $a0, msg2
			li $v0, 4
			syscall
			j finito
			
sbagliato:	la $a0, msg3
			li $v0, 4
			syscall

finito:		
			li $v0, 10 
			syscall
			.end main