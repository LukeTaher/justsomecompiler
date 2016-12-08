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
LOOP1:
movq -32(%rbp), %rax
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
movq -32(%rbp), %rax
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
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
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
jmp END_BRANCH2
BRANCH2:
movq -32(%rbp), %rax
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
jle BRANCH3
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
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
jmp END_BRANCH3
BRANCH3:
movq -32(%rbp), %rax
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
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
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
jmp END_BRANCH4
BRANCH4:
movq -32(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
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
pushq $1
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
END_BRANCH4:
END_BRANCH3:
END_BRANCH2:
jmp LOOP1
END_LOOP1:
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