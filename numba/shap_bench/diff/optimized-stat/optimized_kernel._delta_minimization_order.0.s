	.file	"<string>"
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI0_0:
	.quad	0
	.quad	1
	.quad	2
	.quad	3
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI0_1:
	.quad	4
.LCPI0_2:
	.quad	8
.LCPI0_3:
	.quad	12
.LCPI0_4:
	.quad	16
.LCPI0_5:
	.quad	1
	.section	.ltext,"axl",@progbits
	.globl	_ZN16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29
	.p2align	4
	.type	_ZN16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29,@function
_ZN16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29:
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r15
	movq	%rsi, %rbx
	movq	%rdi, %r13
	movabsq	$NRT_incref, %rax
	movq	%rdx, %rdi
	callq	*%rax
	vcvtsi2sdq	184(%rsp), %xmm15, %xmm0
	vcvttsd2si	%xmm0, %r14
	movabsq	$1152921504606846975, %rax
	cmpq	%rax, %r14
	jg	.LBB0_1
	movq	%r14, %rax
	sarq	$63, %rax
	andnq	%r14, %rax, %r12
	leaq	(,%r12,8), %rdi
	movabsq	$NRT_MemInfo_alloc_aligned, %rax
	movl	$32, %esi
	callq	*%rax
	testq	%rax, %rax
	je	.LBB0_4
	movq	%rbx, 56(%rsp)
	movq	192(%rsp), %rbp
	movabsq	$9223372036854775792, %rbx
	movq	%rax, 16(%rsp)
	movq	24(%rax), %rdi
	testq	%r14, %r14
	movq	%rdi, 8(%rsp)
	jle	.LBB0_18
	cmpq	$3, %r14
	ja	.LBB0_9
	xorl	%eax, %eax
	movq	8(%rsp), %rdi
	jmp	.LBB0_8
.LBB0_9:
	movabsq	$.LCPI0_0, %rcx
	movabsq	$.LCPI0_1, %rdx
	cmpq	$16, %r14
	jae	.LBB0_11
	xorl	%eax, %eax
	movq	8(%rsp), %rdi
	jmp	.LBB0_15
.LBB0_11:
	movq	%r14, %rax
	andq	%rbx, %rax
	vmovdqa	(%rcx), %ymm0
	xorl	%esi, %esi
	vpbroadcastq	(%rdx), %ymm1
	movabsq	$.LCPI0_2, %rdi
	vpbroadcastq	(%rdi), %ymm2
	movabsq	$.LCPI0_3, %rdi
	vpbroadcastq	(%rdi), %ymm3
	movabsq	$.LCPI0_4, %rdi
	vpbroadcastq	(%rdi), %ymm4
	movq	8(%rsp), %rdi
	.p2align	4
.LBB0_12:
	vpaddq	%ymm1, %ymm0, %ymm5
	vpaddq	%ymm2, %ymm0, %ymm6
	vmovdqu	%ymm0, (%rdi,%rsi,8)
	vmovdqu	%ymm5, 32(%rdi,%rsi,8)
	vmovdqu	%ymm6, 64(%rdi,%rsi,8)
	vpaddq	%ymm3, %ymm0, %ymm5
	vmovdqu	%ymm5, 96(%rdi,%rsi,8)
	addq	$16, %rsi
	vpaddq	%ymm4, %ymm0, %ymm0
	cmpq	%rsi, %rax
	jne	.LBB0_12
	cmpq	%r14, %rax
	je	.LBB0_18
	testb	$12, %r14b
	je	.LBB0_8
.LBB0_15:
	movq	%rax, %rsi
	leaq	12(%rbx), %rax
	andq	%r14, %rax
	vmovq	%rsi, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpor	(%rcx), %ymm0, %ymm0
	vpbroadcastq	(%rdx), %ymm1
	.p2align	4
.LBB0_16:
	vmovdqu	%ymm0, (%rdi,%rsi,8)
	addq	$4, %rsi
	vpaddq	%ymm1, %ymm0, %ymm0
	cmpq	%rsi, %rax
	jne	.LBB0_16
	cmpq	%r14, %rax
	je	.LBB0_18
	.p2align	4
.LBB0_8:
	movq	%rax, (%rdi,%rax,8)
	incq	%rax
	cmpq	%rax, %r14
	jne	.LBB0_8
.LBB0_18:
	movq	%r13, 40(%rsp)
	movq	%r15, 48(%rsp)
	testq	%rbp, %rbp
	movq	%rdi, %r15
	jle	.LBB0_47
	movq	176(%rsp), %rax
	addq	$8, %rbx
	andq	%rbp, %rbx
	leaq	-2(%r12), %rcx
	addq	$4, %rax
	movq	%rax, 32(%rsp)
	movl	$2, %r13d
	vpxor	%xmm8, %xmm8, %xmm8
	vpcmpeqd	%xmm9, %xmm9, %xmm9
	movabsq	$.LCPI0_5, %rax
	vpbroadcastq	(%rax), %ymm7
	movq	%rcx, (%rsp)
	vmovdqu	%ymm7, 80(%rsp)
	jmp	.LBB0_20
	.p2align	4
