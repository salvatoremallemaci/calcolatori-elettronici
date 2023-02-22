			.data
			
var:		.word 3141592653	
		
			.text
			.globl main
			.ent main
			
			
			
main:		
			and $t1, $0, $0		# in $t1 memorizzo il quoziente delle
								# divisioni successive per 10
				
			and $t2, $0, $0
			addi $t2, $t2, 1	# count a 1, per capire quante iterazioni
								# mi toccherà fare, cos' so quanti byte riallocare
								# per lo stack
			and $t3, $t0, $t0
			
			lw $t1, var
			
while1:		divu $t1, $t1, 10	# così otteniamo come resto, la cifra meno signficativa
			addi $sp, $sp, -4
			mfhi $t6
			sw $t6, ($sp)
			addi $t2, $t2, 1
			bne $t1, 0, while1
			
	
			and $t4, $0, $0
			addi $t4, $t4, 1	# counter 
while2:		
			lw $t3, ($sp)
			addu $t5, $t3, '0'
			
			li $v0, 11
			move $a0, $t5
			syscall

			addi $t4, $t4, 1
			addi $sp, $sp, 4

			bne $t4, $t2, while2
			
			li $v0, 10
			syscall
			.end main