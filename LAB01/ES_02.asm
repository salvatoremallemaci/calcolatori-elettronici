		.data

var1:	.byte 'm'
var2:	.byte 'i'				# var1, var2 ... , var5 sono memorizzati in memoria
var3:	.byte 'p'				# in maniera contigua, consecutiva
var4:	.byte 's'
var5:	.byte 0					# var5 serve da terminatore per la stringa che 
								# vorremo stampare alla fine
								# dice alla syscall 4 quando terminare la stampa
								# dunque stampa var1var2var3var4, trova null
								# di var5 e termina la stampa.
		
		.text
		.globl main
		.ent main
		
main:	
		lb $t0, var1
		lb $t1, var2
		lb $t2, var3
		lb $t3, var4
		lb $t4, var5
			
		addi $t0, $t0, -32
		addi $t1, $t1, -32
		addi $t2, $t2, -32
		addi $t3, $t3, -32
		
		# aggiorno il valore delle variabili -> le salvo in maiuscolo 
		
		sb $t0, var1
		sb $t1, var2			
		sb $t2, var3
		sb $t3, var4
		
		li $v0, 4
		la $a0, var1
		syscall
		
		li $v0, 10
		syscall
		.end main
		
		# stampa MIPS

		