	.file	"<string>"
	.section	.ltext,"axl",@progbits
	.globl	_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@function
_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	movq	%rdi, 40(%rsp)
	testq	%r8, %r8
	jle	.LBB0_14
	movq	240(%rsp), %r15
	movq	184(%rsp), %r12
	movq	128(%rsp), %r13
	cmpq	$8, %r8
	movq	%r8, 32(%rsp)
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
	movq	%r8, %r14
	movq	%rbx, (%rsp)
	movq	%rbx, %rbp
	andq	$7, %r14
	je	.LBB0_11
	movq	(%rsp), %rbp
	.p2align	4
.LBB0_10:
	movq	%rbp, %rbx
	incq	%rbp
	vmovss	(%r13,%rbx,4), %xmm0
	vmovss	(%r12,%rbx,4), %xmm1
	movabsq	$powf, %rax
	callq	*%rax
	vmovss	%xmm0, (%r15,%rbx,4)
	decq	%r14
	jne	.LBB0_10
.LBB0_11:
	movq	(%rsp), %rax
	subq	32(%rsp), %rax
	cmpq	$-8, %rax
	ja	.LBB0_14
	movabsq	$powf, %rbx
	.p2align	4
.LBB0_13:
	vmovss	(%r13,%rbp,4), %xmm0
	vmovss	(%r12,%rbp,4), %xmm1
	callq	*%rbx
	vmovss	%xmm0, (%r15,%rbp,4)
	vmovss	4(%r13,%rbp,4), %xmm0
	vmovss	4(%r12,%rbp,4), %xmm1
	callq	*%rbx
	vmovss	%xmm0, 4(%r15,%rbp,4)
	vmovss	8(%r13,%rbp,4), %xmm0
	vmovss	8(%r12,%rbp,4), %xmm1
	callq	*%rbx
	vmovss	%xmm0, 8(%r15,%rbp,4)
	vmovss	12(%r13,%rbp,4), %xmm0
	vmovss	12(%r12,%rbp,4), %xmm1
	callq	*%rbx
	vmovss	%xmm0, 12(%r15,%rbp,4)
	vmovss	16(%r13,%rbp,4), %xmm0
	vmovss	16(%r12,%rbp,4), %xmm1
	callq	*%rbx
	vmovss	%xmm0, 16(%r15,%rbp,4)
	vmovss	20(%r13,%rbp,4), %xmm0
	vmovss	20(%r12,%rbp,4), %xmm1
	callq	*%rbx
	vmovss	%xmm0, 20(%r15,%rbp,4)
	vmovss	24(%r13,%rbp,4), %xmm0
	vmovss	24(%r12,%rbp,4), %xmm1
	callq	*%rbx
	vmovss	%xmm0, 24(%r15,%rbp,4)
	leaq	8(%rbp), %r14
	vmovss	28(%r13,%rbp,4), %xmm0
	vmovss	28(%r12,%rbp,4), %xmm1
	callq	*%rbx
	vmovss	%xmm0, 28(%r15,%rbp,4)
	movq	%r14, %rbp
	cmpq	%r14, 32(%rsp)
	jne	.LBB0_13
	jmp	.LBB0_14
.LBB0_5:
	movabsq	$9223372036854775800, %rbx
	andq	%r8, %rbx
	xorl	%ebp, %ebp
	movabsq	$powf, %r14
	.p2align	4
