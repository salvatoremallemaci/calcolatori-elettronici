			.data
			
array1:		.word 16, 21, -9, 5		# array di 4 elementi, ogni elemento è una word, 16 byte occupati	
array2:		.space 16				# riservo 16 byte in memoria, usati per memorizzare 4 elementi, ciascuno su 4 byte

	
			.text
			.globl main
			.ent main
			
main:		
			# copio alla rovescia, array1 in array2
			
			
# 1^ modo
			li $t0, 0 				# indice del ciclo

			li $t1, 0					# indice per il primo array1 -> i 
			li $t2, 12 				# indice per il secondo array2 -> j, parto dall'indirizzo dell'ultimo elemento
						
			
# ciclo:	
			lw $t3, array1($t1)		# sto accendendo al primo elemento di array1 
			sw $t3, array2($t2)
			
			# se voglio accedere al secondo elemento di array1, 
			# devo incrementare di 4 -> poichè ogni elemento occupa 4 byte
			addi $t1, $t1, 4		# aumento indice primo array di 4 (byte)
			addi $t2, $t2, -4		# decremento indice secondo arra di 4 (byte)
			addi $t0, $t0, 1		# incremento indice del ciclo
			
			blt $t0, 4, ciclo


# 2^ modo	

			li $t0, 0 				# indice del ciclo
			
			la $t1, array1			# indirizzo di array1, primo elemento
			la $t2, array2			# indirizzo di array2, secondo elemento
				
ciclo:		lw $t3, 0($t1)			# parto dall'inizio di array1
			sw $t3, 12($t2)			# parto dalla fine di array2
			
			# se voglio accedere al secondo elemento di array1, 
			# devo incrementare di 4 -> poichè ogni elemento occupa 4 byte
			addi $t1, $t1, 4		# aumento indice primo array di 4 (byte)
			addi $t2, $t2, -4		# decremento indice secondo arra di 4 (byte)
			addi $t0, $t0, 1		# incremento indice del ciclo
			
			blt $t0, 4, ciclo			
			


			li $v0, 10
			syscall
			.end main