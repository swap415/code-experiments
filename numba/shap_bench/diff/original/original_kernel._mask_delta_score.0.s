	.file	"<string>"
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI0_0:
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
	.short	255
.LCPI0_1:
	.zero	32,1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI0_2:
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.section	.ltext,"axl",@progbits
	.globl	_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE,@function
_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, 8(%rsp)
	movq	%rdi, %r13
	movq	104(%rsp), %r14
	movq	88(%rsp), %rbp
	movq	144(%rsp), %r15
	movabsq	$NRT_incref, %rbx
	movq	%rdx, %r12
	movq	%rdx, %rdi
	callq	*%rbx
	movq	%r14, %rdi
	callq	*%rbx
	movq	%r15, %rbx
	cmpq	$1, %rbp
	je	.LBB0_4
	cmpq	%rbp, %r15
	setne	%al
	cmpq	$1, %r15
	setne	%cl
	movq	%rbp, %rbx
	testb	%al, %cl
	je	.LBB0_4
	movabsq	$.const.picklebuf.c609a61042a044ba6291d5da2e507179b42ccfbc, %rax
.LBB0_3:
	movq	8(%rsp), %rcx
	movq	%rax, (%rcx)
	movl	$1, %r14d
	jmp	.LBB0_72
.LBB0_4:
	movq	%r13, 16(%rsp)
	movabsq	$NRT_MemInfo_alloc_aligned, %rax
	movq	%rbx, %rdi
	movl	$32, %esi
	callq	*%rax
	testq	%rax, %rax
	je	.LBB0_97
	movq	%rax, %r13
	xorl	%r14d, %r14d
	testq	%rbx, %rbx
	jle	.LBB0_10
	movq	136(%rsp), %rdx
	movq	80(%rsp), %rsi
	movq	24(%r13), %rax
	movabsq	$9223372036854775800, %rcx
	cmpq	$2, %rbp
	jb	.LBB0_11
	cmpq	$1, %r15
	jbe	.LBB0_19
	cmpq	$8, %rbx
	jb	.LBB0_9
	movq	%rax, %rdi
	subq	%rsi, %rdi
	cmpq	$128, %rdi
	setb	%dil
	movq	%rax, %r8
	subq	%rdx, %r8
	cmpq	$128, %r8
	setb	%r8b
	orb	%dil, %r8b
	je	.LBB0_47
.LBB0_9:
	xorl	%edi, %edi
.LBB0_56:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB0_59
	movq	%rdi, %r8
	.p2align	4
.LBB0_58:
	cmpb	$0, (%rsi,%r8)
	setne	%r10b
	cmpb	$0, (%rdx,%r8)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB0_58
.LBB0_59:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB0_61
	.p2align	4
.LBB0_60:
	cmpb	$0, (%rsi,%r8)
	setne	%dil
	cmpb	$0, (%rdx,%r8)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, (%rax,%r8)
	cmpb	$0, 1(%rsi,%r8)
	setne	%dil
	cmpb	$0, 1(%rdx,%r8)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 1(%rax,%r8)
	cmpb	$0, 2(%rsi,%r8)
	setne	%dil
	cmpb	$0, 2(%rdx,%r8)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 2(%rax,%r8)
	cmpb	$0, 3(%rsi,%r8)
	setne	%dil
	cmpb	$0, 3(%rdx,%r8)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 3(%rax,%r8)
	addq	$4, %r8
	cmpq	%r8, %rbx
	jne	.LBB0_60
	jmp	.LBB0_61
.LBB0_10:
	xorl	%r15d, %r15d
	movq	104(%rsp), %rdi
	jmp	.LBB0_71
.LBB0_11:
	cmpq	$1, %r15
	jbe	.LBB0_26
	cmpq	$8, %rbx
	jae	.LBB0_35
	xorl	%edi, %edi
.LBB0_14:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB0_17
	movq	%rdi, %r8
	.p2align	4
.LBB0_16:
	cmpb	$0, (%rsi)
	setne	%r10b
	cmpb	$0, (%rdx,%r8)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB0_16
.LBB0_17:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB0_61
	.p2align	4
.LBB0_18:
	cmpb	$0, (%rsi)
	setne	%dil
	cmpb	$0, (%rdx,%r8)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, (%rax,%r8)
	cmpb	$0, (%rsi)
	setne	%dil
	cmpb	$0, 1(%rdx,%r8)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 1(%rax,%r8)
	cmpb	$0, (%rsi)
	setne	%dil
	cmpb	$0, 2(%rdx,%r8)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 2(%rax,%r8)
	cmpb	$0, (%rsi)
	setne	%dil
	cmpb	$0, 3(%rdx,%r8)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 3(%rax,%r8)
	addq	$4, %r8
	cmpq	%r8, %rbx
	jne	.LBB0_18
	jmp	.LBB0_61
