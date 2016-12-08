let x86_prefix = "	.section	__TEXT,__text,regular,pure_instructions
  .macosx_version_min 10, 11
"
let x86_main_prefix = "		.globl	_print
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
  "

let x86_main_suffix = "	pop %rdi
  callq	_print
  xorl	%edi, %edi
  callq	_exit
  .cfi_endproc

  .section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
  .asciz	\"%d\n\"

L_.str.1:                               ## @.str.1
  .asciz	\" %d\"

"

let x86_fun_prefix f n = let n = n + 9 in "	.globl	_" ^ f ^ "
  .align	4, 0x90
_" ^ f ^ ":                                  ## @" ^ f ^ "
  .cfi_startproc
## BB#0:
  pushq	%rbp
Ltmp" ^ (string_of_int n) ^ ":
  .cfi_def_cfa_offset 16
Ltmp" ^ (string_of_int (n+1)) ^ ":
  .cfi_offset %rbp, -16
  movq	%rsp, %rbp
Ltmp" ^ (string_of_int (n+2)) ^ ":
  .cfi_def_cfa_register %rbp
  subq	$16, %rsp
"

let x86_fun_suffix = "movq	%rbp, %rsp
  popq	%rbp
  retq
  .cfi_endproc"

let x86_suffix = "
  .subsections_via_symbols"
