		 .data
vettore: .byte 14, 16, 18, 134, 24, 22, 23, 149, 140, 141, 145, 146
vettoreCompresso: .space 12
INTERVALLO_QUANT = 10
 .text
 .globl main
 .ent main
main:
 subu $sp, $sp, 4
 sw $ra, ($sp)
 la $a0, vettore
 li $a1, 12
 la $a2, vettoreCompresso
 jal comprimi

 lw $ra, ($sp)
 addu $sp, $sp, 4
 jr $ra
 .end main
 
quantizza:
 divu $t0, $a0, INTERVALLO_QUANT
 mulou $v0, $t0, INTERVALLO_QUANT
 jr $ra
		
		
		.ent comprimi

comprimi:
		subu $sp, $sp, 4
		sw $ra, ($sp)
		subu $sp, $sp, 4
		sw $s0, ($sp)
		move $s0, $a0	# in $t0 ho l'indirizzo del vettore iniziale
		move $t1, $a1	# in $t1 ho il numero di valori da scandire
		move $t2, $a2	# in $t2 ho indirizzo del vettore finale
		
		and $t3, $0, $0	# indice ciclo di scansione vett iniziale
		and $t4, $0, $0 # numeri del vett finale
		
ciclo:			
		lbu $a0, ($s0)
		jal quantizza
		beqz $t4, nuovoValore
		beq $t5, $v0, fineCiclo
		

nuovoValore:

		move $t5, $v0
		sb $t5, ($t2)
		addi $t2, $t2, 1
		addi $t4, $t4, 1
		

fineCiclo:	
		addi $s0, $s0, 1
		subu $t1, $t1, 1
		bnez $t1, ciclo
		
		move $v0, $t4
		
		lw $s0, ($sp)
		addu $sp, $sp, 4
		
		lw $ra, ($sp)
		addu $sp, $sp, 4
		
		j $ra
		.end comprimi