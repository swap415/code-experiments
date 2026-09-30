	.file	"<string>"
	.section	.ltext,"axl",@progbits
	.globl	_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@function
_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$248, %rsp
	movq	%rdi, %r12
	testq	%r8, %r8
	jle	.LBB0_18
	movq	416(%rsp), %rdx
	movq	360(%rsp), %r13
	movq	304(%rsp), %r15
	cmpq	$4, %r8
	movq	%r8, (%rsp)
	movq	%r12, 8(%rsp)
	jb	.LBB0_2
	movq	%rdx, %rax
	subq	%r15, %rax
	cmpq	$128, %rax
	setb	%al
	movq	%rdx, %rcx
	subq	%r13, %rcx
	cmpq	$128, %rcx
	setb	%cl
	orb	%al, %cl
	je	.LBB0_4
.LBB0_2:
	xorl	%ecx, %ecx
	movq	%r13, %rax
	movq	%rdx, %r13
.LBB0_13:
	movq	%r8, %r14
	subl	%ecx, %r14d
	movq	%rcx, 16(%rsp)
	movq	%rcx, %rbp
	andl	$7, %r14d
	movq	%rax, %rbx
	je	.LBB0_16
	movq	16(%rsp), %rbp
	.p2align	4
.LBB0_15:
	movq	%rbp, %r12
	incq	%rbp
	vmovss	(%r15,%r12,4), %xmm0
	vmovss	(%rax,%r12,4), %xmm1
	movabsq	$powf, %rax
	vzeroupper
	callq	*%rax
	movq	%rbx, %rax
	vmovss	%xmm0, (%r13,%r12,4)
	decq	%r14
	jne	.LBB0_15
.LBB0_16:
	movq	16(%rsp), %rcx
	subq	(%rsp), %rcx
	cmpq	$-8, %rcx
	movq	8(%rsp), %r12
	ja	.LBB0_18
	.p2align	4
.LBB0_17:
	vmovss	(%r15,%rbp,4), %xmm0
	vmovss	(%rax,%rbp,4), %xmm1
	movabsq	$powf, %rax
	vzeroupper
	callq	*%rax
	vmovss	%xmm0, (%r13,%rbp,4)
	vmovss	4(%r15,%rbp,4), %xmm0
	vmovss	4(%rbx,%rbp,4), %xmm1
	movabsq	$powf, %rax
	callq	*%rax
	vmovss	%xmm0, 4(%r13,%rbp,4)
	vmovss	8(%r15,%rbp,4), %xmm0
	vmovss	8(%rbx,%rbp,4), %xmm1
	movabsq	$powf, %rax
	callq	*%rax
	vmovss	%xmm0, 8(%r13,%rbp,4)
	vmovss	12(%r15,%rbp,4), %xmm0
	vmovss	12(%rbx,%rbp,4), %xmm1
	movabsq	$powf, %rax
	callq	*%rax
	vmovss	%xmm0, 12(%r13,%rbp,4)
	vmovss	16(%r15,%rbp,4), %xmm0
	vmovss	16(%rbx,%rbp,4), %xmm1
	movabsq	$powf, %rax
	callq	*%rax
	vmovss	%xmm0, 16(%r13,%rbp,4)
	vmovss	20(%r15,%rbp,4), %xmm0
	vmovss	20(%rbx,%rbp,4), %xmm1
	movabsq	$powf, %rax
	callq	*%rax
	vmovss	%xmm0, 20(%r13,%rbp,4)
	vmovss	24(%r15,%rbp,4), %xmm0
	vmovss	24(%rbx,%rbp,4), %xmm1
	movabsq	$powf, %rax
	callq	*%rax
	vmovss	%xmm0, 24(%r13,%rbp,4)
	leaq	8(%rbp), %r14
	vmovss	28(%r15,%rbp,4), %xmm0
	vmovss	28(%rbx,%rbp,4), %xmm1
	movabsq	$powf, %rax
	callq	*%rax
	movq	%rbx, %rax
	vmovss	%xmm0, 28(%r13,%rbp,4)
	movq	%r14, %rbp
	cmpq	%r14, (%rsp)
	jne	.LBB0_17
