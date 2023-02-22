			.data
msg_ok:		.asciiz "Il carattere inserito è una cifra. "			
msg_err:	.asciiz "Il carattere inserito non corrisponde ad un numero. "
			.text
			.globl main
			.ent main
			
main:		
			
			# la $a0, msg
			# li $v0, 4
			# syscall
			
			# li $v0, 5
			# syscall
			# move $t0, $v0		# in $t0 ho il mio num
			
while:		beq $t0,'\n', done
			li $v0, 12
			syscall
			move $t0, $v0
			
			# controllo che il carattere inserita sia un numero
			
			# converto il carattere in una cifra
			sub $t0, $t0, '0'
			# verifico che questo sia una cifra, ossia :
			addi $t4, $t4, 10
			addi $t3, $t3, -1
			
			slt $t1, $t0, $t4
			sgt $t2, $t0, $t3
			and $t5, $t1, $t2
			
			bne $t5, 1, errore
			# la $a0, msg_ok
			# li $v0, 4
			# syscall
			
			
			j while
			
errore:		la $a0, msg_err
			li $v0, 4
			syscall
			
done:		
			
			li $v0, 10
			syscall
			.end main
			
			