			.data
			
			
			.text
			.globl main
			.ent main
			
main:		
			addi $t1, $t1,1 
			move $t2, $t1
			
			li $v0, 10
			syscall
			.end main