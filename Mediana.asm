.data 
input: .asciz "Inserisci quanti elementi desideri in un array: \n"
output: .asciz "\nLa mediana è: \n"
.align 2
.text 

.globl  main

main: 

la a0, input
li a7, 4
ecall

li a7, 5
ecall 
mv t0, a0
mv s0, t0


addi sp, sp, -100 
mv t1, sp

jal scorri
li t5, 2

mv t1, sp
mv t2, s0

li t5, 30
jal ordina


mv t1, sp
mv t2, s0
jal stampa

finestampa:

li t0, 2
div t3, s0, t0 
rem t2, s0, t0 
add t5, t3, t2
mv t1,sp
bnez t2, medianadispari
jal medianapari
	
scorri:
li a7, 5
ecall
sw a0, (t1)
addi t1, t1, 4
addi t0, t0, -1
bnez  t0, scorri
jr ra

ordina:
beqz t2, fine
lw t4, (t1)

addi t1, t1, 4
addi t2, t2, -1

lw t3,(t1)
beqz t2, fine
bge t3, t4, ordina

sw t4, (t1) 
addi t1, t1, -4
sw t3, (t1)
addi t1, t1, 4
j ordina
fine:
mv t2, s0
mv t1, sp
addi t5, t5 ,-1
bnez t5, ordina 

stampa:
beqz t2, finestampa
lw t0, (t1)
mv a0, t0
li a7, 1
ecall
addi t1, t1, 4
addi t2, t2, -1

beqz t2, finestampa
bnez t2, stampa
medianadispari: 
lw t3, (t1)
addi t1, t1, 4
addi t5, t5, -1
beqz t5, stampamed
bnez t5, medianadispari

medianapari:
lw t5, (t1)
addi t1, t1, 4
addi t3, t3, -1
beqz t3, stampamedp
bnez t3, medianapari

stampamed:
la a0,output
li a7, 4
ecall
mv a0, t3
li a7, 1
ecall
li a7, 10 
ecall 

stampamedp:
la a0,output
li a7, 4
ecall

lw t6, (t1)
add t6, t6 ,t5
li t5,2
div t6, t6 , t5
mv a0, t6
li a7, 1
ecall
li a7, 10 
ecall 