.data
input : .asciz "Inserisci il numero :"
output: .asciz " Il numero in binario è: "

.text 

.globl main


main:


	la, a0 , input
	li a7, 4
	ecall

	li a7, 5
	ecall 
	mv s0, a0
	la a0, output 
	li a7 , 4
	ecall 
	
	li t1, 2
	
	li a7 , 1
	jal printBinary
	
	li a7 ,10 
	ecall
	
	
printBinary: 
	
	addi sp, sp, -4
	sw s0, (sp) # memorizza l'intero all'interno dello stack pointer
	
loop: 
	beqz s0, printLoop 
	addi t3, t3, 1
	addi sp, sp ,-4
	rem , t0 , s0 , t1
	div s0, s0 , t1
	sw t0 , (sp)
	j loop
	
	
	
printLoop: 
	beq t4, t3 , exit
	lw a0, (sp)
	ecall 
	addi sp, sp ,4
	addi t4, t4 ,1 
	j printLoop
	
exit: 
	lw s0, (sp)
	addi sp , sp ,4
	jr ra
	 	 	
	
		
	
	 
	
	
	
	
