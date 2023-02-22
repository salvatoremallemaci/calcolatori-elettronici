DIM = 5
				.data		
array:			.word 's', 'a', 'l', 'v', 'o' 		
				.text
				.globl main
				.ent main
				
main:		
	
				and $t1, $0, $0			# indice di accesso al vettore
				and $t5, $0, $0			# contatore cicli
				
ciclo:			lw $t2, array($t1)
				move $a0, $t2

				jal conversione
				
				sw $v0, array($t1)
				addi $t1, $t1, 4
				addi $t5, $t5, 1
				
				bne $t5, DIM, ciclo


				li $v0, 10
				syscall
				.end main.
				
				.ent conversione
conversione:	
				subu $v0, $a0, 32
				jr $ra
				.end conversione