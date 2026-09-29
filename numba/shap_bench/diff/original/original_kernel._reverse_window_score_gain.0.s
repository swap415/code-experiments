	.file	"<string>"
	.section	.ltext,"axl",@progbits
	.globl	_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
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
	jne	.LBB0_6
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
	jne	.LBB0_8
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
	jne	.LBB0_9
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
	jne	.LBB0_10
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
.LBB0_5:
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
.LBB0_6:
	.cfi_def_cfa_offset 208
	movq	80(%rsp), %rax
	jmp	.LBB0_7
.LBB0_8:
	movq	64(%rsp), %rax
	jmp	.LBB0_7
.LBB0_9:
	movq	48(%rsp), %rax
	jmp	.LBB0_7
.LBB0_10:
	movq	32(%rsp), %rax
.LBB0_7:
	movq	8(%rsp), %rcx
	movq	%rax, (%rcx)
	movl	$1, %eax
	jmp	.LBB0_5
.Lfunc_end0:
	.size	_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end0-_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.cfi_endproc

	.globl	_ZN7cpython15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	_ZN7cpython15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@function
_ZN7cpython15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx:
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
	subq	$376, %rsp
	.cfi_def_cfa_offset 432
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rdi
	leaq	208(%rsp), %rax
	movq	%rax, 8(%rsp)
	leaq	216(%rsp), %rax
	movq	%rax, (%rsp)
	movabsq	$.const._reverse_window_score_gain, %rsi
	movabsq	$PyArg_UnpackTuple, %r10
	leaq	232(%rsp), %r8
	leaq	224(%rsp), %r9
	movl	$4, %edx
	movl	$4, %ecx
	xorl	%eax, %eax
	callq	*%r10
	movq	$0, 120(%rsp)
	movq	$0, 144(%rsp)
	testl	%eax, %eax
	je	.LBB1_28
	movabsq	$_ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	cmpq	$0, (%rax)
	je	.LBB1_16
	movq	232(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 240(%rsp)
	vmovups	%ymm0, 272(%rsp)
	movq	$0, 304(%rsp)
	movabsq	$NRT_adapt_ndarray_from_python, %rbx
	leaq	240(%rsp), %rsi
	vzeroupper
	callq	*%rbx
	cmpq	$1, 264(%rsp)
	setne	%cl
	testl	%eax, %eax
	setne	%bpl
	orb	%cl, %bpl
	cmpb	$1, %bpl
	je	.LBB1_18
	testb	%bpl, %bpl
	jne	.LBB1_28
.LBB1_4:
	movq	240(%rsp), %r14
	movq	248(%rsp), %r15
	movq	272(%rsp), %r12
	movq	280(%rsp), %r13
	movq	288(%rsp), %rbp
	movq	304(%rsp), %rax
	movq	%rax, 200(%rsp)
	movq	224(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 320(%rsp)
	vmovups	%ymm0, 344(%rsp)
	leaq	320(%rsp), %rsi
	vzeroupper
	callq	*%rbx
	testl	%eax, %eax
	jne	.LBB1_19
	cmpq	$8, 344(%rsp)
	jne	.LBB1_19
	movq	%rbp, 168(%rsp)
	movq	%r13, 176(%rsp)
	movq	%r12, 184(%rsp)
	movq	%r15, 192(%rsp)
	movq	%r14, 136(%rsp)
	movq	320(%rsp), %rax
	movq	%rax, 128(%rsp)
	movq	352(%rsp), %rax
	movq	%rax, 160(%rsp)
	movq	360(%rsp), %rax
	movq	%rax, 152(%rsp)
	movq	216(%rsp), %rdi
	movabsq	$PyNumber_Long, %rbp
	callq	*%rbp
	movabsq	$PyLong_AsLongLong, %rbx
	movabsq	$Py_DecRef, %r14
	testq	%rax, %rax
	je	.LBB1_20
	movq	%rax, %r13
	movq	%rax, %rdi
	callq	*%rbx
	movq	%rax, %r12
	movq	%r13, %rdi
	movq	%r14, %r15
	callq	*%r14
	movabsq	$PyErr_Occurred, %r14
	callq	*%r14
	testq	%rax, %rax
	jne	.LBB1_22
.LBB1_8:
	movq	208(%rsp), %rdi
	callq	*%rbp
	testq	%rax, %rax
	je	.LBB1_21
	movq	%rax, %rbp
	movq	%rax, %rdi
	callq	*%rbx
	movq	%rax, %r13
	movq	%rbp, %rdi
	callq	*%r15
	callq	*%r14
	testq	%rax, %rax
	jne	.LBB1_22
.LBB1_10:
	movq	$0, 120(%rsp)
	movq	%r13, 104(%rsp)
	movq	%r12, 96(%rsp)
	movq	152(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	160(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	128(%rsp), %r15
	movq	%r15, 40(%rsp)
	movq	200(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	168(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	176(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	184(%rsp), %rax
	movq	%rax, (%rsp)
	movabsq	$_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	leaq	120(%rsp), %rdi
	leaq	144(%rsp), %rsi
	movl	$1, %r9d
	movq	136(%rsp), %r13
	movq	%r13, %rdx
	movq	192(%rsp), %rcx
	callq	*%rax
	movl	%eax, %ebp
	movq	144(%rsp), %r14
	movq	120(%rsp), %r12
	movabsq	$NRT_decref, %rbx
	movq	%r13, %rdi
	callq	*%rbx
	movq	%r15, %rdi
	callq	*%rbx
	testl	%ebp, %ebp
	jne	.LBB1_13
	movabsq	$PyLong_FromLongLong, %rax
	movq	%r12, %rdi
	callq	*%rax
.LBB1_12:
	addq	$376, %rsp
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
.LBB1_13:
	.cfi_def_cfa_offset 432
	movabsq	$PyErr_Clear, %rax
	callq	*%rax
	movl	8(%r14), %esi
	movq	(%r14), %rdi
	cmpl	$0, 32(%r14)
	jle	.LBB1_24
	movslq	%esi, %rsi
	movabsq	$PyBytes_FromStringAndSize, %rax
	callq	*%rax
	movq	%rax, %rbx
	movq	16(%r14), %rdi
	callq	*24(%r14)
	testq	%rax, %rax
	je	.LBB1_29
	movabsq	$numba_runtime_build_excinfo_struct, %rcx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	*%rcx
	movq	%rax, %rbx
	movabsq	$NRT_Free, %rax
	movq	%r14, %rdi
	callq	*%rax
	jmp	.LBB1_25
.LBB1_16:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.missing Environment: _ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx", %rsi
.LBB1_17:
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	jmp	.LBB1_28
.LBB1_18:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	testb	%bpl, %bpl
	je	.LBB1_4
	jmp	.LBB1_28
.LBB1_19:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	jmp	.LBB1_23
.LBB1_20:
	movq	%r14, %r15
	xorl	%r12d, %r12d
	movabsq	$PyErr_Occurred, %r14
	callq	*%r14
	testq	%rax, %rax
	je	.LBB1_8
	jmp	.LBB1_22
.LBB1_21:
	xorl	%r13d, %r13d
	callq	*%r14
	testq	%rax, %rax
	je	.LBB1_10
.LBB1_22:
	movabsq	$NRT_decref, %rax
	movq	128(%rsp), %rdi
	callq	*%rax
	movq	136(%rsp), %r14
.LBB1_23:
	movabsq	$NRT_decref, %rax
	movq	%r14, %rdi
	jmp	.LBB1_27
.LBB1_24:
	movq	16(%r14), %rdx
	movabsq	$numba_unpickle, %rax
	callq	*%rax
	movq	%rax, %rbx
.LBB1_25:
	testq	%rbx, %rbx
	je	.LBB1_28
	movabsq	$numba_do_raise, %rax
	movq	%rbx, %rdi
.LBB1_27:
	callq	*%rax
.LBB1_28:
	xorl	%eax, %eax
	jmp	.LBB1_12
.LBB1_29:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.Error creating Python tuple from runtime exception arguments", %rsi
	jmp	.LBB1_17
.Lfunc_end1:
	.size	_ZN7cpython15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end1-_ZN7cpython15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.cfi_endproc

	.globl	cfunc._ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	cfunc._ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@function
cfunc._ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$144, %rsp
	.cfi_def_cfa_offset 176
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rcx, %rax
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	176(%rsp), %rsi
	vmovaps	192(%rsp), %xmm0
	vmovups	232(%rsp), %xmm1
	vmovaps	256(%rsp), %xmm2
	movq	$0, 136(%rsp)
	movq	$0, 128(%rsp)
	vmovups	%xmm2, 96(%rsp)
	vmovups	%xmm1, 72(%rsp)
	vmovups	%xmm0, 32(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%r9, 8(%rsp)
	movq	%r8, (%rsp)
	movabsq	$_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, %r8
	leaq	136(%rsp), %rdi
	leaq	128(%rsp), %rsi
	movq	%rax, %r9
	callq	*%r8
	movl	%eax, %ecx
	movq	128(%rsp), %rbx
	movq	136(%rsp), %rax
	movl	$0, 124(%rsp)
	testl	%ecx, %ecx
	jne	.LBB2_1
.LBB2_5:
	addq	$144, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB2_1:
	.cfi_def_cfa_offset 176
	movq	%rax, %r15
	movabsq	$numba_gil_ensure, %rax
	leaq	124(%rsp), %rdi
	callq	*%rax
	movabsq	$PyErr_Clear, %rax
	callq	*%rax
	movl	8(%rbx), %esi
	movq	(%rbx), %rdi
	cmpl	$0, 32(%rbx)
	jle	.LBB2_6
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
	jmp	.LBB2_7
.LBB2_6:
	movq	16(%rbx), %rdx
	movabsq	$numba_unpickle, %rax
	callq	*%rax
	movq	%rax, %r14
.LBB2_7:
	testq	%r14, %r14
	je	.LBB2_4
	movabsq	$numba_do_raise, %rax
	movq	%r14, %rdi
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
	movq	%r15, %rax
	jmp	.LBB2_5
.LBB2_3:
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.Error creating Python tuple from runtime exception arguments.1", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	xorl	%eax, %eax
	jmp	.LBB2_5
.Lfunc_end2:
	.size	cfunc._ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end2-cfunc._ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx
	.cfi_endproc

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI3_0:
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
.LCPI3_1:
	.zero	32,1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI3_2:
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
	je	.LBB3_4
	cmpq	%rbp, %r15
	setne	%al
	cmpq	$1, %r15
	setne	%cl
	movq	%rbp, %rbx
	testb	%al, %cl
	je	.LBB3_4
	movabsq	$.const.picklebuf.c609a61042a044ba6291d5da2e507179b42ccfbc, %rax
.LBB3_3:
	movq	%rax, (%r12)
	movl	$1, %r12d
	jmp	.LBB3_72
.LBB3_4:
	movq	%r13, 8(%rsp)
	movabsq	$NRT_MemInfo_alloc_aligned, %rax
	movq	%rbx, %rdi
	movl	$32, %esi
	callq	*%rax
	testq	%rax, %rax
	je	.LBB3_98
	movq	%rax, %r13
	xorl	%r12d, %r12d
	testq	%rbx, %rbx
	jle	.LBB3_10
	movq	136(%rsp), %rdx
	movq	80(%rsp), %rsi
	movq	24(%r13), %rax
	movabsq	$9223372036854775800, %rcx
	cmpq	$2, %rbp
	jb	.LBB3_11
	cmpq	$1, %r15
	jbe	.LBB3_19
	cmpq	$8, %rbx
	jb	.LBB3_9
	movq	%rax, %rdi
	subq	%rsi, %rdi
	cmpq	$128, %rdi
	setb	%dil
	movq	%rax, %r8
	subq	%rdx, %r8
	cmpq	$128, %r8
	setb	%r8b
	orb	%dil, %r8b
	je	.LBB3_47
.LBB3_9:
	xorl	%edi, %edi
.LBB3_56:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB3_59
	movq	%rdi, %r8
	.p2align	4
.LBB3_58:
	cmpb	$0, (%rsi,%r8)
	setne	%r10b
	cmpb	$0, (%rdx,%r8)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB3_58
.LBB3_59:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB3_61
	.p2align	4
.LBB3_60:
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
	jne	.LBB3_60
	jmp	.LBB3_61
.LBB3_10:
	xorl	%r15d, %r15d
	movq	104(%rsp), %rdi
	jmp	.LBB3_71
.LBB3_11:
	cmpq	$1, %r15
	jbe	.LBB3_26
	cmpq	$8, %rbx
	jae	.LBB3_35
	xorl	%edi, %edi
.LBB3_14:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB3_17
	movq	%rdi, %r8
	.p2align	4
.LBB3_16:
	cmpb	$0, (%rsi)
	setne	%r10b
	cmpb	$0, (%rdx,%r8)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB3_16
.LBB3_17:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB3_61
	.p2align	4
.LBB3_18:
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
	jne	.LBB3_18
	jmp	.LBB3_61
.LBB3_19:
	cmpq	$8, %rbx
	jae	.LBB3_39
	xorl	%edi, %edi
.LBB3_21:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB3_24
	movq	%rdi, %r8
	.p2align	4
.LBB3_23:
	cmpb	$0, (%rsi,%r8)
	setne	%r10b
	cmpb	$0, (%rdx)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB3_23
.LBB3_24:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB3_61
	.p2align	4
.LBB3_25:
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
	jne	.LBB3_25
	jmp	.LBB3_61
.LBB3_26:
	cmpq	$8, %rbx
	jae	.LBB3_43
	xorl	%edi, %edi
.LBB3_28:
	movq	%rbx, %r9
	movq	%rdi, %r8
	andq	$3, %r9
	je	.LBB3_31
	movq	%rdi, %r8
	.p2align	4
.LBB3_30:
	cmpb	$0, (%rsi)
	setne	%r10b
	cmpb	$0, (%rdx)
	setne	%r11b
	xorb	%r10b, %r11b
	movb	%r11b, (%rax,%r8)
	incq	%r8
	decq	%r9
	jne	.LBB3_30
.LBB3_31:
	subq	%rbx, %rdi
	cmpq	$-4, %rdi
	ja	.LBB3_61
	.p2align	4
.LBB3_32:
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
	jne	.LBB3_32
.LBB3_61:
	movl	%ebx, %edx
	andl	$7, %edx
	cmpq	$8, %rbx
	jb	.LBB3_74
	leaq	-8(%rbx), %rdi
	movq	%rdi, %r8
	shrq	$3, %r8
	je	.LBB3_97
.LBB3_63:
	incq	%r8
	andq	$-2, %r8
	xorl	%r15d, %r15d
	movq	%rax, %rsi
	.p2align	4
.LBB3_64:
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
	addq	$-2, %r8
	jne	.LBB3_64
	testb	$8, %dil
	jne	.LBB3_67
.LBB3_66:
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
.LBB3_67:
	testq	%rdx, %rdx
	je	.LBB3_73
	andq	%rcx, %rbx
	addq	%rbx, %rax
.LBB3_69:
	movq	104(%rsp), %rdi
	xorl	%ecx, %ecx
.LBB3_70:
	cmpb	$1, (%rax,%rcx)
	sbbq	$-1, %r15
	incq	%rcx
	cmpq	%rcx, %rdx
	jne	.LBB3_70
.LBB3_71:
	movabsq	$NRT_decref, %rbx
	vzeroupper
	callq	*%rbx
	movq	16(%rsp), %rdi
	callq	*%rbx
	movq	%r13, %rdi
	callq	*%rbx
	movq	8(%rsp), %rax
	movq	%r15, (%rax)
.LBB3_72:
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
.LBB3_35:
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
	jne	.LBB3_14
	andb	%r9b, %r8b
	jne	.LBB3_14
	cmpq	$128, %rbx
	jae	.LBB3_75
	xorl	%edi, %edi
	jmp	.LBB3_79
.LBB3_39:
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
	jne	.LBB3_21
	andb	%r9b, %r8b
	jne	.LBB3_21
	cmpq	$128, %rbx
	jae	.LBB3_82
	xorl	%edi, %edi
	jmp	.LBB3_86
.LBB3_43:
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
	jne	.LBB3_28
	andb	%r9b, %r8b
	jne	.LBB3_28
	movzbl	(%rdx), %r8d
	movzbl	(%rsi), %r9d
	cmpq	$128, %rbx
	jae	.LBB3_89
	xorl	%edi, %edi
	jmp	.LBB3_93
.LBB3_73:
	movq	104(%rsp), %rdi
	jmp	.LBB3_71
.LBB3_74:
	xorl	%r15d, %r15d
	jmp	.LBB3_69
.LBB3_47:
	cmpq	$128, %rbx
	jae	.LBB3_49
	xorl	%edi, %edi
	jmp	.LBB3_53
.LBB3_49:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	xorl	%r8d, %r8d
	vpxor	%xmm0, %xmm0, %xmm0
	movabsq	$.LCPI3_1, %r9
	vmovdqa	(%r9), %ymm1
	.p2align	4
.LBB3_50:
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
	jne	.LBB3_50
	cmpq	%rdi, %rbx
	je	.LBB3_96
	testb	$120, %bl
	je	.LBB3_56
.LBB3_53:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	vpxor	%xmm0, %xmm0, %xmm0
	movabsq	$.LCPI3_2, %r9
	vmovdqa	(%r9), %xmm1
	.p2align	4
.LBB3_54:
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
	jne	.LBB3_54
	cmpq	%rdi, %rbx
	je	.LBB3_96
	jmp	.LBB3_56
.LBB3_75:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	cmpb	$0, (%rsi)
	setne	%r8b
	vmovd	%r8d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	xorl	%r8d, %r8d
	vpxor	%xmm1, %xmm1, %xmm1
	movabsq	$.LCPI3_1, %r9
	vmovdqa	(%r9), %ymm2
	.p2align	4
.LBB3_76:
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
	jne	.LBB3_76
	cmpq	%rdi, %rbx
	je	.LBB3_96
	testb	$120, %bl
	je	.LBB3_14
.LBB3_79:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	cmpb	$0, (%rsi)
	setne	%r9b
	vmovd	%r9d, %xmm0
	vpbroadcastb	%xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	movabsq	$.LCPI3_2, %r9
	vmovdqa	(%r9), %xmm3
	.p2align	4
.LBB3_80:
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
	jne	.LBB3_80
	cmpq	%rdi, %rbx
	jne	.LBB3_14
	jmp	.LBB3_96
.LBB3_82:
	leaq	-120(%rcx), %rdi
	andq	%rbx, %rdi
	cmpb	$0, (%rdx)
	setne	%r8b
	vmovd	%r8d, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	xorl	%r8d, %r8d
	vpxor	%xmm1, %xmm1, %xmm1
	movabsq	$.LCPI3_1, %r9
	vmovdqa	(%r9), %ymm2
	.p2align	4
.LBB3_83:
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
	jne	.LBB3_83
	cmpq	%rdi, %rbx
	je	.LBB3_96
	testb	$120, %bl
	je	.LBB3_21
.LBB3_86:
	movq	%rdi, %r8
	movq	%rbx, %rdi
	andq	%rcx, %rdi
	cmpb	$0, (%rdx)
	setne	%r9b
	vmovd	%r9d, %xmm0
	vpbroadcastb	%xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	movabsq	$.LCPI3_2, %r9
	vmovdqa	(%r9), %xmm3
	.p2align	4
.LBB3_87:
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
	jne	.LBB3_87
	cmpq	%rdi, %rbx
	jne	.LBB3_21
	jmp	.LBB3_96
.LBB3_89:
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
.LBB3_90:
	vmovdqu	%ymm0, (%rax,%r10)
	vmovdqu	%ymm0, 32(%rax,%r10)
	vmovdqu	%ymm0, 64(%rax,%r10)
	vmovdqu	%ymm0, 96(%rax,%r10)
	subq	$-128, %r10
	cmpq	%r10, %rdi
	jne	.LBB3_90
	cmpq	%rdi, %rbx
	je	.LBB3_96
	testb	$120, %bl
	je	.LBB3_28
.LBB3_93:
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
	movabsq	$.LCPI3_0, %r8
	vpand	(%r8), %ymm0, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpackuswb	%xmm1, %xmm0, %xmm0
	.p2align	4
.LBB3_94:
	vmovq	%xmm0, (%rax,%r10)
	addq	$8, %r10
	cmpq	%r10, %rdi
	jne	.LBB3_94
	cmpq	%rdi, %rbx
	jne	.LBB3_28
.LBB3_96:
	movl	%ebx, %edx
	andl	$7, %edx
	leaq	-8(%rbx), %rdi
	movq	%rdi, %r8
	shrq	$3, %r8
	jne	.LBB3_63
.LBB3_97:
	xorl	%r15d, %r15d
	movq	%rax, %rsi
	jmp	.LBB3_66
.LBB3_98:
	movabsq	$.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209, %rax
	jmp	.LBB3_3
.Lfunc_end3:
	.size	_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE, .Lfunc_end3-_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE
	.cfi_endproc

	.weak	NRT_incref
	.p2align	4
	.type	NRT_incref,@function
NRT_incref:
	endbr64
	testq	%rdi, %rdi
	je	.LBB4_2
	lock		incq	(%rdi)
.LBB4_2:
	retq
.Lfunc_end4:
	.size	NRT_incref, .Lfunc_end4-NRT_incref

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

	.type	.const._reverse_window_score_gain,@object
	.section	.lrodata,"al",@progbits
	.p2align	4, 0x0
.const._reverse_window_score_gain:
	.asciz	"_reverse_window_score_gain"
	.size	.const._reverse_window_score_gain, 27

	.type	_ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,@object
	.comm	_ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx":
	.asciz	"missing Environment: _ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx"
	.size	".const.missing Environment: _ZN08NumbaEnv15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx", 190

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
