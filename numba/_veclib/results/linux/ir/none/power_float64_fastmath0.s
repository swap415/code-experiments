	.file	"<string>"
	.section	.ltext,"axl",@progbits
	.globl	_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE,@function
_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	movq	%rdi, 56(%rsp)
	testq	%r8, %r8
	jle	.LBB0_14
	movq	256(%rsp), %r15
	movq	200(%rsp), %r12
	movq	144(%rsp), %r13
	cmpq	$4, %r8
	movq	%r8, 8(%rsp)
	jb	.LBB0_2
	movq	%r15, %rax
	subq	%r13, %rax
	cmpq	$32, %rax
	setb	%al
	movq	%r15, %rcx
	subq	%r12, %rcx
	cmpq	$32, %rcx
	setb	%cl
	orb	%al, %cl
	je	.LBB0_5
.LBB0_2:
	xorl	%ebx, %ebx
.LBB0_8:
	movl	%r8d, %r14d
	subl	%ebx, %r14d
	movq	%rbx, 16(%rsp)
	movq	%rbx, %rbp
	andl	$7, %r14d
	je	.LBB0_11
	movq	16(%rsp), %rbp
	.p2align	4
.LBB0_10:
	movq	%rbp, %rbx
	incq	%rbp
	vmovsd	(%r13,%rbx,8), %xmm0
	vmovsd	(%r12,%rbx,8), %xmm1
	movabsq	$pow, %rax
	callq	*%rax
	vmovsd	%xmm0, (%r15,%rbx,8)
	decq	%r14
	jne	.LBB0_10
.LBB0_11:
	movq	16(%rsp), %rax
	subq	8(%rsp), %rax
	cmpq	$-8, %rax
	ja	.LBB0_14
	movabsq	$pow, %rbx
	.p2align	4
.LBB0_13:
	vmovsd	(%r13,%rbp,8), %xmm0
	vmovsd	(%r12,%rbp,8), %xmm1
	callq	*%rbx
	vmovsd	%xmm0, (%r15,%rbp,8)
	vmovsd	8(%r13,%rbp,8), %xmm0
	vmovsd	8(%r12,%rbp,8), %xmm1
	callq	*%rbx
	vmovsd	%xmm0, 8(%r15,%rbp,8)
	vmovsd	16(%r13,%rbp,8), %xmm0
	vmovsd	16(%r12,%rbp,8), %xmm1
	callq	*%rbx
	vmovsd	%xmm0, 16(%r15,%rbp,8)
	vmovsd	24(%r13,%rbp,8), %xmm0
	vmovsd	24(%r12,%rbp,8), %xmm1
	callq	*%rbx
	vmovsd	%xmm0, 24(%r15,%rbp,8)
	vmovsd	32(%r13,%rbp,8), %xmm0
	vmovsd	32(%r12,%rbp,8), %xmm1
	callq	*%rbx
	vmovsd	%xmm0, 32(%r15,%rbp,8)
	vmovsd	40(%r13,%rbp,8), %xmm0
	vmovsd	40(%r12,%rbp,8), %xmm1
	callq	*%rbx
	vmovsd	%xmm0, 40(%r15,%rbp,8)
	vmovsd	48(%r13,%rbp,8), %xmm0
	vmovsd	48(%r12,%rbp,8), %xmm1
	callq	*%rbx
	vmovsd	%xmm0, 48(%r15,%rbp,8)
	leaq	8(%rbp), %r14
	vmovsd	56(%r13,%rbp,8), %xmm0
	vmovsd	56(%r12,%rbp,8), %xmm1
	callq	*%rbx
	vmovsd	%xmm0, 56(%r15,%rbp,8)
	movq	%r14, %rbp
	cmpq	%r14, 8(%rsp)
	jne	.LBB0_13
	jmp	.LBB0_14
.LBB0_5:
	movabsq	$9223372036854775804, %rbx
	andq	%r8, %rbx
	xorl	%ebp, %ebp
	movabsq	$pow, %r14
	.p2align	4
.LBB0_6:
	vmovsd	(%r13,%rbp,8), %xmm0
	vmovsd	%xmm0, 16(%rsp)
	vmovsd	8(%r13,%rbp,8), %xmm0
	vmovsd	(%r12,%rbp,8), %xmm1
	vmovsd	%xmm1, 32(%rsp)
	vmovsd	8(%r12,%rbp,8), %xmm1
	callq	*%r14
	vmovaps	%xmm0, 64(%rsp)
	vmovsd	16(%rsp), %xmm0
	vmovsd	32(%rsp), %xmm1
	callq	*%r14
	vpunpcklqdq	64(%rsp), %xmm0, %xmm0
	vmovaps	%xmm0, 16(%rsp)
	vmovsd	24(%r13,%rbp,8), %xmm0
	vmovsd	24(%r12,%rbp,8), %xmm1
	callq	*%r14
	vmovaps	%xmm0, 32(%rsp)
	vmovsd	16(%r13,%rbp,8), %xmm0
	vmovsd	16(%r12,%rbp,8), %xmm1
	callq	*%r14
	vpunpcklqdq	32(%rsp), %xmm0, %xmm0
	vmovups	%xmm0, 16(%r15,%rbp,8)
	vmovaps	16(%rsp), %xmm0
	vmovups	%xmm0, (%r15,%rbp,8)
	addq	$4, %rbp
	cmpq	%rbp, %rbx
	jne	.LBB0_6
	movq	8(%rsp), %r8
	cmpq	%rbx, %r8
	jne	.LBB0_8
.LBB0_14:
	movq	56(%rsp), %rax
	movq	$0, (%rax)
	xorl	%eax, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, .Lfunc_end0-_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE

	.globl	_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE,@function
_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE:
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
	movabsq	$_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, %rax
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
	cmpq	$8, 184(%rsp)
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
	cmpq	$8, 312(%rsp)
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
	cmpq	$8, 248(%rsp)
	jne	.LBB1_12
	movq	224(%rsp), %r12
	movq	256(%rsp), %rax
	movq	%rax, 112(%rsp)
	movq	%rbp, 56(%rsp)
	movq	%r13, (%rsp)
	movabsq	$_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, %rax
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
	movabsq	$".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE", %rsi
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
	.size	_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, .Lfunc_end1-_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE
	.cfi_endproc

	.globl	cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE
	.p2align	4
	.type	cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE,@function
cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE:
	subq	$152, %rsp
	movq	200(%rsp), %rax
	movq	256(%rsp), %rcx
	movq	$0, 144(%rsp)
	movq	%rcx, 112(%rsp)
	movq	%rax, 56(%rsp)
	movq	%r8, (%rsp)
	movabsq	$_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, %rax
	leaq	144(%rsp), %rdi
	movq	%rdx, %r8
	callq	*%rax
	movq	144(%rsp), %rax
	addq	$152, %rsp
	retq
.Lfunc_end2:
	.size	cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, .Lfunc_end2-cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE

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

	.type	_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE,@object
	.comm	_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE":
	.asciz	"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE"
	.size	".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE", 218

	.type	".const.can't unbox array from PyObject into native value.  The object maybe of a different type",@object
	.p2align	4, 0x0
".const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"
	.size	".const.can't unbox array from PyObject into native value.  The object maybe of a different type", 89

	.section	".note.GNU-stack","",@progbits
