			.data
n:			.word 12
k:			.word 2	
			.text
			.globl main
			.ent main

main:		
			
			lw $a0, n
			lw $a1, k
			jal combina
			
			move $a0, $v0
			li $v0, 1
			syscall

			li $v0, 10
			syscall
			.end main

			
			.ent combina
combina:	
			
			# in $a0 avrò n!
			# in $a1 avrò k!
			# in $a2 avrò (n-k)!
			
			sub $t2, $a0, $a1		# n-k
			
			move $t0, $a0
			li $t1 1 
LOOP_n: 	mul $t1 $t1 $t0 		# n!
			addi $t0 $t0 -1 
			bne $t0, 0, LOOP_n
			move $a0, $t1
			
			move $t0, $a1
			li $t1 1 
LOOP_k: 	mul $t1 $t1 $t0 		# k!
			addi $t0 $t0 -1 
			bne $t0, 0, LOOP_k
			move $a1, $t1
			
			move $t0, $t2
			li $t1 1 
LOOP_n_k: 	mul $t1 $t1 $t0 		# (n-k)!
			addi $t0 $t0 -1 
			bne $t0, 0, LOOP_n_k
			move $a2, $t1
			
			mul $t5, $a1, $a2
			div $t6, $a0, $t5		# n! / (k)!(n-k)!
			move $v0, $t6
			
			jr $ra
			.end combina
			