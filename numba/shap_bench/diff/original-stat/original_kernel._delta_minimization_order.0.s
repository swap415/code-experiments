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
	.section	.ltext,"axl",@progbits
	.globl	_ZN15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29
	.p2align	4
	.type	_ZN15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29,@function
_ZN15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29:
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rsi, %r14
	movq	%rdi, %r13
	movq	$0, 24(%rsp)
	movabsq	$NRT_incref, %rax
	movq	%rdx, 16(%rsp)
	movq	%rdx, %rdi
	callq	*%rax
	vcvtsi2sdq	152(%rsp), %xmm15, %xmm0
	vcvttsd2si	%xmm0, %r12
	movabsq	$1152921504606846975, %rax
	cmpq	%rax, %r12
	jg	.LBB0_1
	movq	%r12, %rax
	sarq	$63, %rax
	andnq	%r12, %rax, %r15
	leaq	(,%r15,8), %rdi
	movabsq	$NRT_MemInfo_alloc_aligned, %rax
	movl	$32, %esi
	callq	*%rax
	testq	%rax, %rax
	je	.LBB0_4
	movq	%rax, %rbx
	movq	24(%rax), %rbp
	testq	%r12, %r12
	jle	.LBB0_18
	cmpq	$3, %r12
	ja	.LBB0_9
	xorl	%eax, %eax
	jmp	.LBB0_8
.LBB0_9:
	movabsq	$9223372036854775792, %rsi
	movabsq	$.LCPI0_0, %rcx
	movabsq	$.LCPI0_1, %rdx
	cmpq	$16, %r12
	jae	.LBB0_11
	xorl	%eax, %eax
	jmp	.LBB0_15
.LBB0_11:
	movq	%r12, %rax
	andq	%rsi, %rax
	vmovdqa	(%rcx), %ymm0
	xorl	%edi, %edi
	vpbroadcastq	(%rdx), %ymm1
	movabsq	$.LCPI0_2, %r8
	vpbroadcastq	(%r8), %ymm2
	movabsq	$.LCPI0_3, %r8
	vpbroadcastq	(%r8), %ymm3
	movabsq	$.LCPI0_4, %r8
	vpbroadcastq	(%r8), %ymm4
	.p2align	4
.LBB0_12:
	vpaddq	%ymm1, %ymm0, %ymm5
	vpaddq	%ymm2, %ymm0, %ymm6
	vmovdqu	%ymm0, (%rbp,%rdi,8)
	vmovdqu	%ymm5, 32(%rbp,%rdi,8)
	vmovdqu	%ymm6, 64(%rbp,%rdi,8)
	vpaddq	%ymm3, %ymm0, %ymm5
	vmovdqu	%ymm5, 96(%rbp,%rdi,8)
	addq	$16, %rdi
	vpaddq	%ymm4, %ymm0, %ymm0
	cmpq	%rdi, %rax
	jne	.LBB0_12
	cmpq	%r12, %rax
	je	.LBB0_18
	testb	$12, %r12b
	je	.LBB0_8
.LBB0_15:
	movq	%rax, %rdi
	addq	$12, %rsi
	movq	%rsi, %rax
	andq	%r12, %rax
	vmovq	%rdi, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpor	(%rcx), %ymm0, %ymm0
	vpbroadcastq	(%rdx), %ymm1
	.p2align	4
.LBB0_16:
	vmovdqu	%ymm0, (%rbp,%rdi,8)
	addq	$4, %rdi
	vpaddq	%ymm1, %ymm0, %ymm0
	cmpq	%rdi, %rax
	jne	.LBB0_16
	cmpq	%r12, %rax
	je	.LBB0_18
	.p2align	4
.LBB0_8:
	movq	%rax, (%rbp,%rax,8)
	incq	%rax
	cmpq	%rax, %r12
	jne	.LBB0_8
.LBB0_18:
	movq	%r13, 64(%rsp)
	movq	%r14, 32(%rsp)
	movl	$3, %r14d
	subq	%r15, %r14
	movl	$2, %r12d
	jmp	.LBB0_19
	.p2align	4
.LBB0_26:
	incq	%r12
	incq	%r14
	cmpq	$100, %r12
	je	.LBB0_27
.LBB0_19:
	leaq	-2(%r15), %rax
	cmpq	%rax, %r12
	jg	.LBB0_26
	movl	$1, %r13d
	jmp	.LBB0_21
	.p2align	4
.LBB0_25:
	incq	%r13
	leaq	(%r14,%r13), %rax
	cmpq	$1, %rax
	je	.LBB0_26
