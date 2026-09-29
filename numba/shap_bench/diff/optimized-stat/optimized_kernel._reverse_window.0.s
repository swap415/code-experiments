	.file	"<string>"
	.section	.ltext,"axl",@progbits
	.globl	_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx
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
	movq	88(%rsp), %r11
	movq	%r11, %r9
	sarq	%r9
	testq	%r9, %r9
	jle	.LBB0_8
	movq	80(%rsp), %rax
	movq	64(%rsp), %rcx
	movq	56(%rsp), %rdx
	leaq	(%r11,%rax), %r8
	movl	%r9d, %esi
	andl	$3, %esi
	cmpq	$4, %r9
	jae	.LBB0_3
	xorl	%ebx, %ebx
	jmp	.LBB0_6
.LBB0_3:
	movabsq	$9223372036854775804, %r10
	andq	%r10, %r9
	leaq	(%rdx,%rax,8), %r10
	addq	%rax, %r11
	decq	%r11
	xorl	%ebx, %ebx
	.p2align	4
.LBB0_4:
	leaq	(%rax,%rbx), %r14
	sarq	$63, %r14
	andq	%rcx, %r14
	leaq	(%r10,%r14,8), %r14
	movq	(%r14,%rbx,8), %r15
	movq	%r11, %r12
	sarq	$63, %r12
	andq	%rcx, %r12
	leaq	(%rdx,%r12,8), %r12
	movq	(%r12,%r11,8), %r13
	movq	%r13, (%r14,%rbx,8)
	movq	%r15, (%r12,%r11,8)
	leaq	(%rax,%rbx), %r14
	incq	%r14
	sarq	$63, %r14
	andq	%rcx, %r14
	leaq	(%r10,%r14,8), %r14
	movq	8(%r14,%rbx,8), %r15
	movq	%rbx, %r12
	xorq	$-2, %r12
	addq	%r8, %r12
	leaq	(%rdx,%r12,8), %r13
	sarq	$63, %r12
	andq	%rcx, %r12
	movq	(%r13,%r12,8), %rbp
	movq	%rbp, 8(%r14,%rbx,8)
	movq	%r15, (%r13,%r12,8)
	leaq	(%rax,%rbx), %r14
	addq	$2, %r14
	sarq	$63, %r14
	andq	%rcx, %r14
	leaq	(%r10,%r14,8), %r14
	movq	16(%r14,%rbx,8), %r15
	movq	%rbx, %r12
	xorq	$-3, %r12
	addq	%r8, %r12
	leaq	(%rdx,%r12,8), %r13
	sarq	$63, %r12
	andq	%rcx, %r12
	movq	(%r13,%r12,8), %rbp
	movq	%rbp, 16(%r14,%rbx,8)
	movq	%r15, (%r13,%r12,8)
	leaq	(%rax,%rbx), %r14
	addq	$3, %r14
	sarq	$63, %r14
	andq	%rcx, %r14
	leaq	(%r10,%r14,8), %r14
	movq	24(%r14,%rbx,8), %r15
	movq	%rbx, %r12
	xorq	$-4, %r12
	addq	%r8, %r12
	leaq	(%rdx,%r12,8), %r13
	sarq	$63, %r12
	andq	%rcx, %r12
	movq	(%r13,%r12,8), %rbp
	movq	%rbp, 24(%r14,%rbx,8)
	addq	$4, %rbx
	movq	%r15, (%r13,%r12,8)
	addq	$-4, %r11
	cmpq	%rbx, %r9
	jne	.LBB0_4
	testq	%rsi, %rsi
	je	.LBB0_8
.LBB0_6:
	movq	%rbx, %r9
	notq	%r9
	addq	%r8, %r9
	addq	%rbx, %rax
	.p2align	4
.LBB0_7:
	movq	%rax, %r8
	sarq	$63, %r8
	andq	%rcx, %r8
	leaq	(%rdx,%r8,8), %r8
	movq	(%r8,%rax,8), %r10
	movq	%r9, %r11
	sarq	$63, %r11
	andq	%rcx, %r11
	leaq	(%rdx,%r11,8), %r11
	movq	(%r11,%r9,8), %rbx
	movq	%rbx, (%r8,%rax,8)
	movq	%r10, (%r11,%r9,8)
	decq	%r9
	incq	%rax
	decq	%rsi
	jne	.LBB0_7
.LBB0_8:
	movq	$0, (%rdi)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end0-_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx

	.globl	_ZN7cpython16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	_ZN7cpython16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,@function
