.data 

hello: .asciz "Hello World "

.text
.globl  main


main: 


la a0 , hello
 
li a7 ,  4
ecall


li a7 , 10
ecall