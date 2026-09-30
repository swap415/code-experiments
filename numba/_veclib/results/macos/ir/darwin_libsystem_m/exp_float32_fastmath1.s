	.build_version macos, 26, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
__ZN8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	sub	sp, sp, #176
	stp	x28, x27, [sp, #80]
	stp	x26, x25, [sp, #96]
	stp	x24, x23, [sp, #112]
	stp	x22, x21, [sp, #128]
	stp	x20, x19, [sp, #144]
	stp	x29, x30, [sp, #160]
	mov	x19, x0
	cmp	x4, #1
	b.lt	LBB0_14
	mov	x21, #0
	ldr	x20, [sp, #272]
	cmp	x4, #4
	b.lo	LBB0_12
	sub	x8, x20, x6
	cmp	x8, #64
	b.lo	LBB0_12
Lloh0:
	adrp	x22, __simd_exp_f4@GOTPAGE
Lloh1:
	ldr	x22, [x22, __simd_exp_f4@GOTPAGEOFF]
	cmp	x4, #16
	b.hs	LBB0_5
	mov	x21, #0
	b	LBB0_9
LBB0_5:
	and	x23, x4, #0xc
	mov	x24, x4
	and	x21, x4, #0x7ffffffffffffff0
	mov	x25, x6
	add	x26, x6, #32
	add	x27, x20, #32
	neg	x28, x21
LBB0_6:
	ldp	q0, q2, [x26, #-32]
	ldp	q3, q1, [x26], #64
	stp	q2, q3, [sp, #16]
	str	q1, [sp, #64]
	blr	x22
	str	q0, [sp, #48]
	ldr	q0, [sp, #16]
	blr	x22
	str	q0, [sp, #16]
	ldr	q0, [sp, #32]
	blr	x22
	str	q0, [sp, #32]
	ldr	q0, [sp, #64]
	blr	x22
	ldr	q2, [sp, #48]
	ldp	q3, q1, [sp, #16]
	stp	q2, q3, [x27, #-32]
	stp	q1, q0, [x27], #64
	adds	x28, x28, #16
	b.ne	LBB0_6
	cmp	x24, x21
	b.eq	LBB0_14
	mov	x4, x24
	mov	x6, x25
	cbz	x23, LBB0_12
LBB0_9:
	mov	x8, x21
	mov	x23, x4
	and	x21, x4, #0x7ffffffffffffffc
	sub	x24, x8, x21
	lsl	x8, x8, #2
	add	x26, x20, x8
	mov	x25, x6
	add	x27, x6, x8
LBB0_10:
	ldr	q0, [x27], #16
	blr	x22
	str	q0, [x26], #16
	adds	x24, x24, #4
	b.ne	LBB0_10
	mov	x4, x23
	cmp	x23, x21
	mov	x6, x25
	b.eq	LBB0_14
LBB0_12:
	lsl	x8, x21, #2
	add	x20, x20, x8
	add	x22, x6, x8
	sub	x21, x21, x4
Lloh2:
	adrp	x23, _expf@GOTPAGE
Lloh3:
	ldr	x23, [x23, _expf@GOTPAGEOFF]
LBB0_13:
	ldr	s0, [x22], #4
	blr	x23
	str	s0, [x20], #4
	adds	x21, x21, #1
	b.lo	LBB0_13
LBB0_14:
	str	xzr, [x19]
	mov	w0, #0
	ldp	x29, x30, [sp, #160]
	ldp	x20, x19, [sp, #144]
	ldp	x22, x21, [sp, #128]
	ldp	x24, x23, [sp, #112]
	ldp	x26, x25, [sp, #96]
	ldp	x28, x27, [sp, #80]
	add	sp, sp, #176
	ret
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpLdrGot	Lloh2, Lloh3

	.globl	__ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
__ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
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
Lloh4:
	adrp	x1, "_.const.make_kernel.<locals>.kernel"@GOTPAGE
Lloh5:
	ldr	x1, [x1, "_.const.make_kernel.<locals>.kernel"@GOTPAGEOFF]
Lloh6:
	adrp	x8, _PyArg_UnpackTuple@GOTPAGE
Lloh7:
	ldr	x8, [x8, _PyArg_UnpackTuple@GOTPAGEOFF]
	mov	w2, #3
	mov	w3, #3
	blr	x8
	cbz	w0, LBB1_16
Lloh8:
	adrp	x8, __ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh9:
	ldr	x8, [x8, __ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
Lloh10:
	ldr	x8, [x8]
	cbz	x8, LBB1_10
	add	x8, sp, #256
	ldr	x0, [sp, #328]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x8]
	str	q0, [x8, #32]
	str	xzr, [sp, #304]
Lloh11:
	adrp	x23, _NRT_adapt_ndarray_from_python@GOTPAGE
Lloh12:
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
Lloh13:
	adrp	x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh14:
	ldr	x8, [x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
	add	x0, sp, #120
	mov	x4, x20
	mov	x6, x21
	blr	x8
Lloh15:
	adrp	x20, _NRT_decref@GOTPAGE
Lloh16:
	ldr	x20, [x20, _NRT_decref@GOTPAGEOFF]
	mov	x0, x19
	blr	x20
	mov	x0, x22
	blr	x20
	mov	x0, x23
	blr	x20
Lloh17:
	adrp	x19, __Py_NoneStruct@GOTPAGE
Lloh18:
	ldr	x19, [x19, __Py_NoneStruct@GOTPAGEOFF]
Lloh19:
	adrp	x8, _Py_IncRef@GOTPAGE
Lloh20:
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
Lloh21:
	adrp	x0, _PyExc_RuntimeError@GOTPAGE
Lloh22:
	ldr	x0, [x0, _PyExc_RuntimeError@GOTPAGEOFF]
Lloh23:
	adrp	x1, "_.const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"@GOTPAGE
Lloh24:
	ldr	x1, [x1, "_.const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"@GOTPAGEOFF]
	b	LBB1_12
LBB1_11:
Lloh25:
	adrp	x0, _PyExc_TypeError@GOTPAGE
Lloh26:
	ldr	x0, [x0, _PyExc_TypeError@GOTPAGEOFF]
Lloh27:
	adrp	x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGE
Lloh28:
	ldr	x1, [x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGEOFF]
LBB1_12:
Lloh29:
	adrp	x8, _PyErr_SetString@GOTPAGE
Lloh30:
	ldr	x8, [x8, _PyErr_SetString@GOTPAGEOFF]
	blr	x8
	b	LBB1_16
LBB1_13:
Lloh31:
	adrp	x0, _PyExc_TypeError@GOTPAGE
Lloh32:
	ldr	x0, [x0, _PyExc_TypeError@GOTPAGEOFF]
Lloh33:
	adrp	x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGE
Lloh34:
	ldr	x1, [x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGEOFF]
Lloh35:
	adrp	x8, _PyErr_SetString@GOTPAGE
Lloh36:
	ldr	x8, [x8, _PyErr_SetString@GOTPAGEOFF]
	blr	x8
	b	LBB1_15
LBB1_14:
Lloh37:
	adrp	x0, _PyExc_TypeError@GOTPAGE
Lloh38:
	ldr	x0, [x0, _PyExc_TypeError@GOTPAGEOFF]
Lloh39:
	adrp	x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGE
Lloh40:
	ldr	x1, [x1, "_.const.can't unbox array from PyObject into native value.  The object maybe of a different type"@GOTPAGEOFF]
Lloh41:
	adrp	x8, _PyErr_SetString@GOTPAGE
Lloh42:
	ldr	x8, [x8, _PyErr_SetString@GOTPAGEOFF]
	blr	x8
Lloh43:
	adrp	x8, _NRT_decref@GOTPAGE
Lloh44:
	ldr	x8, [x8, _NRT_decref@GOTPAGEOFF]
	mov	x0, x22
	blr	x8
LBB1_15:
Lloh45:
	adrp	x8, _NRT_decref@GOTPAGE
Lloh46:
	ldr	x8, [x8, _NRT_decref@GOTPAGEOFF]
	mov	x0, x19
	blr	x8
LBB1_16:
	mov	x19, #0
	b	LBB1_9
	.loh AdrpLdrGot	Lloh6, Lloh7
	.loh AdrpLdrGot	Lloh4, Lloh5
	.loh AdrpLdrGotLdr	Lloh8, Lloh9, Lloh10
	.loh AdrpLdrGot	Lloh11, Lloh12
	.loh AdrpLdrGot	Lloh19, Lloh20
	.loh AdrpLdrGot	Lloh17, Lloh18
	.loh AdrpLdrGot	Lloh15, Lloh16
	.loh AdrpLdrGot	Lloh13, Lloh14
	.loh AdrpLdrGot	Lloh23, Lloh24
	.loh AdrpLdrGot	Lloh21, Lloh22
	.loh AdrpLdrGot	Lloh27, Lloh28
	.loh AdrpLdrGot	Lloh25, Lloh26
	.loh AdrpLdrGot	Lloh29, Lloh30
	.loh AdrpLdrGot	Lloh35, Lloh36
	.loh AdrpLdrGot	Lloh33, Lloh34
	.loh AdrpLdrGot	Lloh31, Lloh32
	.loh AdrpLdrGot	Lloh43, Lloh44
	.loh AdrpLdrGot	Lloh41, Lloh42
	.loh AdrpLdrGot	Lloh39, Lloh40
	.loh AdrpLdrGot	Lloh37, Lloh38
	.loh AdrpLdrGot	Lloh45, Lloh46
	.cfi_endproc

	.globl	_cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
_cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	sub	sp, sp, #144
	stp	x29, x30, [sp, #128]
	mov	x6, x4
	ldr	x8, [sp, #224]
	str	xzr, [sp, #120]
	str	x8, [sp, #96]
Lloh47:
	adrp	x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh48:
	ldr	x8, [x8, __ZN8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
	add	x0, sp, #120
	mov	x4, x2
	blr	x8
	ldr	x0, [sp, #120]
	ldp	x29, x30, [sp, #128]
	add	sp, sp, #144
	ret
	.loh AdrpLdrGot	Lloh47, Lloh48

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
Lloh49:
	adrp	x1, _NRT_MemInfo_call_dtor@GOTPAGE
Lloh50:
	ldr	x1, [x1, _NRT_MemInfo_call_dtor@GOTPAGEOFF]
	br	x1
	.loh AdrpLdrGot	Lloh49, Lloh50
	.cfi_endproc

	.section	__TEXT,__const
	.p2align	4, 0x0
"_.const.make_kernel.<locals>.kernel":
	.asciz	"make_kernel.<locals>.kernel"

	.comm	__ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,8,3
	.p2align	4, 0x0
"_.const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE":
	.asciz	"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v15B60c8tJTIeFIjxB2IKSgI4CrvQClYb5wBbdC9XqICn1Wk1gKBZBVGsCAA_3d_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"

	.p2align	4, 0x0
"_.const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"

.subsections_via_symbols
