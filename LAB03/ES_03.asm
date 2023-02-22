			.data
			
giorni:		.byte 13
ore:		.byte 16
minuti:		.byte 45
risultato:	.space 4			

			.text
			.globl main
			.ent main
			
main:		
			#1.2) verifica overflow -> da' Exception in caso di overflow ( unsigned )
#			mulou $t2, $t0, $t1		# $t2 = $t0 * $t1

			lbu $t0,giorni
			lbu $t1,ore
			lbu $t2,minuti
			
			addiu $t4, $t4, 1440
			addiu $t5, $t5, 60
			
			mul $t0,$t0, $t4
			addu $t3, $t3, $t0		# giorni
			
			mul $t1,$t1,$t5
			addu $t3, $t3, $t1		# giorni + ore
			
			addu $t3, $t3, $t2		# giorni + ore + minuti
			
			sw  $t3, risultato

			
			
			li $v0, 10
			syscall
			.end main
			
			
			
			
			