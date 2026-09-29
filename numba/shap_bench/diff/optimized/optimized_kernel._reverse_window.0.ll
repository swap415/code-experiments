; ModuleID = '_reverse_window'
source_filename = "<string>"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.const._reverse_window = internal constant [16 x i8] c"_reverse_window\00"
@_ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx = common local_unnamed_addr global ptr null
@".const.missing Environment: _ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx" = internal constant [150 x i8] c"missing Environment: _ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx\00"
@PyExc_TypeError = external global i8
@".const.can't unbox array from PyObject into native value.  The object maybe of a different type" = internal constant [89 x i8] c"can't unbox array from PyObject into native value.  The object maybe of a different type\00"
@_Py_NoneStruct = external global i8
@PyExc_RuntimeError = external global i8

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define noundef i32 @_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx(ptr noalias writeonly captures(none) %retptr, ptr noalias readnone captures(none) %excinfo, ptr readnone captures(none) %arg.order.0, ptr readnone captures(none) %arg.order.1, i64 %arg.order.2, i64 %arg.order.3, ptr captures(none) %arg.order.4, i64 %arg.order.5.0, i64 %arg.order.6.0, i64 %arg.start, i64 %arg.length) local_unnamed_addr #0 {
B0.else.if:
  %.36.1 = ashr i64 %arg.length, 1
  %.148107.not = icmp slt i64 %.36.1, 1
  br i1 %.148107.not, label %B124, label %B36.lr.ph

B36.lr.ph:                                        ; preds = %B0.else.if
  %.220 = add nsw i64 %arg.length, %arg.start
  %xtraiter = and i64 %.36.1, 3
  %0 = icmp ult i64 %.36.1, 4
  br i1 %0, label %B36.epil.preheader, label %B36.lr.ph.new

B36.lr.ph.new:                                    ; preds = %B36.lr.ph
  %unroll_iter = and i64 %.36.1, 9223372036854775804
  %1 = shl i64 %arg.start, 3
  %scevgep9 = getelementptr i8, ptr %arg.order.4, i64 %1
  %2 = shl i64 %arg.length, 3
  %scevgep19 = getelementptr i8, ptr %scevgep9, i64 %2
  %3 = add i64 %arg.length, -1
  br label %B36

