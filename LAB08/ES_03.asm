NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 1
			.data
prezzi: 	.word 39, 1880, 2394, 1000, 1590
scontati: 	.space DIM
totSconto: .space 4

			.text
			.globl main
			.ent main
main: 		subu $sp, $sp, 4
			sw $ra, ($sp)
			la $a0, prezzi
			la $a1, scontati
			li $a2, NUM
			li $a3, SCONTO
			li $t0, ARROTONDA
			subu $sp, 4
			sw $t0, ($sp)
			jal calcola_sconto
			sw $v0, totSconto
			move $t0, $v0
			lw $ra, 4($sp)
			addu $sp, $sp, 8
			jr $ra
			.end main
			
			
			.ent calcola_sconto
			
calcola_sconto:
	
			move $t0, $a0		# in $t0 ho indirizzo prima pos vettore prezzi
			move $t1, $a1		# in $t1 ho indirizzo prima pos vettore scontati
			move $t2, $a2		# in $t2 ho quanti sono i num del vettore
			move $t3, $a3		# in $t3 ho lo sconto
			lw $t4, ($sp)		# in $t4 ho lo 'arrotonda'
			
			and $t5, $0, $0		# indice ciclo
			and $v0, $0, $0		# res finale, inizializzato
			li $t6, 100
			sub $t7, $t6, $t3	# percentuale prezzo effettivo
			subu $sp, $sp, 4
			sw $s0, ($sp)
			subu $sp, $sp, 4
			sw $s1, ($sp)
ciclo:					
			lw $t8, ($t0)		# valore corrente del vettore
			mul $t9, $t8, $t7
			div $t9, $t6
			mflo $t9			# ho parte bassa del numero
			beq $t4, 0, noArr
			mfhi $s0
			blt $s0, 50, noArr
			addi $t9, $t9, 1
noArr:		
			
			
			sw $t9, ($t1)
			subu $s1, $t8, $t9
			addu $v0, $v0, $s1
			addiu $t0, $t0, 4
			addiu $t5, $t5, 1
			bne $t5, $t2, ciclo
			
			
			lw $s1, ($sp)
			addu $sp, $sp, 4
			lw $s0, ($sp)
			addu $sp, $sp, 4
			jr $ra
			.end calcola_sconto