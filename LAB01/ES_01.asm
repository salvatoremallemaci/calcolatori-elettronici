		.data
		
n1:		.byte 10
n2: 	.byte 0x10   # in esadecimale : 16
n3:		.byte '1'	 # in codice ASCII: il carattere 1 equivale a 31
res:	.space 1	 # richiede che res non sia inizializzata, dunque 
					 # "alloco" in byte di spazio in memoria. 
		
		.text
		.globl main
		.ent main

main:	
		lb $t0, n1
		lb $t1, n2
		lb $t2, n3
		lb $t3, res
		
		sub $t3, $t0, $t1
		add $t3, $t3, $t2
		
		li $v0, 1
		move $a0, $t3
		syscall
		
		li $v0, 10
		syscall
		.end main