B36:                                              ; preds = %B36, %B36.lr.ph.new
  %lsr.iv25 = phi i64 [ %lsr.iv.next26, %B36 ], [ %3, %B36.lr.ph.new ]
  %lsr.iv21 = phi i64 [ %lsr.iv.next22, %B36 ], [ 0, %B36.lr.ph.new ]
  %.154106108 = phi i64 [ 0, %B36.lr.ph.new ], [ %.161.3, %B36 ]
  %4 = add i64 %arg.start, %.154106108
  %.201 = icmp slt i64 %4, 0
  %.202 = select i1 %.201, i64 %arg.order.5.0, i64 0
  %5 = shl i64 %.202, 3
  %scevgep27 = getelementptr i8, ptr %scevgep9, i64 %5
  %6 = shl i64 %.154106108, 3
  %scevgep28 = getelementptr i8, ptr %scevgep27, i64 %6
  %.217 = load i64, ptr %scevgep28, align 8
  %7 = add i64 %arg.start, %lsr.iv25
  %.236 = icmp slt i64 %7, 0
  %.237 = select i1 %.236, i64 %arg.order.5.0, i64 0
  %8 = shl i64 %.237, 3
  %scevgep20 = getelementptr i8, ptr %scevgep19, i64 %8
  %scevgep23 = getelementptr i8, ptr %scevgep20, i64 %lsr.iv21
  %scevgep24 = getelementptr i8, ptr %scevgep23, i64 -8
  %.252 = load i64, ptr %scevgep24, align 8
  store i64 %.252, ptr %scevgep28, align 8
  store i64 %.217, ptr %scevgep24, align 8
  %9 = add i64 %arg.start, %.154106108
  %10 = add i64 %9, 1
  %.201.1 = icmp slt i64 %10, 0
  %.202.1 = select i1 %.201.1, i64 %arg.order.5.0, i64 0
  %11 = shl i64 %.202.1, 3
  %scevgep16 = getelementptr i8, ptr %scevgep9, i64 %11
  %12 = shl i64 %.154106108, 3
  %scevgep17 = getelementptr i8, ptr %scevgep16, i64 %12
  %scevgep18 = getelementptr i8, ptr %scevgep17, i64 8
  %.217.1 = load i64, ptr %scevgep18, align 8
  %13 = xor i64 %.154106108, -2
  %.222.1 = add i64 %.220, %13
  %.236.1 = icmp slt i64 %.222.1, 0
  %.237.1 = select i1 %.236.1, i64 %arg.order.5.0, i64 0
  %14 = getelementptr i64, ptr %arg.order.4, i64 %.222.1
  %.251.1 = getelementptr i64, ptr %14, i64 %.237.1
  %.252.1 = load i64, ptr %.251.1, align 8
  store i64 %.252.1, ptr %scevgep18, align 8
  store i64 %.217.1, ptr %.251.1, align 8
  %15 = add i64 %arg.start, %.154106108
  %16 = add i64 %15, 2
  %.201.2 = icmp slt i64 %16, 0
  %.202.2 = select i1 %.201.2, i64 %arg.order.5.0, i64 0
  %17 = shl i64 %.202.2, 3
  %scevgep13 = getelementptr i8, ptr %scevgep9, i64 %17
  %18 = shl i64 %.154106108, 3
  %scevgep14 = getelementptr i8, ptr %scevgep13, i64 %18
  %scevgep15 = getelementptr i8, ptr %scevgep14, i64 16
  %.217.2 = load i64, ptr %scevgep15, align 8
  %19 = xor i64 %.154106108, -3
  %.222.2 = add i64 %.220, %19
  %.236.2 = icmp slt i64 %.222.2, 0
  %.237.2 = select i1 %.236.2, i64 %arg.order.5.0, i64 0
  %20 = getelementptr i64, ptr %arg.order.4, i64 %.222.2
  %.251.2 = getelementptr i64, ptr %20, i64 %.237.2
  %.252.2 = load i64, ptr %.251.2, align 8
  store i64 %.252.2, ptr %scevgep15, align 8
  store i64 %.217.2, ptr %.251.2, align 8
  %.161.3 = add nuw nsw i64 %.154106108, 4
  %21 = add i64 %arg.start, %.154106108
  %22 = add i64 %21, 3
  %.201.3 = icmp slt i64 %22, 0
  %.202.3 = select i1 %.201.3, i64 %arg.order.5.0, i64 0
  %23 = shl i64 %.202.3, 3
  %scevgep10 = getelementptr i8, ptr %scevgep9, i64 %23
  %24 = shl i64 %.154106108, 3
  %scevgep11 = getelementptr i8, ptr %scevgep10, i64 %24
  %scevgep12 = getelementptr i8, ptr %scevgep11, i64 24
  %.217.3 = load i64, ptr %scevgep12, align 8
  %25 = xor i64 %.154106108, -4
  %.222.3 = add i64 %.220, %25
  %.236.3 = icmp slt i64 %.222.3, 0
  %.237.3 = select i1 %.236.3, i64 %arg.order.5.0, i64 0
  %26 = getelementptr i64, ptr %arg.order.4, i64 %.222.3
  %.251.3 = getelementptr i64, ptr %26, i64 %.237.3
  %.252.3 = load i64, ptr %.251.3, align 8
  store i64 %.252.3, ptr %scevgep12, align 8
  store i64 %.217.3, ptr %.251.3, align 8
  %lsr.iv.next22 = add i64 %lsr.iv21, -32
  %lsr.iv.next26 = add i64 %lsr.iv25, -4
  %niter.ncmp.3 = icmp eq i64 %unroll_iter, %.161.3
  br i1 %niter.ncmp.3, label %B124.loopexit.unr-lcssa, label %B36

