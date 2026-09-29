; ModuleID = '_reverse_window_score_gain'
source_filename = "<string>"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.const._reverse_window_score_gain = internal constant [27 x i8] c"_reverse_window_score_gain\00"
@_ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx = common local_unnamed_addr global ptr null
@".const.missing Environment: _ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx" = internal constant [192 x i8] c"missing Environment: _ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx\00"
@PyExc_TypeError = external global i8
@".const.can't unbox array from PyObject into native value.  The object maybe of a different type" = internal constant [89 x i8] c"can't unbox array from PyObject into native value.  The object maybe of a different type\00"
@".const.unknown error when calling native function" = internal constant [43 x i8] c"unknown error when calling native function\00"
@PyExc_RuntimeError = external global i8
@PyExc_StopIteration = external global i8
@PyExc_SystemError = external global i8
@".const.unknown error when calling native function.2" = internal constant [43 x i8] c"unknown error when calling native function\00"
@".const.<numba.core.cpu.CPUContext>" = internal constant [28 x i8] c"<numba.core.cpu.CPUContext>\00"
@_ZN08NumbaEnv5numba7cpython8builtins6ol_int12_3clocals_3e4implB3v17B42c8tJTIeFIjxB2IKSgI4CrvQClcaMQ5hEEUSJJgA_3dEb = common local_unnamed_addr global ptr null

