				.data
			
latoTriangolo:	.word 8
latoQuadrato: 	.word 8			
			
				.text
				.globl main
				.ent main

main:		
				lw $a2, latoTriangolo		# passo come par il latoTriangolo
				lw $a3, latoQuadrato		# passo come par il latoQuadrato

				jal stampaTriangolo
				jal stampaQuadrato
				
				li $v0, 10
				syscall
				.end main
				
				
				.ent stampaTriangolo
stampaTriangolo:

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
				bne $t0, $a2, ciclo_esterno
				
				jr $ra 					
				.end stampaTriangolo	
				
				.ent stampaQuadrato
stampaQuadrato:	

ciclo_esterno2:	
				addi $t4, $t4, 1			# indice esterno
ciclo_interno2:	
				li $a0, '*'
				li $v0, 11    
				syscall
				addi $t5, $t5, 1			# indice interno
				bne $t5, $a3, ciclo_interno2
				and $t5, $0, $0				# resetto indice interno
				li $a0, '\n'
				li $v0, 11    
				syscall
				bne $t4, $a3, ciclo_esterno2
				
				
				jr $ra
				.end stampaQuadrato