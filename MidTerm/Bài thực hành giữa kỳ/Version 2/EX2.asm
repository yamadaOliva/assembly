.data
	A:word 0:100
	mess1:.asciiz  "So phan tu cua mang :"
	error1:.asciiz "phan tu phai lon hon 0\n"
	mess2:.asciiz "phan tu thu "
	mess3:.asciiz " la:"
	mess4:.asciiz "\n"
	mess5:.asciiz "Tong cac so le chia het cho 3 la :"
.text	
	
insert_arraylenght:
	li $v0,4 
	la $a0,mess1
	syscall 
	li $v0,5
	syscall
	add $t5,$t5,$v0
	slt $t9,$t5,$zero
	bne $t9,$zero,err1
	j end_insert
err1:
	li $v0,4 
	la $a0,error1
	syscall
	j insert_arraylenght
end_insert:
li $t1,0 # var_run
insert_elements:
	beq $t1,$t5,end_insertelements
	li $v0,4 
	la $a0,mess2
	syscall 
	li $v0,1 
	add $a0,$t1,$zero
	syscall
	li $v0,4 
	la $a0,mess3
	syscall
	li $v0,5
	syscall
	sll $t2,$t1,2
	sw $v0,A($t2)
	li $v0,4 
	la $a0,mess4
	syscall 
	addi $t1,$t1,1
	j insert_elements
end_insertelements:
li $t9,0 #sum
li $t1,0 #run
la $a0,A
li $t8,3 #fordiv
j loop
loop_up:
	addi $t1,$t1,1
loop:
	beq $t1,$t5,endloop
	sll $t2,$t1,2
	add $t3,$t2,$a0
	lw $t2,0($t3)
	andi $t4,$t2,1
	beq $t4,$zero,loop_up
	div $t2,$t8 # /3
	mfhi $t3
	bne $t3,$zero,loop_up
	add $t9,$t9,$t2
	j loop_up
endloop:
	li $v0,56 
	la $a0,mess5
	add $a1,$a1,$t9
	syscall 
	
	