### data segment ###
.data
input: .asciz "Inserisci il numero di elementi dell'array: "
input_n: .asciz "Inserisci l'elemento che vuoi eliminare: "
input_el: .asciz "Inserisci numero: "
output: .asciz "L'array √®: "
####### code segment  #########
.text
.globl main
main:
	la a0, input
	li a7, 4
	ecall
	
	li a7, 5
	ecall 
	mv a2, a0  ##in a2 ho la cardinalit√†
	
	la a0, input_n
	li a7, 4
	ecall
	
	li a7, 5
	ecall 
	mv a3, a0  ##in a3 ho il numero da eliminare
	
	
	jal Insert
	
	jal Cancel
	li t0,0
	
	la a0, output
	li a7, 4
	ecall
printLoop:
	beq t0, a2, exit2
	addi sp,sp, -4
			#loop di stampa
	li a7, 1
	lw a0, (sp)
	ecall
	addi t0, t0, 1
	j printLoop
exit2:
	li t1, 4
	mul t2, t1, t0  # riporto lo sp in cima
	add sp,sp,t2
	li a7, 10
	ecall
	
	
Insert:

loop:
	beq t0, a2, exit
	addi sp,sp, -4
	la a0, input_el
	li a7, 4
	ecall
				#loop di inserimento
	li a7, 5 
	ecall
	sw a0, (sp)
	addi t0, t0, 1
	j loop
exit:
	li t1, 4
	mul t2, t1, t0  # riporto lo sp in cima
	add sp,sp,t2
	jr ra	
	
Cancel:
	li t0, 0
cmp:
	beq t0, a2, exit1
	addi sp,sp,-4
	lw t2, (sp)
	bne t2, a3, continue
	sub t4, a2, t0
shift:
	beq t5, t4, end_shift
	addi sp,sp,-4
	lw t3, (sp)
	sw t3, 4(sp)
	addi t5,t5,1
	j shift	
end_shift:
	addi a2, a2, -1
	li t1, 4
	mul t6, t4, t1  # riporto lo sp al punto dove ho avuto l'esito del confronto positivo
	add sp,sp,t6
	addi sp,sp,4
	li t5,0
	j cmp				
continue:
	addi t0,t0,1
	j cmp									
exit1:
	li t1, 4
	mul t6, t1, t0  # riporto lo sp in cima
	add sp,sp,t6
	jr ra			
