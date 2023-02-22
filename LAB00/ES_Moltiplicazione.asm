				.data
msg1: 			.asciiz "aSide = "
msg2: 			.asciiz "bSide = "
msg3: 			.asciiz "cSide = "

msg4:			.asciiz "Find volume of a rectangular parallelepiped: "
msg5:			.asciiz "\nFind surface area of a rectangular parallelepiped: "

# aSide: 		.word 73
# bside: 		.word 14
# cSide:  		.word 16

volume: 		.word 0 
surfaceArea:	.word 0
				
				.text
				.globl main
				.ent main
main:			
				
				li  $v0, 4
				la  $a0, msg1
				syscall
				
				#lw  $t0, aSide
				
				li $v0, 5 				# syscall 5 (read_int) 
				syscall
				move $t0, $v0
				
				
				li  $v0, 4
				la  $a0, msg2
				syscall
				
				#lw  $t1, bside
				
				li $v0, 5 				# syscall 5 (read_int) 
				syscall
				move $t1, $v0
				
				
				li  $v0, 4
				la  $a0, msg3
				syscall
				
				#lw  $t2, cSide
				
				li $v0, 5 				# syscall 5 (read_int) 
				syscall
				move $t2, $v0
				
				
				
				mul $t3, $t0, $t1		# aSide * bSide  ( = tmpRes)
				mul $t4, $t3, $t2		# tmpRes * cSide ( = volume)
				sw  $t4, volume
				
				li  $v0, 4
				la  $a0, msg4
				syscall
				
				li 	$v0, 1 				# call code, print int
				lw 	$a0, volume 		# value for int to print
				syscall 
				
				mul $t3, $t0, $t1       # aSide * bSide ( = tmpRes1 )
				mul $t4, $t0, $t2		# aSide * cSide ( = tmpRes2 )
				mul $t5, $t1, $t2       # bSide * cSide ( = tmpRes3 )
				add $t6, $t3, $t4       # tmpRes1 + tmpRes2 = tmpRes4
				add $t7, $t6, $t5       # tmpRes4 + tmpRes3 = tmpRes5 
				sll $t7, $t7, 1			# tmpRes5 * 2 = res
				
				sw  $t7, surfaceArea
				
				li  $v0, 4
				la  $a0, msg5
				syscall
				
				li $v0, 1
				lw $a0, surfaceArea
				syscall
				
				li  $v0, 10
				syscall
				.end main

			