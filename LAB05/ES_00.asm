			.data
			
			
			.text
			.globl main
			.ent main

main:		
			li $t0, 9
			li $t1, 4
			
			# PUSH
			
			addi $sp, $sp, -8
			
#			addi $sp, $sp, -4 	# incremento lo stack pointer di 4 -> alloco uno slot di memoria
			sw $t0, 4($sp)		
			
#			addi $sp, $sp, -4	
			sw $t1, ($sp)
			
			# POP
			
			# politica LIFO -> last in first out
			
			lw $t1, ($sp)
#			addi $sp, $sp, 4
			
			lw $t0, 4($sp)		# carico 
			addi $sp, $sp, 8	# libero lo stack
			
			
			li $v0, 10
			syscall
			.end main