_ZN7cpython16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx:
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
	movq	%rsi, %rdi
	leaq	56(%rsp), %rax
	movq	%rax, (%rsp)
	movabsq	$.const._reverse_window, %rsi
	movabsq	$PyArg_UnpackTuple, %r10
	xorl	%ebx, %ebx
	leaq	72(%rsp), %r8
	leaq	64(%rsp), %r9
	movl	$3, %edx
	movl	$3, %ecx
	xorl	%eax, %eax
	callq	*%r10
	testl	%eax, %eax
	je	.LBB1_17
	movabsq	$_ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	cmpq	$0, (%rax)
	je	.LBB1_2
	movq	72(%rsp), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 80(%rsp)
	vmovups	%ymm0, 104(%rsp)
	movabsq	$NRT_adapt_ndarray_from_python, %rax
	leaq	80(%rsp), %rsi
	vzeroupper
	callq	*%rax
	testl	%eax, %eax
	jne	.LBB1_6
	cmpq	$8, 104(%rsp)
	jne	.LBB1_6
	movq	80(%rsp), %r14
	movq	112(%rsp), %rbx
	movq	120(%rsp), %r13
	movq	64(%rsp), %rdi
	movabsq	$PyNumber_Long, %r12
	callq	*%r12
	movq	%rax, %r15
	movabsq	$PyLong_AsLongLong, %rax
	movabsq	$Py_DecRef, %rbp
	testq	%r15, %r15
	movq	%r14, 40(%rsp)
	movq	%rbx, 48(%rsp)
	je	.LBB1_8
	movq	%r15, %rdi
	callq	*%rax
	movq	%rax, %rbx
	movq	%r15, %rdi
	callq	*%rbp
	movabsq	$PyErr_Occurred, %r14
	callq	*%r14
	testq	%rax, %rax
	jne	.LBB1_9
.LBB1_12:
	movq	56(%rsp), %rdi
	callq	*%r12
	testq	%rax, %rax
	je	.LBB1_13
	movq	%rax, %r12
	movq	%rax, %rdi
	movabsq	$PyLong_AsLongLong, %rax
	callq	*%rax
	movq	%rax, %r15
	movq	%r12, %rdi
	movabsq	$Py_DecRef, %rax
	callq	*%rax
	callq	*%r14
	testq	%rax, %rax
	jne	.LBB1_9
.LBB1_16:
	movq	%r15, 32(%rsp)
	movq	%rbx, 24(%rsp)
	movq	%r13, 8(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, (%rsp)
	movabsq	$_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	leaq	144(%rsp), %rdi
	callq	*%rax
	movabsq	$NRT_decref, %rax
	movq	40(%rsp), %rdi
	callq	*%rax
	movabsq	$_Py_NoneStruct, %rbx
	movabsq	$Py_IncRef, %rax
	movq	%rbx, %rdi
	callq	*%rax
.LBB1_17:
	movq	%rbx, %rax
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
.LBB1_2:
	.cfi_def_cfa_offset 208
	movabsq	$PyExc_RuntimeError, %rdi
	movabsq	$".const.missing Environment: _ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx", %rsi
	jmp	.LBB1_3
.LBB1_6:
	movabsq	$PyExc_TypeError, %rdi
	movabsq	$".const.can't unbox array from PyObject into native value.  The object maybe of a different type", %rsi
.LBB1_3:
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
	xorl	%ebx, %ebx
	jmp	.LBB1_17
.LBB1_8:
	xorl	%ebx, %ebx
	movabsq	$PyErr_Occurred, %r14
	callq	*%r14
	testq	%rax, %rax
	je	.LBB1_12
	jmp	.LBB1_9
.LBB1_13:
	xorl	%r15d, %r15d
	callq	*%r14
	testq	%rax, %rax
	je	.LBB1_16
.LBB1_9:
	movabsq	$NRT_decref, %rax
	movq	40(%rsp), %rdi
	callq	*%rax
	xorl	%ebx, %ebx
	jmp	.LBB1_17
.Lfunc_end1:
	.size	_ZN7cpython16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end1-_ZN7cpython16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx
	.cfi_endproc

	.globl	cfunc._ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx
	.p2align	4
	.type	cfunc._ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,@function
cfunc._ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx:
	endbr64
	subq	$56, %rsp
	vmovups	72(%rsp), %xmm0
	movq	$0, 48(%rsp)
	vmovups	%xmm0, 24(%rsp)
	movq	%r9, 8(%rsp)
	movq	%r8, (%rsp)
	movabsq	$_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, %rax
	leaq	48(%rsp), %rdi
	callq	*%rax
	movq	48(%rsp), %rax
	addq	$56, %rsp
	retq
.Lfunc_end2:
	.size	cfunc._ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, .Lfunc_end2-cfunc._ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx

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

	.type	.const._reverse_window,@object
	.section	.lrodata,"al",@progbits
.const._reverse_window:
	.asciz	"_reverse_window"
	.size	.const._reverse_window, 16

	.type	_ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,@object
	.comm	_ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx",@object
	.p2align	4, 0x0
".const.missing Environment: _ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx":
	.asciz	"missing Environment: _ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx"
	.size	".const.missing Environment: _ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx", 150

	.type	".const.can't unbox array from PyObject into native value.  The object maybe of a different type",@object
	.p2align	4, 0x0
".const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"
	.size	".const.can't unbox array from PyObject into native value.  The object maybe of a different type", 89

	.section	".note.GNU-stack","",@progbits
