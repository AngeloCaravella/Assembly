.data 
array: .word 0:9
input: .asciz "Inserisci il numero: "
inputofind: .asciz "\nInserisci il numero  da ricercare: "
output: .asciz "\n"
 
.text
.globl main

main:

    la a0, array 
    mv t1, a0 
    addi t0, t0, 10
    
    jal ra, inserimento        
                                                                                      
   
    
    la a0, inputofind #STAMPA
    li a7, 4
    ecall
    
    li a7, 5 # LEGGO INPUT DA CERCARE
    ecall
    
    mv t2, a0 
    
    la t1, array
  addi t0, t0, 10  
    j ricercaoccorrenze
   trovato: 
   	li t6, 10 
	sub t6, t6 ,t5  # PRENDO IL NUMERO DI TROVATI E NE CALCOLO QUELLI CHE DOVRANNO ESSSERE STAMPATI
  
  cancella:
     la t1, array
   addi t0, t0 ,10
   
    j modifica
    
   esci:
   	
   	addi t5, t5, -1
   	bne t5 ,t4, cancella #FINCHE' NON SONO UGUALI CANCELLA
   stampa:
   la t1, array
  mv t0, t6 
    j print #STAMPO	
    r:					
    #CHIUSURA
    li a7 , 10
    ecall 
    
    
    
    
ricercaoccorrenze:			
      
        lw a0, (t1)  # PRENDO 
        mv t3,a0   #CARICO
  
        beq t3,t2, occ
       l:
        addi t1, t1, 4	
        addi t0, t0, -1
    	 
    	bnez t0, ricercaoccorrenze
    	
    	b trovato
occ:
addi t5, t5,1 #INCREMENTO NUMERO DI OCCORRENZE
j l

modifica:			
        la a0, output
        li a7, 4      # \n
        ecall
     
        lw a0, (t1)  # PRENDO 
        mv t3,a0   #CARICO
  
        beq t3,t2, shift  # E' ORA DI SCHIFT
       	return :
       	
        addi t1, t1, 4	
        addi t0, t0, -1
    	 
    	bnez t0, modifica
    	b	esci
 	
shift:
	addi, t4, t4, -1 # HIT QUINDI NE STAMPERO' UNO IN MENO
	addi t1, t1, 4	#INCREMENTI PER PRENDERTI A[i+1] 
	lw a0, (t1) #TE LO PRENDI
	mv t3,a0
	
	addi t1, t1, -4	 # DECREMENTI PER PUNTARE  AD A[i]
	addi t0 ,t0 ,-1 # CONTATORE CHE SCENDE
	beqz  t0, esci
	j mem
arretramento:
	addi t1, t1, 8 # DI 8 PERCHE' CI SARANNO DUE COPIE DELL' ELEMENTO E MI SERVE COPIARE QUELLO DOPO DUE POSIZIONI
	lw a0, (t1)
	mv t3, a0 
	addi t0 ,t0 ,-1
	addi t1, t1, -4	
	
	beqz  t0, esci
	j mem
mem: 
        sw t3 ,(t1) 	# MEMORIZZO
	j arretramento


inserimento: 
	
	la a0, input 
	li a7, 4
	ecall 
	
	li a7, 5  
	ecall
	
	sw a0, (t1) 
	addi t1, t1, 4
	addi t0, t0, -1
	
	bnez t0, inserimento 
	jr ra 
	
print:		
    	
    la a0, output 
    li a7, 4
    ecall
    
    lw a0, (t1) 
    li a7, 1
    ecall	
    
    addi t1, t1, 4						
    addi t0, t0, -1
    	 
    bnez t0, print
    j r

	
