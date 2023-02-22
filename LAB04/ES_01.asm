			.data
DIM = 20			
vettore:	.space 80		# 80 byte = 20 elementi di tipo word			
			.text
			.globl main
			.ent main
			
main:		
			li $t0, 2 				# indice di accesso j 
			li $t2, 1				# i primi due valori della serie sono 1
			
			la $t1, vettore			# accedo all'indirizzo del primo el di vettore
			
			sw $t2, 0($t1)
			sw $t2, 4($t1)
			
			sll $t3, $t0, 2			# moltiplico per 4 l'indice, "riscalo per byte" i
			
ciclo:		
			and $t8, $0, $0
			and $t4, $0, $0
			and $t5, $0, $0 

			# fib[i]=fib[i-1]+fib[i-2];
			
			addi $t4, $t3, -4		# i-1
			addi $t5, $t3, -8		# i-2 
				
			lw $t6, vettore($t4)	# fib[i-1]
			lw $t7, vettore($t5)	# fib[i-2]
			
			add $t8, $t8, $t6		# res += fib[i-1]
			add $t8, $t8, $t7		# res += fib[i-2]
			
			sw $t8, vettore($t3)	# salvo in vett[i] il res -> fib[i] = res
			
			addi $t3, $t3, 4		# aumento indice primo array di 4 (byte) = i
			addi $t0, $t0, 1		# incremento indice del ciclo
			
			blt $t0, DIM, ciclo		# itero j=2,j!=20,j++

			li $v0, 10
			syscall
			.end main