			.data
			
DIM = 5
msg1:		.asciiz "Inserire i numeri: "
msg2:		.asciiz "La media e': "			
			
			.text
			.globl main
			.ent main
			
main:		

			and $t0, $0, $0 		# azzeramento contatore
			and $t1, $0, $0 		# azzeramento accumulatore
			
			la $a0, msg1
			li $v0, 4
			syscall
			
while:		li $v0, 5
			syscall
			
			add $t1, $t1, $v0
			addiu $t0,$t0,1 
			
			bne $t0, DIM, while
			
			la $a0, msg2
			li $v0, 4
			syscall
			
			div $t1, $t1, DIM
				
			li $v0, 1				# Print integer
			move $a0, $t1 			# valoreda stampare
			syscall					# system call
			
			li $v0, 10
			syscall
		    .end main