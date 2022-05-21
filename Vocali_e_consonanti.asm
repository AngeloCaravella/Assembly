.data 
stringa: .asciz  "Inserisci la stringa di cui vuoi vedere quante vocali e consonanti ci sono:\n "
#################
vocalii: .asciz  "Il numero di vocali è: \n"
consonantii: .asciz  "Il numero di consonanti è: \n"
#################
scelta:  .asciz  "\n Scegli una vocale o una consonante che ti piace di più: \n"
trovato: .asciz  "\n E' stata trovata tot volte: \n"
#################
vocali:  .asciz  "aeiou "
consonanti: .asciz "bcdfghlmnpqrstvz "
.text 

.globl main
 main: 
 li s3, ' ' #CARICO UNO SPAZIO PER CONTROLLARE SUCCESSIVAMENTE LA PRESENZA DI ESSO
 
 la a0 ,stringa
 li a7, 4
 ecall 

 addi sp, sp ,-100
 #LETTURA
 mv a0, sp
 li a1, 200
 li a7,8
 ecall 

 #STAMPA DELLA STRING APPENA LETTA
 li a7,4
 ecall 


 la t2, vocali #CARICO L'INDIRIZZO DELLE VOCALI 
 la t5, consonanti
 mv t0 ,sp #METTO LO STACK POINTER 
################################# 
 scorri:
 lbu t1, (t0) 
 jal controlla
 esci:
 jal controlla2 	
 esci2:
 la t2, vocali #E' BUON USO RICARICARE L'INDIRIZZO 
 #COSI' DA EVITARE DISALLINEAMENTI
 la t5, consonanti

 addi t0, t0, 1
 bnez t1, scorri
################################
 la a0, vocalii
 li a7, 4
 ecall 

 mv a0, s0 
 li a7, 1
 ecall
 
 la a0, consonantii
 li a7, 4
 ecall 

 mv a0, s4
 li a7, 1
 ecall
################################
la a0, scelta
li a7, 4
ecall 

#LEGGO IL CARATTERE
li a7, 12
ecall
li s1, 0
mv s1, a0

mv t0, sp
 scorrii:
lbu t1, (t0) 
beq t1, s1, somma 
e:
addi t0, t0, 1
bnez t1, scorrii 
#####################

la a0, trovato
li a7, 4
ecall 

#STAMPO 
mv a0, s2
li a7, 1 
ecall 

################################
#RIPRISINO LO STACK POINTER
addi sp, sp ,100

#ESCI
li a7 ,10
ecall 

#######################
controlla:
lbu t3, (t2) 
addi t2 , t2, 1
beq t3, s3, esci #SE E' UGUALE ALLO SPAZIO ESCO
beq t3, t1, sommavocali
bnez t3, controlla
#######################
controlla2:
lbu t4, (t5) 
addi t5 , t5, 1
beq t4, s3, esci2 #SE E' UGUALE ALLO SPAZIO ESCO
beq t4, t1, sommaconsonanti
bnez t4, controlla2
######################
sommavocali:
addi s0, s0 ,1
j controlla
sommaconsonanti:
addi s4, s4, 1
j controlla2
somma:
addi s2, s2, 1
j e
#################