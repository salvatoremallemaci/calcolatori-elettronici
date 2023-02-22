# 1) Caricare un valore da memoria a registro 
# 2) Decremento il registro
# 3) Visualizzo a video il valore del registro
# 4) Salvo il registro in memoria
	
		.data
num: 	.word	3000000000
		
		
		
		.text
		.globl main
		.ent main

main:   
		lw $t0, num				#1)
									
		subu $t0, $t0, 1000000000   		#2)
		
		li $v0, 1				#
		move $a0, $t0			#3)
		syscall                 #
		
		 
		sw $t0, num 			#4)
		
		li $v0, 10
		syscall
		.end main