define noundef range(i32 -1, -2) i32 @_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx(ptr noalias writeonly captures(none) %retptr, ptr noalias readnone captures(none) %excinfo, ptr %arg.masks.0, ptr readnone captures(none) %arg.masks.1, i64 %arg.masks.2, i64 %arg.masks.3, ptr readonly captures(none) %arg.masks.4, i64 %arg.masks.5.0, i64 %arg.masks.5.1, i64 %arg.masks.6.0, i64 %arg.masks.6.1, ptr readnone captures(none) %arg.order.0, ptr readnone captures(none) %arg.order.1, i64 %arg.order.2, i64 %arg.order.3, ptr readonly captures(none) %arg.order.4, i64 %arg.order.5.0, i64 %arg.order.6.0, i64 %arg.start, i64 %arg.length) local_unnamed_addr {
B0.endif:
  %.272229.not = icmp slt i64 %arg.masks.5.1, 1
  br i1 %.272229.not, label %common.ret, label %B124.lr.ph

B124.lr.ph:                                       ; preds = %B0.endif
  %.103 = add nsw i64 %arg.length, %arg.start
  %0 = getelementptr i64, ptr %arg.order.4, i64 %.103
  %.150 = icmp slt i64 %.103, 0
  %.151 = select i1 %.150, i64 %arg.order.5.0, i64 0
  %.165 = getelementptr i64, ptr %0, i64 %.151
  %.166 = load i64, ptr %.165, align 8
  %1 = getelementptr i8, ptr %0, i64 -8
  %.117.inv = icmp sgt i64 %.103, 0
  %.118 = select i1 %.117.inv, i64 0, i64 %arg.order.5.0
  %.132 = getelementptr i64, ptr %1, i64 %.118
  %.133 = load i64, ptr %.132, align 8
  %2 = getelementptr i64, ptr %arg.order.4, i64 %arg.start
  %.83 = icmp slt i64 %arg.start, 0
  %.84 = select i1 %.83, i64 %arg.order.5.0, i64 0
  %.98 = getelementptr i64, ptr %2, i64 %.84
  %.99 = load i64, ptr %.98, align 8
  %3 = getelementptr i8, ptr %2, i64 -8
  %.51.inv = icmp sgt i64 %arg.start, 0
  %.52 = select i1 %.51.inv, i64 0, i64 %arg.order.5.0
  %.66 = getelementptr i64, ptr %3, i64 %.52
  %.67 = load i64, ptr %.66, align 8
  %.335 = icmp slt i64 %.67, 0
  %.336 = select i1 %.335, i64 %arg.masks.5.0, i64 0
  %.337 = add i64 %.336, %.67
  %.357 = mul i64 %.337, %arg.masks.5.1
  %4 = getelementptr i8, ptr %arg.masks.4, i64 %.357
  %.399 = icmp slt i64 %.99, 0
  %.400 = select i1 %.399, i64 %arg.masks.5.0, i64 0
  %.401 = add i64 %.400, %.99
  %.421 = mul i64 %.401, %arg.masks.5.1
  %5 = getelementptr i8, ptr %arg.masks.4, i64 %.421
  %.463 = icmp slt i64 %.133, 0
  %.464 = select i1 %.463, i64 %arg.masks.5.0, i64 0
  %.465 = add i64 %.464, %.133
  %.485 = mul i64 %.465, %arg.masks.5.1
  %6 = getelementptr i8, ptr %arg.masks.4, i64 %.485
  %.527 = icmp slt i64 %.166, 0
  %.528 = select i1 %.527, i64 %arg.masks.5.0, i64 0
  %.529 = add i64 %.528, %.166
  %.549 = mul i64 %.529, %arg.masks.5.1
  %7 = getelementptr i8, ptr %arg.masks.4, i64 %.549
  %min.iters.check = icmp ult i64 %arg.masks.5.1, 8
  br i1 %min.iters.check, label %B124.endif.endif.endif.endif.endif.endif.endif.endif.preheader, label %vector.ph

vector.ph:                                        ; preds = %B124.lr.ph
  %n.vec = and i64 %arg.masks.5.1, 9223372036854775800
  %8 = add i64 %.549, 4
  %scevgep = getelementptr i8, ptr %arg.masks.4, i64 %8
  %9 = add i64 %.485, 4
  %scevgep27 = getelementptr i8, ptr %arg.masks.4, i64 %9
  %10 = add i64 %.421, 4
  %scevgep30 = getelementptr i8, ptr %arg.masks.4, i64 %10
  %11 = add i64 %.357, 4
  %scevgep33 = getelementptr i8, ptr %arg.masks.4, i64 %11
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %42, %vector.body ]
  %vec.phi15 = phi <4 x i64> [ zeroinitializer, %vector.ph ], [ %43, %vector.body ]
  %scevgep34 = getelementptr i8, ptr %scevgep33, i64 %index
  %scevgep35 = getelementptr i8, ptr %scevgep34, i64 -4
  %wide.load = load <4 x i8>, ptr %scevgep35, align 1
  %wide.load16 = load <4 x i8>, ptr %scevgep34, align 1
  %12 = icmp ne <4 x i8> %wide.load, zeroinitializer
  %13 = icmp ne <4 x i8> %wide.load16, zeroinitializer
  %scevgep31 = getelementptr i8, ptr %scevgep30, i64 %index
  %scevgep32 = getelementptr i8, ptr %scevgep31, i64 -4
  %wide.load17 = load <4 x i8>, ptr %scevgep32, align 1
  %wide.load18 = load <4 x i8>, ptr %scevgep31, align 1
  %14 = icmp ne <4 x i8> %wide.load17, zeroinitializer
  %15 = icmp ne <4 x i8> %wide.load18, zeroinitializer
  %scevgep28 = getelementptr i8, ptr %scevgep27, i64 %index
  %scevgep29 = getelementptr i8, ptr %scevgep28, i64 -4
  %wide.load19 = load <4 x i8>, ptr %scevgep29, align 1
  %wide.load20 = load <4 x i8>, ptr %scevgep28, align 1
  %16 = icmp ne <4 x i8> %wide.load19, zeroinitializer
  %17 = icmp ne <4 x i8> %wide.load20, zeroinitializer
  %scevgep25 = getelementptr i8, ptr %scevgep, i64 %index
  %scevgep26 = getelementptr i8, ptr %scevgep25, i64 -4
  %wide.load21 = load <4 x i8>, ptr %scevgep26, align 1
  %wide.load22 = load <4 x i8>, ptr %scevgep25, align 1
  %18 = icmp ne <4 x i8> %wide.load21, zeroinitializer
  %19 = icmp ne <4 x i8> %wide.load22, zeroinitializer
  %20 = xor <4 x i1> %12, %14
  %21 = xor <4 x i1> %13, %15
  %22 = zext <4 x i1> %20 to <4 x i64>
  %23 = zext <4 x i1> %21 to <4 x i64>
  %24 = xor <4 x i1> %16, %18
  %25 = xor <4 x i1> %17, %19
  %26 = zext <4 x i1> %24 to <4 x i64>
  %27 = zext <4 x i1> %25 to <4 x i64>
  %28 = xor <4 x i1> %12, %16
  %29 = xor <4 x i1> %13, %17
  %30 = sext <4 x i1> %28 to <4 x i64>
  %31 = sext <4 x i1> %29 to <4 x i64>
  %32 = xor <4 x i1> %14, %18
  %33 = xor <4 x i1> %15, %19
  %34 = sext <4 x i1> %32 to <4 x i64>
  %35 = sext <4 x i1> %33 to <4 x i64>
  %36 = add <4 x i64> %vec.phi, %22
  %37 = add <4 x i64> %vec.phi15, %23
  %38 = add <4 x i64> %36, %30
  %39 = add <4 x i64> %37, %31
  %40 = add <4 x i64> %38, %34
  %41 = add <4 x i64> %39, %35
  %42 = add <4 x i64> %40, %26
  %43 = add <4 x i64> %41, %27
  %index.next = add nuw i64 %index, 8
  %44 = icmp eq i64 %n.vec, %index.next
  br i1 %44, label %middle.block, label %vector.body, !llvm.loop !0

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i64> %43, %42
  %rdx.shuf = shufflevector <4 x i64> %bin.rdx, <4 x i64> poison, <4 x i32> <i32 2, i32 3, i32 poison, i32 poison>
  %bin.rdx36 = add <4 x i64> %bin.rdx, %rdx.shuf
  %rdx.shuf37 = shufflevector <4 x i64> %bin.rdx36, <4 x i64> poison, <4 x i32> <i32 1, i32 poison, i32 poison, i32 poison>
  %bin.rdx38 = add <4 x i64> %bin.rdx36, %rdx.shuf37
  %45 = extractelement <4 x i64> %bin.rdx38, i32 0
  %cmp.n = icmp eq i64 %arg.masks.5.1, %n.vec
  br i1 %cmp.n, label %common.ret, label %B124.endif.endif.endif.endif.endif.endif.endif.endif.preheader

