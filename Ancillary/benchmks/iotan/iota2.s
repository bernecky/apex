	.file	"iota2.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"sum is %f\n"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	subq	$8008, %rsp
	.cfi_def_cfa_offset 8016
	movdqa	.LC0(%rip), %xmm0
	leaq	8000(%rsp), %rcx
	movq	%rsp, %rax
	movdqa	.LC1(%rip), %xmm2
	.p2align 4,,10
	.p2align 3
.L2:
	cvtdq2pd	%xmm0, %xmm1
	movapd	%xmm1, (%rax)
	pshufd	$238, %xmm0, %xmm1
	paddd	%xmm2, %xmm0
	cvtdq2pd	%xmm1, %xmm1
	movapd	%xmm1, 16(%rax)
	addq	$32, %rax
	cmpq	%rcx, %rax
	jne	.L2
	xorpd	%xmm0, %xmm0
	movq	%rsp, %rdx
	.p2align 4,,10
	.p2align 3
.L3:
	addsd	(%rdx), %xmm0
	addq	$8, %rdx
	cmpq	%rax, %rdx
	jne	.L3
	movl	$.LC3, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movl	$1000, %eax
	addq	$8008, %rsp
	ret
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
