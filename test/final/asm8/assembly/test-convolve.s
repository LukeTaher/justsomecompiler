	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_convolve
	.align	4, 0x90
_convolve:                                  ## @convolve
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
pushq %rsi
pushq %rdx
pushq %rcx
movq -48(%rbp), %rax
pushq %rax
leaq -56(%rbp), %rax
pushq %rax
movq -40(%rbp), %rax
pushq %rax
leaq -72(%rbp), %rax
pushq %rax
pushq $0
leaq -88(%rbp), %rax
pushq %rax
pushq $0
LOOP1:
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
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
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
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
leaq -104(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH3
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
jmp END_BRANCH3
BRANCH3:
pushq $0
END_BRANCH3:
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH4
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
jmp END_BRANCH4
BRANCH4:
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
END_BRANCH4:
movq -120(%rbp), %rax
pushq %rax
leaq -136(%rbp), %rax
pushq %rax
pushq $0
LOOP5:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP5
popq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH6
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH6
BRANCH6:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH7
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH7
BRANCH7:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH8
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH8
BRANCH8:
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
popq %rax
popq %rbx
pushq %rax
END_BRANCH8:
END_BRANCH7:
END_BRANCH6:
jmp LOOP5
END_LOOP5:
movq -96(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
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
movq -112(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
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
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH2
BRANCH2:
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH9
pushq $0
leaq -104(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
jmp END_BRANCH10
BRANCH10:
pushq $0
END_BRANCH10:
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH11
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
jmp END_BRANCH11
BRANCH11:
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
END_BRANCH11:
movq -120(%rbp), %rax
pushq %rax
leaq -136(%rbp), %rax
pushq %rax
pushq $0
LOOP12:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP12
popq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH13
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH13
BRANCH13:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH14
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH14
BRANCH14:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH15
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH15
BRANCH15:
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
popq %rax
popq %rbx
pushq %rax
END_BRANCH15:
END_BRANCH14:
END_BRANCH13:
jmp LOOP12
END_LOOP12:
movq -96(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
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
movq -112(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
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
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH9
BRANCH9:
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH16
pushq $0
leaq -104(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH17
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
jmp END_BRANCH17
BRANCH17:
pushq $0
END_BRANCH17:
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH18
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
jmp END_BRANCH18
BRANCH18:
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
END_BRANCH18:
movq -120(%rbp), %rax
pushq %rax
leaq -136(%rbp), %rax
pushq %rax
pushq $0
LOOP19:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP19
popq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH20
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH20
BRANCH20:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH21
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH21
BRANCH21:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH22
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH22
BRANCH22:
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
popq %rax
popq %rbx
pushq %rax
END_BRANCH22:
END_BRANCH21:
END_BRANCH20:
jmp LOOP19
END_LOOP19:
movq -96(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
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
movq -112(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
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
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH16
BRANCH16:
pushq $0
leaq -104(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH23
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
jmp END_BRANCH23
BRANCH23:
pushq $0
END_BRANCH23:
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH24
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
jmp END_BRANCH24
BRANCH24:
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
END_BRANCH24:
movq -120(%rbp), %rax
pushq %rax
leaq -136(%rbp), %rax
pushq %rax
pushq $0
LOOP25:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP25
popq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH26
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH26
BRANCH26:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH27
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH27
BRANCH27:
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -128(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH28
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
jmp END_BRANCH28
BRANCH28:
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
movq -112(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -144(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -112(%rbp), %rax
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
movq -144(%rbp), %rax
pushq %rax
movq -144(%rbp), %rax
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
popq %rax
popq %rbx
pushq %rax
END_BRANCH28:
END_BRANCH27:
END_BRANCH26:
jmp LOOP25
END_LOOP25:
movq -96(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
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
movq -112(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
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
popq %rax
popq %rbx
pushq %rax
popq %rax
popq %rbx
popq %rbx
pushq %rax
pushq $0
leaq -112(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH29
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
jmp END_BRANCH29
BRANCH29:
pushq $0
END_BRANCH29:
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH30
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
jmp END_BRANCH30
BRANCH30:
movq -32(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
END_BRANCH30:
movq -128(%rbp), %rax
pushq %rax
leaq -144(%rbp), %rax
pushq %rax
pushq $0
LOOP31:
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -136(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP31
popq %rax
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -136(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH32
movq -120(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -120(%rbp), %rax
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
movq -152(%rbp), %rax
pushq %rax
movq -152(%rbp), %rax
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
jmp END_BRANCH32
BRANCH32:
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -136(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH33
movq -120(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -120(%rbp), %rax
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
movq -152(%rbp), %rax
pushq %rax
movq -152(%rbp), %rax
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
jmp END_BRANCH33
BRANCH33:
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -136(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH34
movq -120(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -120(%rbp), %rax
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
movq -152(%rbp), %rax
pushq %rax
movq -152(%rbp), %rax
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
jmp END_BRANCH34
BRANCH34:
movq -120(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -120(%rbp), %rax
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
movq -152(%rbp), %rax
pushq %rax
movq -152(%rbp), %rax
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
movq -120(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq *%r10
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %r10
movq -96(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -152(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
callq *%r10
pushq %rax
popq %rax
popq %rbx 
imul %rax, %rbx
pushq %rbx
movq -120(%rbp), %rax
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
movq -152(%rbp), %rax
pushq %rax
movq -152(%rbp), %rax
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
popq %rax
popq %rbx
pushq %rax
END_BRANCH34:
END_BRANCH33:
END_BRANCH32:
jmp LOOP31
END_LOOP31:
movq -96(%rbp), %rax
pushq %rax
movq -96(%rbp), %rax
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
movq -120(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
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
END_BRANCH16:
END_BRANCH9:
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
popq %rax
popq %rbx
popq %rbx
pushq %rax
popq %rax
movq	%rbp, %rsp
	popq	%rbp
	retq
	.cfi_endproc	.globl	_f
	.align	4, 0x90
_f:                                  ## @f
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
movq -24(%rbp), %rax
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH35
pushq $1
jmp END_BRANCH35
BRANCH35:
movq -24(%rbp), %rax
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
jle BRANCH36
pushq $1
jmp END_BRANCH36
BRANCH36:
movq -24(%rbp), %rax
pushq %rax
pushq $2
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH37
pushq $1
jmp END_BRANCH37
BRANCH37:
movq -24(%rbp), %rax
pushq %rax
pushq $3
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH38
pushq $1
jmp END_BRANCH38
BRANCH38:
pushq $1
END_BRANCH38:
END_BRANCH37:
END_BRANCH36:
END_BRANCH35:
popq %rax
movq	%rbp, %rsp
	popq	%rbp
	retq
	.cfi_endproc	.globl	_g
	.align	4, 0x90
_g:                                  ## @g
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
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH39
pushq $1
jmp END_BRANCH39
BRANCH39:
movq -24(%rbp), %rax
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
jle BRANCH40
pushq $1
jmp END_BRANCH40
BRANCH40:
movq -24(%rbp), %rax
pushq %rax
pushq $2
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH41
pushq $1
jmp END_BRANCH41
BRANCH41:
movq -24(%rbp), %rax
pushq %rax
pushq $3
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH42
pushq $1
jmp END_BRANCH42
BRANCH42:
pushq $1
END_BRANCH42:
END_BRANCH41:
END_BRANCH40:
END_BRANCH39:
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
popq %rdi
pushq $5
popq %rsi
movabsq $_g, %rbx
 pushq %rbx 
popq %rdx
movabsq $_f, %rbx
 pushq %rbx 
popq %rcx
callq _convolve
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