B124.endif.endif.endif.endif.endif.endif.endif.endif.preheader: ; preds = %B124.lr.ph, %middle.block
  %gain.2.0232.ph = phi i64 [ 0, %B124.lr.ph ], [ %45, %middle.block ]
  %.278225230.ph = phi i64 [ 0, %B124.lr.ph ], [ %n.vec, %middle.block ]
  br label %B124.endif.endif.endif.endif.endif.endif.endif.endif

common.ret:                                       ; preds = %B124.endif.endif.endif.endif.endif.endif.endif.endif, %middle.block, %B0.endif
  %gain.2.0.lcssa = phi i64 [ 0, %B0.endif ], [ %45, %middle.block ], [ %.674, %B124.endif.endif.endif.endif.endif.endif.endif.endif ]
  store i64 %gain.2.0.lcssa, ptr %retptr, align 8
  ret i32 0

B124.endif.endif.endif.endif.endif.endif.endif.endif: ; preds = %B124.endif.endif.endif.endif.endif.endif.endif.endif.preheader, %B124.endif.endif.endif.endif.endif.endif.endif.endif
  %gain.2.0232 = phi i64 [ %.674, %B124.endif.endif.endif.endif.endif.endif.endif.endif ], [ %gain.2.0232.ph, %B124.endif.endif.endif.endif.endif.endif.endif.endif.preheader ]
  %.278225230 = phi i64 [ %.285, %B124.endif.endif.endif.endif.endif.endif.endif.endif ], [ %.278225230.ph, %B124.endif.endif.endif.endif.endif.endif.endif.endif.preheader ]
  %.285 = add nuw nsw i64 %.278225230, 1
  %.361 = getelementptr i8, ptr %4, i64 %.278225230
  %.362 = load i8, ptr %.361, align 1
  %.365 = icmp ne i8 %.362, 0
  %.425 = getelementptr i8, ptr %5, i64 %.278225230
  %.426 = load i8, ptr %.425, align 1
  %.429 = icmp ne i8 %.426, 0
  %.489 = getelementptr i8, ptr %6, i64 %.278225230
  %.490 = load i8, ptr %.489, align 1
  %.493 = icmp ne i8 %.490, 0
  %.553 = getelementptr i8, ptr %7, i64 %.278225230
  %.554 = load i8, ptr %.553, align 1
  %.557 = icmp ne i8 %.554, 0
  %.566 = xor i1 %.365, %.429
  %.15.i = zext i1 %.566 to i64
  %.592 = xor i1 %.493, %.557
  %.15.i11 = zext i1 %.592 to i64
  %.619 = xor i1 %.365, %.493
  %.15.i12.neg = sext i1 %.619 to i64
  %.646 = xor i1 %.429, %.557
  %.15.i13.neg = sext i1 %.646 to i64
  %.neg = add i64 %gain.2.0232, %.15.i
  %.618 = add i64 %.neg, %.15.i12.neg
  %.neg14 = add i64 %.618, %.15.i13.neg
  %.674 = add i64 %.neg14, %.15.i11
  %exitcond.not = icmp eq i64 %arg.masks.5.1, %.285
  br i1 %exitcond.not, label %common.ret, label %B124.endif.endif.endif.endif.endif.endif.endif.endif, !llvm.loop !3
}

