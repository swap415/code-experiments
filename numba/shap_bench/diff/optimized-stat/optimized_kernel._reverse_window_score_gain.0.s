	.file	"<string>"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI0_0:
	.quad	1
	.section	.ltext,"axl",@progbits
	.globl	_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@function
_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx:
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
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	72(%rsp), %rax
	testq	%rax, %rax
	jle	.LBB0_1
	movq	152(%rsp), %rcx
	movq	136(%rsp), %rdx
	movq	128(%rsp), %rsi
	movq	64(%rsp), %r10
	movq	56(%rsp), %r8
	movq	160(%rsp), %r9
	addq	%rcx, %r9
	leaq	(%rsi,%r9,8), %r14
	movq	%r9, %r11
	sarq	$63, %r11
	andq	%rdx, %r11
	movq	(%r14,%r11,8), %rbx
	xorl	%r11d, %r11d
	testq	%r9, %r9
	movq	%rdx, %r9
	cmovgq	%r11, %r9
	movq	-8(%r14,%r9,8), %r9
	leaq	(%rsi,%rcx,8), %rsi
	movq	%rcx, %r14
	sarq	$63, %r14
	andq	%rdx, %r14
	movq	(%rsi,%r14,8), %r14
	testq	%rcx, %rcx
	cmovgq	%r11, %rdx
	movq	-8(%rsi,%rdx,8), %rdx
	movq	%rdx, %rcx
	sarq	$63, %rcx
	andq	%r10, %rcx
	addq	%rdx, %rcx
	imulq	%rax, %rcx
	movq	%r14, %rdx
	sarq	$63, %rdx
	andq	%r10, %rdx
	addq	%r14, %rdx
	imulq	%rax, %rdx
	movq	%r9, %rsi
	sarq	$63, %rsi
	andq	%r10, %rsi
	addq	%r9, %rsi
	imulq	%rax, %rsi
	movq	%rbx, %r9
	sarq	$63, %r9
	andq	%r10, %r9
	addq	%rbx, %r9
	imulq	%rax, %r9
	movl	$0, %r10d
	cmpq	$8, %rax
	jb	.LBB0_6
	movabsq	$9223372036854775800, %r10
	andq	%rax, %r10
	leaq	(%r9,%r8), %r11
	addq	$4, %r11
	leaq	4(%rsi,%r8), %rbx
	leaq	(%rdx,%r8), %r14
	addq	$4, %r14
	leaq	(%rcx,%r8), %r15
	addq	$4, %r15
	vpxor	%xmm3, %xmm3, %xmm3
	xorl	%r12d, %r12d
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	movabsq	$.LCPI0_0, %r13
	vpbroadcastq	(%r13), %ymm2
	vpxor	%xmm4, %xmm4, %xmm4
	.p2align	4
