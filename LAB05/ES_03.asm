				.data
				
input_a:		.asciiz "Inserisci a: "
input_b:		.asciiz "Inserisci b: "
input_c:		.asciiz "Inserisci c: "

msg_no_reali:	.asciiz "L'equazione non ammette soluzioni reali."
msg_reali:		.asciiz "L'equazione ammette 2 soluzioni reali distinte."
msg_reali_u:	.asciiz "L'equazione ammette 2 soluzioni reali coincidenti."

A:				.space 4
B:				.space 4
C:				.space 4			


				.text
				.globl main
				.ent main
			
main:		
				la $a0, input_a
				li $v0, 4
				syscall
				
				li $v0, 5 
				syscall
				move $t0, $v0
				
				la $a0, input_b
				li $v0, 4
				syscall
				
				li $v0, 5 
				syscall
				move $t1, $v0
				
				la $a0, input_c
				li $v0, 4
				syscall
				
				li $v0, 5 
				syscall
				move $t2, $v0

				# a in $t0, b in $t1, c in $t2
				
				# calcolo il discriminante e lo salvo in $t4
				mul $t6, $t1, $t1	# b^2
				
				mul $t5, $t0, $t2	# 4ac
				mul $t8, $t2, 4		
				
				sub $t4, $t6, $t8	# delta = b^2 - 4ac
				
				slti $t7, $t4, 0	# se delta < 0 -> $t7 = 1
				beq $t7, 1, no_reali
				beq $t4, 0, reali_u
				beq $t7, 0, reali_si
			
reali_si:		la $a0, msg_reali
				li $v0, 4
				syscall	
				j fine			


reali_u:		la $a0, msg_reali_u
				li $v0, 4
				syscall	
				j fine
			
no_reali:		la $a0, msg_no_reali
				li $v0, 4
				syscall	
				j fine

fine:	
				li $v0, 10
				syscall
				.end main