.LBB0_6:
	vmovss	(%r13,%rbp,4), %xmm0
	vmovss	%xmm0, (%rsp)
	vmovss	4(%r13,%rbp,4), %xmm0
	vmovss	(%r12,%rbp,4), %xmm1
	vmovss	%xmm1, 16(%rsp)
	vmovss	4(%r12,%rbp,4), %xmm1
	callq	*%r14
	vmovaps	%xmm0, 48(%rsp)
	vmovss	(%rsp), %xmm0
	vmovss	16(%rsp), %xmm1
	callq	*%r14
	vinsertps	$16, 48(%rsp), %xmm0, %xmm0
	vmovaps	%xmm0, (%rsp)
	vmovss	8(%r13,%rbp,4), %xmm0
	vmovss	8(%r12,%rbp,4), %xmm1
	callq	*%r14
	vmovaps	(%rsp), %xmm1
	vinsertps	$32, %xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, (%rsp)
	vmovss	12(%r13,%rbp,4), %xmm0
	vmovss	12(%r12,%rbp,4), %xmm1
	callq	*%r14
	vmovaps	(%rsp), %xmm1
	vinsertps	$48, %xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, (%rsp)
	vmovss	20(%r13,%rbp,4), %xmm0
	vmovss	20(%r12,%rbp,4), %xmm1
	callq	*%r14
	vmovaps	%xmm0, 16(%rsp)
	vmovss	16(%r13,%rbp,4), %xmm0
	vmovss	16(%r12,%rbp,4), %xmm1
	callq	*%r14
	vinsertps	$16, 16(%rsp), %xmm0, %xmm0
	vmovaps	%xmm0, 16(%rsp)
	vmovss	24(%r13,%rbp,4), %xmm0
	vmovss	24(%r12,%rbp,4), %xmm1
	callq	*%r14
	vmovaps	16(%rsp), %xmm1
	vinsertps	$32, %xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 16(%rsp)
	vmovss	28(%r13,%rbp,4), %xmm0
	vmovss	28(%r12,%rbp,4), %xmm1
	callq	*%r14
	vmovaps	16(%rsp), %xmm1
	vinsertps	$48, %xmm0, %xmm1, %xmm0
	vmovups	%xmm0, 16(%r15,%rbp,4)
	vmovaps	(%rsp), %xmm0
	vmovups	%xmm0, (%r15,%rbp,4)
	addq	$8, %rbp
	cmpq	%rbp, %rbx
	jne	.LBB0_6
	movq	32(%rsp), %r8
	cmpq	%rbx, %r8
	jne	.LBB0_8
.LBB0_14:
	movq	40(%rsp), %rax
	movq	$0, (%rax)
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, .Lfunc_end0-_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE

	.globl	_ZN7cpython8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	4
	.type	_ZN7cpython8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@function
_ZN7cpython8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
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
	movabsq	$".const.kernel_for.<locals>.kernel", %rsi
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
	movabsq	$_ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, %rax
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
	movabsq	$_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, %rax
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
	movabsq	$".const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE", %rsi
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
	.size	_ZN7cpython8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, .Lfunc_end1-_ZN7cpython8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.cfi_endproc

	.globl	cfunc._ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	4
	.type	cfunc._ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@function
cfunc._ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	subq	$152, %rsp
	movq	200(%rsp), %rax
	movq	256(%rsp), %rcx
	movq	$0, 144(%rsp)
	movq	%rcx, 112(%rsp)
	movq	%rax, 56(%rsp)
	movq	%r8, (%rsp)
	movabsq	$_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, %rax
	leaq	144(%rsp), %rdi
	movq	%rdx, %r8
	callq	*%rax
	movq	144(%rsp), %rax
	addq	$152, %rsp
	retq
.Lfunc_end2:
	.size	cfunc._ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, .Lfunc_end2-cfunc._ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE

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

	.type	".const.kernel_for.<locals>.kernel",@object
	.section	.lrodata,"al",@progbits
	.p2align	4, 0x0
".const.kernel_for.<locals>.kernel":
	.asciz	"kernel_for.<locals>.kernel"
	.size	".const.kernel_for.<locals>.kernel", 27

	.type	_ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,@object
	.comm	_ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE":
	.asciz	"missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"
	.size	".const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE", 217

	.type	".const.can't unbox array from PyObject into native value.  The object maybe of a different type",@object
	.p2align	4, 0x0
".const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"
	.size	".const.can't unbox array from PyObject into native value.  The object maybe of a different type", 89

	.section	".note.GNU-stack","",@progbits
