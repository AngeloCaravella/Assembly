.data 


input: .asciz "\nInserisci il numero: "
array: .word 0:8


.text 

.globl main


main: 

	addi t1, t1, 9 #inizializzo contatore

	la a0, array
	mv t0,a0
	
	jal ra,  inserimento
	
	addi t1, t1, 9
	
	la a0, array
	mv t0, a0
	jal  ra, piùpiccolo
	
	
	fine:
	addi t1, t1, 9
	
	la a0, array
	mv t0, a0
	li t3, 0
	jal ra, contaoccorrenze
	
	fine2:
	mv a0,t4
	li a7 ,1
	ecall
	 
	
	

	li a7, 10 # EXIT 
	ecall
	
inserimento:
	
	
	la a0, input
	li a7, 4
	ecall 	
	
	li a7, 5
	ecall
	
	sw a0, (t0)# SALVO ELEMENTO
	addi t0, t0, 4 #VADO AVANTI 
	addi t1, t1, -1 #DECREMENTO CONTATORE
	
	bnez t1, inserimento
	jr ra
piùpiccolo: 
	lw a0, (t0)
	mv t2, a0 
	addi t0, t0, 4 
	addi t1, t1, -1
	b controllo
	jr ra
controllo:
	beqz  t1, fine
	lw a0, (t0)
	mv t3, a0 
	
	addi t0, t0, 4 
	addi t1, t1, -1

	blt  t2, t3 controllo
	mv t2, t3
	beqz  t1, fine
	b controllo

	jr ra		
contaoccorrenze: 
	
	lw a0, (t0)
	mv t3, a0 
	addi t0, t0, 4 
	beq t3, t2 , incrementa
	
	addi t1, t1, -1
	bnez  t1, contaoccorrenze
	b fine2
	jr ra
	
incrementa:
	addi t4, t4, 1					
	addi t1, t1, -1
	bnez  t1, contaoccorrenze
	b fine2																																																										