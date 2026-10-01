	.build_version macos, 26, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
__ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	sub	sp, sp, #240
	stp	x28, x27, [sp, #144]
	stp	x26, x25, [sp, #160]
	stp	x24, x23, [sp, #176]
	stp	x22, x21, [sp, #192]
	stp	x20, x19, [sp, #208]
	stp	x29, x30, [sp, #224]
	mov	x19, x0
	cmp	x4, #1
	b.lt	LBB0_5
	ldr	x21, [sp, #336]
	ldr	x20, [sp, #280]
	cmp	x4, #4
	b.hs	LBB0_6
	mov	x22, #0
LBB0_3:
	lsl	x8, x22, #2
	add	x21, x21, x8
	add	x20, x20, x8
	add	x23, x6, x8
	sub	x22, x22, x4
Lloh0:
	adrp	x24, _powf@GOTPAGE
Lloh1:
	ldr	x24, [x24, _powf@GOTPAGEOFF]
LBB0_4:
	ldr	s0, [x23], #4
	ldr	s1, [x20], #4
	blr	x24
	str	s0, [x21], #4
	adds	x22, x22, #1
	b.lo	LBB0_4
LBB0_5:
	str	xzr, [x19]
	mov	w0, #0
	ldp	x29, x30, [sp, #224]
	ldp	x20, x19, [sp, #208]
	ldp	x22, x21, [sp, #192]
	ldp	x24, x23, [sp, #176]
	ldp	x26, x25, [sp, #160]
	ldp	x28, x27, [sp, #144]
	add	sp, sp, #240
	ret
LBB0_6:
	mov	x22, #0
	sub	x8, x21, x6
	cmp	x8, #64
	b.lo	LBB0_3
	sub	x8, x21, x20
	cmp	x8, #64
	b.lo	LBB0_3
Lloh2:
	adrp	x23, __simd_pow_f4@GOTPAGE
Lloh3:
	ldr	x23, [x23, __simd_pow_f4@GOTPAGEOFF]
	cmp	x4, #16
	str	x4, [sp, #24]
	b.hs	LBB0_10
	mov	x22, #0
	b	LBB0_14
LBB0_10:
	and	x8, x4, #0xc
	str	x8, [sp, #16]
	and	x22, x4, #0x7ffffffffffffff0
	mov	x26, x6
	add	x27, x6, #32
	add	x28, x20, #32
	add	x24, x21, #32
	neg	x25, x22
LBB0_11:
	ldp	q0, q3, [x27, #-32]
	ldp	q2, q4, [x27], #64
	str	q2, [sp, #96]
	ldp	q1, q2, [x28, #-32]
	stp	q2, q3, [sp, #32]
	ldp	q3, q2, [x28], #64
	str	q3, [sp, #64]
	stp	q2, q4, [sp, #112]
	blr	x23
	str	q0, [sp, #80]
	ldp	q1, q0, [sp, #32]
	blr	x23
	str	q0, [sp, #48]
	ldr	q0, [sp, #96]
	ldr	q1, [sp, #64]
	blr	x23
	str	q0, [sp, #96]
	ldp	q1, q0, [sp, #112]
	blr	x23
	ldr	q2, [sp, #80]
	ldr	q1, [sp, #48]
	stp	q2, q1, [x24, #-32]
	ldr	q1, [sp, #96]
	stp	q1, q0, [x24], #64
	adds	x25, x25, #16
	b.ne	LBB0_11
	ldr	x4, [sp, #24]
	cmp	x4, x22
	b.eq	LBB0_5
	mov	x6, x26
	ldr	x8, [sp, #16]
	cbz	x8, LBB0_3
LBB0_14:
	mov	x8, x22
	and	x22, x4, #0x7ffffffffffffffc
	sub	x25, x8, x22
	lsl	x8, x8, #2
	add	x27, x21, x8
	add	x28, x20, x8
	mov	x26, x6
	add	x24, x6, x8
LBB0_15:
	ldr	q0, [x24], #16
	ldr	q1, [x28], #16
	blr	x23
	str	q0, [x27], #16
	adds	x25, x25, #4
	b.ne	LBB0_15
	ldr	x4, [sp, #24]
	cmp	x4, x22
	mov	x6, x26
	b.ne	LBB0_3
	b	LBB0_5
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpLdrGot	Lloh2, Lloh3

	.globl	__ZN7cpython8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
__ZN7cpython8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	.cfi_startproc
	sub	sp, sp, #416
	stp	x28, x27, [sp, #336]
	stp	x24, x23, [sp, #352]
	stp	x22, x21, [sp, #368]
	stp	x20, x19, [sp, #384]
	stp	x29, x30, [sp, #400]
	.cfi_def_cfa_offset 416
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	mov	x0, x1
	add	x8, sp, #312
	str	x8, [sp, #16]
	add	x8, sp, #320
	add	x9, sp, #328
	stp	x9, x8, [sp]
Lloh4:
	adrp	x1, "_.const.kernel_for.<locals>.kernel"@GOTPAGE
Lloh5:
	ldr	x1, [x1, "_.const.kernel_for.<locals>.kernel"@GOTPAGEOFF]
Lloh6:
	adrp	x8, _PyArg_UnpackTuple@GOTPAGE
Lloh7:
	ldr	x8, [x8, _PyArg_UnpackTuple@GOTPAGEOFF]
	mov	w2, #3
	mov	w3, #3
	blr	x8
	cbz	w0, LBB1_16
Lloh8:
	adrp	x8, __ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh9:
	ldr	x8, [x8, __ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
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
	ldr	x24, [sp, #224]
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
	str	x24, [sp, #40]
	add	x0, sp, #120
Lloh13:
	adrp	x8, __ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh14:
	ldr	x8, [x8, __ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
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
	ldp	x29, x30, [sp, #400]
	ldp	x20, x19, [sp, #384]
	ldp	x22, x21, [sp, #368]
	ldp	x24, x23, [sp, #352]
	ldp	x28, x27, [sp, #336]
	add	sp, sp, #416
	ret
LBB1_10:
Lloh21:
	adrp	x0, _PyExc_RuntimeError@GOTPAGE
Lloh22:
	ldr	x0, [x0, _PyExc_RuntimeError@GOTPAGEOFF]
Lloh23:
	adrp	x1, "_.const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"@GOTPAGE
Lloh24:
	ldr	x1, [x1, "_.const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"@GOTPAGEOFF]
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

	.globl	_cfunc._ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE
	.p2align	2
_cfunc._ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE:
	sub	sp, sp, #144
	stp	x29, x30, [sp, #128]
	mov	x6, x4
	ldr	x8, [sp, #168]
	ldr	x9, [sp, #224]
	str	xzr, [sp, #120]
	str	x9, [sp, #96]
	str	x8, [sp, #40]
	add	x0, sp, #120
Lloh47:
	adrp	x8, __ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGE
Lloh48:
	ldr	x8, [x8, __ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE@GOTPAGEOFF]
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
"_.const.kernel_for.<locals>.kernel":
	.asciz	"kernel_for.<locals>.kernel"

	.comm	__ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE,8,3
	.p2align	4, 0x0
"_.const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE":
	.asciz	"missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE"

	.p2align	4, 0x0
"_.const.can't unbox array from PyObject into native value.  The object maybe of a different type":
	.asciz	"can't unbox array from PyObject into native value.  The object maybe of a different type"

.subsections_via_symbols
