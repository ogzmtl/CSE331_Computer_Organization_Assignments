.data
	myArray: .space 40
	myTempArr: .space 40
	myLastArr: .space 40
	newLine: .asciiz "\n"
.text

 # $t0 = counterTemp
 # $t2 = i 
 # $t6 =j
 # $t5 = k
 # $t8 = sizeofarray x 4
 
main :

	
	addi $s1, $zero, 3
	addi $s2, $zero, 10
	addi $s3, $zero, 7
	addi $s4, $zero, 9
	addi $s5, $zero, 4
	addi $s6, $zero, 11
	addi $s7, $zero, 12 
	
            addi $t1, $zero, 0
 	sw $s1, myArray($t1)
 	#sw $s1, myTempArr($t1)
 	
 	    addi $t1, $t1, 4
 	sw $s2, myArray($t1) 
 	#sw $s2, myTempArr($t1)
 	
 	    addi $t1, $t1, 4
 	sw $s3, myArray($t1)
 	#sw $s3, myTempArr($t1)
 	
 	    addi $t1, $t1,4	
 	sw $s4, myArray($t1)
 	#sw $s4, myTempArr($t1)
 	
 	    addi $t1, $t1, 4
  	sw $s5, myArray($t1)
  	#sw $s5, myTempArr($t1)
  	   
  	     addi $t1, $t1,4
 	sw $s6, myArray($t1) 
 	
 	addi $t1, $t1,4
 	sw $s7, myArray($t1) 
 	#sw $s6, myTempArr($t1)
 	
 	  li $t2, 0  	
 	  li $t8, 36 # size of array
 	 			 	 			 			
for_i:
	bgt  $t2, $t8, exit # if (i > sizeofarray , go exit)
	addi $t0, $zero, 0 # counterTemp = 0 
	
	lw $t9, myArray($t2) 
	sw $t9, myTempArr($t0)  # myTemparr[counterTemp] = myArray[i];
	addi $t2, $t2, 4 # counter i++	
	
	
	addi $t6, $t2, 0 # $t6 = j and j = i+1
	j for_j
	

for_j:
	bgt $t6, $t8, for_i # if j > sizeofArray go forI	
	#addi $t0, $t0, 4 # counterTemp = size will increase 4 counter temp++
	
	lw $t3, myTempArr($t0)
	lw $t4, myArray($t6)
	blt $t3,$t4,equalize
	bge $t3, $t4, return
return:
	addi $t6, $t6, 4 # j++
	
	addi $t5, $t6, 0 # $t5 = k and k = j+1
	j for_k
	
	
for_k:
	
	bgt $t5, $t8, for_j
	
	lw $t3, myTempArr($t0)
	lw $t4, myArray($t5)
	
	blt $t3, $t4, equal
	bgt $t3, $t4,return_back 
return_back:		
	addi $t5, $t5, 4
	j for_k

equal:
	addi $t0, $t0, 4
	lw $t9, myArray($t5)
	sw $t9, myTempArr($t0) 	
	###################################
		li $v0, 1
		li $t7, 0
		lw $t9, myTempArr($t7)
		move $a0, $t9
		syscall
		li $v0, 1
		li $t7, 4
		lw $t9, myTempArr($t7) ### MANUEL SUBSEQUENCE WRITING
		move $a0, $t9
		syscall
		li $v0, 1
		li $t7, 8
		lw $t9, myTempArr($t7)
		move $a0, $t9
		syscall
		li $v0, 4
		la $a0, newLine
		syscall
	###################################
	j return_back
	
equalize:
	addi $t0, $t0, 4
	sw $t4, myTempArr($t0)
	j return	
	
exit:
	####################
	li $v0, 1
	li $t8, 0
	lw $t9, myTempArr($t8)
	move $a0, $t9
	syscall
	########################
	
	
	