define ptr @_ZN7cpython16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx(ptr readnone captures(none) %py_closure, ptr %py_args, ptr readnone captures(none) %py_kws) local_unnamed_addr {
entry:
  %.5 = alloca ptr, align 8
  %.6 = alloca ptr, align 8
  %.7 = alloca ptr, align 8
  %.8 = alloca ptr, align 8
  %.9 = call i32 (ptr, ptr, i64, i64, ...) @PyArg_UnpackTuple(ptr %py_args, ptr nonnull @.const._reverse_window_score_gain, i64 4, i64 4, ptr nonnull %.5, ptr nonnull %.6, ptr nonnull %.7, ptr nonnull %.8)
  %.10 = icmp eq i32 %.9, 0
  %.22 = alloca { ptr, ptr, i64, i64, ptr, [2 x i64], [2 x i64] }, align 8
  %.47 = alloca { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] }, align 8
  %.101 = alloca i64, align 8
  store i64 0, ptr %.101, align 8
  br i1 %.10, label %common.ret, label %entry.endif, !prof !4

common.ret:                                       ; preds = %entry.endif.endif.endif.e...endif.endif.endif.endif, %entry.endif.endif.endif.e...if.3, %entry.endif.endif.endif.e...endif.3.endif, %arg0.err, %entry.endif.endif.endif, %entry, %entry.endif.endif.endif.e...endif.endif.if.endif, %entry.endif.if
  %common.ret.op = phi ptr [ null, %entry.endif.endif.endif.e...endif.3.endif ], [ null, %entry ], [ null, %entry.endif.if ], [ null, %entry.endif.endif.endif.e...if.3 ], [ %.136, %entry.endif.endif.endif.e...endif.endif.if.endif ], [ null, %arg0.err ], [ null, %entry.endif.endif.endif ], [ null, %entry.endif.endif.endif.e...endif.endif.endif.endif ]
  ret ptr %common.ret.op

