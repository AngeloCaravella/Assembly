# DATA SEGMENT 
.data
.align 2

prompt: 
.asciz "\n Inserisci un carattere "

output_msg: 
.asciz "\n Il codice ASCII del carattere è "

spazio: 
.asciz "\n"

dec: 
.asciz "(dec) - "

ch: .space 2

word:
.word 0:1 

.text



.globl main 

main: 
 	la a0, prompt # STAMPA INS
 	li a7, 4
 	ecall 
 	
 	li a7, 12
 	ecall 
 	mv t1, a0 # SPOSTO IL CARATTERE IN T1 PER POI ESSERE STAMPATO
 	
 	
 	la a0, output_msg
 	li a7, 4      # STAMPA 
 	ecall 
 	
 	jal printdecimal1 
 	
 	#############
 	la a0, prompt # STAMPA INS
 	li a7, 4
 	ecall 
 	
 	la a0, ch #CARICO L'INDIRIZZO DELLA STRINGA
 	li a1, 2  #IMPOSTO LA LUNGHEZZA
 	li a7, 8
 	ecall
 	
 	la a0, output_msg
 	li a7, 4 # STAMPA
 	ecall 
 	
 	lbu a0, ch
 	
 	jal printdecimal2
 	#############
 	
 	
 	la a0, prompt # STAMPA INS
 	li a7, 4
 	ecall 
 	
 	la a0, word
 	mv t1, a0 
 	li a7, 12
 	ecall 
 	sb a0 , (t1)
 	
 	la a0, output_msg
 	li a7, 4# STAMPA 
 	ecall 
 	jal printdecimal3
 	
 	############
 	li a7, 10 # exit
 	ecall 
 	
printdecimal1: 
mv a0, t1
li a7, 1
ecall 

jr ra

printdecimal2: 

li a7, 1
ecall 

jr ra 	

printdecimal3: 
lb a0, (t1)
li a7, 1
ecall 

jr ra 	