.LBB0_32:
	incq	%r13
	decq	(%rsp)
	cmpq	$100, %r13
	je	.LBB0_33
.LBB0_20:
	leaq	-2(%r12), %rax
	cmpq	%rax, %r13
	jg	.LBB0_32
	movl	$1, %r14d
	movq	%r13, 24(%rsp)
	jmp	.LBB0_22
	.p2align	4
.LBB0_31:
	incq	%r14
	cmpq	(%rsp), %r14
	je	.LBB0_32
.LBB0_22:
	leaq	(%r14,%r13), %rax
	leaq	(%r15,%rax,8), %rcx
	movq	%rax, %rdx
	sarq	$63, %rdx
	andq	%r12, %rdx
	movq	(%rcx,%rdx,8), %rdi
	testq	%rax, %rax
	movq	%r12, %rax
	movl	$0, %r8d
	cmovgq	%r8, %rax
	movq	-8(%rcx,%rax,8), %rsi
	leaq	(%r15,%r14,8), %rax
	movq	%r14, %rcx
	sarq	$63, %rcx
	andq	%r12, %rcx
	movq	(%rax,%rcx,8), %rdx
	testq	%r14, %r14
	movq	%r12, %rcx
	cmovgq	%r8, %rcx
	movq	-8(%rax,%rcx,8), %rcx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	184(%rsp), %r8
	andq	%r8, %rax
	addq	%rcx, %rax
	imulq	%rbp, %rax
	movq	%rdx, %rcx
	sarq	$63, %rcx
	andq	%r8, %rcx
	addq	%rdx, %rcx
	imulq	%rbp, %rcx
	movq	%rsi, %rdx
	sarq	$63, %rdx
	andq	%r8, %rdx
	addq	%rsi, %rdx
	imulq	%rbp, %rdx
	movq	%rdi, %rsi
	sarq	$63, %rsi
	andq	%r8, %rsi
	addq	%rdi, %rsi
	imulq	%rbp, %rsi
	movl	$0, %edi
	movl	$0, %r8d
	cmpq	$8, %rbp
	jb	.LBB0_26
	movq	32(%rsp), %r10
	leaq	(%r10,%rsi), %rdi
	leaq	(%r10,%rdx), %r8
	leaq	(%r10,%rcx), %r9
	addq	%rax, %r10
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%r11d, %r11d
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4
.LBB0_24:
	vmovd	-4(%r10,%r11), %xmm2
	vmovd	(%r10,%r11), %xmm3
	vpcmpeqb	%xmm2, %xmm8, %xmm2
	vpxor	%xmm2, %xmm9, %xmm2
	vpmovsxbd	%xmm2, %xmm5
	vpcmpeqb	%xmm3, %xmm8, %xmm2
	vpxor	%xmm2, %xmm9, %xmm2
	vpmovsxbd	%xmm2, %xmm3
	vmovd	-4(%r9,%r11), %xmm2
	vpcmpeqb	%xmm2, %xmm8, %xmm2
	vpxor	%xmm2, %xmm9, %xmm2
	vpmovsxbd	%xmm2, %xmm2
	vmovd	-4(%r8,%r11), %xmm4
	vpcmpeqb	%xmm4, %xmm8, %xmm4
	vpxor	%xmm4, %xmm9, %xmm4
	vpmovsxbd	%xmm4, %xmm4
	vpxor	%xmm4, %xmm5, %xmm6
	vpmovsxdq	%xmm6, %ymm6
	vpaddq	%ymm6, %ymm1, %ymm1
	vmovd	(%r8,%r11), %xmm6
	vpcmpeqb	%xmm6, %xmm8, %xmm6
	vpxor	%xmm6, %xmm9, %xmm6
	vpmovsxbd	%xmm6, %xmm6
	vpxor	%xmm2, %xmm5, %xmm5
	vpmovzxdq	%xmm5, %ymm5
	vpand	%ymm7, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm1, %ymm1
	vpxor	%xmm6, %xmm3, %xmm5
	vpmovsxdq	%xmm5, %ymm5
	vpaddq	%ymm5, %ymm0, %ymm0
	vmovd	(%r9,%r11), %xmm5
	vpcmpeqb	%xmm5, %xmm8, %xmm5
	vpxor	%xmm5, %xmm9, %xmm5
	vpmovsxbd	%xmm5, %xmm5
	vpxor	%xmm5, %xmm3, %xmm3
	vpmovzxdq	%xmm3, %ymm3
	vpand	%ymm7, %ymm3, %ymm3
	vpaddq	%ymm3, %ymm0, %ymm0
	vmovd	-4(%rdi,%r11), %xmm3
	vpcmpeqb	%xmm3, %xmm8, %xmm3
	vpxor	%xmm3, %xmm9, %xmm3
	vpmovsxbd	%xmm3, %xmm3
	vpxor	%xmm3, %xmm4, %xmm4
	vpxor	%xmm3, %xmm2, %xmm2
	vmovd	(%rdi,%r11), %xmm3
	vpcmpeqb	%xmm3, %xmm8, %xmm3
	vpxor	%xmm3, %xmm9, %xmm3
	vpmovsxbd	%xmm3, %xmm3
	vpxor	%xmm3, %xmm6, %xmm6
	vpxor	%xmm3, %xmm5, %xmm3
	vpmovzxdq	%xmm4, %ymm4
	vpand	%ymm7, %ymm4, %ymm4
	vpmovsxdq	%xmm2, %ymm2
	vpaddq	%ymm4, %ymm2, %ymm2
	vpaddq	%ymm2, %ymm1, %ymm1
	vpmovzxdq	%xmm6, %ymm2
	vpand	%ymm7, %ymm2, %ymm2
	vpmovsxdq	%xmm3, %ymm3
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm2, %ymm0, %ymm0
	addq	$8, %r11
	cmpq	%r11, %rbx
	jne	.LBB0_24
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rdi
	movq	%rbx, %r8
	cmpq	%rbx, %rbp
	je	.LBB0_28