.LBB0_4:
	vmovd	-4(%r15,%r12), %xmm5
	vmovd	(%r15,%r12), %xmm6
	vpcmpeqb	%xmm0, %xmm5, %xmm5
	vpxor	%xmm1, %xmm5, %xmm5
	vpmovsxbd	%xmm5, %xmm8
	vpcmpeqb	%xmm0, %xmm6, %xmm5
	vpxor	%xmm1, %xmm5, %xmm5
	vpmovsxbd	%xmm5, %xmm6
	vmovd	-4(%r14,%r12), %xmm5
	vpcmpeqb	%xmm0, %xmm5, %xmm5
	vpxor	%xmm1, %xmm5, %xmm5
	vpmovsxbd	%xmm5, %xmm5
	vmovd	-4(%rbx,%r12), %xmm7
	vpcmpeqb	%xmm0, %xmm7, %xmm7
	vpxor	%xmm1, %xmm7, %xmm7
	vpmovsxbd	%xmm7, %xmm7
	vpxor	%xmm7, %xmm8, %xmm9
	vpmovsxdq	%xmm9, %ymm9
	vpaddq	%ymm3, %ymm9, %ymm3
	vmovd	(%rbx,%r12), %xmm9
	vpcmpeqb	%xmm0, %xmm9, %xmm9
	vpxor	%xmm1, %xmm9, %xmm9
	vpmovsxbd	%xmm9, %xmm9
	vpxor	%xmm5, %xmm8, %xmm8
	vpmovzxdq	%xmm8, %ymm8
	vpand	%ymm2, %ymm8, %ymm8
	vpaddq	%ymm3, %ymm8, %ymm3
	vpxor	%xmm6, %xmm9, %xmm8
	vpmovsxdq	%xmm8, %ymm8
	vpaddq	%ymm4, %ymm8, %ymm4
	vmovd	(%r14,%r12), %xmm8
	vpcmpeqb	%xmm0, %xmm8, %xmm8
	vpxor	%xmm1, %xmm8, %xmm8
	vpmovsxbd	%xmm8, %xmm8
	vpxor	%xmm6, %xmm8, %xmm6
	vpmovzxdq	%xmm6, %ymm6
	vpand	%ymm2, %ymm6, %ymm6
	vpaddq	%ymm6, %ymm4, %ymm4
	vmovd	-4(%r11,%r12), %xmm6
	vpcmpeqb	%xmm0, %xmm6, %xmm6
	vpxor	%xmm1, %xmm6, %xmm6
	vpmovsxbd	%xmm6, %xmm6
	vpxor	%xmm6, %xmm7, %xmm7
	vpxor	%xmm6, %xmm5, %xmm5
	vmovd	(%r11,%r12), %xmm6
	vpcmpeqb	%xmm0, %xmm6, %xmm6
	vpxor	%xmm1, %xmm6, %xmm6
	vpmovsxbd	%xmm6, %xmm6
	vpxor	%xmm6, %xmm9, %xmm9
	vpxor	%xmm6, %xmm8, %xmm6
	vpmovzxdq	%xmm7, %ymm7
	vpand	%ymm2, %ymm7, %ymm7
	vpmovsxdq	%xmm5, %ymm5
	vpaddq	%ymm7, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm3, %ymm3
	vpmovzxdq	%xmm9, %ymm5
	vpand	%ymm2, %ymm5, %ymm5
	vpmovsxdq	%xmm6, %ymm6
	vpaddq	%ymm5, %ymm6, %ymm5
	vpaddq	%ymm5, %ymm4, %ymm4
	addq	$8, %r12
	cmpq	%r12, %r10
	jne	.LBB0_4
	vpaddq	%ymm3, %ymm4, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpshufd	$238, %xmm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %r11
	cmpq	%r10, %rax
	je	.LBB0_8
.LBB0_6:
	addq	%r8, %rcx
	addq	%r8, %rdx
	addq	%r8, %rsi
	addq	%r8, %r9
	movq	%r11, %r8
	.p2align	4
.LBB0_7:
	cmpb	$0, (%rcx,%r10)
	setne	%bl
	cmpb	$0, (%rdx,%r10)
	setne	%bpl
	cmpb	$0, (%rsi,%r10)
	setne	%r14b
	cmpb	$0, (%r9,%r10)
	leaq	1(%r10), %r10
	setne	%r15b
	movl	%ebx, %r11d
	xorb	%bpl, %r11b
	movzbl	%r11b, %r11d
	addq	%r8, %r11
	xorb	%r14b, %bl
	xorb	%r15b, %r14b
	movzbl	%r14b, %r8d
	xorb	%r15b, %bpl
	movzbl	%bl, %ebx
	subq	%rbx, %r11
	movzbl	%bpl, %ebx
	subq	%rbx, %r11
	addq	%r8, %r11
	movq	%r11, %r8
	cmpq	%r10, %rax
	jne	.LBB0_7
	jmp	.LBB0_8
.LBB0_1:
	xorl	%r11d, %r11d
.LBB0_8:
	movq	%r11, (%rdi)
	xorl	%eax, %eax
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
.Lfunc_end0:
	.size	_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end0-_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.cfi_endproc

	.globl	_ZN7cpython16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	_ZN7cpython16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@function
