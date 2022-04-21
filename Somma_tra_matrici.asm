#########DATA SEGMENT######
.data
#per definire la lunghezza delle righe e delle colonne
righe:    .word 3 

colonne:  .word 3 

matrice1: .word  1 ,1,1 
	  .word  2 ,2,2
	  .word  3 ,3,3 
	  
matrice2: .word  1 ,1,1 
	  .word  1 ,1,1
	  .word  1 ,1,1 	  
	  
matricer: .word  0 ,0 ,0
	  .word  0, 0, 0
 	  .word  0, 0, 0
 	  
spazio:   .asciz "\n" 	  
.text
#########################
 	.globl main 
 	main: 
 	
 	la t0, matrice1 # CARICO L'INDIRIZZO DI MEMORIA DELLA PRIMA MATRICE
 	la t1, matrice2 # CARICO L'INDIRIZZO DI MEMORIA DELLA SECONDA MATRICE
 	la s1, matricer # CARICO L'INDIRIZZO DI MEMORIA DELLA MATRICE RISULTANTE
 	
 	# carico 3
 	lw s2, righe 
 	lw s3, colonne
nuovogiro: 	
 	lw t2, 0(t0) 
 	lw t3, 0(t1)
 	
 	addi t0, t0, 4 # vado avanti con le righe nella prima matrice
 	addi t1, t1, 4# vado avanti con le righe nella seconda matrice
 	
 	add s0, s0, t2 # sommo il primo elemento della prima matrice
 	add s0, s0, t3 # sommo il risultato al secondo 
 	
 	sw s0, (s1) # Carico il primo elemento nella matrice finale 
 	
 	li s0, 0 # rinizializzo la somma
 	addi s1, s1, 4 # vado avanti con la nuova matrice
 	
 	addi s3, s3, -1 #decremento il numero di colonne
 	
 	bnez s3, nuovogiro 
 	addi s2, s2, -1 # decremento il numero di righe 
 	lw s3, colonne # ristabilizzo il numero di colonne
 	
 	la a0, spazio
 	li a7, 4
 	ecall 
 	bnez s2, nuovogiro # se le righe non sono finite, nuova corsa
 	 
 	la s1,matricer #ricarico l'indirizzo 
 	# ricarico i contatori 
 	lw s2, righe 
 	lw s3, colonne
 	li s0, 0
###########STAMPA########## 	
nuovacorsa: 	
 	lw s0,(s1) 	
 	mv a0, s0 
 	li a7, 1
 	ecall  
 	
	addi s1, s1, 4
	
	addi s3, s3, -1 #decremento il numero di colonne
 	
 	bnez s3, nuovacorsa
 	
 	la a0, spazio
 	li a7, 4
 	ecall 
 	lw s3, colonne 
 	addi s2, s2, -1 # decremento il numero di righe 
 	bnez s2, nuovacorsa
#########EXIT############# 	
	li a7 ,10
	ecall 