.LBB0_26:
	movq	176(%rsp), %r9
	addq	%r9, %rax
	addq	%r9, %rcx
	addq	%r9, %rdx
	addq	%r9, %rsi
	movq	%rdi, %r9
	.p2align	4
.LBB0_27:
	cmpb	$0, (%rax,%r8)
	setne	%r10b
	cmpb	$0, (%rcx,%r8)
	setne	%r11b
	cmpb	$0, (%rdx,%r8)
	setne	%r15b
	cmpb	$0, (%rsi,%r8)
	leaq	1(%r8), %r8
	setne	%r13b
	movl	%r10d, %edi
	xorb	%r11b, %dil
	movzbl	%dil, %edi
	addq	%r9, %rdi
	xorb	%r15b, %r10b
	xorb	%r13b, %r15b
	movzbl	%r15b, %r9d
	xorb	%r13b, %r11b
	movzbl	%r10b, %r10d
	subq	%r10, %rdi
	movzbl	%r11b, %r10d
	subq	%r10, %rdi
	addq	%r9, %rdi
	movq	%rdi, %r9
	cmpq	%r8, %rbp
	jne	.LBB0_27
.LBB0_28:
	testq	%rdi, %rdi
	movq	8(%rsp), %r15
	movq	24(%rsp), %r13
	jle	.LBB0_31
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$8, %r9d
	leaq	80(%rsp), %rdi
	leaq	72(%rsp), %rsi
	movq	24(%rsp), %rdx
	xorl	%ecx, %ecx
	movq	%r12, %r8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$8
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	movabsq	$_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	vzeroupper
	callq	*%rax
	vpcmpeqd	%xmm9, %xmm9, %xmm9
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	128(%rsp), %ymm7
	addq	$48, %rsp
	.cfi_adjust_cfa_offset -48
	testl	%eax, %eax
	je	.LBB0_31
	cmpl	$-2, %eax
	je	.LBB0_31
	jmp	.LBB0_48
.LBB0_33:
	movl	$2, %r13d
	vpxor	%xmm8, %xmm8, %xmm8
	vpcmpeqd	%xmm9, %xmm9, %xmm9
	leaq	-2(%r12), %rax
	movq	%rax, (%rsp)
	jmp	.LBB0_34
	.p2align	4
.LBB0_46:
	incq	%r13
	decq	(%rsp)
	cmpq	$100, %r13
	je	.LBB0_47
.LBB0_34:
	leaq	-2(%r12), %rax
	cmpq	%rax, %r13
	jg	.LBB0_46
	movl	$1, %r14d
	movq	%r13, 24(%rsp)
	jmp	.LBB0_36
	.p2align	4
.LBB0_45:
	incq	%r14
	cmpq	(%rsp), %r14
	je	.LBB0_46
