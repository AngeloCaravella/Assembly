.data 
input: .asciz "Inserisci quanti numeri vuoi inserire\n"

numel: .asciz "\nInserisci il numero da eliminare:"
numin: .asciz "\nInserisci il numero da sostituire:"
s: .asciz "\n"
.text 

.globl main


main:

la a0, input
li a7, 4
ecall

li a7, 5
ecall
mv t0, a0

la a0, s
li a7, 4
ecall
addi sp, sp, -100
mv t1, sp

jal inserisci
la a0, numel
li a7, 4
ecall

li a7, 5
ecall
mv t3, a0
la a0, numin
li a7, 4
ecall

li a7, 5
ecall
mv t4, a0
mv t1, sp
jal eliminaesost

mv t1, sp 
stampa:
lw t3, (t1)
mv a0,t3
li a7, 1
ecall
addi t1, t1, 4
bnez t3,stampa

li a7, 10
ecall
inserisci:
li a7, 5
ecall

sw a0, (t1) 

addi t1, t1, 4
addi t0, t0, -1

la a0, s
li a7, 4
ecall

bnez t0, inserisci 
jr ra
eliminaesost:
lw t5, (t1)
beq t5, t3, el
esci:
addi t1, t1, 4

bnez t5,eliminaesost
jr ra

el:
sw t4, (t1) 
j esci