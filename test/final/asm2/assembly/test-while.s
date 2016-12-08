	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
		.globl	_print
	.align	4, 0x90
_print:                                 ## @print
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	L_.str(%rip), %rax
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %esi
	movq	%rax, %rdi
	movb	$0, %al
	callq	_printf
	xorl	%edi, %edi
	movl	%eax, -8(%rbp)          ## 4-byte Spill
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_read
	.align	4, 0x90
_read:                                  ## @read
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	L_.str.1(%rip), %rdi
	leaq	-4(%rbp), %rsi
	movb	$0, %al
	callq	_scanf
	movl	-4(%rbp), %ecx
	movl	%eax, -8(%rbp)          ## 4-byte Spill
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
  pushq $0
leaq -24(%rbp), %rax
pushq %rax
pushq $0
leaq -40(%rbp), %rax
pushq %rax
pushq $0
LOOP1:
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP1
popq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH2
pushq $0
leaq -56(%rbp), %rax
pushq %rax
pushq $0
LOOP3:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP3
popq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH4
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH4
BRANCH4:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH5
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH5
BRANCH5:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH6
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH6
BRANCH6:
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH6:
END_BRANCH5:
END_BRANCH4:
jmp LOOP3
END_LOOP3:
movq -48(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH2
BRANCH2:
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH7
pushq $0
leaq -56(%rbp), %rax
pushq %rax
pushq $0
LOOP8:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP8
popq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH9
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH9
BRANCH9:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH10
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH10
BRANCH10:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH11
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH11
BRANCH11:
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH11:
END_BRANCH10:
END_BRANCH9:
jmp LOOP8
END_LOOP8:
movq -48(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH7
BRANCH7:
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH12
pushq $0
leaq -56(%rbp), %rax
pushq %rax
pushq $0
LOOP13:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP13
popq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH14
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH14
BRANCH14:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH15
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH15
BRANCH15:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH16
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH16
BRANCH16:
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH16:
END_BRANCH15:
END_BRANCH14:
jmp LOOP13
END_LOOP13:
movq -48(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH12
BRANCH12:
pushq $0
leaq -56(%rbp), %rax
pushq %rax
pushq $0
LOOP17:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP17
popq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH18
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH18
BRANCH18:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH19
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH19
BRANCH19:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH20
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH20
BRANCH20:
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
movq -64(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH20:
END_BRANCH19:
END_BRANCH18:
jmp LOOP17
END_LOOP17:
movq -48(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
pushq $0
leaq -64(%rbp), %rax
pushq %rax
pushq $0
LOOP21:
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP21
popq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH22
movq -72(%rbp), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH22
BRANCH22:
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH23
movq -72(%rbp), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH23
BRANCH23:
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH24
movq -72(%rbp), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH24
BRANCH24:
movq -72(%rbp), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
movq -72(%rbp), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH24:
END_BRANCH23:
END_BRANCH22:
jmp LOOP21
END_LOOP21:
movq -48(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH12:
END_BRANCH7:
END_BRANCH2:
jmp LOOP1
END_LOOP1:
popq %rax
popq %rbx
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
	pop %rdi
	callq	_print
	xorl	%edi, %edi
	callq	_exit
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d
"

L_.str.1:                               ## @.str.1
	.asciz	" %d"


	.subsections_via_symbols