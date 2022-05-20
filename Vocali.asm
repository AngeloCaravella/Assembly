.data 
stringa: .asciz  "Inserisci la stringa di cui vuoi vedere quante vocali ci sono:\n "
vocalii: .asciz  "Il numero di vocali è: \n"
scelta:  .asciz  "\n Scegli una vocale che ti piace di più: \n"
trovato: .asciz  "\n E' stata trovata tot volte: \n"
vocali:  .asciz  "aeiou "
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
 li a1, 100
 li a7,8
 ecall 

 #STAMPA DELLA STRING APPENA LETTA
 li a7,4
 ecall 


 la t2, vocali #CARICO L'INDIRIZZO DELLE VOCALI 
 mv t0 ,sp #METTO LO STACK POINTER 
 scorri:
 lbu t1, (t0) 
 jal controlla
 esci:

 la t2, vocali #E' BUON USO RICARCARE L'INDIRIZZO 
 #COSI' DA EVITARE DISALLINEAMENTI
 addi t0, t0, 1
 bnez t1, scorri

################################
 la a0, vocalii
 li a7, 4
 ecall 

 mv a0, s0 
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
beq t1, s1, sommavocale ####VOCALE TROVATA L'AGGIUNGO
e:
addi t0, t0, 1
bnez t1, scorrii 
#####################

la a0, trovato
li a7, 4
ecall 

#STAMPO LA QUANTITA' DELLA VOCALE 
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

sommavocali:
addi s0, s0 ,1
j controlla

sommavocale:
addi s2, s2, 1
j e
