		.data
num1:	.word 173
num2:	.word 200
num3:	.word 15
msg:	.asciiz "I numeri in ordine crescente sono: "
spazio:	.asciiz " "		
		.text
		.globl main
		.ent main
		
main:	
		#uso il registro $t0 come registro temp di swap
		
		lw $t1, num1
		lw $t2, num2
		lw $t3, num3
		
		bge $t1, $t2, L1
		bge $t1, $t3, L2
		bge $t2, $t3, L3
		
		#SWAP:	

L1:		move $t0, $t1 		# $t1 in $t0  temp = t1
		move $t1, $t2		# $t2 in $t1  t1 = t2
		move $t2, $t0		# $t0 in $t2  t2 = temp
		
L2:		move $t0, $t1 		# $t1 in $t0  temp = t1
		move $t1, $t3		# $t3 in $t1  t1 = t3
		move $t3, $t0		# $t0 in $t3  t3 = temp		
		
L3:		move $t0, $t2 		# $t2 in $t0  temp = t2
		move $t2, $t3		# $t3 in $t2  t2 = t3
		move $t3, $t0		# $t0 in $t3  t3 = temp
		
		li $v0, 4 			
		la $a0, msg 		
		syscall 
		
		li $v0, 1
		move $a0, $t1		
		syscall
		
		li $v0, 4 			
		la $a0, spazio 		
		syscall 
		
		li $v0, 1
		move $a0, $t2		
		syscall
		
		li $v0, 4 			
		la $a0, spazio 		
		syscall 
		
		li $v0, 1
		move $a0, $t3		
		syscall
		
		li $v0, 4 			
		la $a0, spazio 		
		syscall 
		
		li $v0, 10
		syscall
		.end main

		