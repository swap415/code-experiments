	.file	"<string>"
	.section	.ltext,"axl",@progbits
	.globl	_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@function
_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, %r13
	testq	%r8, %r8
	jle	.LBB0_12
	movq	208(%rsp), %r15
	cmpq	$8, %r8
	setb	%al
	movq	96(%rsp), %r12
	movq	%r15, %rcx
	subq	%r12, %rcx
	cmpq	$32, %rcx
	setb	%cl
	orb	%al, %cl
	movq	%r8, 32(%rsp)
	je	.LBB0_3
	xorl	%r14d, %r14d
	jmp	.LBB0_6
.LBB0_3:
	movabsq	$9223372036854775800, %r14
	andq	%r8, %r14
	xorl	%ebp, %ebp
	movabsq	$tanf, %rbx
	.p2align	4
.LBB0_4:
	vmovss	(%r12,%rbp,4), %xmm0
	vmovss	%xmm0, (%rsp)
	vmovss	4(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovaps	%xmm0, 16(%rsp)
	vmovss	(%rsp), %xmm0
	callq	*%rbx
	vinsertps	$16, 16(%rsp), %xmm0, %xmm0
	vmovaps	%xmm0, (%rsp)
	vmovss	8(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovaps	(%rsp), %xmm1
	vinsertps	$32, %xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, (%rsp)
	vmovss	12(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovaps	(%rsp), %xmm1
	vinsertps	$48, %xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, (%rsp)
	vmovss	20(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovaps	%xmm0, 16(%rsp)
	vmovss	16(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vinsertps	$16, 16(%rsp), %xmm0, %xmm0
	vmovaps	%xmm0, 16(%rsp)
	vmovss	24(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovaps	16(%rsp), %xmm1
	vinsertps	$32, %xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 16(%rsp)
	vmovss	28(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovaps	16(%rsp), %xmm1
	vinsertps	$48, %xmm0, %xmm1, %xmm0
	vmovups	%xmm0, 16(%r15,%rbp,4)
	vmovaps	(%rsp), %xmm0
	vmovups	%xmm0, (%r15,%rbp,4)
	addq	$8, %rbp
	cmpq	%rbp, %r14
	jne	.LBB0_4
	movq	32(%rsp), %r8
	cmpq	%r14, %r8
	je	.LBB0_12
.LBB0_6:
	movq	%r13, 16(%rsp)
	movq	%r8, %rbx
	movq	%r14, (%rsp)
	movq	%r14, %rbp
	andq	$7, %rbx
	je	.LBB0_9
	movabsq	$tanf, %r14
	movq	(%rsp), %rbp
	.p2align	4
.LBB0_8:
	movq	%rbp, %r13
	incq	%rbp
	vmovss	(%r12,%r13,4), %xmm0
	callq	*%r14
	vmovss	%xmm0, (%r15,%r13,4)
	decq	%rbx
	jne	.LBB0_8
.LBB0_9:
	movq	(%rsp), %rax
	subq	32(%rsp), %rax
	cmpq	$-8, %rax
	movq	16(%rsp), %r13
	ja	.LBB0_12
	movabsq	$tanf, %rbx
	.p2align	4
.LBB0_11:
	vmovss	(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovss	%xmm0, (%r15,%rbp,4)
	vmovss	4(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovss	%xmm0, 4(%r15,%rbp,4)
	vmovss	8(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovss	%xmm0, 8(%r15,%rbp,4)
	vmovss	12(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovss	%xmm0, 12(%r15,%rbp,4)
	vmovss	16(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovss	%xmm0, 16(%r15,%rbp,4)
	vmovss	20(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovss	%xmm0, 20(%r15,%rbp,4)
	vmovss	24(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovss	%xmm0, 24(%r15,%rbp,4)
	leaq	8(%rbp), %r14
	vmovss	28(%r12,%rbp,4), %xmm0
	callq	*%rbx
	vmovss	%xmm0, 28(%r15,%rbp,4)
	movq	%r14, %rbp
	cmpq	%r14, 32(%rsp)
	jne	.LBB0_11
.LBB0_12:
	movq	$0, (%r13)
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, .Lfunc_end0-_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE

	.globl	_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@function
_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$352, %rsp
	.cfi_def_cfa_offset 400
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
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
	movabsq	$_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, %rax
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
	movq	%r13, (%rsp)
	movabsq	$_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, %rax
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
	addq	$352, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB1_2:
	.cfi_def_cfa_offset 400
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE", %rsi
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
	.size	_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, .Lfunc_end1-_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.cfi_endproc

	.globl	cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	4
	.type	cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@function
cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	subq	$152, %rsp
	movq	256(%rsp), %rax
	movq	$0, 144(%rsp)
	movq	%rax, 112(%rsp)
	movq	%r8, (%rsp)
	movabsq	$_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, %rax
	leaq	144(%rsp), %rdi
	movq	%rdx, %r8
	callq	*%rax
	movq	144(%rsp), %rax
	addq	$152, %rsp
	retq
.Lfunc_end2:
	.size	cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, .Lfunc_end2-cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE

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

	.type	_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@object
	.comm	_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE":
	.asciz	"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"
	.size	".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE", 217

	.type	".const.can't unbox array from PyObject into native value.  The object maybe of a different type",@object
	.p2align	4, 0x0
".const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"
	.size	".const.can't unbox array from PyObject into native value.  The object maybe of a different type", 89

	.section	".note.GNU-stack","",@progbits
