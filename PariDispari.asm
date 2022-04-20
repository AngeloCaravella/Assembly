.data
str1:	.asciz "Pari"
str2:	.asciz "Dispari"

.text
	li a7, 5	# input numero
	ecall
	li t0, 2
	rem t0, a0, t0
	beq t0, zero, pari
	la a0, str2		# carico la stringa dispari
	beq zero, zero, stampa
	
pari:	la a0, str1	# carico la stringa pari
	
stampa:	li a7, 4	# stampo la stringa
	ecall
	
	li a7, 10
	ecall