.LBB0_18:
	movq	$0, (%r12)
	xorl	%eax, %eax
	addq	$248, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.LBB0_4:
	movabsq	$9223372036854775776, %rsi
	cmpq	$32, %r8
	jae	.LBB0_6
	xorl	%ecx, %ecx
	movq	%r13, %rax
	movq	%rdx, %r13
	jmp	.LBB0_10
.LBB0_6:
	movq	%r8, %rcx
	andq	%rsi, %rcx
	xorl	%ebp, %ebp
	movabsq	$_ZGVdN8vv_powf, %rbx
	movq	%r13, %rax
	movq	%rdx, %r13
	.p2align	4
.LBB0_7:
	vmovups	(%r15,%rbp,4), %ymm0
	vmovups	32(%r15,%rbp,4), %ymm1
	vmovups	%ymm1, 48(%rsp)
	vmovups	64(%r15,%rbp,4), %ymm1
	vmovups	%ymm1, 80(%rsp)
	vmovups	96(%r15,%rbp,4), %ymm1
	vmovups	%ymm1, 16(%rsp)
	vmovups	(%rax,%rbp,4), %ymm1
	vmovups	32(%rax,%rbp,4), %ymm2
	vmovups	%ymm2, 112(%rsp)
	vmovups	64(%rax,%rbp,4), %ymm2
	vmovups	%ymm2, 144(%rsp)
	vmovups	96(%rax,%rbp,4), %ymm2
	vmovups	%ymm2, 208(%rsp)
	movq	%rax, %r14
	movq	%rcx, %r12
	callq	*%rbx
	vmovups	%ymm0, 176(%rsp)
	vmovups	48(%rsp), %ymm0
	vmovups	112(%rsp), %ymm1
	callq	*%rbx
	vmovups	%ymm0, 48(%rsp)
	vmovups	80(%rsp), %ymm0
	vmovups	144(%rsp), %ymm1
	callq	*%rbx
	vmovups	%ymm0, 80(%rsp)
	vmovups	16(%rsp), %ymm0
	vmovups	208(%rsp), %ymm1
	callq	*%rbx
	movq	%r12, %rcx
	movq	%r14, %rax
	vmovups	176(%rsp), %ymm1
	vmovups	%ymm1, (%r13,%rbp,4)
	vmovups	48(%rsp), %ymm1
	vmovups	%ymm1, 32(%r13,%rbp,4)
	vmovups	80(%rsp), %ymm1
	vmovups	%ymm1, 64(%r13,%rbp,4)
	vmovups	%ymm0, 96(%r13,%rbp,4)
	addq	$32, %rbp
	cmpq	%rbp, %r12
	jne	.LBB0_7
	movq	(%rsp), %r8
	cmpq	%rcx, %r8
	movq	8(%rsp), %r12
	movabsq	$9223372036854775776, %rsi
	je	.LBB0_18
	testb	$28, %r8b
	je	.LBB0_13
.LBB0_10:
	movq	%rcx, %rbx
	addq	$28, %rsi
	movq	%rsi, %rcx
	andq	%r8, %rcx
	movabsq	$_ZGVbN4vv_powf, %r14
	movq	%rax, %rbp
	.p2align	4
.LBB0_11:
	vmovups	(%r15,%rbx,4), %xmm0
	vmovups	(%rbp,%rbx,4), %xmm1
	movq	%rcx, %r12
	vzeroupper
	callq	*%r14
	movq	%r12, %rcx
	vmovups	%xmm0, (%r13,%rbx,4)
	addq	$4, %rbx
	cmpq	%rbx, %r12
	jne	.LBB0_11
	movq	(%rsp), %r8
	cmpq	%rcx, %r8
	movq	%rbp, %rax
	movq	8(%rsp), %r12
	jne	.LBB0_13
	jmp	.LBB0_18
.Lfunc_end0:
	.size	_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, .Lfunc_end0-_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE

	.globl	_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@function