entry.endif:                                      ; preds = %entry
  %.14 = load ptr, ptr @_ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx, align 8
  %.17 = icmp eq ptr %.14, null
  br i1 %.17, label %entry.endif.if, label %entry.endif.endif, !prof !4

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_RuntimeError, ptr nonnull @".const.missing Environment: _ZN08NumbaEnv16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx")
  br label %common.ret

entry.endif.endif:                                ; preds = %entry.endif
  %.21 = load ptr, ptr %.5, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(72) %.22, i8 0, i64 72, i1 false)
  %.26 = call i32 @NRT_adapt_ndarray_from_python(ptr %.21, ptr nonnull %.22)
  %sunkaddr = getelementptr inbounds i8, ptr %.22, i64 24
  %.30 = load i64, ptr %sunkaddr, align 8
  %.31 = icmp ne i64 %.30, 1
  %.32 = icmp ne i32 %.26, 0
  %.33 = or i1 %.32, %.31
  br i1 %.33, label %entry.endif.endif.if, label %entry.endif.endif.endif, !prof !4

entry.endif.endif.if:                             ; preds = %entry.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  br label %entry.endif.endif.endif

entry.endif.endif.endif:                          ; preds = %entry.endif.endif.if, %entry.endif.endif
  %.37.fca.0.load = load ptr, ptr %.22, align 8
  %sunkaddr1 = getelementptr inbounds i8, ptr %.22, i64 32
  %.37.fca.4.load = load ptr, ptr %sunkaddr1, align 8
  %sunkaddr2 = getelementptr inbounds i8, ptr %.22, i64 40
  %.37.fca.5.0.load = load i64, ptr %sunkaddr2, align 8
  %sunkaddr3 = getelementptr inbounds i8, ptr %.22, i64 48
  %.37.fca.5.1.load = load i64, ptr %sunkaddr3, align 8
  br i1 %.33, label %common.ret, label %entry.endif.endif.endif.endif, !prof !4

entry.endif.endif.endif.endif:                    ; preds = %entry.endif.endif.endif
  %.46 = load ptr, ptr %.6, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %.47, i8 0, i64 56, i1 false)
  %.51 = call i32 @NRT_adapt_ndarray_from_python(ptr %.46, ptr nonnull %.47)
  %sunkaddr4 = getelementptr inbounds i8, ptr %.47, i64 24
  %.55 = load i64, ptr %sunkaddr4, align 8
  %.56 = icmp ne i64 %.55, 8
  %.57 = icmp ne i32 %.51, 0
  %.58 = or i1 %.57, %.56
  br i1 %.58, label %entry.endif.endif.endif.endif.endif.thread, label %entry.endif.endif.endif.endif.endif.endif, !prof !4

arg0.err:                                         ; preds = %entry.endif.endif.endif.endif.endif.thread, %arg1.err
  call void @NRT_decref(ptr %.37.fca.0.load)
  br label %common.ret

entry.endif.endif.endif.endif.endif.thread:       ; preds = %entry.endif.endif.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  br label %arg0.err

entry.endif.endif.endif.endif.endif.endif:        ; preds = %entry.endif.endif.endif.endif
  %.62.fca.0.load = load ptr, ptr %.47, align 8
  %sunkaddr5 = getelementptr inbounds i8, ptr %.47, i64 32
  %.62.fca.4.load = load ptr, ptr %sunkaddr5, align 8
  %sunkaddr6 = getelementptr inbounds i8, ptr %.47, i64 40
  %.62.fca.5.0.load = load i64, ptr %sunkaddr6, align 8
  %.69 = load ptr, ptr %.7, align 8
  %.72 = call ptr @PyNumber_Long(ptr %.69)
  %.73.not = icmp eq ptr %.72, null
  br i1 %.73.not, label %entry.endif.endif.endif.endif.endif.endif.endif, label %entry.endif.endif.endif.endif.endif.endif.if, !prof !4