.LBB0_21:
	movq	$0, 8(%rsp)
	leaq	8(%rsp), %rdi
	leaq	24(%rsp), %rsi
	movq	16(%rsp), %rdx
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r8
	movq	56(%rsp), %r9
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$8
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	$8
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$0
	.cfi_adjust_cfa_offset 8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	movabsq	$_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	vzeroupper
	callq	*%rax
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	testl	%eax, %eax
	jne	.LBB0_37
	cmpq	$0, 8(%rsp)
	jle	.LBB0_25
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$8, %r9d
	leaq	88(%rsp), %rdi
	leaq	80(%rsp), %rsi
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	movq	%r15, %r8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$8
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	movabsq	$_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	callq	*%rax
	addq	$48, %rsp
	.cfi_adjust_cfa_offset -48
	testl	%eax, %eax
	je	.LBB0_25
	cmpl	$-2, %eax
	je	.LBB0_25
.LBB0_40:
	movq	32(%rsp), %rcx
	movq	$0, (%rcx)
	jmp	.LBB0_39
.LBB0_27:
	movl	$3, %r14d
	subq	%r15, %r14
	movl	$2, %r12d
	jmp	.LBB0_28
	.p2align	4
.LBB0_35:
	incq	%r12
	incq	%r14
	cmpq	$100, %r12
	je	.LBB0_36
.LBB0_28:
	leaq	-2(%r15), %rax
	cmpq	%rax, %r12
	jg	.LBB0_35
	movl	$1, %r13d
	jmp	.LBB0_30
	.p2align	4
.LBB0_34:
	incq	%r13
	leaq	(%r14,%r13), %rax
	cmpq	$1, %rax
	je	.LBB0_35
.LBB0_30:
	movq	$0, 8(%rsp)
	leaq	8(%rsp), %rdi
	leaq	24(%rsp), %rsi
	movq	16(%rsp), %rdx
	movq	40(%rsp), %rcx
	movq	48(%rsp), %r8
	movq	56(%rsp), %r9
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$8
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	$8
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$0
	.cfi_adjust_cfa_offset 8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	248(%rsp)
	.cfi_adjust_cfa_offset 8
	movabsq	$_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	vzeroupper
	callq	*%rax
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	testl	%eax, %eax
	jne	.LBB0_37
	cmpq	$0, 8(%rsp)
	jle	.LBB0_34
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$8, %r9d
	leaq	88(%rsp), %rdi
	leaq	80(%rsp), %rsi
	movq	%rbx, %rdx
	xorl	%ecx, %ecx
	movq	%r15, %r8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$8
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	movabsq	$_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	callq	*%rax
	addq	$48, %rsp
	.cfi_adjust_cfa_offset -48
	testl	%eax, %eax
	je	.LBB0_34
	cmpl	$-2, %eax
	je	.LBB0_34
	jmp	.LBB0_40
.LBB0_37:
	movq	24(%rsp), %rax
	movq	32(%rsp), %rcx
	movq	%rax, (%rcx)
.LBB0_38:
	movl	$1, %eax
.LBB0_39:
	addq	$88, %rsp
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
.LBB0_1:
	.cfi_def_cfa_offset 144
	movabsq	$.const.picklebuf.58e14eccb507b1e0206981740223e685cb8c3c57, %rax
	movq	%rax, (%r14)
	jmp	.LBB0_38
.LBB0_4:
	movabsq	$.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209, %rax
	movq	%rax, (%r14)
	jmp	.LBB0_38
.LBB0_36:
	movq	64(%rsp), %rax
	movq	%rbx, (%rax)
	movq	$0, 8(%rax)
	movq	%r15, 16(%rax)
	movq	$8, 24(%rax)
	movq	%rbp, 32(%rax)
	movq	%r15, 40(%rax)
	movq	$8, 48(%rax)
	movabsq	$NRT_decref, %rax
	movq	16(%rsp), %rdi
	vzeroupper
	callq	*%rax
	xorl	%eax, %eax
	jmp	.LBB0_39
.Lfunc_end0:
	.size	_ZN15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29, .Lfunc_end0-_ZN15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29
	.cfi_endproc

	.globl	_ZN7cpython15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29
	.p2align	4
	.type	_ZN7cpython15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29,@function
