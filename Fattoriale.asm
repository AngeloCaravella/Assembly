.data 

inserimento: .asciz "Inserisci un numero: "
risultato: .asciz "Il risultato è: 1 "
 
.text

.globl main

main: 
	
	la a0, inserimento #STAMPA
	li a7, 4
	ecall
	
	
	
	li a7 , 5 # INSERIMENTO INTERO
	ecall 
	
	 
	mv t0, a0
	li t1, 1
	mv t3, t0
	
	beqz  t0, casobanale
	beq t0 , t1 , casobanale
																
	
	
	addi sp, sp ,-4
	
	sw t0, (sp) 
	loop:
	lw t0, (sp) 
	lw t2, (sp) 
	addi t2, t2, -1 # (N-1) 
	beq t2, t1, exit
	j calcola 
	

	
	exit:
	mv a0 , t3
	li a7, 1
	ecall
	
	#EXIT
	li a7 ,10
	ecall 	
	
calcola:
mul t3 , t3 , t2
sw t2, (sp)

j loop
 	
casobanale:
la a0 , risultato
li a7, 4
ecall	

	
							
	
