	.build_version macos, 26, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
__ZN8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	cmp	x4, #1
	b.lt	LBB0_14
	mov	x9, #0
	ldr	x8, [sp, #96]
	cmp	x4, #4
	b.lo	LBB0_12
	sub	x10, x8, x6
	cmp	x10, #64
	b.lo	LBB0_12
	cmp	x4, #16
	b.hs	LBB0_5
	mov	x9, #0
	b	LBB0_9
LBB0_5:
	and	x10, x4, #0xc
	and	x9, x4, #0x7ffffffffffffff0
	add	x11, x6, #32
	add	x12, x8, #32
	neg	x13, x9
LBB0_6:
	ldp	q0, q1, [x11, #-32]
	ldp	q2, q3, [x11], #64
	fsqrt.4s	v0, v0
	fsqrt.4s	v1, v1
	fsqrt.4s	v2, v2
	fsqrt.4s	v3, v3
	stp	q0, q1, [x12, #-32]
	stp	q2, q3, [x12], #64
	adds	x13, x13, #16
	b.ne	LBB0_6
	cmp	x4, x9
	b.eq	LBB0_14
	cbz	x10, LBB0_12
LBB0_9:
	mov	x11, x9
	and	x9, x4, #0x7ffffffffffffffc
	sub	x10, x11, x9
	lsl	x12, x11, #2
	add	x11, x8, x12
	add	x12, x6, x12
LBB0_10:
	ldr	q0, [x12], #16
	fsqrt.4s	v0, v0
	str	q0, [x11], #16
	adds	x10, x10, #4
	b.ne	LBB0_10
	cmp	x4, x9
	b.eq	LBB0_14
LBB0_12:
	lsl	x10, x9, #2
	add	x8, x8, x10
	add	x10, x6, x10
	sub	x9, x9, x4
LBB0_13:
	ldr	s0, [x10], #4
	fsqrt	s0, s0
	str	s0, [x8], #4
	adds	x9, x9, #1
	b.lo	LBB0_13
LBB0_14:
	str	xzr, [x0]
	mov	w0, #0
	ret

	.globl	__ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
__ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
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
Lloh0:
	adrp	x1, "_.const.make_kernel.<locals>.kernel"@GOTPAGE
Lloh1:
	ldr	x1, [x1, "_.const.make_kernel.<locals>.kernel"@GOTPAGEOFF]
Lloh2:
	adrp	x8, _PyArg_UnpackTuple@GOTPAGE
Lloh3:
	ldr	x8, [x8, _PyArg_UnpackTuple@GOTPAGEOFF]
	mov	w2, #3
	mov	w3, #3
	blr	x8
	cbz	w0, LBB1_16
Lloh4:
	adrp	x8, __ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh5:
	ldr	x8, [x8, __ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
Lloh6:
	ldr	x8, [x8]
	cbz	x8, LBB1_10
	add	x8, sp, #256
	ldr	x0, [sp, #328]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x8]
	str	q0, [x8, #32]
	str	xzr, [sp, #304]
Lloh7:
	adrp	x23, _NRT_adapt_ndarray_from_python@GOTPAGE
Lloh8:
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
Lloh9:
	adrp	x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh10:
	ldr	x8, [x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
	add	x0, sp, #120
	mov	x4, x20
	mov	x6, x21
	blr	x8
Lloh11:
	adrp	x20, _NRT_decref@GOTPAGE
Lloh12:
	ldr	x20, [x20, _NRT_decref@GOTPAGEOFF]
	mov	x0, x19
	blr	x20
	mov	x0, x22
	blr	x20
	mov	x0, x23
	blr	x20
Lloh13:
	adrp	x19, __Py_NoneStruct@GOTPAGE
Lloh14:
	ldr	x19, [x19, __Py_NoneStruct@GOTPAGEOFF]
Lloh15:
	adrp	x8, _Py_IncRef@GOTPAGE
Lloh16:
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
Lloh17:
	adrp	x0, _PyExc_RuntimeError@GOTPAGE
Lloh18:
	ldr	x0, [x0, _PyExc_RuntimeError@GOTPAGEOFF]
Lloh19:
	adrp	x1, "_.const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"@GOTPAGE
Lloh20:
	ldr	x1, [x1, "_.const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"@GOTPAGEOFF]
	b	LBB1_12
LBB1_11:
Lloh21:
	adrp	x0, _PyExc_TypeError@GOTPAGE
Lloh22:
	ldr	x0, [x0, _PyExc_TypeError@GOTPAGEOFF]
Lloh23:
	adrp	x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGE
Lloh24:
	ldr	x1, [x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGEOFF]
LBB1_12:
Lloh25:
	adrp	x8, _PyErr_SetString@GOTPAGE
Lloh26:
	ldr	x8, [x8, _PyErr_SetString@GOTPAGEOFF]
	blr	x8
	b	LBB1_16
LBB1_13:
Lloh27:
	adrp	x0, _PyExc_TypeError@GOTPAGE
Lloh28:
	ldr	x0, [x0, _PyExc_TypeError@GOTPAGEOFF]
Lloh29:
	adrp	x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGE
Lloh30:
	ldr	x1, [x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGEOFF]
Lloh31:
	adrp	x8, _PyErr_SetString@GOTPAGE
Lloh32:
	ldr	x8, [x8, _PyErr_SetString@GOTPAGEOFF]
	blr	x8
	b	LBB1_15
LBB1_14:
Lloh33:
	adrp	x0, _PyExc_TypeError@GOTPAGE
Lloh34:
	ldr	x0, [x0, _PyExc_TypeError@GOTPAGEOFF]
Lloh35:
	adrp	x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGE
Lloh36:
	ldr	x1, [x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGEOFF]
Lloh37:
	adrp	x8, _PyErr_SetString@GOTPAGE
Lloh38:
	ldr	x8, [x8, _PyErr_SetString@GOTPAGEOFF]
	blr	x8
Lloh39:
	adrp	x8, _NRT_decref@GOTPAGE
Lloh40:
	ldr	x8, [x8, _NRT_decref@GOTPAGEOFF]
	mov	x0, x22
	blr	x8
LBB1_15:
Lloh41:
	adrp	x8, _NRT_decref@GOTPAGE
Lloh42:
	ldr	x8, [x8, _NRT_decref@GOTPAGEOFF]
	mov	x0, x19
	blr	x8
LBB1_16:
	mov	x19, #0
	b	LBB1_9
	.loh AdrpLdrGot	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpLdrGotLdr	Lloh4, Lloh5, Lloh6
	.loh AdrpLdrGot	Lloh7, Lloh8
	.loh AdrpLdrGot	Lloh15, Lloh16
	.loh AdrpLdrGot	Lloh13, Lloh14
	.loh AdrpLdrGot	Lloh11, Lloh12
	.loh AdrpLdrGot	Lloh9, Lloh10
	.loh AdrpLdrGot	Lloh19, Lloh20
	.loh AdrpLdrGot	Lloh17, Lloh18
	.loh AdrpLdrGot	Lloh23, Lloh24
	.loh AdrpLdrGot	Lloh21, Lloh22
	.loh AdrpLdrGot	Lloh25, Lloh26
	.loh AdrpLdrGot	Lloh31, Lloh32
	.loh AdrpLdrGot	Lloh29, Lloh30
	.loh AdrpLdrGot	Lloh27, Lloh28
	.loh AdrpLdrGot	Lloh39, Lloh40
	.loh AdrpLdrGot	Lloh37, Lloh38
	.loh AdrpLdrGot	Lloh35, Lloh36
	.loh AdrpLdrGot	Lloh33, Lloh34
	.loh AdrpLdrGot	Lloh41, Lloh42
	.cfi_endproc

	.globl	_cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
_cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	sub	sp, sp, #144
	stp	x29, x30, [sp, #128]
	mov	x6, x4
	ldr	x8, [sp, #224]
	str	xzr, [sp, #120]
	str	x8, [sp, #96]
Lloh43:
	adrp	x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh44:
	ldr	x8, [x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
	add	x0, sp, #120
	mov	x4, x2
	blr	x8
	ldr	x0, [sp, #120]
	ldp	x29, x30, [sp, #128]
	add	sp, sp, #144
	ret
	.loh AdrpLdrGot	Lloh43, Lloh44

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
Lloh45:
	adrp	x1, _NRT_MemInfo_call_dtor@GOTPAGE
Lloh46:
	ldr	x1, [x1, _NRT_MemInfo_call_dtor@GOTPAGEOFF]
	br	x1
	.loh AdrpLdrGot	Lloh45, Lloh46
	.cfi_endproc

	.section	__TEXT,__const
	.p2align	4, 0x0
"_.const.make_kernel.<locals>.kernel":
	.asciz	"make_kernel.<locals>.kernel"

	.comm	__ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,8,3
	.p2align	4, 0x0
"_.const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE":
	.asciz	"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v39B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"

	.p2align	4, 0x0
"_.const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"

.subsections_via_symbols
