.data 
input: .asciz "Inserisci la stringa da invertire: "
output: .asciz "\nLa stringa invertita è:"
stringa: .space 20
stringarisultante: .space 20
.text 

.globl main 
main: 

	la a0, input
	li a7, 4
	ecall  
	
	la a0, stringa
	li a1,20
	li a7, 8
	ecall  
	
	mv t0, a0 
	
	calcolaLunghezza:
	lbu t1,(t0)
	addi t2, t2, 1
	addi t0, t0, 1
	bnez t1,  calcolaLunghezza
	
	addi t2, t2 ,-2  
	
	la t0, stringa
	la t3, stringarisultante
	
	mv t1,t0
	
	add t1, t1, t2# MI POSIZIONO NELL' ULTIMO ELEMENTO
	nuovogiro:
	lbu t2 ,(t1) 
	sb t2, (t3) #CARICO IL BYTE NELLA NUOVA STRINGA 
	
	addi t1, t1,-1 #DECREMENTO PER TORNARE INDIETRO 
	addi t3, t3, 1
	bnez t2, nuovogiro
	
	
	la a0, output
	li a7, 4
	ecall  
	
	la a0, stringarisultante
	li a7, 4
	ecall  
	
	li a7,10 
	ecall 