arg1.err:                                         ; preds = %entry.endif.endif.endif.e...endif, %entry.endif.endif.endif.endif.endif.endif.endif
  call void @NRT_decref(ptr %.62.fca.0.load)
  br label %arg0.err

entry.endif.endif.endif.endif.endif.endif.if:     ; preds = %entry.endif.endif.endif.endif.endif.endif
  %.75 = call i64 @PyLong_AsLongLong(ptr nonnull %.72)
  call void @Py_DecRef(ptr nonnull %.72)
  br label %entry.endif.endif.endif.endif.endif.endif.endif

entry.endif.endif.endif.endif.endif.endif.endif:  ; preds = %entry.endif.endif.endif.endif.endif.endif.if, %entry.endif.endif.endif.endif.endif.endif
  %.70.0 = phi i64 [ %.75, %entry.endif.endif.endif.endif.endif.endif.if ], [ 0, %entry.endif.endif.endif.endif.endif.endif ]
  %.80 = call ptr @PyErr_Occurred()
  %.81.not = icmp eq ptr %.80, null
  br i1 %.81.not, label %entry.endif.endif.endif.endif.endif.endif.endif.endif, label %arg1.err, !prof !5

entry.endif.endif.endif.endif.endif.endif.endif.endif: ; preds = %entry.endif.endif.endif.endif.endif.endif.endif
  %.85 = load ptr, ptr %.8, align 8
  %.88 = call ptr @PyNumber_Long(ptr %.85)
  %.89.not = icmp eq ptr %.88, null
  br i1 %.89.not, label %entry.endif.endif.endif.e...endif, label %entry.endif.endif.endif.e...if, !prof !4

entry.endif.endif.endif.e...if:                   ; preds = %entry.endif.endif.endif.endif.endif.endif.endif.endif
  %.91 = call i64 @PyLong_AsLongLong(ptr nonnull %.88)
  call void @Py_DecRef(ptr nonnull %.88)
  br label %entry.endif.endif.endif.e...endif

entry.endif.endif.endif.e...endif:                ; preds = %entry.endif.endif.endif.e...if, %entry.endif.endif.endif.endif.endif.endif.endif.endif
  %.86.0 = phi i64 [ %.91, %entry.endif.endif.endif.e...if ], [ 0, %entry.endif.endif.endif.endif.endif.endif.endif.endif ]
  %.96 = call ptr @PyErr_Occurred()
  %.97.not = icmp eq ptr %.96, null
  br i1 %.97.not, label %entry.endif.endif.endif.e...endif.endif, label %arg1.err, !prof !5

entry.endif.endif.endif.e...endif.endif:          ; preds = %entry.endif.endif.endif.e...endif
  store i64 0, ptr %.101, align 8
  %.111 = call i32 @_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.101, ptr nonnull poison, ptr %.37.fca.0.load, ptr poison, i64 poison, i64 poison, ptr %.37.fca.4.load, i64 %.37.fca.5.0.load, i64 %.37.fca.5.1.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.62.fca.4.load, i64 %.62.fca.5.0.load, i64 poison, i64 %.70.0, i64 %.86.0) #2
  %.121 = load i64, ptr %.101, align 8
  call void @NRT_decref(ptr %.37.fca.0.load)
  call void @NRT_decref(ptr %.62.fca.0.load)
  %cond = icmp eq i32 %.111, 0
  br i1 %cond, label %entry.endif.endif.endif.e...endif.endif.if.endif, label %entry.endif.endif.endif.e...endif.endif.endif, !prof !6