.LBB0_36:
	leaq	(%r14,%r13), %rax
	leaq	(%r15,%rax,8), %rcx
	movq	%rax, %rdx
	sarq	$63, %rdx
	andq	%r12, %rdx
	movq	(%rcx,%rdx,8), %rdi
	testq	%rax, %rax
	movq	%r12, %rax
	movl	$0, %r8d
	cmovgq	%r8, %rax
	movq	-8(%rcx,%rax,8), %rsi
	leaq	(%r15,%r14,8), %rax
	movq	%r14, %rcx
	sarq	$63, %rcx
	andq	%r12, %rcx
	movq	(%rax,%rcx,8), %rdx
	testq	%r14, %r14
	movq	%r12, %rcx
	cmovgq	%r8, %rcx
	movq	-8(%rax,%rcx,8), %rcx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	184(%rsp), %r8
	andq	%r8, %rax
	addq	%rcx, %rax
	imulq	%rbp, %rax
	movq	%rdx, %rcx
	sarq	$63, %rcx
	andq	%r8, %rcx
	addq	%rdx, %rcx
	imulq	%rbp, %rcx
	movq	%rsi, %rdx
	sarq	$63, %rdx
	andq	%r8, %rdx
	addq	%rsi, %rdx
	imulq	%rbp, %rdx
	movq	%rdi, %rsi
	sarq	$63, %rsi
	andq	%r8, %rsi
	addq	%rdi, %rsi
	imulq	%rbp, %rsi
	movl	$0, %edi
	movl	$0, %r8d
	cmpq	$8, %rbp
	jb	.LBB0_40
	movq	32(%rsp), %r10
	leaq	(%r10,%rsi), %rdi
	leaq	(%r10,%rdx), %r8
	leaq	(%r10,%rcx), %r9
	addq	%rax, %r10
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%r11d, %r11d
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4
.LBB0_38:
	vmovd	-4(%r10,%r11), %xmm2
	vmovd	(%r10,%r11), %xmm3
	vpcmpeqb	%xmm2, %xmm8, %xmm2
	vpxor	%xmm2, %xmm9, %xmm2
	vpmovsxbd	%xmm2, %xmm5
	vpcmpeqb	%xmm3, %xmm8, %xmm2
	vpxor	%xmm2, %xmm9, %xmm2
	vpmovsxbd	%xmm2, %xmm3
	vmovd	-4(%r9,%r11), %xmm2
	vpcmpeqb	%xmm2, %xmm8, %xmm2
	vpxor	%xmm2, %xmm9, %xmm2
	vpmovsxbd	%xmm2, %xmm2
	vmovd	-4(%r8,%r11), %xmm4
	vpcmpeqb	%xmm4, %xmm8, %xmm4
	vpxor	%xmm4, %xmm9, %xmm4
	vpmovsxbd	%xmm4, %xmm4
	vpxor	%xmm4, %xmm5, %xmm6
	vpmovsxdq	%xmm6, %ymm6
	vpaddq	%ymm6, %ymm1, %ymm1
	vmovd	(%r8,%r11), %xmm6
	vpcmpeqb	%xmm6, %xmm8, %xmm6
	vpxor	%xmm6, %xmm9, %xmm6
	vpmovsxbd	%xmm6, %xmm6
	vpxor	%xmm2, %xmm5, %xmm5
	vpmovzxdq	%xmm5, %ymm5
	vpand	%ymm7, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm1, %ymm1
	vpxor	%xmm6, %xmm3, %xmm5
	vpmovsxdq	%xmm5, %ymm5
	vpaddq	%ymm5, %ymm0, %ymm0
	vmovd	(%r9,%r11), %xmm5
	vpcmpeqb	%xmm5, %xmm8, %xmm5
	vpxor	%xmm5, %xmm9, %xmm5
	vpmovsxbd	%xmm5, %xmm5
	vpxor	%xmm5, %xmm3, %xmm3
	vpmovzxdq	%xmm3, %ymm3
	vpand	%ymm7, %ymm3, %ymm3
	vpaddq	%ymm3, %ymm0, %ymm0
	vmovd	-4(%rdi,%r11), %xmm3
	vpcmpeqb	%xmm3, %xmm8, %xmm3
	vpxor	%xmm3, %xmm9, %xmm3
	vpmovsxbd	%xmm3, %xmm3
	vpxor	%xmm3, %xmm4, %xmm4
	vpxor	%xmm3, %xmm2, %xmm2
	vmovd	(%rdi,%r11), %xmm3
	vpcmpeqb	%xmm3, %xmm8, %xmm3
	vpxor	%xmm3, %xmm9, %xmm3
	vpmovsxbd	%xmm3, %xmm3
	vpxor	%xmm3, %xmm6, %xmm6
	vpxor	%xmm3, %xmm5, %xmm3
	vpmovzxdq	%xmm4, %ymm4
	vpand	%ymm7, %ymm4, %ymm4
	vpmovsxdq	%xmm2, %ymm2
	vpaddq	%ymm4, %ymm2, %ymm2
	vpaddq	%ymm2, %ymm1, %ymm1
	vpmovzxdq	%xmm6, %ymm2
	vpand	%ymm7, %ymm2, %ymm2
	vpmovsxdq	%xmm3, %ymm3
	vpaddq	%ymm2, %ymm3, %ymm2
	vpaddq	%ymm2, %ymm0, %ymm0
	addq	$8, %r11
	cmpq	%r11, %rbx
	jne	.LBB0_38
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rdi
	movq	%rbx, %r8
	cmpq	%rbx, %rbp
	je	.LBB0_42
.LBB0_40:
	movq	176(%rsp), %r9
	addq	%r9, %rax
	addq	%r9, %rcx
	addq	%r9, %rdx
	addq	%r9, %rsi
	movq	%rdi, %r9
	.p2align	4
