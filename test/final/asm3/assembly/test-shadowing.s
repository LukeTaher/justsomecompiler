	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_a
	.align	4, 0x90
_a:                                  ## @a
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
pushq %rdi
pushq $1
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH1
pushq $1
jmp END_BRANCH1
BRANCH1:
pushq $0
END_BRANCH1:
popq %rax
popq %rbx
pushq %rax
popq %rax
movq	%rbp, %rsp
	popq	%rbp
	retq
	.cfi_endproc	.globl	_LAMBDA2
	.align	4, 0x90
_LAMBDA2:                                  ## @LAMBDA2
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp15:
	.cfi_def_cfa_offset 16
Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp17:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
pushq %rdi
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
popq %rax
movq	%rbp, %rsp
	popq	%rbp
	retq
	.cfi_endproc		.globl	_print
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
  pushq $5
leaq -24(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
pushq $10
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
movabsq $_LAMBDA2, %rbx
 pushq %rbx 
leaq -64(%rbp), %rax
pushq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
movq -72(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
pushq $1
popq %rdi
callq *%rax
pushq %rax
popq %rdi
callq _a
pushq %rax
popq %rax
cmpq $0, %rax
jle BRANCH3
pushq $98
leaq -80(%rbp), %rax
pushq %rax
pushq $99
movq -96(%rbp), %rax
pushq %rax
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH3
BRANCH3:
pushq $0
END_BRANCH3:
popq %rdi
callq *%rax
pushq %rax
pushq $100
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
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