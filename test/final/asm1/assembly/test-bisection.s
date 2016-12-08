	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_iterativeBisection
	.align	4, 0x90
_iterativeBisection:                                  ## @iterativeBisection
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
pushq $1
leaq -56(%rbp), %rax
pushq %rax
pushq $0
LOOP1:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle END_LOOP1
popq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH2
movq -48(%rbp), %rax
pushq %rax
movq -40(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
leaq -72(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
movq -40(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
movq -32(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH3
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
jmp END_LOOP1
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH3
BRANCH3:
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
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH4
movq -48(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH4
BRANCH4:
movq -40(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
END_BRANCH4:
popq %rax
popq %rbx
pushq %rax
END_BRANCH3:
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH2
BRANCH2:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH5
movq -48(%rbp), %rax
pushq %rax
movq -40(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
leaq -72(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
movq -40(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
movq -32(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH6
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
jmp END_LOOP1
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
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH7
movq -48(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH7
BRANCH7:
movq -40(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
END_BRANCH7:
popq %rax
popq %rbx
pushq %rax
END_BRANCH6:
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH5
BRANCH5:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
movq -24(%rbp), %rax
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
movq -48(%rbp), %rax
pushq %rax
movq -40(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
leaq -72(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
movq -40(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
movq -32(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH9
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
jmp END_LOOP1
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH9
BRANCH9:
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
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH10
movq -48(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH10
BRANCH10:
movq -40(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
END_BRANCH10:
popq %rax
popq %rbx
pushq %rax
END_BRANCH9:
popq %rax
popq %rbx
popq %rbx
pushq %rax
jmp END_BRANCH8
BRANCH8:
movq -48(%rbp), %rax
pushq %rax
movq -40(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
leaq -72(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
movq -40(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
movq -32(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH11
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
jmp END_LOOP1
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
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH12
movq -48(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH12
BRANCH12:
movq -40(%rbp), %rax
pushq %rax
movq -80(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
END_BRANCH12:
popq %rax
popq %rbx
pushq %rax
END_BRANCH11:
popq %rax
popq %rbx
popq %rbx
pushq %rax
movq -48(%rbp), %rax
pushq %rax
movq -40(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
leaq -80(%rbp), %rax
pushq %rax
movq -88(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
movq -40(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
movq -32(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH13
movq -88(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _print
pushq $0
jmp END_LOOP1
popq %rax
popq %rbx
pushq %rax
jmp END_BRANCH13
BRANCH13:
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
movq -88(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
movq -88(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH14
movq -48(%rbp), %rax
pushq %rax
movq -88(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH14
BRANCH14:
movq -40(%rbp), %rax
pushq %rax
movq -88(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
END_BRANCH14:
popq %rax
popq %rbx
pushq %rax
END_BRANCH13:
popq %rax
popq %rbx
popq %rbx
pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH8:
END_BRANCH5:
END_BRANCH2:
jmp LOOP1
END_LOOP1:
popq %rax
popq %rbx
popq %rbx
pushq %rax
popq %rax
movq	%rbp, %rsp
	popq	%rbp
	retq
	.cfi_endproc	.globl	_recursiveBisection
	.align	4, 0x90
_recursiveBisection:                                  ## @recursiveBisection
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
pushq %rsi
pushq %rdx
pushq %rcx
movq -24(%rbp), %rax
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH15
pushq $0
jmp END_BRANCH15
BRANCH15:
movq -48(%rbp), %rax
pushq %rax
movq -40(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
add %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
leaq -56(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 sete %al
 movq %rax, %rbx
pushq %rbx
movq -40(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
pushq $2
popq %rax
popq %rbx 
pushq %rax
 pushq %rbx
 popq %rax
 popq %rbx
 cltd

							div %rbx
 movq %rax, %rbx
pushq %rbx
movq -32(%rbp), %rax
pushq %rax
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setl %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH16
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
jmp END_BRANCH16
BRANCH16:
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setge %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
movq -48(%rbp), %rax
pushq %rax
popq %rdi
callq _f
pushq %rax
pushq $0
popq %rax
popq %rbx 
cmpq %rax, %rbx
 setle %al
 movq %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
and %rax, %rbx
pushq %rbx
popq %rax
popq %rbx 
or %rax, %rbx
pushq %rbx
popq %rax
cmpq $0, %rax
jle BRANCH17
movq -48(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
jmp END_BRANCH17
BRANCH17:
movq -40(%rbp), %rax
pushq %rax
movq -64(%rbp), %rax
pushq %rax
popq %rax
movq (%rax), %rax
pushq %rax
popq %rax
popq %rbx
movq %rax, (%rbx)
 pushq %rax
END_BRANCH17:
movq -24(%rbp), %rax
pushq %rax
pushq $1
popq %rax
popq %rbx 
sub %rax, %rbx
pushq %rbx
popq %rdi
movq -32(%rbp), %rax
pushq %rax
popq %rsi
movq -40(%rbp), %rax
pushq %rax
popq %rdx
movq -48(%rbp), %rax
pushq %rax
popq %rcx
callq _recursiveBisection
pushq %rax
popq %rax
popq %rbx
pushq %rax
END_BRANCH16:
popq %rax
popq %rbx
popq %rbx
pushq %rax
END_BRANCH15:
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
pushq $5
popq %rax
popq %rbx 
sub %rax, %rbx
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
  pushq $20
popq %rdi
pushq $0
popq %rsi
pushq $10
popq %rdx
pushq $1
popq %rcx
callq _iterativeBisection
pushq %rax
pushq $20
popq %rdi
pushq $0
popq %rsi
pushq $10
popq %rdx
pushq $1
popq %rcx
callq _recursiveBisection
pushq %rax
popq %rax
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