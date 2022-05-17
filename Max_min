# Description: given an array of integer, find min and max values
# Input: array of integers from user input
# Output print the min and max values
#################################### Data segment ####################################
.data
prompt_in:	.string "Dammi in valore di arr["	# input message
prompt_in1:	.string "]: "				# and input message, index array between angular brackets

prompt_max:	.string "Il massimo Ë: "		# output message, for max value
prompt_min:	.string "\nIl minimo Ë: "		# output message, for min value
#################################### Code segment ####################################
.text
.globl main
main:
	addi	sp, sp, -20		# crate stack pointer for allocate array of 5 ints (5 * 4bytes)
	
	# Fill the array
	mv 	a0, sp			# a0 = stack pointer, a0 is param of riempi_array funct
	jal 	riempi_array		# call riempi_array, nothing will be return
	
	# Find max value
	mv	a0, sp			# a0 = stack pointer, a0 is param of trova_max funct
	jal	trova_max		# call trova_max, return max value in a0
	mv	s0, a0			# save in s0 = a0, s0 saving no needed because it's in the main funct
	
	# Find min value
	mv	a0, sp			# a0 = stack pointer, a0 is param of trova_min funct
	jal	trova_min		# call trova_min, return min value in a0
	mv	s1, a0			# s1 = a0 

	addi	sp, sp, 20		# restore the sp
	
	# Print prompt_max
	la	a0, prompt_max
	li	a7, 4
	ecall

	# Print max value
	mv	a0, s0
	li	a7, 1
	ecall

	# Print prompt_min
	la	a0, prompt_min
	li	a7, 4
	ecall

	# Print min value
	mv	a0, s1
	li	a7, 1
	ecall

	# Exit program (R.I.P)
	li	a7, 10
	ecall
# End main
######################################################
# riempi_array method
# Description: fill the array with values from user input
#	-> t0 = array pointer
#	-> t1 = array index
#	-> t2 = number of array elements
# Input: a0 -> array pointer
riempi_array:
	mv	t0, a0			# t0 = array pointer, wi will use a0 for syscalls
	li	t1, 0			# t1 = counter (array index)
	li	t2, 5			# t2 = array size
read_loop:
	# Print prompt_in
	la	a0, prompt_in
	li	a7, 4
	ecall
	
	# Print array index
	mv	a0, t1
	li	a7, 1
	ecall

	# Print prompt_in1
	la	a0, prompt_in1
	li	a7, 4
	ecall

	# Read int value
	li	a7, 5
	ecall

	# Store value in array
	sw	a0, (t0)
	addi	t0, t0, 4		# t0 = next array element
	addi 	t1, t1, 1		# t1 = increase index
	blt 	t1, t2, read_loop	# (t1 < 5)? if true, read next int
	ret				# else, return to main
# Fine riempi_array
######################################################
# trova_max method
# Description: find max value in array
#	-> t0 = array pointer
#	-> t1 = array index
#	-> t2 = number of array elements
# Input: a0 -> array pointer
# Output: a0 -> max value
trova_max:
	mv	t0, a0			# t0 = array pointer, wi will use a0 for ret val
	li	t1, 0			# t1 = counter (array index)
	li	t2, 5			# t2 = array size
	lw	a0, (t0)		# a0 = first array element actually the max
loop_max:
	addi	t0, t0, 4		# t0 = next array element
	addi 	t1, t1, 1		# t1++
	lw	t3, (t0)		# t3 = *t0
	bge	a0, t3, no_change_max	# (a0 < t3)? if true no changes are needed
	mv 	a0, t3			# else, a0 = new max
no_change_max:
	blt 	t1, t2, loop_max	# (t1 < 5)? if true, go to next int
	ret				# else, return to main
# Fine trova_max
######################################################
# trova_min method
# Description: find min value in array, it's the same of trova_max
#	-> t0 = array pointer
#	-> t1 = array index
#	-> t2 = number of array elements
# Input: a0 -> array pointer
# Output: a0 -> min value
trova_min:
	mv	t0, a0
	li	t1, 0
	li	t2, 5
	lw	a0, (t0)
loop_min:
	addi	t0, t0, 4
	addi 	t1, t1, 1
	lw	t3, (t0)
	ble	a0, t3, no_change_min	# the only difference from trova_max, invertion of comparison
	mv 	a0, t3
no_change_min:
	blt 	t1, t2, loop_min
	ret
# Fine trova_min
######################################################