.LBB0_41:
	cmpb	$0, (%rax,%r8)
	setne	%r10b
	cmpb	$0, (%rcx,%r8)
	setne	%r11b
	cmpb	$0, (%rdx,%r8)
	setne	%r15b
	cmpb	$0, (%rsi,%r8)
	leaq	1(%r8), %r8
	setne	%r13b
	movl	%r10d, %edi
	xorb	%r11b, %dil
	movzbl	%dil, %edi
	addq	%r9, %rdi
	xorb	%r15b, %r10b
	xorb	%r13b, %r15b
	movzbl	%r15b, %r9d
	xorb	%r13b, %r11b
	movzbl	%r10b, %r10d
	subq	%r10, %rdi
	movzbl	%r11b, %r10d
	subq	%r10, %rdi
	addq	%r9, %rdi
	movq	%rdi, %r9
	cmpq	%r8, %rbp
	jne	.LBB0_41
.LBB0_42:
	testq	%rdi, %rdi
	movq	8(%rsp), %r15
	movq	24(%rsp), %r13
	jle	.LBB0_45
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$8, %r9d
	leaq	80(%rsp), %rdi
	leaq	72(%rsp), %rsi
	movq	24(%rsp), %rdx
	xorl	%ecx, %ecx
	movq	%r12, %r8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$8
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	movabsq	$_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	vzeroupper
	callq	*%rax
	vpcmpeqd	%xmm9, %xmm9, %xmm9
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	128(%rsp), %ymm7
	addq	$48, %rsp
	.cfi_adjust_cfa_offset -48
	testl	%eax, %eax
	je	.LBB0_45
	cmpl	$-2, %eax
	je	.LBB0_45
.LBB0_48:
	movq	56(%rsp), %rcx
	movq	$0, (%rcx)
	jmp	.LBB0_49