_ZN7cpython16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx:
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
	subq	$344, %rsp
	.cfi_def_cfa_offset 400
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rdi
	leaq	176(%rsp), %rax
	movq	%rax, 8(%rsp)
	leaq	184(%rsp), %rax
	movq	%rax, (%rsp)
	movabsq	$.const._reverse_window_score_gain, %rsi
	movabsq	$PyArg_UnpackTuple, %r10
	leaq	200(%rsp), %r8
	leaq	192(%rsp), %r9
	movl	$4, %edx
	movl	$4, %ecx
	xorl	%eax, %eax
	callq	*%r10
	movq	$0, 112(%rsp)
	testl	%eax, %eax
	je	.LBB1_1
	movabsq	$_ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	cmpq	$0, (%rax)
	je	.LBB1_4
	movq	200(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 272(%rsp)
	vmovups	%ymm0, 304(%rsp)
	movq	$0, 336(%rsp)
	movabsq	$NRT_adapt_ndarray_from_python, %rbx
	leaq	272(%rsp), %rsi
	vzeroupper
	callq	*%rbx
	cmpq	$1, 296(%rsp)
	setne	%cl
	testl	%eax, %eax
	setne	%bpl
	orb	%cl, %bpl
	cmpb	$1, %bpl
	je	.LBB1_7
	testb	%bpl, %bpl
	jne	.LBB1_1
.LBB1_9:
	movq	272(%rsp), %r14
	movq	304(%rsp), %r15
	movq	312(%rsp), %r12
	movq	320(%rsp), %r13
	movq	192(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 208(%rsp)
	vmovups	%ymm0, 232(%rsp)
	leaq	208(%rsp), %rsi
	vzeroupper
	callq	*%rbx
	testl	%eax, %eax
	jne	.LBB1_11
	cmpq	$8, 232(%rsp)
	jne	.LBB1_11
	movq	%r13, 152(%rsp)
	movq	%r12, 160(%rsp)
	movq	%r15, 168(%rsp)
	movq	208(%rsp), %rax
	movq	%rax, 120(%rsp)
	movq	240(%rsp), %rax
	movq	%rax, 144(%rsp)
	movq	248(%rsp), %rax
	movq	%rax, 136(%rsp)
	movq	184(%rsp), %rdi
	movabsq	$PyNumber_Long, %r13
	callq	*%r13
	movabsq	$PyLong_AsLongLong, %rbx
	movabsq	$Py_DecRef, %rbp
	testq	%rax, %rax
	movq	%r14, 128(%rsp)
	je	.LBB1_15
	movq	%rax, %r12
	movq	%rax, %rdi
	callq	*%rbx
	movq	%rax, %r15
	movq	%r12, %rdi
	callq	*%rbp
	movabsq	$PyErr_Occurred, %r14
	callq	*%r14
	testq	%rax, %rax
	jne	.LBB1_16
.LBB1_19:
	movq	176(%rsp), %rdi
	callq	*%r13
	testq	%rax, %rax
	je	.LBB1_20
	movq	%rax, %r13
	movq	%rax, %rdi
	callq	*%rbx
	movq	%rax, %r12
	movq	%r13, %rdi
	callq	*%rbp
	callq	*%r14
	testq	%rax, %rax
	jne	.LBB1_16
.LBB1_23:
	movq	$0, 112(%rsp)
	movq	%r12, 104(%rsp)
	movq	%r15, 96(%rsp)
	movq	136(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	144(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	152(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	160(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	168(%rsp), %rax
	movq	%rax, (%rsp)
	movabsq	$_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	leaq	112(%rsp), %rdi
	movq	128(%rsp), %r14
	movq	%r14, %rdx
	callq	*%rax
	movl	%eax, %ebp
	movq	112(%rsp), %r15
	movabsq	$NRT_decref, %rbx
	movq	%r14, %rdi
	callq	*%rbx
	movq	120(%rsp), %rdi
	callq	*%rbx
	testl	%ebp, %ebp
	jne	.LBB1_24
	movabsq	$PyLong_FromLongLong, %rax
	movq	%r15, %rdi
	callq	*%rax
.LBB1_2:
	addq	$344, %rsp
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
.LBB1_24:
	.cfi_def_cfa_offset 400
	jg	.LBB1_30
	cmpl	$-1, %ebp
	je	.LBB1_1
	cmpl	$-3, %ebp
	jne	.LBB1_28
	movabsq	$PyExc_StopIteration, %rdi
	movabsq	$PyErr_SetNone, %rax
	callq	*%rax
	jmp	.LBB1_1
.LBB1_4:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.missing Environment: _ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx", %rsi
	jmp	.LBB1_5
.LBB1_7:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	testb	%bpl, %bpl
	je	.LBB1_9
	jmp	.LBB1_1
.LBB1_11:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	jmp	.LBB1_12
.LBB1_15:
	xorl	%r15d, %r15d
	movabsq	$PyErr_Occurred, %r14
	callq	*%r14
	testq	%rax, %rax
	je	.LBB1_19
	jmp	.LBB1_16
.LBB1_20:
	xorl	%r12d, %r12d
	callq	*%r14
	testq	%rax, %rax
	je	.LBB1_23
.LBB1_16:
	movabsq	$NRT_decref, %rax
	movq	120(%rsp), %rdi
	callq	*%rax
	movq	128(%rsp), %r14
.LBB1_12:
	movabsq	$NRT_decref, %rax
	movq	%r14, %rdi
	callq	*%rax
	jmp	.LBB1_1
.LBB1_28:
	movabsq	$PyExc_SystemError, %rdi
	movabsq	$".const.unknown error when calling native function", %rsi
.LBB1_5:
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
.LBB1_1:
	xorl	%eax, %eax
	jmp	.LBB1_2
.LBB1_30:
	movabsq	$PyErr_Clear, %rax
	callq	*%rax
.Lfunc_end1:
	.size	_ZN7cpython16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end1-_ZN7cpython16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.cfi_endproc

	.globl	cfunc._ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	cfunc._ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@function
cfunc._ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$136, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rdx
	movq	160(%rsp), %rax
	vmovups	216(%rsp), %xmm0
	vmovaps	240(%rsp), %xmm1
	movq	$0, 128(%rsp)
	vmovups	%xmm1, 96(%rsp)
	vmovups	%xmm0, 72(%rsp)
	movq	%rax, 16(%rsp)
	movq	%r9, 8(%rsp)
	movq	%r8, (%rsp)
	movabsq	$_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	leaq	128(%rsp), %rdi
	callq	*%rax
	movq	128(%rsp), %rcx
	movl	$0, 124(%rsp)
	testl	%eax, %eax
	jne	.LBB2_1
.LBB2_5:
	movq	%rcx, %rax
	addq	$136, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB2_1:
	.cfi_def_cfa_offset 160
	movq	%rcx, %r14
	movabsq	$numba_gil_ensure, %rcx
	leaq	124(%rsp), %rdi
	movl	%eax, %ebx
	callq	*%rcx
	testl	%ebx, %ebx
	jg	.LBB2_2
	movl	%ebx, %eax
	cmpl	$-1, %ebx
	je	.LBB2_4
	cmpl	$-3, %eax
	jne	.LBB2_3
	movabsq	$PyExc_StopIteration, %rdi
	movabsq	$PyErr_SetNone, %rax
	callq	*%rax
	jmp	.LBB2_4
.LBB2_3:
	movabsq	$PyExc_SystemError, %rdi
	movabsq	$".const.unknown error when calling native function.2", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
.LBB2_4:
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
	leaq	124(%rsp), %rdi
	callq	*%rax
	movq	%r14, %rcx
	jmp	.LBB2_5
.LBB2_2:
	movabsq	$PyErr_Clear, %rax
	callq	*%rax
.Lfunc_end2:
	.size	cfunc._ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end2-cfunc._ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
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

	.type	.const._reverse_window_score_gain,@object
	.section	.lrodata,"al",@progbits
	.p2align	4, 0x0
.const._reverse_window_score_gain:
	.asciz	"_reverse_window_score_gain"
	.size	.const._reverse_window_score_gain, 27

	.type	_ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@object
	.comm	_ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx":
	.asciz	"missing Environment: _ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx"
	.size	".const.missing Environment: _ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx", 192

	.type	".const.can't unbox array from PyObject into native value.  The object maybe of a different type",@object
	.p2align	4, 0x0
".const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"
	.size	".const.can't unbox array from PyObject into native value.  The object maybe of a different type", 89

	.type	".const.unknown error when calling native function",@object
	.p2align	4, 0x0
".const.unknown error when calling native function":
	.asciz	"unknown error when calling native function"
	.size	".const.unknown error when calling native function", 43

	.type	".const.unknown error when calling native function.2",@object
	.p2align	4, 0x0
".const.unknown error when calling native function.2":
	.asciz	"unknown error when calling native function"
	.size	".const.unknown error when calling native function.2", 43

	.type	".const.<numba.core.cpu.CPUContext>",@object
	.p2align	4, 0x0
".const.<numba.core.cpu.CPUContext>":
	.asciz	"<numba.core.cpu.CPUContext>"
	.size	".const.<numba.core.cpu.CPUContext>", 28

	.type	_ZN08NumbaEnv5numba7cpython8builtins6ol_int12_3clocals_3e4implB3v17B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEb,@object
	.comm	_ZN08NumbaEnv5numba7cpython8builtins6ol_int12_3clocals_3e4implB3v17B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEb,8,8
	.section	".note.GNU-stack","",@progbits
