				.data
tab:			.word addizione, sottrazione, moltiplicazione, divisione			
opa:			.word 2043
opb:			.word 5
res:			.space 4
msgIN:			.asciiz "1: addizione\n2: sottrazione\n3: moltiplicazione\n4: divisione intera\nInserisci comando: "

				.text
				.globl main
				.ent main

main:			
				lw $t2,opa
				lw $t3,opb
		
				li $v0, 4 			
				la $a0, msgIN	
				syscall
				
				li $v0, 5
				syscall
				move $t0, $v0
				
				addi $t0, $t0, -1		# ho 4 etichette -> 0 1 2 3 come indici di accesso
				sll $t0, $t0, 2			# moltiplico per 4, poichè ogni etichetta occupa 4 byte
				lw $t1, tab($t0)
				jr $t1
			
addizione:		
				add $t4, $t2, $t3
				sw $t4, res
				j fine
			
sottrazione:	
				sub $t4, $t2, $t3
				sw $t4, res
				j fine

moltiplicazione:	
				
				mul $t4, $t2, $t3
				sw $t4, res
				j fine

divisione:		
				div $t4, $t2, $t3
				sw $t4, res
				j fine

fine:			
			
				li $v0, 10
				syscall
				.end main