entry.endif.endif.endif.e...endif.endif.endif:    ; preds = %entry.endif.endif.endif.e...endif.endif
  %.119 = icmp sgt i32 %.111, 0
  br i1 %.119, label %entry.endif.endif.endif.e...endif.endif.endif.if, label %entry.endif.endif.endif.e...endif.endif.endif.endif

entry.endif.endif.endif.e...endif.endif.if.endif: ; preds = %entry.endif.endif.endif.e...endif.endif
  %.136 = call ptr @PyLong_FromLongLong(i64 %.121)
  br label %common.ret

entry.endif.endif.endif.e...endif.endif.endif.if: ; preds = %entry.endif.endif.endif.e...endif.endif.endif
  call void @PyErr_Clear()
  unreachable

entry.endif.endif.endif.e...endif.endif.endif.endif: ; preds = %entry.endif.endif.endif.e...endif.endif.endif
  switch i32 %.111, label %entry.endif.endif.endif.e...endif.3.endif [
    i32 -3, label %entry.endif.endif.endif.e...if.3
    i32 -1, label %common.ret
  ]

entry.endif.endif.endif.e...if.3:                 ; preds = %entry.endif.endif.endif.e...endif.endif.endif.endif
  call void @PyErr_SetNone(ptr nonnull @PyExc_StopIteration)
  br label %common.ret

entry.endif.endif.endif.e...endif.3.endif:        ; preds = %entry.endif.endif.endif.e...endif.endif.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_SystemError, ptr nonnull @".const.unknown error when calling native function")
  br label %common.ret
}

declare i32 @PyArg_UnpackTuple(ptr, ptr, i64, i64, ...) local_unnamed_addr

declare void @PyErr_SetString(ptr, ptr) local_unnamed_addr

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #0

declare i32 @NRT_adapt_ndarray_from_python(ptr captures(none), ptr captures(none)) local_unnamed_addr

declare ptr @PyNumber_Long(ptr) local_unnamed_addr

declare i64 @PyLong_AsLongLong(ptr) local_unnamed_addr

declare void @Py_DecRef(ptr) local_unnamed_addr

declare ptr @PyErr_Occurred() local_unnamed_addr

declare ptr @PyLong_FromLongLong(i64) local_unnamed_addr

declare void @PyErr_Clear() local_unnamed_addr

declare void @PyErr_SetNone(ptr) local_unnamed_addr

define i64 @cfunc._ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx({ ptr, ptr, i64, i64, ptr, [2 x i64], [2 x i64] } %.1, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, i64 %.3, i64 %.4) local_unnamed_addr {
entry:
  %.6 = alloca i64, align 8
  store i64 0, ptr %.6, align 8
  %extracted.meminfo = extractvalue { ptr, ptr, i64, i64, ptr, [2 x i64], [2 x i64] } %.1, 0
  %extracted.data = extractvalue { ptr, ptr, i64, i64, ptr, [2 x i64], [2 x i64] } %.1, 4
  %extracted.shape = extractvalue { ptr, ptr, i64, i64, ptr, [2 x i64], [2 x i64] } %.1, 5
  %.10 = extractvalue [2 x i64] %extracted.shape, 0
  %.11 = extractvalue [2 x i64] %extracted.shape, 1
  %extracted.data.1 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, 4
  %extracted.shape.1 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, 5
  %.14 = extractvalue [1 x i64] %extracted.shape.1, 0
  %.16 = call i32 @_ZN16optimized_kernel26_reverse_window_score_gainB3v16B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.6, ptr nonnull poison, ptr %extracted.meminfo, ptr poison, i64 poison, i64 poison, ptr %extracted.data, i64 %.10, i64 %.11, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.1, i64 %.14, i64 poison, i64 %.3, i64 %.4) #2
  %.26 = load i64, ptr %.6, align 8
  %.28 = alloca i32, align 4
  store i32 0, ptr %.28, align 4
  %cond = icmp eq i32 %.16, 0
  br i1 %cond, label %common.ret, label %entry.if, !prof !6