.LBB0_47:
	movq	40(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	$0, 8(%rax)
	movq	%r12, 16(%rax)
	movq	$8, 24(%rax)
	movq	%r15, 32(%rax)
	movq	%r12, 40(%rax)
	movq	$8, 48(%rax)
	movabsq	$NRT_decref, %rax
	movq	48(%rsp), %rdi
	vzeroupper
	callq	*%rax
	xorl	%eax, %eax
.LBB0_49:
	addq	$120, %rsp
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
	vzeroupper
	retq
.LBB0_1:
	.cfi_def_cfa_offset 176
	movabsq	$.const.picklebuf.58e14eccb507b1e0206981740223e685cb8c3c57, %rax
	jmp	.LBB0_2
.LBB0_4:
	movabsq	$.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209, %rax
.LBB0_2:
	movq	%rax, (%rbx)
	movl	$1, %eax
	jmp	.LBB0_49
.Lfunc_end0:
	.size	_ZN16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29, .Lfunc_end0-_ZN16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29
	.cfi_endproc

	.globl	_ZN7cpython16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29
	.p2align	4
	.type	_ZN7cpython16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29,@function
_ZN7cpython16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29:
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
	subq	$296, %rsp
	.cfi_def_cfa_offset 352
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rdi
	leaq	208(%rsp), %rax
	movq	%rax, (%rsp)
	movabsq	$.const._delta_minimization_order, %rsi
	movabsq	$PyArg_UnpackTuple, %r10
	xorl	%r14d, %r14d
	leaq	88(%rsp), %r8
	leaq	216(%rsp), %r9
	movl	$3, %edx
	movl	$3, %ecx
	xorl	%eax, %eax
	callq	*%r10
	movq	$0, 40(%rsp)
	testl	%eax, %eax
	je	.LBB1_9
	movabsq	$_ZN08NumbaEnv16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29, %rax
	movq	(%rax), %r13
	testq	%r13, %r13
	je	.LBB1_14
	movq	88(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 224(%rsp)
	vmovups	%ymm0, 256(%rsp)
	movq	$0, 288(%rsp)
	movabsq	$NRT_adapt_ndarray_from_python, %rax
	leaq	224(%rsp), %rsi
	vzeroupper
	callq	*%rax
	testl	%eax, %eax
	jne	.LBB1_15
	cmpq	$1, 248(%rsp)
	jne	.LBB1_15
	movq	224(%rsp), %r15
	vmovaps	256(%rsp), %xmm0
	movq	272(%rsp), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	vmovups	%ymm1, 96(%rsp)
	vmovups	%ymm1, 120(%rsp)
	movq	%rax, 16(%rsp)
	vmovups	%xmm0, (%rsp)
	movabsq	$_ZN16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29, %rax
	leaq	96(%rsp), %rdi
	leaq	40(%rsp), %rsi
	movq	%r15, %rdx
	vzeroupper
	callq	*%rax
	movl	%eax, %ebp
	movq	40(%rsp), %r14
	movq	96(%rsp), %rbx
	movq	104(%rsp), %r12
	movq	112(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	128(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	136(%rsp), %rax
	movq	%rax, 56(%rsp)
	movq	144(%rsp), %rax
	movq	%rax, 48(%rsp)
	movabsq	$NRT_decref, %rax
	movq	%r15, %rdi
	movq	%rax, %r15
	callq	*%rax
	testl	%ebp, %ebp
	jne	.LBB1_10
	movq	24(%r13), %rdi
	testq	%rdi, %rdi
	je	.LBB1_7
	movabsq	$PyList_GetItem, %rax
	xorl	%esi, %esi
	callq	*%rax
	movq	%rax, %r14
	jmp	.LBB1_8
.LBB1_7:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.`env.consts` is NULL in `read_const`", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	xorl	%r14d, %r14d
.LBB1_8:
	movabsq	$.const.pickledata.dfbcfdd39fcb26f4d0c680954487b8c0b53bb8a3, %rdi
	movabsq	$.const.pickledata.dfbcfdd39fcb26f4d0c680954487b8c0b53bb8a3.sha1, %rdx
	movabsq	$numba_unpickle, %rax
	movl	$32, %esi
	callq	*%rax
	movq	%rbx, 152(%rsp)
	movq	%r12, 160(%rsp)
	movq	80(%rsp), %rcx
	movq	%rcx, 168(%rsp)
	movq	72(%rsp), %rcx
	movq	%rcx, 176(%rsp)
	movq	64(%rsp), %rcx
	movq	%rcx, 184(%rsp)
	movq	56(%rsp), %rcx
	movq	%rcx, 192(%rsp)
	movq	48(%rsp), %rcx
	movq	%rcx, 200(%rsp)
	movabsq	$NRT_adapt_ndarray_to_python_acqref, %r9
	leaq	152(%rsp), %rdi
	movq	%rax, %rsi
	movl	$1, %edx
	movl	$1, %ecx
	movq	%r14, %r8
	callq	*%r9
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	*%r15
.LBB1_9:
	movq	%r14, %rax
	addq	$296, %rsp
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
.LBB1_10:
	.cfi_def_cfa_offset 352
	jle	.LBB1_17
	movabsq	$PyErr_Clear, %rax
	callq	*%rax
	movl	8(%r14), %esi
	movq	(%r14), %rdi
	cmpl	$0, 32(%r14)
	jle	.LBB1_20
	movslq	%esi, %rsi
	movabsq	$PyBytes_FromStringAndSize, %rax
	callq	*%rax
	movq	%rax, %rbx
	movq	16(%r14), %rdi
	callq	*24(%r14)
	testq	%rax, %rax
	je	.LBB1_27
	movabsq	$numba_runtime_build_excinfo_struct, %rcx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	*%rcx
	movq	%rax, %rbx
	movabsq	$NRT_Free, %rax
	movq	%r14, %rdi
	callq	*%rax
	jmp	.LBB1_21
.LBB1_14:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.missing Environment: _ZN08NumbaEnv16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29", %rsi
	jmp	.LBB1_16
.LBB1_15:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
.LBB1_16:
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	xorl	%r14d, %r14d
	jmp	.LBB1_9
.LBB1_17:
	cmpl	$-3, %ebp
	je	.LBB1_24
	cmpl	$-1, %ebp
	jne	.LBB1_25
.LBB1_19:
	xorl	%r14d, %r14d
	jmp	.LBB1_9
.LBB1_20:
	movq	16(%r14), %rdx
	movabsq	$numba_unpickle, %rax
	callq	*%rax
	movq	%rax, %rbx
.LBB1_21:
	testq	%rbx, %rbx
	je	.LBB1_19
	movabsq	$numba_do_raise, %rax
	movq	%rbx, %rdi
.LBB1_23:
	callq	*%rax
	xorl	%r14d, %r14d
	jmp	.LBB1_9
.LBB1_24:
	movabsq	$PyExc_StopIteration, %rdi
	movabsq	$PyErr_SetNone, %rax
	jmp	.LBB1_23
.LBB1_25:
	movabsq	$PyExc_SystemError, %rdi
	movabsq	$".const.unknown error when calling native function", %rsi
	jmp	.LBB1_16
.LBB1_27:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.Error creating Python tuple from runtime exception arguments", %rsi
	jmp	.LBB1_16
.Lfunc_end1:
	.size	_ZN7cpython16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29, .Lfunc_end1-_ZN7cpython16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29
	.cfi_endproc

	.weak	NRT_incref
	.p2align	4
	.type	NRT_incref,@function
NRT_incref:
	endbr64
	testq	%rdi, %rdi
	je	.LBB2_2
	lock		incq	(%rdi)
.LBB2_2:
	retq
.Lfunc_end2:
	.size	NRT_incref, .Lfunc_end2-NRT_incref

	.weak	NRT_decref
	.p2align	4
	.type	NRT_decref,@function
NRT_decref:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.LBB3_2
	#MEMBARRIER
	lock		decq	(%rdi)
	je	.LBB3_3
.LBB3_2:
	retq
.LBB3_3:
	#MEMBARRIER
	movabsq	$NRT_MemInfo_call_dtor, %rax
	jmpq	*%rax
.Lfunc_end3:
	.size	NRT_decref, .Lfunc_end3-NRT_decref
	.cfi_endproc

	.weak	_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,@function
_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx:
	endbr64
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movq	88(%rsp), %rbx
	movq	%rbx, %r11
	sarq	%r11
	testq	%r11, %r11
	jle	.LBB4_8
	movq	80(%rsp), %rax
	movq	64(%rsp), %r10
	movq	56(%rsp), %rcx
	leaq	(%rbx,%rax), %rdx
	movl	%r11d, %esi
	andl	$3, %esi
	cmpq	$3, %r11
	ja	.LBB4_3
	shlq	$3, %r10
	xorl	%r11d, %r11d
	movq	%r10, %r8
	jmp	.LBB4_6
.LBB4_3:
	movq	%rdi, -8(%rsp)
	movabsq	$9223372036854775804, %r8
	andq	%r8, %r11
	leaq	(%rcx,%rax,8), %rdi
	leaq	(,%r10,8), %r8
	addq	%rax, %rbx
	decq	%rbx
	xorl	%r14d, %r14d
	.p2align	4
.LBB4_4:
	leaq	(%rax,%r14), %r15
	sarq	$63, %r15
	andq	%r8, %r15
	addq	%rdi, %r15
	movq	(%r15,%r14,8), %r12
	movq	%rbx, %r13
	sarq	$63, %r13
	andq	%r8, %r13
	addq	%rcx, %r13
	movq	(%r13,%rbx,8), %rbp
	movq	%rbp, (%r15,%r14,8)
	movq	%r12, (%r13,%rbx,8)
	leaq	(%rax,%r14), %r15
	incq	%r15
	sarq	$63, %r15
	andq	%r8, %r15
	addq	%rdi, %r15
	movq	8(%r15,%r14,8), %r12
	movq	%r14, %r13
	xorq	$-2, %r13
	addq	%rdx, %r13
	leaq	(%rcx,%r13,8), %rbp
	sarq	$63, %r13
	andq	%r10, %r13
	movq	(%rbp,%r13,8), %r9
	movq	%r9, 8(%r15,%r14,8)
	movq	%r12, (%rbp,%r13,8)
	leaq	(%rax,%r14), %r9
	addq	$2, %r9
	sarq	$63, %r9
	andq	%r8, %r9
	addq	%rdi, %r9
	movq	16(%r9,%r14,8), %r15
	movq	%r14, %r12
	xorq	$-3, %r12
	addq	%rdx, %r12
	leaq	(%rcx,%r12,8), %r13
	sarq	$63, %r12
	andq	%r10, %r12
	movq	(%r13,%r12,8), %rbp
	movq	%rbp, 16(%r9,%r14,8)
	movq	%r15, (%r13,%r12,8)
	leaq	(%rax,%r14), %r9
	addq	$3, %r9
	sarq	$63, %r9
	andq	%r8, %r9
	addq	%rdi, %r9
	movq	24(%r9,%r14,8), %r15
	movq	%r14, %r12
	xorq	$-4, %r12
	addq	%rdx, %r12
	leaq	(%rcx,%r12,8), %r13
	sarq	$63, %r12
	andq	%r10, %r12
	movq	(%r13,%r12,8), %rbp
	movq	%rbp, 24(%r9,%r14,8)
	addq	$4, %r14
	movq	%r15, (%r13,%r12,8)
	addq	$-4, %rbx
	cmpq	%r14, %r11
	jne	.LBB4_4
	testq	%rsi, %rsi
	movq	-8(%rsp), %rdi
	je	.LBB4_8
.LBB4_6:
	movq	%r11, %r9
	notq	%r9
	addq	%r9, %rdx
	addq	%r11, %rax
	.p2align	4
.LBB4_7:
	movq	%rax, %rbx
	sarq	$63, %rbx
	andq	%r8, %rbx
	addq	%rcx, %rbx
	movq	(%rbx,%rax,8), %r9
	movq	%rdx, %r10
	sarq	$63, %r10
	andq	%r8, %r10
	addq	%rcx, %r10
	movq	(%r10,%rdx,8), %r11
	movq	%r11, (%rbx,%rax,8)
	movq	%r9, (%r10,%rdx,8)
	decq	%rdx
	incq	%rax
	decq	%rsi
	jne	.LBB4_7
.LBB4_8:
	movq	$0, (%rdi)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end4-_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx

	.type	.const._delta_minimization_order,@object
	.section	.lrodata,"al",@progbits
	.p2align	4, 0x0
.const._delta_minimization_order:
	.asciz	"_delta_minimization_order"
	.size	.const._delta_minimization_order, 26

	.type	_ZN08NumbaEnv16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29,@object
	.comm	_ZN08NumbaEnv16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29":
	.asciz	"missing Environment: _ZN08NumbaEnv16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29"
	.size	".const.missing Environment: _ZN08NumbaEnv16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29", 212

	.type	".const.can't unbox array from PyObject into native value.  The object maybe of a different type",@object
	.p2align	4, 0x0
".const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"
	.size	".const.can't unbox array from PyObject into native value.  The object maybe of a different type", 89

	.type	".const.`env.consts` is NULL in `read_const`",@object
	.p2align	4, 0x0
".const.`env.consts` is NULL in `read_const`":
	.asciz	"`env.consts` is NULL in `read_const`"
	.size	".const.`env.consts` is NULL in `read_const`", 37

	.type	.const.pickledata.dfbcfdd39fcb26f4d0c680954487b8c0b53bb8a3,@object
	.p2align	4, 0x0
.const.pickledata.dfbcfdd39fcb26f4d0c680954487b8c0b53bb8a3:
	.ascii	"\200\004\225\025\000\000\000\000\000\000\000\214\005numpy\224\214\007ndarray\224\223\224."
	.size	.const.pickledata.dfbcfdd39fcb26f4d0c680954487b8c0b53bb8a3, 32

	.type	.const.pickledata.dfbcfdd39fcb26f4d0c680954487b8c0b53bb8a3.sha1,@object
	.p2align	4, 0x0
.const.pickledata.dfbcfdd39fcb26f4d0c680954487b8c0b53bb8a3.sha1:
	.ascii	"\337\274\375\323\237\313&\364\320\306\200\225D\207\270\300\265;\270\243"
	.size	.const.pickledata.dfbcfdd39fcb26f4d0c680954487b8c0b53bb8a3.sha1, 20

	.type	".const.Error creating Python tuple from runtime exception arguments",@object
	.p2align	4, 0x0
".const.Error creating Python tuple from runtime exception arguments":
	.asciz	"Error creating Python tuple from runtime exception arguments"
	.size	".const.Error creating Python tuple from runtime exception arguments", 61

	.type	".const.unknown error when calling native function",@object
	.p2align	4, 0x0
".const.unknown error when calling native function":
	.asciz	"unknown error when calling native function"
	.size	".const.unknown error when calling native function", 43

	.type	_ZN08NumbaEnv5numba2np8arrayobj9np_arange12_3clocals_3e4implB2v2B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEx27omitted_28default_3dNone_2927omitted_28default_3dNone_2927omitted_28default_3dNone_29,@object
	.comm	_ZN08NumbaEnv5numba2np8arrayobj9np_arange12_3clocals_3e4implB2v2B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEx27omitted_28default_3dNone_2927omitted_28default_3dNone_2927omitted_28default_3dNone_29,8,8
	.type	_ZN08NumbaEnv5numba7cpython8builtins6ol_int12_3clocals_3e4implB2v3B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEx,@object
	.comm	_ZN08NumbaEnv5numba7cpython8builtins6ol_int12_3clocals_3e4implB2v3B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEx,8,8
	.type	_ZN08NumbaEnv5numba7cpython8builtins6ol_max12_3clocals_3e4implB2v4B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dE15StarArgUniTupleIxLi2EE,@object
	.comm	_ZN08NumbaEnv5numba7cpython8builtins6ol_max12_3clocals_3e4implB2v4B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dE15StarArgUniTupleIxLi2EE,8,8
	.type	_ZN08NumbaEnv5numba2np8arrayobj11ol_np_empty12_3clocals_3e4implB2v5B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEx16class_28int64_29,@object
	.comm	_ZN08NumbaEnv5numba2np8arrayobj11ol_np_empty12_3clocals_3e4implB2v5B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEx16class_28int64_29,8,8
	.type	.const.pickledata.58e14eccb507b1e0206981740223e685cb8c3c57,@object
	.p2align	4, 0x0
.const.pickledata.58e14eccb507b1e0206981740223e685cb8c3c57:
	.ascii	"\200\004\225~\000\000\000\000\000\000\000\214\bbuiltins\224\214\nValueError\224\223\224\214[array is too big; `arr.size * arr.dtype.itemsize` is larger than the maximum possible size.\224\205\224N\207\224."
	.size	.const.pickledata.58e14eccb507b1e0206981740223e685cb8c3c57, 137

	.type	.const.pickledata.58e14eccb507b1e0206981740223e685cb8c3c57.sha1,@object
	.p2align	4, 0x0
.const.pickledata.58e14eccb507b1e0206981740223e685cb8c3c57.sha1:
	.ascii	"X\341N\314\265\007\261\340 i\201t\002#\346\205\313\214<W"
	.size	.const.pickledata.58e14eccb507b1e0206981740223e685cb8c3c57.sha1, 20

	.type	.const.picklebuf.58e14eccb507b1e0206981740223e685cb8c3c57,@object
	.p2align	4, 0x0
.const.picklebuf.58e14eccb507b1e0206981740223e685cb8c3c57:
	.quad	.const.pickledata.58e14eccb507b1e0206981740223e685cb8c3c57
	.long	137
	.zero	4
	.quad	.const.pickledata.58e14eccb507b1e0206981740223e685cb8c3c57.sha1
	.quad	0
	.long	0
	.zero	4
	.size	.const.picklebuf.58e14eccb507b1e0206981740223e685cb8c3c57, 40

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

	.type	_ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@object
	.comm	_ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,8,8
	.type	_ZN08NumbaEnv5numba7cpython8builtins6ol_int12_3clocals_3e4implB3v17B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEb,@object
	.comm	_ZN08NumbaEnv5numba7cpython8builtins6ol_int12_3clocals_3e4implB3v17B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEb,8,8
	.type	_ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,@object
	.comm	_ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,8,8
	.section	".note.GNU-stack","",@progbits
