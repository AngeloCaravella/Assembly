.data 
array: .word 0:9
input: .asciz "Inserisci il numero: "
output: .asciz "\nArray ordinato"
 
.text
.globl main

main:

    la a0, array 
    mv t1, a0 
    addi t0, t0, 10
    
    jal ra, inserimento        
                                                                                      
    addi t0, t0, 10
    jal ra, bubblesort
   
   esci:
    		
    li a7 , 10
    ecall 

print:			
    la a0, output 
    li a7, 4
    ecall
    
    lw a0, (t1) #INSERIMENTO
    li a7, 1
    ecall	
    
    addi t1, t1, 4						
    addi t0, t0, -1
    	 
    bnez t0, print
    b	esci

inserimento: 
	
	la a0, input # STAMPA 
	li a7, 4
	ecall 
	
	li a7, 5 #INSERIMENTO INTERO 
	ecall
	
	sw a0, (t1) #ALLOCAZIONE
	addi t1, t1, 4
	addi t0, t0, -1
	
	bnez t0, inserimento #CONTROLLO
	jr ra 
	
bubblesort:
	li t3,10
	
ripasso:	
	addi t3, t3, -1
	la t1, array
	beqz t3, print	
	addi t4, t4, 10
	
dentro:	
	lw a0, (t1)
	lw a1, 4(t1)
	bgt a0, a1, sort
nuovacorsa: 
	addi t1, t1, 4
	addi t4, t4, -1
	bgtz t4, dentro
	b ripasso
sort:
	mv t2, a0
	mv a0, a1
	mv a1, t2
	sw a0, (t1)
	sw a1,4(t1)
	jal nuovacorsa



	