.LBB0_19:
	cmpq	$8, %rbx
	jae	.LBB0_39
	xorl	%edi, %edi
.LBB0_21:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB0_24
	movq	%rdi, %r8
	.p2align	4
.LBB0_23:
	cmpb	$0, (%rsi,%r8)
	setne	%r10b
	cmpb	$0, (%rdx)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB0_23
.LBB0_24:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB0_61
	.p2align	4
.LBB0_25:
	cmpb	$0, (%rsi,%r8)
	setne	%dil
	cmpb	$0, (%rdx)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, (%rax,%r8)
	cmpb	$0, 1(%rsi,%r8)
	setne	%dil
	cmpb	$0, (%rdx)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 1(%rax,%r8)
	cmpb	$0, 2(%rsi,%r8)
	setne	%dil
	cmpb	$0, (%rdx)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 2(%rax,%r8)
	cmpb	$0, 3(%rsi,%r8)
	setne	%dil
	cmpb	$0, (%rdx)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 3(%rax,%r8)
	addq	$4, %r8
	cmpq	%r8, %rbx
	jne	.LBB0_25
	jmp	.LBB0_61
.LBB0_26:
	cmpq	$8, %rbx
	jae	.LBB0_43
	xorl	%edi, %edi
.LBB0_28:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB0_31
	movq	%rdi, %r8
	.p2align	4
.LBB0_30:
	cmpb	$0, (%rsi)
	setne	%r10b
	cmpb	$0, (%rdx)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB0_30
.LBB0_31:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB0_61
	.p2align	4
.LBB0_32:
	cmpb	$0, (%rsi)
	setne	%dil
	cmpb	$0, (%rdx)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, (%rax,%r8)
	cmpb	$0, (%rsi)
	setne	%dil
	cmpb	$0, (%rdx)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 1(%rax,%r8)
	cmpb	$0, (%rsi)
	setne	%dil
	cmpb	$0, (%rdx)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 2(%rax,%r8)
	cmpb	$0, (%rsi)
	setne	%dil
	cmpb	$0, (%rdx)
	setne	%r9b
	xorb	%dil, %r9b
	movb	%r9b, 3(%rax,%r8)
	addq	$4, %r8
	cmpq	%r8, %rbx
	jne	.LBB0_32
.LBB0_61:
	movl	%ebx, %edx
	andl	$7, %edx
	cmpq	$8, %rbx
	jb	.LBB0_75
	leaq	-8(%rbx), %rdi
	shrq	$3, %rdi
	je	.LBB0_74
	incq	%rdi
	movq	%rdi, %r8
	andq	$-2, %r8
	negq	%r8
	xorl	%r15d, %r15d
	movq	%rax, %rsi
	.p2align	4
