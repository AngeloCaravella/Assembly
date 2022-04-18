# somma di quattro numeri interi 
.data 

stampa: .asciz "Per favore inserisci quattro numeri: \n " 
somma: .asciz "La somma è"

.text
.globl main
main: 

#STAMPA  
la a0, stampa 
li a7, 4
ecall 

#CARICAMENTO PRIMO NUMERO 
li a7,5
ecall 
mv t0, a0 


#CARICAMENTO SECONDO NUMERO 
li a7,5
ecall 
mv t1, a0 

#CARICAMENTO TERZO NUMERO 
li a7,5
ecall 
mv t2, a0

#CARICAMENTO QUARTO NUMERO 
li a7,5
ecall 
mv t3, a0 

# ESEGUO SOMME
add t0, t0, t1
add t0, t0, t2
add t0, t0, t3 

# CARICO LA STAMPA PER LA SOMMA
la a0, somma

# SOMMA OUTPUT 
mv a0, t0 

#DIRETTIVA PER LA SOMMA
li a7 , 1
ecall

#DIRETTIVA PER USCIRE
li a7,10 
ecall 


