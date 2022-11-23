https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.text 
start:
	li sp 0x10000
	la s0 inputcnt
	lw s0 0(s0)
	la a0 inputs

input_loop:
	#jal solve

	addi a0 a0 16
	addi s0 s0 -1
	bnez s0 input_loop

	la s0 inputcnt
	lw s0 0(s0)
	la s1 inputs
	la s2 answers
loop_answers:
	li s3 16
	addi s4 zero 0
	

	loop_answer:
		add t0 s3 s1
		add t1 s3 s2

		lb t2 0(t0)
		lb t3 0(t1)
		beq t2 t3 skip_different

		addi s4 s4 1

		skip_different:
		addi s3 s3 -1
		bnez s3 loop_answer

	li t4 0x10000
	sw s4 0(t4)

	addi s0 s0 -1
	bnez s0 loop_answers
	hcf

#########################################
####### Modify this part! #############>>

solve:
	addi sp sp -8
	sw a0 4(sp)
	sw ra 0(sp)
	
	lw ra 0(sp)
	lw a0 4(sp)
	addi sp sp 8
	ret

### Do not modify beyond this point! ##<<
#########################################


.data
inputcnt:
.word 3
inputs: 
.byte 0 4 3 0 0 0 4 2 0 2 0 0 3 0 0 0
.byte 0 0 3 0 0 4 0 2 0 0 2 0 0 2 0 3
.byte 0 3 0 4 0 0 2 0 4 0 3 0 0 0 0 2
answers:
.byte 2 4 3 1 1 3 4 2 4 2 1 3 3 1 2 4 
.byte 2 1 3 4 3 4 1 2 4 3 2 1 1 2 4 3 
.byte 2 3 1 4 1 4 2 3 4 2 3 1 3 1 4 2 

