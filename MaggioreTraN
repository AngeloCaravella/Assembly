.data 

inserimento: .asciz "Inserisci quanti numeri vuoi confrontare"
inserimento2: .asciz "Inserisci il numero"
.text

.globl main

main:

dacapo:
la a0, inserimento
li a7, 4
ecall

li t4, 1
li a7, 5  # inserimento numeri da confrontare
ecall

mv t0, a0 
beqz t0, dacapo
beq t0 ,t4, dacapo 

la a0, inserimento2
li a7, 4
ecall

li a7, 5  # inserimento primo numero 
ecall

mv t1, a0
addi t3, t3 ,1

j loop

exit :
blt t2, t1, setfinal #controllo per il caso speciale che può occorrere cioè il numero a coda è più piccolo 


final:
mv a0 ,t2
li a7,1 
ecall

li a7,10 
ecall


loop: 
	addi t3, t3, 1#incremento contatore
	
	la a0, inserimento2# solita stampa
	li a7, 4
	ecall

	li a7, 5 # leggo il numero
	ecall
	
	mv t2, a0 
	beq t3, t0 , exit
	blt t2, t1, loop # piu piccolo? nuova giro niova corsa
	bgt t2, t1, set # più grande? allora setto 

	
set:
mv t1, t2 
j loop

setfinal:# eseguo il set che non ero riuscito ad eseguire prima per il beq
mv t2, t1 
j final

