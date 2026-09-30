	.build_version macos, 26, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
__ZN8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	sub	sp, sp, #128
	stp	x28, x27, [sp, #32]
	stp	x26, x25, [sp, #48]
	stp	x24, x23, [sp, #64]
	stp	x22, x21, [sp, #80]
	stp	x20, x19, [sp, #96]
	stp	x29, x30, [sp, #112]
	mov	x19, x0
	cmp	x4, #1
	b.lt	LBB0_8
	mov	x21, #0
	ldr	x22, [sp, #224]
Lloh0:
	adrp	x20, _sinf@GOTPAGE
Lloh1:
	ldr	x20, [x20, _sinf@GOTPAGEOFF]
	cmp	x4, #1
	b.eq	LBB0_6
	sub	x8, x22, x6
	cmp	x8, #8
	b.lo	LBB0_6
	mov	x23, x4
	and	x21, x4, #0x7ffffffffffffffe
	neg	x25, x21
	mov	x24, x6
	mov	x26, x6
	mov	x27, x22
LBB0_4:
	ldr	d0, [x26], #8
	str	q0, [sp]
	mov	s0, v0[1]
	blr	x20
	str	q0, [sp, #16]
	ldr	q0, [sp]
	blr	x20
	ldr	q1, [sp, #16]
	mov.s	v0[1], v1[0]
	str	d0, [x27], #8
	adds	x25, x25, #2
	b.ne	LBB0_4
	mov	x4, x23
	cmp	x23, x21
	mov	x6, x24
	b.eq	LBB0_8
LBB0_6:
	lsl	x8, x21, #2
	add	x22, x22, x8
	add	x23, x6, x8
	sub	x21, x21, x4
LBB0_7:
	ldr	s0, [x23], #4
	blr	x20
	str	s0, [x22], #4
	adds	x21, x21, #1
	b.lo	LBB0_7
LBB0_8:
	str	xzr, [x19]
	mov	w0, #0
	ldp	x29, x30, [sp, #112]
	ldp	x20, x19, [sp, #96]
	ldp	x22, x21, [sp, #80]
	ldp	x24, x23, [sp, #64]
	ldp	x26, x25, [sp, #48]
	ldp	x28, x27, [sp, #32]
	add	sp, sp, #128
	ret
	.loh AdrpLdrGot	Lloh0, Lloh1

	.globl	__ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
__ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	.cfi_startproc
	sub	sp, sp, #400
	stp	x24, x23, [sp, #336]
	stp	x22, x21, [sp, #352]
	stp	x20, x19, [sp, #368]
	stp	x29, x30, [sp, #384]
	.cfi_def_cfa_offset 400
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x0, x1
	add	x8, sp, #312
	str	x8, [sp, #16]
	add	x8, sp, #320
	add	x9, sp, #328
	stp	x9, x8, [sp]
Lloh2:
	adrp	x1, "_.const.make_kernel.<locals>.kernel"@GOTPAGE
Lloh3:
	ldr	x1, [x1, "_.const.make_kernel.<locals>.kernel"@GOTPAGEOFF]
Lloh4:
	adrp	x8, _PyArg_UnpackTuple@GOTPAGE
Lloh5:
	ldr	x8, [x8, _PyArg_UnpackTuple@GOTPAGEOFF]
	mov	w2, #3
	mov	w3, #3
	blr	x8
	cbz	w0, LBB1_16
Lloh6:
	adrp	x8, __ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh7:
	ldr	x8, [x8, __ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
Lloh8:
	ldr	x8, [x8]
	cbz	x8, LBB1_10
	add	x8, sp, #256
	ldr	x0, [sp, #328]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x8]
	str	q0, [x8, #32]
	str	xzr, [sp, #304]
Lloh9:
	adrp	x23, _NRT_adapt_ndarray_from_python@GOTPAGE
Lloh10:
	ldr	x23, [x23, _NRT_adapt_ndarray_from_python@GOTPAGEOFF]
	add	x1, sp, #256
	blr	x23
	cbnz	w0, LBB1_11
	ldr	x8, [sp, #280]
	cmp	x8, #4
	b.ne	LBB1_11
	ldr	x19, [sp, #256]
	ldr	x20, [sp, #272]
	ldr	x21, [sp, #288]
	ldr	x0, [sp, #320]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #192]
	str	q0, [sp, #224]
	str	xzr, [sp, #240]
	add	x1, sp, #192
	blr	x23
	cbnz	w0, LBB1_13
	ldr	x8, [sp, #216]
	cmp	x8, #4
	b.ne	LBB1_13
	ldr	x22, [sp, #192]
	ldr	x0, [sp, #312]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #128]
	str	q0, [sp, #160]
	str	xzr, [sp, #176]
	add	x1, sp, #128
	blr	x23
	cbnz	w0, LBB1_14
	ldr	x8, [sp, #152]
	cmp	x8, #4
	b.ne	LBB1_14
	ldr	x23, [sp, #128]
	ldr	x8, [sp, #160]
	str	x8, [sp, #96]
Lloh11:
	adrp	x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh12:
	ldr	x8, [x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
	add	x0, sp, #120
	mov	x4, x20
	mov	x6, x21
	blr	x8
Lloh13:
	adrp	x20, _NRT_decref@GOTPAGE
Lloh14:
	ldr	x20, [x20, _NRT_decref@GOTPAGEOFF]
	mov	x0, x19
	blr	x20
	mov	x0, x22
	blr	x20
	mov	x0, x23
	blr	x20
Lloh15:
	adrp	x19, __Py_NoneStruct@GOTPAGE
Lloh16:
	ldr	x19, [x19, __Py_NoneStruct@GOTPAGEOFF]
Lloh17:
	adrp	x8, _Py_IncRef@GOTPAGE
Lloh18:
	ldr	x8, [x8, _Py_IncRef@GOTPAGEOFF]
	mov	x0, x19
	blr	x8
LBB1_9:
	mov	x0, x19
	ldp	x29, x30, [sp, #384]
	ldp	x20, x19, [sp, #368]
	ldp	x22, x21, [sp, #352]
	ldp	x24, x23, [sp, #336]
	add	sp, sp, #400
	ret
LBB1_10:
Lloh19:
	adrp	x0, _PyExc_RuntimeError@GOTPAGE
Lloh20:
	ldr	x0, [x0, _PyExc_RuntimeError@GOTPAGEOFF]
Lloh21:
	adrp	x1, "_.const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"@GOTPAGE
Lloh22:
	ldr	x1, [x1, "_.const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"@GOTPAGEOFF]
	b	LBB1_12
LBB1_11:
Lloh23:
	adrp	x0, _PyExc_TypeError@GOTPAGE
Lloh24:
	ldr	x0, [x0, _PyExc_TypeError@GOTPAGEOFF]
Lloh25:
	adrp	x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGE
Lloh26:
	ldr	x1, [x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGEOFF]
LBB1_12:
Lloh27:
	adrp	x8, _PyErr_SetString@GOTPAGE
Lloh28:
	ldr	x8, [x8, _PyErr_SetString@GOTPAGEOFF]
	blr	x8
	b	LBB1_16
LBB1_13:
Lloh29:
	adrp	x0, _PyExc_TypeError@GOTPAGE
Lloh30:
	ldr	x0, [x0, _PyExc_TypeError@GOTPAGEOFF]
Lloh31:
	adrp	x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGE
Lloh32:
	ldr	x1, [x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGEOFF]
Lloh33:
	adrp	x8, _PyErr_SetString@GOTPAGE
Lloh34:
	ldr	x8, [x8, _PyErr_SetString@GOTPAGEOFF]
	blr	x8
	b	LBB1_15
LBB1_14:
Lloh35:
	adrp	x0, _PyExc_TypeError@GOTPAGE
Lloh36:
	ldr	x0, [x0, _PyExc_TypeError@GOTPAGEOFF]
Lloh37:
	adrp	x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGE
Lloh38:
	ldr	x1, [x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGEOFF]
Lloh39:
	adrp	x8, _PyErr_SetString@GOTPAGE
Lloh40:
	ldr	x8, [x8, _PyErr_SetString@GOTPAGEOFF]
	blr	x8
Lloh41:
	adrp	x8, _NRT_decref@GOTPAGE
Lloh42:
	ldr	x8, [x8, _NRT_decref@GOTPAGEOFF]
	mov	x0, x22
	blr	x8
LBB1_15:
Lloh43:
	adrp	x8, _NRT_decref@GOTPAGE
Lloh44:
	ldr	x8, [x8, _NRT_decref@GOTPAGEOFF]
	mov	x0, x19
	blr	x8
LBB1_16:
	mov	x19, #0
	b	LBB1_9
	.loh AdrpLdrGot	Lloh4, Lloh5
	.loh AdrpLdrGot	Lloh2, Lloh3
	.loh AdrpLdrGotLdr	Lloh6, Lloh7, Lloh8
	.loh AdrpLdrGot	Lloh9, Lloh10
	.loh AdrpLdrGot	Lloh17, Lloh18
	.loh AdrpLdrGot	Lloh15, Lloh16
	.loh AdrpLdrGot	Lloh13, Lloh14
	.loh AdrpLdrGot	Lloh11, Lloh12
	.loh AdrpLdrGot	Lloh21, Lloh22
	.loh AdrpLdrGot	Lloh19, Lloh20
	.loh AdrpLdrGot	Lloh25, Lloh26
	.loh AdrpLdrGot	Lloh23, Lloh24
	.loh AdrpLdrGot	Lloh27, Lloh28
	.loh AdrpLdrGot	Lloh33, Lloh34
	.loh AdrpLdrGot	Lloh31, Lloh32
	.loh AdrpLdrGot	Lloh29, Lloh30
	.loh AdrpLdrGot	Lloh41, Lloh42
	.loh AdrpLdrGot	Lloh39, Lloh40
	.loh AdrpLdrGot	Lloh37, Lloh38
	.loh AdrpLdrGot	Lloh35, Lloh36
	.loh AdrpLdrGot	Lloh43, Lloh44
	.cfi_endproc

	.globl	_cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
_cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	sub	sp, sp, #144
	stp	x29, x30, [sp, #128]
	mov	x6, x4
	ldr	x8, [sp, #224]
	str	xzr, [sp, #120]
	str	x8, [sp, #96]
Lloh45:
	adrp	x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh46:
	ldr	x8, [x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
	add	x0, sp, #120
	mov	x4, x2
	blr	x8
	ldr	x0, [sp, #120]
	ldp	x29, x30, [sp, #128]
	add	sp, sp, #144
	ret
	.loh AdrpLdrGot	Lloh45, Lloh46

	.globl	_NRT_decref
	.weak_def_can_be_hidden	_NRT_decref
	.p2align	2
_NRT_decref:
	.cfi_startproc
	cbz	x0, LBB3_2
	dmb	ish
	mov	x8, #-1
	ldadd	x8, x8, [x0]
	cmp	x8, #1
	b.eq	LBB3_3
LBB3_2:
	ret
LBB3_3:
	dmb	ishld
Lloh47:
	adrp	x1, _NRT_MemInfo_call_dtor@GOTPAGE
Lloh48:
	ldr	x1, [x1, _NRT_MemInfo_call_dtor@GOTPAGEOFF]
	br	x1
	.loh AdrpLdrGot	Lloh47, Lloh48
	.cfi_endproc

	.section	__TEXT,__const
	.p2align	4, 0x0
"_.const.make_kernel.<locals>.kernel":
	.asciz	"make_kernel.<locals>.kernel"

	.comm	__ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,8,3
	.p2align	4, 0x0
"_.const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE":
	.asciz	"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"

	.p2align	4, 0x0
"_.const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"

.subsections_via_symbols
