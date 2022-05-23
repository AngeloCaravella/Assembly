.data
numero: .asciz "Quanti numeri di Fibonacci vuoi calcolare ? (escluse le condizioni iniziali):\n"
spazio: .asciz " "
.text

.globl Fibonacci

Fibonacci:
#CHIEDO IL NUMERO
la a0 ,numero
li a7, 4
ecall

li a7, 5
ecall
mv t0, a0

addi sp, sp, -100
mv t1,sp

#CARICO IL PRIMO E IL SECONDO NUMERO
li t2, 0
sw t2, (t1) 
addi t1, t1, 4

mv a0, t2
li a7 ,1
ecall

la a0, spazio
li a7, 4
ecall

li t2, 1
sw t2, (t1) 

mv a0, t2
li a7 ,1
ecall

###########################
scorri:
addi t1, t1, -4
lw t2, (t1)

addi t1, t1, 4
lw t3, (t1)

add t3, t3, t2

addi t1, t1, 4
sw t3,(t1)

la a0, spazio
li a7, 4
ecall

mv a0, t3
li a7 ,1
ecall

la a0, spazio
li a7, 4
ecall
addi t0, t0, -1
bnez t0, scorri

addi sp, sp, 100
#EXIT
li a7,10
ecall