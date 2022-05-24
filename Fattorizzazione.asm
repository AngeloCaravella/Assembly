.data
input: .asciz "Inserisci il numero: "

array: .word 2,3,5,7,11,13,17,19,23,29

spazio: .asciz "\n"
output: .asciz "\nLa sua fattorizzazione è: "

.text
.globl main
main:
li s6, 29
la a0, input
li a7, 4
ecall

li a7, 5
ecall
mv s0, a0

la s2, array
jal Fattorizzazione 
  
stampa_e_esci:
li s0, 1
mv a0, s0
li a7 ,1
ecall
  
fine:  
li a7 ,10
ecall


Fattorizzazione: 
lw t0, (s2)
beq  t0,  s6, fine 
  
addi s2, s2 ,4

rem s3,s0, t0 
div s4,s0, t0 
beq s0, t0 , stampa_e_esci #SE IL DIVISORE E' UGUALE AL DIVIDENDO STAMPA E ESCI

bnez s3, Fattorizzazione #SE IL TEST DEL MODULO DA UN RESTO DIVERSO DA ZERO VADO AVANTI
#ALTRIMENTI STAMPO
mv a0, s4
li a7,1
ecall 

la a0, spazio
li a7, 4
ecall


mv s0, s4
rem s5, s4 ,t0
bnez s5 ,Fattorizzazione 
addi s2, s2, -4

bne t0,  s6, Fattorizzazione 
jr ra 