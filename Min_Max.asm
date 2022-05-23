.data 

input: .asciz "Inserisci la l'intero di posto:["
s:     .asciz "]\n " 

minimo: .asciz "Il minimo è: \n" 
massimo: .asciz "\nIl massimo è: \n" 

.text 

.globl  main

main:

li t0,0
li t1,9
addi sp, sp, -100

mv s0, sp
vai:
la a0 , input
li a7 , 4
ecall 

mv a0, t0
li a7, 1
ecall

la a0 , s
li a7 , 4
ecall

li a7 , 5
ecall 

sw a0, (s0)
addi s0, s0 ,4

addi t0, t0, 1
addi t1, t1, -1

bnez  t1, vai


li t1, 9
li t0, 0

#PREPARO LO STACK PER IL MINIMO
addi s0, s0, -36
lw t0, (s0)

addi s0, s0 ,4
addi t1, t1, -1

go:
lw t2, (s0)

blt t0, t2, setmin
mv t3, t2
mv t0, t2
setmin: 

mv t3, t0

addi s0, s0 ,4
addi t1, t1, -1

bnez t1, go

#STAMPO IL MINIMO
la a0, minimo
li a7, 4
ecall 

mv a0, t3
li a7 ,1
ecall

#PREPARO LO STACK PER CERCARE IL MASSIMO 
addi s0, s0, -36
li t1, 9

lw t0, (s0)

addi s0, s0 ,4
addi t1, t1, -1

goo:

lw t2, (s0)

bgt t0, t2, setmax
mv t3, t2
mv t0, t2
setmax: 

mv t3, t0

addi s0, s0 ,4
addi t1, t1, -1

bnez t1, goo

#STAMPO IL MASSIMO 
la a0, massimo
li a7, 4
ecall 

mv a0, t3
li a7 ,1
ecall

#ESCI
li a7 ,10
ecall 