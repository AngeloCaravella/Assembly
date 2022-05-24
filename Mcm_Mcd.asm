.data
input1: .asciz "Inserisci il primo numero: "
input2: .asciz "Inserisci il secondo numero: "

mcd: .asciz "Il massimo comun divisore tra i due è: "
mcm: .asciz "\nIl minimo comune multiplo tra i due è: "

.text



.globl main

main:

la a0, input1
li a7, 4
ecall


li a7, 5
ecall
mv t0, a0
mv s0, t0

la a0, input2
li a7, 4
ecall


li a7, 5
ecall
mv t1, a0
mv s1,t1

jal Mcd
trovato: 

la a0, mcd
li a7, 4
ecall

mv a0, t1
li a7 ,1
ecall

jal Mcm
la a0, mcm
li a7, 4
ecall

mv a0, s0
li a7 ,1
ecall


li a7, 10
ecall

Mcd:
rem t2, t0, t1
beqz t2, trovato
mv t0, t1
mv t1, t2
j Mcd
jr ra
Mcm:
mul s0, s0, s1
div s0, s0, t1
jr ra
 