entry.if:                                         ; preds = %entry
  %.24 = icmp sgt i32 %.16, 0
  call void @numba_gil_ensure(ptr nonnull %.28)
  br i1 %.24, label %entry.if.if, label %entry.if.endif

common.ret:                                       ; preds = %entry, %.31
  ret i64 %.26

.31:                                              ; preds = %entry.if.endif, %entry.if.endif.endif.endif, %entry.if.endif.if
  %.79 = call ptr @PyUnicode_FromString(ptr nonnull @".const.<numba.core.cpu.CPUContext>")
  call void @PyErr_WriteUnraisable(ptr %.79)
  call void @Py_DecRef(ptr %.79)
  call void @numba_gil_release(ptr nonnull %.28)
  br label %common.ret

entry.if.if:                                      ; preds = %entry.if
  call void @PyErr_Clear()
  unreachable

entry.if.endif:                                   ; preds = %entry.if
  switch i32 %.16, label %entry.if.endif.endif.endif [
    i32 -3, label %entry.if.endif.if
    i32 -1, label %.31
  ]

entry.if.endif.if:                                ; preds = %entry.if.endif
  call void @PyErr_SetNone(ptr nonnull @PyExc_StopIteration)
  br label %.31

entry.if.endif.endif.endif:                       ; preds = %entry.if.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_SystemError, ptr nonnull @".const.unknown error when calling native function.2")
  br label %.31
}

declare void @numba_gil_ensure(ptr) local_unnamed_addr

declare ptr @PyUnicode_FromString(ptr) local_unnamed_addr

declare void @PyErr_WriteUnraisable(ptr) local_unnamed_addr

declare void @numba_gil_release(ptr) local_unnamed_addr

; Function Attrs: mustprogress nofree noinline norecurse nounwind willreturn memory(argmem: readwrite)
define linkonce_odr void @NRT_incref(ptr captures(address_is_null) %.1) local_unnamed_addr #1 {
.3:
  %.4 = icmp eq ptr %.1, null
  br i1 %.4, label %common.ret, label %.3.endif, !prof !4

common.ret:                                       ; preds = %.3.endif, %.3
  ret void

.3.endif:                                         ; preds = %.3
  %.4.i = atomicrmw add ptr %.1, i64 1 monotonic, align 8
  br label %common.ret
}

; Function Attrs: noinline
define linkonce_odr void @NRT_decref(ptr %.1) local_unnamed_addr #2 {
.3:
  %.4 = icmp eq ptr %.1, null
  br i1 %.4, label %common.ret1, label %.3.endif, !prof !4

common.ret1:                                      ; preds = %.3, %.3.endif
  ret void

.3.endif:                                         ; preds = %.3
  fence release
  %0 = tail call i8 @llvm.x86.atomic.sub.cc.i64(ptr nonnull %.1, i64 1, i32 4)
  %1 = trunc i8 %0 to i1
  br i1 %1, label %.3.endif.if, label %common.ret1, !prof !4

.3.endif.if:                                      ; preds = %.3.endif
  fence acquire
  tail call void @NRT_MemInfo_call_dtor(ptr nonnull %.1)
  ret void
}

; Function Attrs: nounwind
declare i8 @llvm.x86.atomic.sub.cc.i64(ptr, i64, i32 immarg) #3

declare void @NRT_MemInfo_call_dtor(ptr) local_unnamed_addr

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v4i64(<4 x i64>) #4

attributes #0 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #1 = { mustprogress nofree noinline norecurse nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { noinline }
attributes #3 = { nounwind }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!0 = distinct !{!0, !1, !2}
!1 = !{!"llvm.loop.isvectorized", i32 1}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = distinct !{!3, !2, !1}
!4 = !{!"branch_weights", i32 1, i32 99}
!5 = !{!"branch_weights", i32 99, i32 1}
!6 = !{!"branch_weights", i32 49, i32 1}
