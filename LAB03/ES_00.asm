			.data
message:	.asciiz "Inserisci due numeri: "

			.text
			.globl main
			.ent main
			
main:		
			la $a0, message
			li $v0, 4
			syscall
			
			#  legge il primo numero
			
			li $v0, 5
			syscall
			move $t0, $v0
			
			# legge il secondo numero
			
			li $v0, 5
			syscall
			move $t1, $v0
			
			#1.1) moltiplicazione tra interi unsigned -> la mul non verifica l'overflow
#			mul $t2, $t0, $t1 		# $t2 = $t0 * $t1
			
			#1.2) verifica overflow -> da' Exception in caso di overflow ( unsigned )
#			mulou $t2, $t0, $t1		# $t2 = $t0 * $t1
			
			#1.3) voglio poter gestire l'Exception ( unsigned )
#			multu $t0, $t1			# res su 64 bit
									# registri : $hi  $lo
									#			high  low			
#			mfhi $t3				# move from high -> sposto $hi in $t3
#			bne $t3, $0, overflow 	# se non e' uguale a 0, significa che i 4 byte più 
									# significativi contengono un valore, dunque il 
									# res della moltiplicazione non è rappresentabile 
									# sui 4 byte più significativi

#			mflo $t2				# move from low  ->	sposto $lo in $t2
			
			# il codice continua
			
			#2.1) moltiplicazione tra interi signed
#			mul $t2, $t0, $t1		# non c'è verifica overflow
			
			#2.2) verifica overflow
#			mulo $t2, $t0, $t1		# da' Exception in caso di overflow ( signed)  
			
			#2.3) voglio poter gestire l'Exception ( signed )
			mult $t0, $t1			# $hi $lo
			mfhi $t3
			mflo $t2
									# adesso lavoro con signed -> devo stare attento al segno
			
			# $t3 = 0XFFFFFFFF		# $hi
			# $t2 = 0X04567896		# $lo
				
			# DEVO VERIFICARE CHE LA PARTE ALTA SIA O TUTTA F O TUTTA 0
			# E CHE IL BIT PIU' SIGNIFICATIVO DELLA PARTE BASSA SIA UGUALE AI BIT DELLA PARTE ALTA
			
			sra $t2, $t2, 31		# shift right aritmetic
									# sposta il bit più significativo in quello meno significativo, ossia lo sposta di 31 bit
			# se prima dello shift
			# il bit più significativo è 1 -> $t2 = 
			# il bit più significativo è 0 -> $t2 = 
			
			
overflow:	li $t2, 0xFFFFFFFF		# = -1 in signed, max val in signed
			
			li $v0, 10
			syscall
			.end main
			