B124.loopexit.unr-lcssa:                          ; preds = %B36
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %B124, label %B36.epil.preheader

B36.epil.preheader:                               ; preds = %B124.loopexit.unr-lcssa, %B36.lr.ph
  %.154106108.epil.init = phi i64 [ 0, %B36.lr.ph ], [ %.161.3, %B124.loopexit.unr-lcssa ]
  %27 = add i64 %arg.length, %arg.start
  %28 = add i64 %27, -1
  %29 = sub i64 %28, %.154106108.epil.init
  %30 = add nsw i64 %.154106108.epil.init, %arg.start
  br label %B36.epil

B36.epil:                                         ; preds = %B36.epil, %B36.epil.preheader
  %lsr.iv7 = phi i64 [ %lsr.iv.next8, %B36.epil ], [ %xtraiter, %B36.epil.preheader ]
  %lsr.iv4 = phi i64 [ %lsr.iv.next5, %B36.epil ], [ %30, %B36.epil.preheader ]
  %lsr.iv = phi i64 [ %lsr.iv.next, %B36.epil ], [ %29, %B36.epil.preheader ]
  %.201.epil = icmp slt i64 %lsr.iv4, 0
  %.202.epil = select i1 %.201.epil, i64 %arg.order.5.0, i64 0
  %31 = shl i64 %.202.epil, 3
  %scevgep3 = getelementptr i8, ptr %arg.order.4, i64 %31
  %32 = shl i64 %lsr.iv4, 3
  %scevgep6 = getelementptr i8, ptr %scevgep3, i64 %32
  %.217.epil = load i64, ptr %scevgep6, align 8
  %.236.epil = icmp slt i64 %lsr.iv, 0
  %.237.epil = select i1 %.236.epil, i64 %arg.order.5.0, i64 0
  %33 = shl i64 %.237.epil, 3
  %scevgep = getelementptr i8, ptr %arg.order.4, i64 %33
  %34 = shl i64 %lsr.iv, 3
  %scevgep2 = getelementptr i8, ptr %scevgep, i64 %34
  %.252.epil = load i64, ptr %scevgep2, align 8
  store i64 %.252.epil, ptr %scevgep6, align 8
  store i64 %.217.epil, ptr %scevgep2, align 8
  %lsr.iv.next = add i64 %lsr.iv, -1
  %lsr.iv.next5 = add i64 %lsr.iv4, 1
  %lsr.iv.next8 = add nsw i64 %lsr.iv7, -1
  %epil.iter.cmp.not = icmp eq i64 %lsr.iv.next8, 0
  br i1 %epil.iter.cmp.not, label %B124, label %B36.epil, !llvm.loop !0

B124:                                             ; preds = %B36.epil, %B124.loopexit.unr-lcssa, %B0.else.if
  store ptr null, ptr %retptr, align 8
  ret i32 0
}

define noundef ptr @_ZN7cpython16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx(ptr readnone captures(none) %py_closure, ptr %py_args, ptr readnone captures(none) %py_kws) local_unnamed_addr {
entry:
  %.5 = alloca ptr, align 8
  %.6 = alloca ptr, align 8
  %.7 = alloca ptr, align 8
  %.8 = call i32 (ptr, ptr, i64, i64, ...) @PyArg_UnpackTuple(ptr %py_args, ptr nonnull @.const._reverse_window, i64 3, i64 3, ptr nonnull %.5, ptr nonnull %.6, ptr nonnull %.7)
  %.9 = icmp eq i32 %.8, 0
  %.21 = alloca { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] }, align 8
  %.75 = alloca ptr, align 8
  br i1 %.9, label %common.ret, label %entry.endif, !prof !2