_ZN7cpython15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29:
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
	leaq	280(%rsp), %rax
	movq	%rax, (%rsp)
	movabsq	$.const._delta_minimization_order, %rsi
	movabsq	$PyArg_UnpackTuple, %r10
	xorl	%r14d, %r14d
	leaq	88(%rsp), %r8
	leaq	288(%rsp), %r9
	movl	$3, %edx
	movl	$3, %ecx
	xorl	%eax, %eax
	callq	*%r10
	movq	$0, 40(%rsp)
	testl	%eax, %eax
	je	.LBB1_9
	movabsq	$_ZN08NumbaEnv15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29, %rax
	movq	(%rax), %r12
	testq	%r12, %r12
	je	.LBB1_14
	movq	88(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 208(%rsp)
	vmovups	%ymm0, 240(%rsp)
	movq	$0, 272(%rsp)
	movabsq	$NRT_adapt_ndarray_from_python, %rax
	leaq	208(%rsp), %rsi
	vzeroupper
	callq	*%rax
	testl	%eax, %eax
	jne	.LBB1_15
	cmpq	$1, 232(%rsp)
	jne	.LBB1_15
	movq	208(%rsp), %r15
	movq	216(%rsp), %rcx
	movq	224(%rsp), %r8
	vmovups	240(%rsp), %ymm0
	movq	272(%rsp), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	vmovups	%ymm1, 96(%rsp)
	vmovups	%ymm1, 120(%rsp)
	movq	%rax, 32(%rsp)
	vmovups	%ymm0, (%rsp)
	movabsq	$_ZN15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29, %rax
	leaq	96(%rsp), %rdi
	leaq	40(%rsp), %rsi
	movl	$1, %r9d
	movq	%r15, %rdx
	vzeroupper
	callq	*%rax
	movl	%eax, %ebp
	movq	40(%rsp), %r14
	movq	96(%rsp), %rbx
	movq	104(%rsp), %r13
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
	movq	24(%r12), %rdi
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
	movq	%r13, 160(%rsp)
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
	movabsq	$".const.missing Environment: _ZN08NumbaEnv15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29", %rsi
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
	.size	_ZN7cpython15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29, .Lfunc_end1-_ZN7cpython15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29
	.cfi_endproc

	.weak	_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@function
_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx:
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
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, %r13
	movq	%rcx, 144(%rsp)
	movq	%rdx, %r14
	movq	%rsi, 8(%rsp)
	movq	%rdi, 112(%rsp)
	movq	304(%rsp), %r12
	movq	248(%rsp), %rbx
	movq	224(%rsp), %r15
	movq	$0, 80(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 48(%rsp)
	movq	$0, 32(%rsp)
	movabsq	$NRT_incref, %rbp
	movq	%rdx, %rdi
	callq	*%rbp
	movq	%rbx, %rdi
	callq	*%rbp
	xorl	%eax, %eax
	testq	%r12, %r12
	cmovleq	288(%rsp), %rax
	movq	280(%rsp), %rcx
	leaq	(%rcx,%r12,8), %rbp
	movq	%rax, 128(%rsp)
	movq	-8(%rbp,%rax,8), %rax
	movq	%rax, %rbx
	sarq	$63, %rbx
	andq	216(%rsp), %rbx
	addq	%rax, %rbx
	imulq	%r15, %rbx
	addq	208(%rsp), %rbx
	movq	%r14, %rdi
	movabsq	$NRT_incref, %rax
	callq	*%rax
	movq	%r12, %rax
	sarq	$63, %rax
	andq	288(%rsp), %rax
	movq	%rbp, 136(%rsp)
	movq	%rax, 120(%rsp)
	movq	(%rbp,%rax,8), %rax
	movq	%rax, %rbp
	sarq	$63, %rbp
	andq	216(%rsp), %rbp
	addq	%rax, %rbp
	imulq	%r15, %rbp
	addq	208(%rsp), %rbp
	movq	%r14, %rdi
	movabsq	$NRT_incref, %rax
	callq	*%rax
	movq	$0, 88(%rsp)
	movabsq	$_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, %rax
	leaq	88(%rsp), %rdi
	leaq	80(%rsp), %rsi
	movq	%r14, %rdx
	movq	144(%rsp), %rcx
	movq	%r15, %r8
	movq	%r13, %r9
	movq	240(%rsp), %r10
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	movq	%rcx, %rbp
	.cfi_adjust_cfa_offset 8
	movq	%r13, 40(%rsp)
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rcx
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	callq	*%rax
	addq	$80, %rsp
	.cfi_adjust_cfa_offset -80
	testl	%eax, %eax
	jne	.LBB2_6
	movq	88(%rsp), %r13
	addq	312(%rsp), %r12
	xorl	%ebx, %ebx
	testq	%r12, %r12
	movq	288(%rsp), %r8
	cmovleq	%r8, %rbx
	movq	280(%rsp), %rax
	leaq	(%rax,%r12,8), %rdi
	movq	-8(%rdi,%rbx,8), %rcx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	216(%rsp), %rsi
	andq	%rsi, %rax
	addq	%rcx, %rax
	imulq	%r15, %rax
	movq	208(%rsp), %rdx
	addq	%rdx, %rax
	sarq	$63, %r12
	andq	%r8, %r12
	movq	%rdi, 24(%rsp)
	movq	(%rdi,%r12,8), %rcx
	movq	%rcx, %r10
	sarq	$63, %r10
	andq	%rsi, %r10
	addq	%rcx, %r10
	imulq	%r15, %r10
	addq	%rdx, %r10
	movq	$0, 72(%rsp)
	leaq	72(%rsp), %rdi
	leaq	64(%rsp), %rsi
	movq	%r14, %rdx
	movq	%rbp, %rcx
	movq	%r15, %r8
	movq	16(%rsp), %r9
	movq	240(%rsp), %r11
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%r9
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movabsq	$_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, %rax
	callq	*%rax
	addq	$80, %rsp
	.cfi_adjust_cfa_offset -80
	testl	%eax, %eax
	jne	.LBB2_8
	movq	%r13, 104(%rsp)
	movq	72(%rsp), %rax
	movq	%rax, 96(%rsp)
	movq	136(%rsp), %r13
	movq	128(%rsp), %rax
	movq	-8(%r13,%rax,8), %rcx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	216(%rsp), %rsi
	andq	%rsi, %rax
	addq	%rcx, %rax
	imulq	%r15, %rax
	movq	208(%rsp), %rdx
	addq	%rdx, %rax
	movq	24(%rsp), %rcx
	movq	-8(%rcx,%rbx,8), %rcx
	movq	%rcx, %r10
	sarq	$63, %r10
	andq	%rsi, %r10
	addq	%rcx, %r10
	imulq	%r15, %r10
	addq	%rdx, %r10
	movq	$0, 56(%rsp)
	leaq	56(%rsp), %rdi
	leaq	48(%rsp), %rsi
	movq	%r14, %rdx
	movq	%rbp, %rcx
	movq	%r15, %r8
	movq	16(%rsp), %r9
	movq	240(%rsp), %r11
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%r9
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movabsq	$_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, %rax
	callq	*%rax
	addq	$80, %rsp
	.cfi_adjust_cfa_offset -80
	testl	%eax, %eax
	jne	.LBB2_9
	movq	56(%rsp), %rbx
	movq	120(%rsp), %rax
	movq	(%r13,%rax,8), %rcx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	216(%rsp), %rsi
	andq	%rsi, %rax
	addq	%rcx, %rax
	imulq	%r15, %rax
	movq	208(%rsp), %rdx
	addq	%rdx, %rax
	movq	24(%rsp), %rcx
	movq	(%rcx,%r12,8), %rcx
	movq	%rcx, %r10
	sarq	$63, %r10
	andq	%rsi, %r10
	addq	%rcx, %r10
	imulq	%r15, %r10
	addq	%rdx, %r10
	movq	$0, 40(%rsp)
	leaq	40(%rsp), %rdi
	leaq	32(%rsp), %rsi
	movq	%r14, %rdx
	movq	%rbp, %rcx
	movq	%r15, %r8
	movq	16(%rsp), %r9
	movq	240(%rsp), %r11
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	pushq	%r9
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movabsq	$_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, %rax
	callq	*%rax
	addq	$80, %rsp
	.cfi_adjust_cfa_offset -80
	movl	%eax, %ebp
	movabsq	$NRT_decref, %r15
	movq	248(%rsp), %rdi
	callq	*%r15
	movq	%r14, %rdi
	callq	*%r15
	testl	%ebp, %ebp
	jne	.LBB2_10
	addq	40(%rsp), %rbx
	movq	%r14, %rdi
	callq	*%r15
	movq	%r14, %rdi
	callq	*%r15
	movq	96(%rsp), %rcx
	addq	104(%rsp), %rcx
	subq	%rbx, %rcx
	movq	112(%rsp), %rax
	movq	%rcx, (%rax)
	xorl	%eax, %eax
.LBB2_5:
	addq	$152, %rsp
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
.LBB2_6:
	.cfi_def_cfa_offset 208
	movq	80(%rsp), %rax
	jmp	.LBB2_7
.LBB2_8:
	movq	64(%rsp), %rax
	jmp	.LBB2_7
.LBB2_9:
	movq	48(%rsp), %rax
	jmp	.LBB2_7
.LBB2_10:
	movq	32(%rsp), %rax
.LBB2_7:
	movq	8(%rsp), %rcx
	movq	%rax, (%rcx)
	movl	$1, %eax
	jmp	.LBB2_5
.Lfunc_end2:
	.size	_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end2-_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
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

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI4_0:
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
.LCPI4_1:
	.zero	32,1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI4_2:
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.section	.ltext,"axl",@progbits
	.weak	_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE
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
	movq	%rsi, %r12
	movq	%rdi, %r13
	movq	104(%rsp), %r14
	movq	88(%rsp), %rbp
	movq	144(%rsp), %r15
	movabsq	$NRT_incref, %rbx
	movq	%rdx, 16(%rsp)
	movq	%rdx, %rdi
	callq	*%rbx
	movq	%r14, %rdi
	callq	*%rbx
	movq	%r15, %rbx
	cmpq	$1, %rbp
	je	.LBB4_4
	cmpq	%rbp, %r15
	setne	%al
	cmpq	$1, %r15
	setne	%cl
	movq	%rbp, %rbx
	testb	%al, %cl
	je	.LBB4_4
	movabsq	$.const.picklebuf.c609a61042a044ba6291d5da2e507179b42ccfbc, %rax
.LBB4_3:
	movq	%rax, (%r12)
	movl	$1, %r12d
	jmp	.LBB4_72
.LBB4_4:
	movq	%r13, 8(%rsp)
	movabsq	$NRT_MemInfo_alloc_aligned, %rax
	movq	%rbx, %rdi
	movl	$32, %esi
	callq	*%rax
	testq	%rax, %rax
	je	.LBB4_98
	movq	%rax, %r13
	xorl	%r12d, %r12d
	testq	%rbx, %rbx
	jle	.LBB4_10
	movq	136(%rsp), %rdx
	movq	80(%rsp), %rsi
	movq	24(%r13), %rax
	movabsq	$9223372036854775800, %rcx
	cmpq	$2, %rbp
	jb	.LBB4_11
	cmpq	$1, %r15
	jbe	.LBB4_19
	cmpq	$8, %rbx
	jb	.LBB4_9
	movq	%rax, %rdi
	subq	%rsi, %rdi
	cmpq	$128, %rdi
	setb	%dil
	movq	%rax, %r8
	subq	%rdx, %r8
	cmpq	$128, %r8
	setb	%r8b
	orb	%dil, %r8b
	je	.LBB4_47
.LBB4_9:
	xorl	%edi, %edi
.LBB4_56:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB4_59
	movq	%rdi, %r8
	.p2align	4
.LBB4_58:
	cmpb	$0, (%rsi,%r8)
	setne	%r10b
	cmpb	$0, (%rdx,%r8)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB4_58
.LBB4_59:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB4_61
	.p2align	4
.LBB4_60:
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
	jne	.LBB4_60
	jmp	.LBB4_61
.LBB4_10:
	xorl	%r15d, %r15d
	movq	104(%rsp), %rdi
	jmp	.LBB4_71
.LBB4_11:
	cmpq	$1, %r15
	jbe	.LBB4_26
	cmpq	$8, %rbx
	jae	.LBB4_35
	xorl	%edi, %edi
.LBB4_14:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB4_17
	movq	%rdi, %r8
	.p2align	4
.LBB4_16:
	cmpb	$0, (%rsi)
	setne	%r10b
	cmpb	$0, (%rdx,%r8)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB4_16
.LBB4_17:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB4_61
	.p2align	4
.LBB4_18:
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
	jne	.LBB4_18
	jmp	.LBB4_61
.LBB4_19:
	cmpq	$8, %rbx
	jae	.LBB4_39
	xorl	%edi, %edi
.LBB4_21:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB4_24
	movq	%rdi, %r8
	.p2align	4
.LBB4_23:
	cmpb	$0, (%rsi,%r8)
	setne	%r10b
	cmpb	$0, (%rdx)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB4_23
.LBB4_24:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB4_61
	.p2align	4
.LBB4_25:
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
	jne	.LBB4_25
	jmp	.LBB4_61
.LBB4_26:
	cmpq	$8, %rbx
	jae	.LBB4_43
	xorl	%edi, %edi
.LBB4_28:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB4_31
	movq	%rdi, %r8
	.p2align	4
.LBB4_30:
	cmpb	$0, (%rsi)
	setne	%r10b
	cmpb	$0, (%rdx)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB4_30
.LBB4_31:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB4_61
	.p2align	4
.LBB4_32:
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
	jne	.LBB4_32
.LBB4_61:
	movl	%ebx, %edx
	andl	$7, %edx
	cmpq	$8, %rbx
	jb	.LBB4_74
	leaq	-8(%rbx), %rdi
	movq	%rdi, %r8
	shrq	$3, %r8
	je	.LBB4_97
.LBB4_63:
	incq	%r8
	andq	$-2, %r8
	negq	%r8
	xorl	%r15d, %r15d
	movq	%rax, %rsi
	.p2align	4
.LBB4_64:
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
	jne	.LBB4_64
	testb	$8, %dil
	jne	.LBB4_67
.LBB4_66:
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
.LBB4_67:
	testq	%rdx, %rdx
	je	.LBB4_73
	andq	%rcx, %rbx
	addq	%rbx, %rax
.LBB4_69:
	movq	104(%rsp), %rdi
	xorl	%ecx, %ecx
.LBB4_70:
	cmpb	$1, (%rax,%rcx)
	sbbq	$-1, %r15
	incq	%rcx
	cmpq	%rcx, %rdx
	jne	.LBB4_70
.LBB4_71:
	movabsq	$NRT_decref, %rbx
	vzeroupper
	callq	*%rbx
	movq	16(%rsp), %rdi
	callq	*%rbx
	movq	%r13, %rdi
	callq	*%rbx
	movq	8(%rsp), %rax
	movq	%r15, (%rax)
.LBB4_72:
	movl	%r12d, %eax
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
.LBB4_35:
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
	jne	.LBB4_14
	andb	%r9b, %r8b
	jne	.LBB4_14
	cmpq	$128, %rbx
	jae	.LBB4_75
	xorl	%edi, %edi
	jmp	.LBB4_79
.LBB4_39:
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
	jne	.LBB4_21
	andb	%r9b, %r8b
	jne	.LBB4_21
	cmpq	$128, %rbx
	jae	.LBB4_82
	xorl	%edi, %edi
	jmp	.LBB4_86
.LBB4_43:
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
	jne	.LBB4_28
	andb	%r9b, %r8b
	jne	.LBB4_28
	movzbl	(%rdx), %r8d
	movzbl	(%rsi), %r9d
	cmpq	$128, %rbx
	jae	.LBB4_89
	xorl	%edi, %edi
	jmp	.LBB4_93
.LBB4_73:
	movq	104(%rsp), %rdi
	jmp	.LBB4_71
.LBB4_74:
	xorl	%r15d, %r15d
	jmp	.LBB4_69
.LBB4_47:
	cmpq	$128, %rbx
	jae	.LBB4_49
	xorl	%edi, %edi
	jmp	.LBB4_53
.LBB4_49:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	xorl	%r8d, %r8d
	vpxor	%xmm0, %xmm0, %xmm0
	movabsq	$.LCPI4_1, %r9
	vmovdqa	(%r9), %ymm1
	.p2align	4
.LBB4_50:
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
	jne	.LBB4_50
	cmpq	%rdi, %rbx
	je	.LBB4_96
	testb	$120, %bl
	je	.LBB4_56
.LBB4_53:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	vpxor	%xmm0, %xmm0, %xmm0
	movabsq	$.LCPI4_2, %r9
	vmovdqa	(%r9), %xmm1
	.p2align	4
.LBB4_54:
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
	jne	.LBB4_54
	cmpq	%rdi, %rbx
	je	.LBB4_96
	jmp	.LBB4_56
.LBB4_75:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	cmpb	$0, (%rsi)
	setne	%r8b
	vmovd	%r8d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	xorl	%r8d, %r8d
	vpxor	%xmm1, %xmm1, %xmm1
	movabsq	$.LCPI4_1, %r9
	vmovdqa	(%r9), %ymm2
	.p2align	4
.LBB4_76:
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
	jne	.LBB4_76
	cmpq	%rdi, %rbx
	je	.LBB4_96
	testb	$120, %bl
	je	.LBB4_14
.LBB4_79:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	cmpb	$0, (%rsi)
	setne	%r9b
	vmovd	%r9d, %xmm0
	vpbroadcastb	%xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	movabsq	$.LCPI4_2, %r9
	vmovdqa	(%r9), %xmm3
	.p2align	4
.LBB4_80:
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
	jne	.LBB4_80
	cmpq	%rdi, %rbx
	jne	.LBB4_14
	jmp	.LBB4_96
.LBB4_82:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	cmpb	$0, (%rdx)
	setne	%r8b
	vmovd	%r8d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	xorl	%r8d, %r8d
	vpxor	%xmm1, %xmm1, %xmm1
	movabsq	$.LCPI4_1, %r9
	vmovdqa	(%r9), %ymm2
	.p2align	4
.LBB4_83:
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
	jne	.LBB4_83
	cmpq	%rdi, %rbx
	je	.LBB4_96
	testb	$120, %bl
	je	.LBB4_21
.LBB4_86:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	cmpb	$0, (%rdx)
	setne	%r9b
	vmovd	%r9d, %xmm0
	vpbroadcastb	%xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	movabsq	$.LCPI4_2, %r9
	vmovdqa	(%r9), %xmm3
	.p2align	4
.LBB4_87:
	vmovq	(%rsi,%r8), %xmm4
	vpcmpeqb	%xmm1, %xmm4, %xmm4
	vpxor	%xmm2, %xmm4, %xmm4
	vpmovzxbw	%xmm4, %xmm4
	vpxor	%xmm4, %xmm0, %xmm4
	vpand	%xmm3, %xmm4, %xmm4
	vpackuswb	%xmm4, %xmm4, %xmm4
	vmovq	%xmm4, (%rax,%r8)
	addq	$8, %r8
	cmpq	%r8, %rdi
	jne	.LBB4_87
	cmpq	%rdi, %rbx
	jne	.LBB4_21
	jmp	.LBB4_96
.LBB4_89:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	testb	%r9b, %r9b
	setne	%r10b
	testb	%r8b, %r8b
	setne	%r11b
	xorb	%r10b, %r11b
	vmovd	%r11d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	xorl	%r10d, %r10d
	.p2align	4
.LBB4_90:
	vmovdqu	%ymm0, (%rax,%r10)
	vmovdqu	%ymm0, 32(%rax,%r10)
	vmovdqu	%ymm0, 64(%rax,%r10)
	vmovdqu	%ymm0, 96(%rax,%r10)
	subq	$-128, %r10
	cmpq	%r10, %rdi
	jne	.LBB4_90
	cmpq	%rdi, %rbx
	je	.LBB4_96
	testb	$120, %bl
	je	.LBB4_28
.LBB4_93:
	movq	%rdi, %r10
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	testb	%r9b, %r9b
	setne	%r9b
	testb	%r8b, %r8b
	setne	%r8b
	xorb	%r9b, %r8b
	vmovd	%r8d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	movabsq	$.LCPI4_0, %r8
	vpand	(%r8), %ymm0, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpackuswb	%xmm1, %xmm0, %xmm0
	.p2align	4
.LBB4_94:
	vmovq	%xmm0, (%rax,%r10)
	addq	$8, %r10
	cmpq	%r10, %rdi
	jne	.LBB4_94
	cmpq	%rdi, %rbx
	jne	.LBB4_28
.LBB4_96:
	movl	%ebx, %edx
	andl	$7, %edx
	leaq	-8(%rbx), %rdi
	movq	%rdi, %r8
	shrq	$3, %r8
	jne	.LBB4_63
.LBB4_97:
	xorl	%r15d, %r15d
	movq	%rax, %rsi
	jmp	.LBB4_66
.LBB4_98:
	movabsq	$.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209.9, %rax
	jmp	.LBB4_3
.Lfunc_end4:
	.size	_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, .Lfunc_end4-_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE
	.cfi_endproc

	.weak	NRT_decref
	.p2align	4
	.type	NRT_decref,@function
NRT_decref:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.LBB5_2
	#MEMBARRIER
	lock		decq	(%rdi)
	je	.LBB5_3
.LBB5_2:
	retq
.LBB5_3:
	#MEMBARRIER
	movabsq	$NRT_MemInfo_call_dtor, %rax
	jmpq	*%rax
.Lfunc_end5:
	.size	NRT_decref, .Lfunc_end5-NRT_decref
	.cfi_endproc

	.weak	_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,@function
_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx:
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
	jle	.LBB6_8
	movq	80(%rsp), %rax
	movq	64(%rsp), %r10
	movq	56(%rsp), %rcx
	leaq	(%rbx,%rax), %rdx
	movl	%r11d, %esi
	andl	$3, %esi
	cmpq	$3, %r11
	ja	.LBB6_3
	shlq	$3, %r10
	xorl	%r11d, %r11d
	movq	%r10, %r8
	jmp	.LBB6_6
.LBB6_3:
	movq	%rdi, -8(%rsp)
	movabsq	$9223372036854775804, %r8
	andq	%r8, %r11
	leaq	(%rcx,%rax,8), %rdi
	leaq	(,%r10,8), %r8
	addq	%rax, %rbx
	decq	%rbx
	xorl	%r14d, %r14d
	.p2align	4
.LBB6_4:
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
	jne	.LBB6_4
	testq	%rsi, %rsi
	movq	-8(%rsp), %rdi
	je	.LBB6_8
.LBB6_6:
	movq	%r11, %r9
	notq	%r9
	addq	%r9, %rdx
	addq	%r11, %rax
	.p2align	4
.LBB6_7:
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
	jne	.LBB6_7
.LBB6_8:
	movq	$0, (%rdi)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end6:
	.size	_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end6-_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx

	.type	.const._delta_minimization_order,@object
	.section	.lrodata,"al",@progbits
	.p2align	4, 0x0
.const._delta_minimization_order:
	.asciz	"_delta_minimization_order"
	.size	.const._delta_minimization_order, 26

	.type	_ZN08NumbaEnv15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29,@object
	.comm	_ZN08NumbaEnv15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29":
	.asciz	"missing Environment: _ZN08NumbaEnv15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29"
	.size	".const.missing Environment: _ZN08NumbaEnv15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29", 210

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

	.type	_ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@object
	.comm	_ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,8,8
	.type	.const.pickledata.c609a61042a044ba6291d5da2e507179b42ccfbc,@object
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

	.type	_ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE,@object
	.comm	_ZN08NumbaEnv15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE,8,8
	.type	_ZN08NumbaEnv13_3cdynamic_3e33__numba_array_expr_0x74cedf0377a0B3v11B72c8tJTIeFIjxB2IKSgI4CrvQCk0Z4yRYcWsBAQ4s_2fqEpEUkESQI1_2bmEQRxHRNAA_3d_3dEbb,@object
	.comm	_ZN08NumbaEnv13_3cdynamic_3e33__numba_array_expr_0x74cedf0377a0B3v11B72c8tJTIeFIjxB2IKSgI4CrvQCk0Z4yRYcWsBAQ4s_2fqEpEUkESQI1_2bmEQRxHRNAA_3d_3dEbb,8,8
	.type	_ZN08NumbaEnv5numba2np7npyimpl15_broadcast_ontoB3v12B42c8tJTC_2fWQA93W1AaAIYBPIqRBFCjDSZRVAJmaQIAEx8int64_2ax8int64_2a,@object
	.comm	_ZN08NumbaEnv5numba2np7npyimpl15_broadcast_ontoB3v12B42c8tJTC_2fWQA93W1AaAIYBPIqRBFCjDSZRVAJmaQIAEx8int64_2ax8int64_2a,8,8
	.type	_ZN08NumbaEnv5numba2np8arrayobj15_call_allocatorB2v6B42c8tJTC_2fWQA93W1AaAIYBPIqRBFCjDSZRVAJmaQIAEN29typeref_5b_3cclass_20_27numba4core5types8npytypes14Array_27_3e_5dExj,@object
	.comm	_ZN08NumbaEnv5numba2np8arrayobj15_call_allocatorB2v6B42c8tJTC_2fWQA93W1AaAIYBPIqRBFCjDSZRVAJmaQIAEN29typeref_5b_3cclass_20_27numba4core5types8npytypes14Array_27_3e_5dExj,8,8
	.type	_ZN08NumbaEnv5numba2np8arrayobj18_ol_array_allocate12_3clocals_3e4implB2v7B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEN29typeref_5b_3cclass_20_27numba4core5types8npytypes14Array_27_3e_5dExj,@object
	.comm	_ZN08NumbaEnv5numba2np8arrayobj18_ol_array_allocate12_3clocals_3e4implB2v7B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEN29typeref_5b_3cclass_20_27numba4core5types8npytypes14Array_27_3e_5dExj,8,8
	.type	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.10,@object
	.p2align	4, 0x0
.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.10:
	.ascii	"\200\004\225K\000\000\000\000\000\000\000\214\bbuiltins\224\214\013MemoryError\224\223\224\214'Allocation failed (probably too large).\224\205\224N\207\224."
	.size	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.10, 86

	.type	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.sha1.11,@object
	.p2align	4, 0x0
.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.sha1.11:
	.ascii	"\272(\235\201\360\\p \363G|\025sH\004\337e\253\342\t"
	.size	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.sha1.11, 20

	.type	.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209.9,@object
	.p2align	4, 0x0
.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209.9:
	.quad	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.10
	.long	86
	.zero	4
	.quad	.const.pickledata.ba289d81f05c7020f3477c15734804df65abe209.sha1.11
	.quad	0
	.long	0
	.zero	4
	.size	.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209.9, 40

	.type	_ZN08NumbaEnv5numba2np9arraymath9array_sum12_3clocals_3e14array_sum_implB3v13B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dE5ArrayIbLi1E1C7mutable7alignedE27omitted_28default_3dNone_2927omitted_28default_3dNone_29,@object
	.comm	_ZN08NumbaEnv5numba2np9arraymath9array_sum12_3clocals_3e14array_sum_implB3v13B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dE5ArrayIbLi1E1C7mutable7alignedE27omitted_28default_3dNone_2927omitted_28default_3dNone_29,8,8
	.type	_ZN08NumbaEnv15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,@object
	.comm	_ZN08NumbaEnv15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,8,8
	.section	".note.GNU-stack","",@progbits