_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	.cfi_startproc
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
	leaq	136(%rsp), %rax
	movq	%rax, (%rsp)
	movabsq	$".const.make_kernel.<locals>.kernel", %rsi
	movabsq	$PyArg_UnpackTuple, %r10
	xorl	%ebx, %ebx
	leaq	152(%rsp), %r8
	leaq	144(%rsp), %r9
	movl	$3, %edx
	movl	$3, %ecx
	xorl	%eax, %eax
	callq	*%r10
	testl	%eax, %eax
	je	.LBB1_15
	movabsq	$_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, %rax
	cmpq	$0, (%rax)
	je	.LBB1_2
	movq	152(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 160(%rsp)
	vmovups	%ymm0, 184(%rsp)
	movabsq	$NRT_adapt_ndarray_from_python, %r12
	leaq	160(%rsp), %rsi
	vzeroupper
	callq	*%r12
	testl	%eax, %eax
	jne	.LBB1_6
	cmpq	$4, 184(%rsp)
	jne	.LBB1_6
	movq	160(%rsp), %rbx
	movq	176(%rsp), %r14
	movq	192(%rsp), %r13
	movq	144(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 288(%rsp)
	vmovups	%ymm0, 312(%rsp)
	leaq	288(%rsp), %rsi
	vzeroupper
	callq	*%r12
	testl	%eax, %eax
	jne	.LBB1_9
	cmpq	$4, 312(%rsp)
	jne	.LBB1_9
	movq	288(%rsp), %r15
	movq	320(%rsp), %rbp
	movq	136(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 224(%rsp)
	vmovups	%ymm0, 248(%rsp)
	leaq	224(%rsp), %rsi
	vzeroupper
	callq	*%r12
	testl	%eax, %eax
	jne	.LBB1_12
	cmpq	$4, 248(%rsp)
	jne	.LBB1_12
	movq	224(%rsp), %r12
	movq	256(%rsp), %rax
	movq	%rax, 112(%rsp)
	movq	%rbp, 56(%rsp)
	movq	%r13, (%rsp)
	movabsq	$_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, %rax
	leaq	216(%rsp), %rdi
	movq	%r14, %r8
	callq	*%rax
	movabsq	$NRT_decref, %r14
	movq	%rbx, %rdi
	callq	*%r14
	movq	%r15, %rdi
	callq	*%r14
	movq	%r12, %rdi
	callq	*%r14
	movabsq	$_Py_NoneStruct, %rbx
	movabsq	$Py_IncRef, %rax
	movq	%rbx, %rdi
	callq	*%rax
.LBB1_15:
	movq	%rbx, %rax
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
.LBB1_2:
	.cfi_def_cfa_offset 400
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE", %rsi
	jmp	.LBB1_3
.LBB1_6:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
.LBB1_3:
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	xorl	%ebx, %ebx
	jmp	.LBB1_15
.LBB1_9:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	jmp	.LBB1_13
.LBB1_12:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	movabsq	$NRT_decref, %rax
	movq	%r15, %rdi
	callq	*%rax
.LBB1_13:
	movabsq	$NRT_decref, %rax
	movq	%rbx, %rdi
	callq	*%rax
	xorl	%ebx, %ebx
	jmp	.LBB1_15
.Lfunc_end1:
	.size	_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, .Lfunc_end1-_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.cfi_endproc

	.globl	cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	4
	.type	cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@function
cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	subq	$152, %rsp
	movq	200(%rsp), %rax
	movq	256(%rsp), %rcx
	movq	$0, 144(%rsp)
	movq	%rcx, 112(%rsp)
	movq	%rax, 56(%rsp)
	movq	%r8, (%rsp)
	movabsq	$_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, %rax
	leaq	144(%rsp), %rdi
	movq	%rdx, %r8
	callq	*%rax
	movq	144(%rsp), %rax
	addq	$152, %rsp
	retq
.Lfunc_end2:
	.size	cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, .Lfunc_end2-cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE

	.weak	NRT_decref
	.p2align	4
	.type	NRT_decref,@function
NRT_decref:
	.cfi_startproc
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

	.type	".const.make_kernel.<locals>.kernel",@object
	.section	.lrodata,"al",@progbits
	.p2align	4, 0x0
".const.make_kernel.<locals>.kernel":
	.asciz	"make_kernel.<locals>.kernel"
	.size	".const.make_kernel.<locals>.kernel", 28

	.type	_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@object
	.comm	_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE":
	.asciz	"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"
	.size	".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v43B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE", 240

	.type	".const.can't unbox array from PyObject into native value.  The object maybe of a different type",@object
	.p2align	4, 0x0
".const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"
	.size	".const.can't unbox array from PyObject into native value.  The object maybe of a different type", 89

	.section	".note.GNU-stack","",@progbits