common.ret:                                       ; preds = %entry.endif.endif.endif.thread, %arg0.err, %entry, %entry.endif.endif.endif.endif.endif.endif.endif.endif, %entry.endif.if
  %common.ret.op = phi ptr [ null, %arg0.err ], [ null, %entry ], [ null, %entry.endif.if ], [ null, %entry.endif.endif.endif.thread ], [ @_Py_NoneStruct, %entry.endif.endif.endif.endif.endif.endif.endif.endif ]
  ret ptr %common.ret.op

entry.endif:                                      ; preds = %entry
  %.13 = load ptr, ptr @_ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx, align 8
  %.16 = icmp eq ptr %.13, null
  br i1 %.16, label %entry.endif.if, label %entry.endif.endif, !prof !2

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_RuntimeError, ptr nonnull @".const.missing Environment: _ZN08NumbaEnv16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx")
  br label %common.ret

entry.endif.endif:                                ; preds = %entry.endif
  %.20 = load ptr, ptr %.5, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %.21, i8 0, i64 56, i1 false)
  %.25 = call i32 @NRT_adapt_ndarray_from_python(ptr %.20, ptr nonnull %.21)
  %sunkaddr = getelementptr inbounds i8, ptr %.21, i64 24
  %.29 = load i64, ptr %sunkaddr, align 8
  %.30 = icmp ne i64 %.29, 8
  %.31 = icmp ne i32 %.25, 0
  %.32 = or i1 %.31, %.30
  br i1 %.32, label %entry.endif.endif.endif.thread, label %entry.endif.endif.endif.endif, !prof !2

entry.endif.endif.endif.thread:                   ; preds = %entry.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  br label %common.ret

entry.endif.endif.endif.endif:                    ; preds = %entry.endif.endif
  %.36.fca.0.load = load ptr, ptr %.21, align 8
  %sunkaddr1 = getelementptr inbounds i8, ptr %.21, i64 32
  %.36.fca.4.load = load ptr, ptr %sunkaddr1, align 8
  %sunkaddr2 = getelementptr inbounds i8, ptr %.21, i64 40
  %.36.fca.5.0.load = load i64, ptr %sunkaddr2, align 8
  %.43 = load ptr, ptr %.6, align 8
  %.46 = call ptr @PyNumber_Long(ptr %.43)
  %.47.not = icmp eq ptr %.46, null
  br i1 %.47.not, label %entry.endif.endif.endif.endif.endif, label %entry.endif.endif.endif.endif.if, !prof !2

arg0.err:                                         ; preds = %entry.endif.endif.endif.endif.endif.endif.endif, %entry.endif.endif.endif.endif.endif
  call void @NRT_decref(ptr %.36.fca.0.load)
  br label %common.ret

entry.endif.endif.endif.endif.if:                 ; preds = %entry.endif.endif.endif.endif
  %.49 = call i64 @PyLong_AsLongLong(ptr nonnull %.46)
  call void @Py_DecRef(ptr nonnull %.46)
  br label %entry.endif.endif.endif.endif.endif

entry.endif.endif.endif.endif.endif:              ; preds = %entry.endif.endif.endif.endif.if, %entry.endif.endif.endif.endif
  %.44.0 = phi i64 [ %.49, %entry.endif.endif.endif.endif.if ], [ 0, %entry.endif.endif.endif.endif ]
  %.54 = call ptr @PyErr_Occurred()
  %.55.not = icmp eq ptr %.54, null
  br i1 %.55.not, label %entry.endif.endif.endif.endif.endif.endif, label %arg0.err, !prof !3

entry.endif.endif.endif.endif.endif.endif:        ; preds = %entry.endif.endif.endif.endif.endif
  %.59 = load ptr, ptr %.7, align 8
  %.62 = call ptr @PyNumber_Long(ptr %.59)
  %.63.not = icmp eq ptr %.62, null
  br i1 %.63.not, label %entry.endif.endif.endif.endif.endif.endif.endif, label %entry.endif.endif.endif.endif.endif.endif.if, !prof !2

