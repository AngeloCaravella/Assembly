#DATA SEGMENT#

.data   
.align 2
input: .asciz "\nInserisci il numero "
spazio: .asciz "\n"
.text




.globl fattoriale

fattoriale:


	la a0, input
	li a7, 4
	ecall 
	
	li a7, 5
	ecall 
	
	
	mv t0, a0 
	li t2,1
	bnez  t0,  calc
	
	mv a0 ,t2
	li a7 ,1
	ecall 
	
	calc:
	mv t1, t0	
	i: 
	
	addi t1 ,t1, -1  
	beqz t1,esci
	mul t0, t0,t1
	bnez t1, i
	esci:
	
	mv a0 ,t0
	li a7 ,1
	ecall 
	

	li a7, 10
	ecall 


