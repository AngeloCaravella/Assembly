.data 
input: .asciz "Inserisci quanti numeri vuoi inserire\n"

numel: .asciz "\nInserisci il numero da eliminare:"

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
mv s0,t0
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


ripassa:
mv t1, sp
li t6,4
jal elimina

fine:

mv t1, sp 

stampa:
lw t3, (t1)
mv a0,t3
li a7, 1
ecall
addi t1, t1, 4
addi t0, t0, -1
bnez t0,stampa

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
mv t0, s0
jr ra


elimina:
lw t5, (t1)
beq t5, t3, el
esci:
addi t1, t1, 4
addi s0,s0, -1
bnez s0,elimina
jr ra

el:
addi t1, t1, 4
lw t5, (t1)

addi t1,t1, -4
sw t5, (t1)

shift:
#fase di schift 
addi t1, t1, 8
lw t5, (t1) 

addi t1,t1, -4
sw t5, (t1) 

addi s0,s0, -1
bnez s0,shift
mv t1, sp 
mv s0 ,t0
bnez t6, elimina
jr ra


