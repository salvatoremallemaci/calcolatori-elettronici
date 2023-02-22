				.data
			
latoTriangolo:	.space 4
latoQuadrato: 	.space 4	
msg1:			.asciiz "Inserisci latoTriangolo: "
msg2:			.asciiz "Inserisci latoQuadrato: "
			
				.text
				.globl main
				.ent main

main:			
				la $a0, msg1
				li $v0, 4
				syscall
				
				li $v0, 5
				syscall
				sw $v0, latoTriangolo
				
				lw $a0, latoTriangolo		# passo come par il latoTriangolo
				
				jal stampaTriangolo
				
				la $a0, msg2
				li $v0, 4
				syscall
				
				li $v0, 5
				syscall
				sw $v0, latoQuadrato
				
				lw $a0, latoQuadrato		# passo come par il latoQuadrato
				
				jal stampaQuadrato
				
				li $v0, 10
				syscall
				.end main
				
				
				.ent stampaTriangolo
stampaTriangolo:
				move $t7, $a0
ciclo_esterno:	
				addi $t0, $t0, 1			# indice esterno
ciclo_interno:	
				li $a0, '*'
				li $v0, 11    
				syscall
				addi $t1, $t1, 1			# indice interno
				bne $t1, $t0, ciclo_interno
				and $t1, $0, $0				# resetto indice interno
				li $a0, '\n'
				li $v0, 11    
				syscall
				bne $t0, $t7, ciclo_esterno
				
				jr $ra 					
				.end stampaTriangolo	
				
				.ent stampaQuadrato
stampaQuadrato:	
				move $t7, $a0

ciclo_esterno2:	
				addi $t4, $t4, 1			# indice esterno
ciclo_interno2:	
				li $a0, '*'
				li $v0, 11    
				syscall
				addi $t5, $t5, 1			# indice interno
				bne $t5, $t7, ciclo_interno2
				and $t5, $0, $0				# resetto indice interno
				li $a0, '\n'
				li $v0, 11    
				syscall
				bne $t4, $t7, ciclo_esterno2
				
				
				jr $ra
				.end stampaQuadrato