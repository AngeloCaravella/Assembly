.data 
input: .asciz "\nInserisci la lunghezza della stringa "
input1: .asciz "\nInserisci la stringa: "

output: .asciz "\nNon è palindroma"
output1: .asciz "\nE' palindroma"
spazio: .asciz "\n"

stringa: .space 2

.text
.globl palindromo

palindromo:
	la a0, input
	li a7, 4#STAMPA
	ecall 
	
	li a7, 5
	ecall 
	addi a0, a0 ,1
	mv t0, a0 # CARICO LA LUNGHEZZA DELLA STRINGA

	la a0, input1
	li a7, 4
	ecall 
	
	la a0, stringa
	mv a1, t0
	li a7, 8
	ecall
	
	la a0, stringa
	mv t1, a0 # USERO' T1 PER PUNTARE AI PRIMI ELEMENTI DA SINISTRA
	la a0 ,stringa 
	mv t6, a0 #USERO' T6 PEE PUNTARE AGLI PRIMI ELEMENTI DA DESTRA
	
	la a0, spazio 
	li a7, 4# uno spazio non fa male
	ecall 
	
	li t2, 2
	addi t0, t0, -1
	div t5, t0, t2 # CALCOLO IL NUMERO DI PASSI DA FARE 
	# I CONFRONTI ESSENDO FATTI A COPPIE DI DUE  DIVIDO LA LUNGHEZZA PER DUE 
	
	addi t0, t0, -1 # DECREMENTO LA LUNGHEZZA DI 2 PERCHE' IL CARATTERE DI TERMINAZIONE OCCUPA 2 BYTES
	add t6, t6, t0 
	confronto :
	beqz t5, esci # SE IL CONTATORE E' ARRIVATO A ZERO SIGNIFICA CHE LA STRINGA E' PALINDROMA
	
	lb t4, (t1) 
	lb t3, (t6)
	
	addi t1, t1, 1 # CON T1 VAI AVANTI 
	addi t6, t6, -1 # CON T6 VAI INDIETRO 
	addi t5, t5, -1 #DECREMENTO NUMERO DI CONFRONTI ANCORA DA FARE
	
	beq  t3, t4, confronto # se sono uguali vai avanti 
	
	la a0, output
	li a7, 4
	ecall 
	li a7, 10#EXIT
	ecall 
	
	esci:
	la a0, output1
	li a7, 4
	ecall 
	
	li a7, 10#EXIT
	ecall 