entry.endif.endif.endif.endif.endif.endif.if:     ; preds = %entry.endif.endif.endif.endif.endif.endif
  %.65 = call i64 @PyLong_AsLongLong(ptr nonnull %.62)
  call void @Py_DecRef(ptr nonnull %.62)
  br label %entry.endif.endif.endif.endif.endif.endif.endif

entry.endif.endif.endif.endif.endif.endif.endif:  ; preds = %entry.endif.endif.endif.endif.endif.endif.if, %entry.endif.endif.endif.endif.endif.endif
  %.60.0 = phi i64 [ %.65, %entry.endif.endif.endif.endif.endif.endif.if ], [ 0, %entry.endif.endif.endif.endif.endif.endif ]
  %.70 = call ptr @PyErr_Occurred()
  %.71.not = icmp eq ptr %.70, null
  br i1 %.71.not, label %entry.endif.endif.endif.endif.endif.endif.endif.endif, label %arg0.err, !prof !3

entry.endif.endif.endif.endif.endif.endif.endif.endif: ; preds = %entry.endif.endif.endif.endif.endif.endif.endif
  %.81 = call i32 @_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.75, ptr nonnull poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.36.fca.4.load, i64 %.36.fca.5.0.load, i64 poison, i64 %.44.0, i64 %.60.0) #3
  call void @NRT_decref(ptr %.36.fca.0.load)
  call void @Py_IncRef(ptr nonnull @_Py_NoneStruct)
  br label %common.ret
}

declare i32 @PyArg_UnpackTuple(ptr, ptr, i64, i64, ...) local_unnamed_addr

declare void @PyErr_SetString(ptr, ptr) local_unnamed_addr

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #1

declare i32 @NRT_adapt_ndarray_from_python(ptr captures(none), ptr captures(none)) local_unnamed_addr

declare ptr @PyNumber_Long(ptr) local_unnamed_addr

declare i64 @PyLong_AsLongLong(ptr) local_unnamed_addr

declare void @Py_DecRef(ptr) local_unnamed_addr

declare ptr @PyErr_Occurred() local_unnamed_addr

declare void @Py_IncRef(ptr) local_unnamed_addr

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define ptr @cfunc._ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx({ ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, i64 %.2, i64 %.3) local_unnamed_addr #2 {
entry:
  %.5 = alloca ptr, align 8
  store ptr null, ptr %.5, align 8
  %extracted.data = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 4
  %extracted.shape = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 5
  %.9 = extractvalue [1 x i64] %extracted.shape, 0
  %.11 = call i32 @_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.5, ptr nonnull poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data, i64 %.9, i64 poison, i64 %.2, i64 %.3) #3
  %.21 = load ptr, ptr %.5, align 8
  ret ptr %.21
}

; Function Attrs: noinline
define linkonce_odr void @NRT_decref(ptr %.1) local_unnamed_addr #3 {
.3:
  %.4 = icmp eq ptr %.1, null
  br i1 %.4, label %common.ret1, label %.3.endif, !prof !2

common.ret1:                                      ; preds = %.3, %.3.endif
  ret void

.3.endif:                                         ; preds = %.3
  fence release
  %0 = tail call i8 @llvm.x86.atomic.sub.cc.i64(ptr nonnull %.1, i64 1, i32 4)
  %1 = trunc i8 %0 to i1
  br i1 %1, label %.3.endif.if, label %common.ret1, !prof !2

.3.endif.if:                                      ; preds = %.3.endif
  fence acquire
  tail call void @NRT_MemInfo_call_dtor(ptr nonnull %.1)
  ret void
}

; Function Attrs: nounwind
declare i8 @llvm.x86.atomic.sub.cc.i64(ptr, i64, i32 immarg) #4

declare void @NRT_MemInfo_call_dtor(ptr) local_unnamed_addr

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #5

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) }
attributes #3 = { noinline }
attributes #4 = { nounwind }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!0 = distinct !{!0, !1}
!1 = !{!"llvm.loop.unroll.disable"}
!2 = !{!"branch_weights", i32 1, i32 99}
!3 = !{!"branch_weights", i32 99, i32 1}
