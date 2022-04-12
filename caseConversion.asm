#CASE CONVERTION
.data 
nome: .asciz "Per favore inserisci il tuo nome" 
output: .asciz "Il tuo nome in capitali è:"

stringa: .space 31 # spazio per la stringa di input

.text
.globl main 
main: 

#STAMPA INIZIALE
la a0 ,nome
li a7,4
ecall

la a0 , stringa # CARICAMENTO STRINGA

li a1, 31 # SI CARICANO I 31 CARATTERI (30 + TAPPO)  

# DIRETTIVA PER LEGGERE UNA STRINGA DA CONSOLE
li a7 , 8
ecall 
 
#STAMPA OUTPUT
la a0, output
li a7, 4
ecall 

la t0, stringa
li t2,'a'
li t3,'z'
loop: 
	lbu    	t1,0(t0)
	beqz  	t1,exit_loop    # SE NULL, ABBIAMO FINITO
	blt  	t1,t2,no_change
	bgt	t1,t3,no_change
	addi	t1,t1,-32       # CONVERTE A MINUSCOLE: 'A'-'a'=-32
	sb	t1,(t0)
no_change:
	addi	t0,t0,1        	# INCREMENTA IL PUNTATORE
	j     	loop
exit_loop:
	la    	a0,stringa    # STRINGA CONVERTITA 
	li      a7,4
	ecall
	
	li      a7,10           # ESCI 
	ecall
	