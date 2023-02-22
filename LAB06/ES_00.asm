			.data
			
variabile:	.word 8

			.text
			.globl main				# dona una visibilità globale al main (altri file)
			.ent main
			
main:		
			lw $a0, variabile		# parametro in input della procedura
			li $a1, 5				# altro parametro in input della procedura
#			$a2, $a3 per altri due parametri
#			useremo lo Stack per passare più di 4 parametri -> prossima settimana
			
			jal incrementa			# chiamo la procedura
									# istruzione jal: jump and link -> salta alla procedura e copia nel registro $ra
									# l'indirizzo di ritorno, ossia l'indirizzo a cui la procedura dovrà tornare
									# al suo termine, ossia l'istruzione successiva alla jal
			sw $v0, variabile		# <- ossia questa	
			
			
			li $v0, 10
			syscall
			.end main
			
			.ent incrementa			# indica al debugger che esiste una procedura 'incrementa' (facoltativa)
incrementa:							# qui inizia la procedura
			add $v0, $a0, $a1		# $v0 e' il registro di ritorno
			jr $ra 					# salta al registro $ra -> return address
			.end incrementa			# indica al debugger che la procedura finisce (opzionale) 