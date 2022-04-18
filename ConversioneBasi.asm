# DATA SEGMENT
	.data
prompt:
	.asciz 		"\n\nInserisci un carattere: "
output_msg:
	.asciz		"\nIl codice ASCII del carattere è "
spec_out1:
	.asciz		" (dec) - "	
spec_out2:
	.asciz		" (bin) - "	
spec_out3:
	.asciz		" (hex) \n"	
ch:
	.space		2
ascii_string:
	.space		9

  	
	
# CODE SEGMENT
	.text
	.globl		main
main:
	# stampa prompt
	la		a0, prompt
	li		a7, 4
	ecall
	
	# leggi carattere input 
	la		a0, ch
	li		a1, 2   # NB: il carattere è letto come una stringa carattere+terminatore null (lunga 2)
	li		a7, 8
	ecall
	
	# stampa output message
	la		a0, output_msg
	li		a7, 4
	ecall

	# chiama le tre funzioni di stampa
	lbu		a0, ch  # parametro di input 
	jal		print_decimal
	
	la		a0, spec_out1
	li		a7, 4
	ecall

	lbu		a0, ch
	jal		print_binary
	
	la		a0, spec_out2
	li		a7, 4
	ecall
	
	lbu		a0, ch
	jal		print_hex
	
	la		a0, spec_out3
	li		a7, 4
	ecall

	# terminazione del programma
	li		a7, 10
	ecall
	
#################################################
print_decimal:
	li		a7, 1
	ecall
	
	jr 		ra
	
###############################################################
print_binary:				

	mv		t0, a0
	li              s1, 2 # PER DIVIDERE
	li 		s2, 0 # PER FARE CONFRONTO CON  0 
		
	eseguidivisioni:
	
	rem             t6, t0, s1 
	div 		t0 , t0 ,s1
	
	mv a0, t6
	li a7 , 1
	ecall 
	
	bne             t0 ,s2, eseguidivisioni
	
	jr		ra
	
#################################################################
print_hex:

	mv		t0, a0
	
	li              s1, 16 # PER DIVIDERE
	li 		s2, 0 # PER FARE CONFRONTO CON  0 
		
	eseguidivisionii:
	
	rem             t6, t0, s1 
	div 		t0 , t0 ,s1
	
	mv a0, t6
	li a7 , 1
	ecall 
	
	bne             t0 ,s2, eseguidivisionii
	jr		ra
