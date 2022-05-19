.data 
nome: .asciz "Per favore inserisci la frase: " 
output: .asciz "La frase modificata è:\n "
output1: .asciz "\nLa quantità di spazi compresi all'interno è:\n "
acapo: .asciz "\n"

stringa: .space 31 # spazio per la stringa di input

.text
.globl main 
main: 
li t4, ' ' 
li t2,'a'
li t3,'z'
li t6, 1
li s0, 10
#STAMPA INIZIALE
la a0 ,nome
li a7,4
ecall

la a0 , stringa # CARICAMENTO STRINGA

li a1, 31 # SI CARICANO I 31 CARATTERI (30 + TAPPO)  

# DIRETTIVA PER LEGGERE UNA STRINGA DA CONSOLE
li a7 , 8
ecall 
 

la t0, stringa

loop1: 
	lbu    	t1,0(t0)
	beq     t1, t4, lenght
	continua:
	beqz  	t1,exit_loop1   # SE NULL, ABBIAMO FINITO
	
	addi	t0,t0,1        	# INCREMENTA IL PUNTATORE
	j     	loop1
	exit_loop1:
	
	la a0, output1
	li a7, 4
	ecall 

	mv a0, t5 #STAMPO IL NUMERO DI SPAZI
	li a7, 1
	ecall 
	
	la a0, acapo
	li a7, 4
	ecall 
la t0, stringa

loop: 
	lbu    	t1,0(t0)
	beq     t1, t4, lenght2
	continua2:
	
	beqz  	t1,exit_loop    # SE NULL, ABBIAMO FINITO
	blt  	t1,t2,no_change
	bgt	t1,t3,no_change
	addi	t1,t1,-32       # CONVERTI
	sb	t1,(t0)
	
no_change:
	addi	t0,t0,1        	# INCREMENTA IL PUNTATORE
	j     	loop2
	
ultima_conversione:

	lbu    	t1,0(t0)
	beq     t1,s0, exit_loop 
	beqz  	t1,exit_loop    # SE NULL, ABBIAMO FINITO
	
	addi	t1,t1,-32       # CONVERTI
	sb	t1,(t0)
	
	addi	t0,t0,1        	# INCREMENTA IL PUNTATORE
	j     ultima_conversione	
	
exit_loop:

	#STAMPA OUTPUT
	la a0, output
	li a7, 4
	ecall 	
	
        la      a0,stringa    # STRINGA CONVERTITA 
	li      a7,4
	ecall
	
	li      a7,10           # ESCI 
	ecall
lenght:
addi t5, t5, 1
b continua

lenght2:
beq  t5, t6, ultima_conversione
beqz  	t1,exit_loop  
addi t5, t5, -1
b continua2	

lenght3:
beqz  	t1,exit_loop  
beq  t5, t6, ultima_conversione
addi t5, t5, -1
b loop 	

loop2:
lbu    	t1,0(t0)
beqz  	t1,exit_loop  
addi	t0,t0,1
beq     t1, t4, lenght3
j loop2 