.LBB0_64:
	cmpb	$1, (%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 1(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 2(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 3(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 4(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 5(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 6(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 7(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 8(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 9(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 10(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 11(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 12(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 13(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 14(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 15(%rsi)
	sbbq	$-1, %r15
	addq	$16, %rsi
	addq	$2, %r8
	jne	.LBB0_64
	testb	$1, %dil
	je	.LBB0_67
.LBB0_66:
	cmpb	$1, (%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 1(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 2(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 3(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 4(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 5(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 6(%rsi)
	sbbq	$-1, %r15
	cmpb	$1, 7(%rsi)
	sbbq	$-1, %r15
.LBB0_67:
	testq	%rdx, %rdx
	je	.LBB0_73
	andq	%rcx, %rbx
	addq	%rbx, %rax
.LBB0_69:
	movq	104(%rsp), %rdi
	xorl	%ecx, %ecx
.LBB0_70:
	cmpb	$1, (%rax,%rcx)
	sbbq	$-1, %r15
	incq	%rcx
	cmpq	%rcx, %rdx
	jne	.LBB0_70
.LBB0_71:
	movabsq	$NRT_decref, %rbx
	vzeroupper
	callq	*%rbx
	movq	%r12, %rdi
	callq	*%rbx
	movq	%r13, %rdi
	callq	*%rbx
	movq	16(%rsp), %rax
	movq	%r15, (%rax)
.LBB0_72:
	movl	%r14d, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_35:
	.cfi_def_cfa_offset 80
	leaq	(%rax,%rbx), %rdi
	leaq	1(%rsi), %r8
	leaq	(%rdx,%rbx), %r9
	cmpq	%r8, %rax
	setb	%r10b
	cmpq	%rdi, %rsi
	setb	%r11b
	cmpq	%r9, %rax
	setb	%r8b
	cmpq	%rdi, %rdx
	setb	%r9b
	xorl	%edi, %edi
	testb	%r11b, %r10b
	jne	.LBB0_14
	andb	%r9b, %r8b
	jne	.LBB0_14
	cmpq	$128, %rbx
	jae	.LBB0_76
	xorl	%edi, %edi
	jmp	.LBB0_80
.LBB0_39:
	leaq	(%rax,%rbx), %rdi
	leaq	(%rsi,%rbx), %r8
	leaq	1(%rdx), %r9
	cmpq	%r8, %rax
	setb	%r10b
	cmpq	%rdi, %rsi
	setb	%r11b
	cmpq	%r9, %rax
	setb	%r8b
	cmpq	%rdi, %rdx
	setb	%r9b
	xorl	%edi, %edi
	testb	%r11b, %r10b
	jne	.LBB0_21
	andb	%r9b, %r8b
	jne	.LBB0_21
	cmpq	$128, %rbx
	jae	.LBB0_83
	xorl	%edi, %edi
	jmp	.LBB0_87
.LBB0_43:
	leaq	(%rax,%rbx), %rdi
	leaq	1(%rsi), %r8
	leaq	1(%rdx), %r9
	cmpq	%r8, %rax
	setb	%r10b
	cmpq	%rdi, %rsi
	setb	%r11b
	cmpq	%r9, %rax
	setb	%r8b
	cmpq	%rdi, %rdx
	setb	%r9b
	xorl	%edi, %edi
	testb	%r11b, %r10b
	jne	.LBB0_28
	andb	%r9b, %r8b
	jne	.LBB0_28
	cmpq	$128, %rbx
	jae	.LBB0_90
	xorl	%edi, %edi
	jmp	.LBB0_94
.LBB0_73:
	movq	104(%rsp), %rdi
	jmp	.LBB0_71
.LBB0_74:
	xorl	%r15d, %r15d
	movq	%rax, %rsi
	jmp	.LBB0_66
.LBB0_75:
	xorl	%r15d, %r15d
	jmp	.LBB0_69
.LBB0_47:
	cmpq	$128, %rbx
	jae	.LBB0_49
	xorl	%edi, %edi
	jmp	.LBB0_53
.LBB0_49:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	xorl	%r8d, %r8d
	vpxor	%xmm0, %xmm0, %xmm0
	movabsq	$.LCPI0_1, %r9
	vmovdqa	(%r9), %ymm1
	.p2align	4
.LBB0_50:
	vpcmpeqb	(%rsi,%r8), %ymm0, %ymm2
	vpcmpeqb	32(%rsi,%r8), %ymm0, %ymm3
	vpcmpeqb	64(%rsi,%r8), %ymm0, %ymm4
	vpcmpeqb	96(%rsi,%r8), %ymm0, %ymm5
	vpcmpeqb	(%rdx,%r8), %ymm0, %ymm6
	vpxor	%ymm2, %ymm6, %ymm2
	vpcmpeqb	32(%rdx,%r8), %ymm0, %ymm6
	vpxor	%ymm3, %ymm6, %ymm3
	vpcmpeqb	64(%rdx,%r8), %ymm0, %ymm6
	vpxor	%ymm4, %ymm6, %ymm4
	vpcmpeqb	96(%rdx,%r8), %ymm0, %ymm6
	vpxor	%ymm5, %ymm6, %ymm5
	vpand	%ymm1, %ymm2, %ymm2
	vpand	%ymm1, %ymm3, %ymm3
	vpand	%ymm1, %ymm4, %ymm4
	vpand	%ymm1, %ymm5, %ymm5
	vmovdqu	%ymm2, (%rax,%r8)
	vmovdqu	%ymm3, 32(%rax,%r8)
	vmovdqu	%ymm4, 64(%rax,%r8)
	vmovdqu	%ymm5, 96(%rax,%r8)
	subq	$-128, %r8
	cmpq	%r8, %rdi
	jne	.LBB0_50
	cmpq	%rdi, %rbx
	je	.LBB0_61
	testb	$120, %bl
	je	.LBB0_56
.LBB0_53:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	vpxor	%xmm0, %xmm0, %xmm0
	movabsq	$.LCPI0_2, %r9
	vmovdqa	(%r9), %xmm1
	.p2align	4
.LBB0_54:
	vmovq	(%rsi,%r8), %xmm2
	vpcmpeqb	%xmm0, %xmm2, %xmm2
	vmovq	(%rdx,%r8), %xmm3
	vpcmpeqb	%xmm0, %xmm3, %xmm3
	vpxor	%xmm2, %xmm3, %xmm2
	vpmovzxbw	%xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm2
	vpackuswb	%xmm2, %xmm2, %xmm2
	vmovq	%xmm2, (%rax,%r8)
	addq	$8, %r8
	cmpq	%r8, %rdi
	jne	.LBB0_54
	cmpq	%rdi, %rbx
	je	.LBB0_61
	jmp	.LBB0_56
.LBB0_76:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	cmpb	$0, (%rsi)
	setne	%r8b
	vmovd	%r8d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	xorl	%r8d, %r8d
	vpxor	%xmm1, %xmm1, %xmm1
	movabsq	$.LCPI0_1, %r9
	vmovdqa	(%r9), %ymm2
	.p2align	4
.LBB0_77:
	vpcmpeqb	(%rdx,%r8), %ymm1, %ymm3
	vpxor	%ymm0, %ymm3, %ymm3
	vpcmpeqb	32(%rdx,%r8), %ymm1, %ymm4
	vpxor	%ymm0, %ymm4, %ymm4
	vpcmpeqb	64(%rdx,%r8), %ymm1, %ymm5
	vpxor	%ymm0, %ymm5, %ymm5
	vpcmpeqb	96(%rdx,%r8), %ymm1, %ymm6
	vpxor	%ymm0, %ymm6, %ymm6
	vpandn	%ymm2, %ymm3, %ymm3
	vpandn	%ymm2, %ymm4, %ymm4
	vpandn	%ymm2, %ymm5, %ymm5
	vpandn	%ymm2, %ymm6, %ymm6
	vmovdqu	%ymm3, (%rax,%r8)
	vmovdqu	%ymm4, 32(%rax,%r8)
	vmovdqu	%ymm5, 64(%rax,%r8)
	vmovdqu	%ymm6, 96(%rax,%r8)
	subq	$-128, %r8
	cmpq	%r8, %rdi
	jne	.LBB0_77
	cmpq	%rdi, %rbx
	je	.LBB0_61
	testb	$120, %bl
	je	.LBB0_14
.LBB0_80:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	cmpb	$0, (%rsi)
	setne	%r9b
	vmovd	%r9d, %xmm0
	vpbroadcastb	%xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	movabsq	$.LCPI0_2, %r9
	vmovdqa	(%r9), %xmm3
	.p2align	4
.LBB0_81:
	vmovq	(%rdx,%r8), %xmm4
	vpcmpeqb	%xmm1, %xmm4, %xmm4
	vpxor	%xmm2, %xmm4, %xmm4
	vpmovzxbw	%xmm4, %xmm4
	vpxor	%xmm4, %xmm0, %xmm4
	vpand	%xmm3, %xmm4, %xmm4
	vpackuswb	%xmm4, %xmm4, %xmm4
	vmovq	%xmm4, (%rax,%r8)
	addq	$8, %r8
	cmpq	%r8, %rdi
	jne	.LBB0_81
	cmpq	%rdi, %rbx
	jne	.LBB0_14
	jmp	.LBB0_61
.LBB0_83:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	cmpb	$0, (%rdx)
	setne	%r8b
	vmovd	%r8d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	xorl	%r8d, %r8d
	vpxor	%xmm1, %xmm1, %xmm1
	movabsq	$.LCPI0_1, %r9
	vmovdqa	(%r9), %ymm2
	.p2align	4
.LBB0_84:
	vpcmpeqb	(%rsi,%r8), %ymm1, %ymm3
	vpxor	%ymm0, %ymm3, %ymm3
	vpcmpeqb	32(%rsi,%r8), %ymm1, %ymm4
	vpxor	%ymm0, %ymm4, %ymm4
	vpcmpeqb	64(%rsi,%r8), %ymm1, %ymm5
	vpxor	%ymm0, %ymm5, %ymm5
	vpcmpeqb	96(%rsi,%r8), %ymm1, %ymm6
	vpxor	%ymm0, %ymm6, %ymm6
	vpandn	%ymm2, %ymm3, %ymm3
	vpandn	%ymm2, %ymm4, %ymm4
	vpandn	%ymm2, %ymm5, %ymm5
	vpandn	%ymm2, %ymm6, %ymm6
	vmovdqu	%ymm3, (%rax,%r8)
	vmovdqu	%ymm4, 32(%rax,%r8)
	vmovdqu	%ymm5, 64(%rax,%r8)
	vmovdqu	%ymm6, 96(%rax,%r8)
	subq	$-128, %r8
	cmpq	%r8, %rdi
	jne	.LBB0_84
	cmpq	%rdi, %rbx
	je	.LBB0_61
	testb	$120, %bl
	je	.LBB0_21
.LBB0_87:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	cmpb	$0, (%rdx)
	setne	%r9b
	vmovd	%r9d, %xmm0
	vpbroadcastb	%xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	movabsq	$.LCPI0_2, %r9
	vmovdqa	(%r9), %xmm3
	.p2align	4
.LBB0_88:
	vmovq	(%rsi,%r8), %xmm4
	vpcmpeqb	%xmm1, %xmm4, %xmm4
	vpxor	%xmm2, %xmm4, %xmm4
	vpmovzxbw	%xmm4, %xmm4
	vpxor	%xmm0, %xmm4, %xmm4
	vpand	%xmm3, %xmm4, %xmm4
	vpackuswb	%xmm4, %xmm4, %xmm4
	vmovq	%xmm4, (%rax,%r8)
	addq	$8, %r8
	cmpq	%r8, %rdi
	jne	.LBB0_88
	cmpq	%rdi, %rbx
	jne	.LBB0_21
	jmp	.LBB0_61
.LBB0_90:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	cmpb	$0, (%rsi)
	setne	%r8b
	cmpb	$0, (%rdx)
	setne	%r9b
	xorb	%r8b, %r9b
	vmovd	%r9d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	xorl	%r8d, %r8d
	.p2align	4
.LBB0_91:
	vmovdqu	%ymm0, (%rax,%r8)
	vmovdqu	%ymm0, 32(%rax,%r8)
	vmovdqu	%ymm0, 64(%rax,%r8)
	vmovdqu	%ymm0, 96(%rax,%r8)
	subq	$-128, %r8
	cmpq	%r8, %rdi
	jne	.LBB0_91
	cmpq	%rdi, %rbx
	je	.LBB0_61
	testb	$120, %bl
	je	.LBB0_28
.LBB0_94:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	cmpb	$0, (%rsi)
	setne	%r9b
	cmpb	$0, (%rdx)
	setne	%r10b
	xorb	%r9b, %r10b
	vmovd	%r10d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	movabsq	$.LCPI0_0, %r9
	vpand	(%r9), %ymm0, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpackuswb	%xmm1, %xmm0, %xmm0
	.p2align	4
.LBB0_95:
	vmovq	%xmm0, (%rax,%r8)
	addq	$8, %r8
	cmpq	%r8, %rdi
	jne	.LBB0_95
	cmpq	%rdi, %rbx
	jne	.LBB0_28
	jmp	.LBB0_61
.LBB0_97:
	movabsq	$.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209, %rax
	jmp	.LBB0_3
.Lfunc_end0:
	.size	_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, .Lfunc_end0-_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE
	.cfi_endproc

	.globl	_ZN7cpython15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN7cpython15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE,@function
_ZN7cpython15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rdi
	movabsq	$.const._mask_delta_score, %rsi
	movabsq	$PyArg_UnpackTuple, %r10
	leaq	104(%rsp), %r8
	leaq	96(%rsp), %r9
	movl	$2, %edx
	movl	$2, %ecx
	xorl	%eax, %eax
	callq	*%r10
	movq	$0, 80(%rsp)
	testl	%eax, %eax
	je	.LBB1_1
	movabsq	$_ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, %rax
	cmpq	$0, (%rax)
	je	.LBB1_4
	movq	104(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 112(%rsp)
	vmovups	%ymm0, 136(%rsp)
	movabsq	$NRT_adapt_ndarray_from_python, %r12
	leaq	112(%rsp), %rsi
	vzeroupper
	callq	*%r12
	testl	%eax, %eax
	jne	.LBB1_8
	cmpq	$1, 136(%rsp)
	jne	.LBB1_8
	movq	112(%rsp), %r14
	movq	144(%rsp), %rbx
	movq	152(%rsp), %r15
	movq	96(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 176(%rsp)
	vmovups	%ymm0, 200(%rsp)
	leaq	176(%rsp), %rsi
	vzeroupper
	callq	*%r12
	testl	%eax, %eax
	jne	.LBB1_11
	cmpq	$1, 200(%rsp)
	jne	.LBB1_11
	movq	176(%rsp), %r12
	vmovaps	208(%rsp), %xmm0
	movq	$0, 88(%rsp)
	vmovups	%xmm0, 56(%rsp)
	movq	%r12, 24(%rsp)
	movq	%r15, 8(%rsp)
	movq	%rbx, (%rsp)
	movabsq	$_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, %rax
	leaq	88(%rsp), %rdi
	leaq	80(%rsp), %rsi
	movq	%r14, %rdx
	callq	*%rax
	movl	%eax, %ebp
	movq	80(%rsp), %rbx
	movq	88(%rsp), %r15
	movabsq	$NRT_decref, %r13
	movq	%r14, %rdi
	callq	*%r13
	movq	%r12, %rdi
	callq	*%r13
	testl	%ebp, %ebp
	jne	.LBB1_14
	movabsq	$PyLong_FromLongLong, %rax
	movq	%r15, %rdi
	callq	*%rax
.LBB1_2:
	addq	$232, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB1_14:
	.cfi_def_cfa_offset 288
	movabsq	$PyErr_Clear, %rax
	callq	*%rax
	movl	8(%rbx), %esi
	movq	(%rbx), %rdi
	cmpl	$0, 32(%rbx)
	jle	.LBB1_17
	movslq	%esi, %rsi
	movabsq	$PyBytes_FromStringAndSize, %rax
	callq	*%rax
	movq	%rax, %r14
	movq	16(%rbx), %rdi
	callq	*24(%rbx)
	testq	%rax, %rax
	je	.LBB1_16
	movabsq	$numba_runtime_build_excinfo_struct, %rcx
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	*%rcx
	movq	%rax, %r14
	movabsq	$NRT_Free, %rax
	movq	%rbx, %rdi
	callq	*%rax
	jmp	.LBB1_18
.LBB1_4:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.missing Environment: _ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE", %rsi
	jmp	.LBB1_5
.LBB1_8:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
.LBB1_5:
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	jmp	.LBB1_1
.LBB1_11:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	movabsq	$NRT_decref, %rax
	jmp	.LBB1_20
.LBB1_17:
	movq	16(%rbx), %rdx
	movabsq	$numba_unpickle, %rax
	callq	*%rax
	movq	%rax, %r14
.LBB1_18:
	testq	%r14, %r14
	je	.LBB1_1
	movabsq	$numba_do_raise, %rax
.LBB1_20:
	movq	%r14, %rdi
	callq	*%rax
.LBB1_1:
	xorl	%eax, %eax
	jmp	.LBB1_2
.LBB1_16:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.Error creating Python tuple from runtime exception arguments", %rsi
	jmp	.LBB1_5
.Lfunc_end1:
	.size	_ZN7cpython15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, .Lfunc_end1-_ZN7cpython15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE
	.cfi_endproc

	.globl	cfunc._ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE
	.p2align	4
	.type	cfunc._ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE,@function
cfunc._ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$112, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rdx
	movq	152(%rsp), %rax
	vmovups	184(%rsp), %xmm0
	movq	$0, 104(%rsp)
	movq	$0, 96(%rsp)
	vmovups	%xmm0, 56(%rsp)
	movq	%rax, 24(%rsp)
	movq	%r9, 8(%rsp)
	movq	%r8, (%rsp)
	movabsq	$_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, %rax
	leaq	104(%rsp), %rdi
	leaq	96(%rsp), %rsi
	callq	*%rax
	movl	%eax, %ecx
	movq	96(%rsp), %rbx
	movq	104(%rsp), %rax
	movl	$0, 92(%rsp)
	testl	%ecx, %ecx
	jne	.LBB2_1
.LBB2_7:
	addq	$112, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB2_1:
	.cfi_def_cfa_offset 144
	movq	%rax, %r15
	movabsq	$numba_gil_ensure, %rax
	leaq	92(%rsp), %rdi
	callq	*%rax
	movabsq	$PyErr_Clear, %rax
	callq	*%rax
	movl	8(%rbx), %esi
	movq	(%rbx), %rdi
	cmpl	$0, 32(%rbx)
	jle	.LBB2_4
	movslq	%esi, %rsi
	movabsq	$PyBytes_FromStringAndSize, %rax
	callq	*%rax
	movq	%rax, %r14
	movq	16(%rbx), %rdi
	callq	*24(%rbx)
	testq	%rax, %rax
	je	.LBB2_3
	movabsq	$numba_runtime_build_excinfo_struct, %rcx
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	*%rcx
	movq	%rax, %r14
	movabsq	$NRT_Free, %rax
	movq	%rbx, %rdi
	callq	*%rax
	jmp	.LBB2_5
.LBB2_4:
	movq	16(%rbx), %rdx
	movabsq	$numba_unpickle, %rax
	callq	*%rax
	movq	%rax, %r14
.LBB2_5:
	testq	%r14, %r14
	je	.LBB2_6
	movabsq	$numba_do_raise, %rax
	movq	%r14, %rdi
	callq	*%rax
.LBB2_6:
	movabsq	$".const.<numba.core.cpu.CPUContext>", %rdi
	movabsq	$PyUnicode_FromString, %rax
	callq	*%rax
	movq	%rax, %rbx
	movabsq	$PyErr_WriteUnraisable, %rax
	movq	%rbx, %rdi
	callq	*%rax
	movabsq	$Py_DecRef, %rax
	movq	%rbx, %rdi
	callq	*%rax
	movabsq	$numba_gil_release, %rax
	leaq	92(%rsp), %rdi
	callq	*%rax
	movq	%r15, %rax
	jmp	.LBB2_7
.LBB2_3:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.Error creating Python tuple from runtime exception arguments.1", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	xorl	%eax, %eax
	jmp	.LBB2_7
.Lfunc_end2:
	.size	cfunc._ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, .Lfunc_end2-cfunc._ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE
	.cfi_endproc

	.weak	NRT_incref
	.p2align	4
	.type	NRT_incref,@function
NRT_incref:
	endbr64
	testq	%rdi, %rdi
	je	.LBB3_2
	lock		incq	(%rdi)
.LBB3_2:
	retq
.Lfunc_end3:
	.size	NRT_incref, .Lfunc_end3-NRT_incref

	.weak	NRT_decref
	.p2align	4
	.type	NRT_decref,@function
NRT_decref:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.LBB4_2
	#MEMBARRIER
	lock		decq	(%rdi)
	je	.LBB4_3
.LBB4_2:
	retq
.LBB4_3:
	#MEMBARRIER
	movabsq	$NRT_MemInfo_call_dtor, %rax
	jmpq	*%rax
.Lfunc_end4:
	.size	NRT_decref, .Lfunc_end4-NRT_decref
	.cfi_endproc

	.type	.const.pickledata.c609a61042a044ba6291d5da2e507179b42ccfbc,@object
	.section	.lrodata,"al",@progbits
	.p2align	4, 0x0
.const.pickledata.c609a61042a044ba6291d5da2e507179b42ccfbc:
	.ascii	"\200\004\225\252\000\000\000\000\000\000\000\214\bbuiltins\224\214\nValueError\224\223\224\214\207unable to broadcast argument 1 to output array\nFile \"/tmp/shap-bench-venv/lib/python3.12/site-packages/numba/np/npyimpl.py\", line 373, \224\205\224N\207\224."
	.size	.const.pickledata.c609a61042a044ba6291d5da2e507179b42ccfbc, 181

	.type	.const.pickledata.c609a61042a044ba6291d5da2e507179b42ccfbc.sha1,@object
	.p2align	4, 0x0
.const.pickledata.c609a61042a044ba6291d5da2e507179b42ccfbc.sha1:
	.ascii	"\306\t\246\020B\240D\272b\221\325\332.Pqy\264,\317\274"
	.size	.const.pickledata.c609a61042a044ba6291d5da2e507179b42ccfbc.sha1, 20

	.type	.const.picklebuf.c609a61042a044ba6291d5da2e507179b42ccfbc,@object
	.p2align	4, 0x0
.const.picklebuf.c609a61042a044ba6291d5da2e507179b42ccfbc:
	.quad	.const.pickledata.c609a61042a044ba6291d5da2e507179b42ccfbc
	.long	181
	.zero	4
	.quad	.const.pickledata.c609a61042a044ba6291d5da2e507179b42ccfbc.sha1
	.quad	0
	.long	0
	.zero	4
	.size	.const.picklebuf.c609a61042a044ba6291d5da2e507179b42ccfbc, 40

	.type	.const._mask_delta_score,@object
	.p2align	4, 0x0
.const._mask_delta_score:
	.asciz	"_mask_delta_score"
	.size	.const._mask_delta_score, 18

	.type	_ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE,@object
	.comm	_ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE":
	.asciz	"missing Environment: _ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE"
	.size	".const.missing Environment: _ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE", 179

	.type	".const.can't unbox array from PyObject into native value.  The object maybe of a different type",@object
	.p2align	4, 0x0
".const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"
	.size	".const.can't unbox array from PyObject into native value.  The object maybe of a different type", 89

	.type	".const.Error creating Python tuple from runtime exception arguments",@object
	.p2align	4, 0x0
".const.Error creating Python tuple from runtime exception arguments":
	.asciz	"Error creating Python tuple from runtime exception arguments"
	.size	".const.Error creating Python tuple from runtime exception arguments", 61

	.type	".const.Error creating Python tuple from runtime exception arguments.1",@object
	.p2align	4, 0x0
".const.Error creating Python tuple from runtime exception arguments.1":
	.asciz	"Error creating Python tuple from runtime exception arguments"
	.size	".const.Error creating Python tuple from runtime exception arguments.1", 61

	.type	".const.<numba.core.cpu.CPUContext>",@object
	.p2align	4, 0x0
".const.<numba.core.cpu.CPUContext>":
	.asciz	"<numba.core.cpu.CPUContext>"
	.size	".const.<numba.core.cpu.CPUContext>", 28

	.type	_ZN08NumbaEnv13_3cdynamic_3e33__numba_array_expr_0x765373d236e0B3v11B72c8tJTIeFIjxB2IKSgI4CrvQCk0Z4yRYcWsBAQ4s_2fqEpEUkESQI1_2bmEQRxHRNAA_3d_3dEbb,@object
	.comm	_ZN08NumbaEnv13_3cdynamic_3e33__numba_array_expr_0x765373d236e0B3v11B72c8tJTIeFIjxB2IKSgI4CrvQCk0Z4yRYcWsBAQ4s_2fqEpEUkESQI1_2bmEQRxHRNAA_3d_3dEbb,8,8
	.type	_ZN08NumbaEnv5numba2np7npyimpl15_broadcast_ontoB3v12B42c8tJTC_2fWQA93W1AaAIYBPIqRBFCjDSZRVAJmaQIAEx8int64_2ax8int64_2a,@object
	.comm	_ZN08NumbaEnv5numba2np7npyimpl15_broadcast_ontoB3v12B42c8tJTC_2fWQA93W1AaAIYBPIqRBFCjDSZRVAJmaQIAEx8int64_2ax8int64_2a,8,8
	.type	_ZN08NumbaEnv5numba2np8arrayobj15_call_allocatorB2v6B42c8tJTC_2fWQA93W1AaAIYBPIqRBFCjDSZRVAJmaQIAEN29typeref_5b_3cclass_20_27numba4core5types8npytypes14Array_27_3e_5dExj,@object
	.comm	_ZN08NumbaEnv5numba2np8arrayobj15_call_allocatorB2v6B42c8tJTC_2fWQA93W1AaAIYBPIqRBFCjDSZRVAJmaQIAEN29typeref_5b_3cclass_20_27numba4core5types8npytypes14Array_27_3e_5dExj,8,8
	.type	_ZN08NumbaEnv5numba2np8arrayobj18_ol_array_allocate12_3clocals_3e4implB2v7B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEN29typeref_5b_3cclass_20_27numba4core5types8npytypes14Array_27_3e_5dExj,@object
	.comm	_ZN08NumbaEnv5numba2np8arrayobj18_ol_array_allocate12_3clocals_3e4implB2v7B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEN29typeref_5b_3cclass_20_27numba4core5types8npytypes14Array_27_3e_5dExj,8,8
	.type	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209,@object
	.p2align	4, 0x0
.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209:
	.ascii	"\200\004\225K\000\000\000\000\000\000\000\214\bbuiltins\224\214\013MemoryError\224\223\224\214'Allocation failed (probably too large).\224\205\224N\207\224."
	.size	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209, 86

	.type	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.sha1,@object
	.p2align	4, 0x0
.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.sha1:
	.ascii	"\272(\235\201\360\\p \363G|\025sH\004\337e\253\342\t"
	.size	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.sha1, 20

	.type	.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209,@object
	.p2align	4, 0x0
.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209:
	.quad	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209
	.long	86
	.zero	4
	.quad	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.sha1
	.quad	0
	.long	0
	.zero	4
	.size	.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209, 40

	.type	_ZN08NumbaEnv5numba2np9arraymath9array_sum12_3clocals_3e14array_sum_implB3v13B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dE5ArrayIbLi1E1C7mutable7alignedE27omitted_28default_3dNone_2927omitted_28default_3dNone_29,@object
	.comm	_ZN08NumbaEnv5numba2np9arraymath9array_sum12_3clocals_3e14array_sum_implB3v13B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dE5ArrayIbLi1E1C7mutable7alignedE27omitted_28default_3dNone_2927omitted_28default_3dNone_29,8,8
	.section	".note.GNU-stack","",@progbits
