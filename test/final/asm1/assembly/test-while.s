	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_testfuna
	.align	4, 0x90
_testfuna:                                  ## @testfuna
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
pushq $0
LOOP1:
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP1
popq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH2
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH2
BRANCH2:
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH3
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH3
BRANCH3:
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH4
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH4
BRANCH4:
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
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
popq %rax
movq	%rbp, %rsp
	popq	%rbp
	retq
	.cfi_endproc	.globl	_testfunb
	.align	4, 0x90
_testfunb:                                  ## @testfunb
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
pushq %rdi
pushq $0
LOOP5:
movq -24(%rbp), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP5
popq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH6
pushq $0
LOOP7:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP7
popq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH8
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH8
BRANCH8:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH9
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH9
BRANCH9:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH10
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH10
BRANCH10:
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH10:
END_BRANCH9:
END_BRANCH8:
jmp LOOP7
END_LOOP7:
jmp END_BRANCH6
BRANCH6:
movq -24(%rbp), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH11
pushq $0
LOOP12:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP12
popq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH13
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH13
BRANCH13:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH14
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH14
BRANCH14:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH15
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH15
BRANCH15:
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH15:
END_BRANCH14:
END_BRANCH13:
jmp LOOP12
END_LOOP12:
jmp END_BRANCH11
BRANCH11:
movq -24(%rbp), %rax
pushq %rax
pushq $10
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH16
pushq $0
LOOP17:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP17
popq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH18
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH18
BRANCH18:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH19
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH19
BRANCH19:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH20
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH20
BRANCH20:
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH20:
END_BRANCH19:
END_BRANCH18:
jmp LOOP17
END_LOOP17:
jmp END_BRANCH16
BRANCH16:
pushq $0
LOOP21:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP21
popq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH22
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH22
BRANCH22:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH23
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH23
BRANCH23:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH24
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH24
BRANCH24:
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH24:
END_BRANCH23:
END_BRANCH22:
jmp LOOP21
END_LOOP21:
pushq $0
LOOP25:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP25
popq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH26
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH26
BRANCH26:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH27
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH27
BRANCH27:
movq -24(%rbp), %rax
pushq %rax
pushq $20
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setg %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH28
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH28
BRANCH28:
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
movq -24(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH28:
END_BRANCH27:
END_BRANCH26:
jmp LOOP25
END_LOOP25:
popq %rax
popq %rbx
pushq %rax
END_BRANCH16:
END_BRANCH11:
END_BRANCH6:
jmp LOOP5
END_LOOP5:
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
  pushq $1
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