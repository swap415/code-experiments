; ModuleID = 'make_kernel.<locals>.kernel'
source_filename = "<string>"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.6.0"

@".const.make_kernel.<locals>.kernel" = internal constant [28 x i8] c"make_kernel.<locals>.kernel\00"
@_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE = common local_unnamed_addr global ptr null
@".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE" = internal constant [218 x i8] c"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE\00"
@PyExc_TypeError = external global i8
@".const.can't unbox array from PyObject into native value.  The object maybe of a different type" = internal constant [89 x i8] c"can't unbox array from PyObject into native value.  The object maybe of a different type\00"
@_Py_NoneStruct = external global i8
@PyExc_RuntimeError = external global i8
@llvm.compiler.used = appending global [1 x ptr] [ptr @_simd_pow_f4], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define noundef i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE(ptr noalias writeonly captures(none) %retptr, ptr noalias readnone captures(none) %excinfo, ptr readnone captures(none) %arg.x.0, ptr readnone captures(none) %arg.x.1, i64 %arg.x.2, i64 %arg.x.3, ptr readonly captures(none) %arg.x.4, i64 %arg.x.5.0, i64 %arg.x.6.0, ptr readnone captures(none) %arg.y.0, ptr readnone captures(none) %arg.y.1, i64 %arg.y.2, i64 %arg.y.3, ptr readonly captures(none) %arg.y.4, i64 %arg.y.5.0, i64 %arg.y.6.0, ptr readnone captures(none) %arg.out.0, ptr readnone captures(none) %arg.out.1, i64 %arg.out.2, i64 %arg.out.3, ptr writeonly captures(none) %arg.out.4, i64 %arg.out.5.0, i64 %arg.out.6.0) local_unnamed_addr #0 {
B0.endif:
  %.134112.not = icmp slt i64 %arg.x.2, 1
  br i1 %.134112.not, label %B88, label %iter.check

iter.check:                                       ; preds = %B0.endif
  %min.iters.check = icmp ult i64 %arg.x.2, 4
  br i1 %min.iters.check, label %B52.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %0 = ptrtoint ptr %arg.out.4 to i64
  %1 = ptrtoint ptr %arg.x.4 to i64
  %2 = ptrtoint ptr %arg.y.4 to i64
  %3 = sub i64 %0, %1
  %diff.check = icmp ult i64 %3, 64
  %4 = sub i64 %0, %2
  %diff.check4 = icmp ult i64 %4, 64
  %conflict.rdx = or i1 %diff.check, %diff.check4
  br i1 %conflict.rdx, label %B52.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %min.iters.check5 = icmp ult i64 %arg.x.2, 16
  br i1 %min.iters.check5, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.mod.vf = and i64 %arg.x.2, 12
  %n.vec = and i64 %arg.x.2, 9223372036854775792
  %scevgep41 = getelementptr i8, ptr %arg.x.4, i64 32
  %scevgep47 = getelementptr i8, ptr %arg.y.4, i64 32
  %scevgep53 = getelementptr i8, ptr %arg.out.4, i64 32
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %lsr.iv54 = phi ptr [ %scevgep55, %vector.body ], [ %scevgep53, %vector.ph ]
  %lsr.iv48 = phi ptr [ %scevgep49, %vector.body ], [ %scevgep47, %vector.ph ]
  %lsr.iv42 = phi ptr [ %scevgep43, %vector.body ], [ %scevgep41, %vector.ph ]
  %lsr.iv39 = phi i64 [ %lsr.iv.next40, %vector.body ], [ %n.vec, %vector.ph ]
  %scevgep45 = getelementptr i8, ptr %lsr.iv42, i64 -32
  %scevgep46 = getelementptr i8, ptr %lsr.iv42, i64 -16
  %scevgep44 = getelementptr i8, ptr %lsr.iv42, i64 16
  %wide.load = load <4 x float>, ptr %scevgep45, align 4
  %wide.load6 = load <4 x float>, ptr %scevgep46, align 4
  %wide.load7 = load <4 x float>, ptr %lsr.iv42, align 4
  %wide.load8 = load <4 x float>, ptr %scevgep44, align 4
  %scevgep51 = getelementptr i8, ptr %lsr.iv48, i64 -32
  %scevgep52 = getelementptr i8, ptr %lsr.iv48, i64 -16
  %scevgep50 = getelementptr i8, ptr %lsr.iv48, i64 16
  %wide.load9 = load <4 x float>, ptr %scevgep51, align 4
  %wide.load10 = load <4 x float>, ptr %scevgep52, align 4
  %wide.load11 = load <4 x float>, ptr %lsr.iv48, align 4
  %wide.load12 = load <4 x float>, ptr %scevgep50, align 4
  %5 = tail call <4 x float> @_simd_pow_f4(<4 x float> %wide.load, <4 x float> %wide.load9)
  %6 = tail call <4 x float> @_simd_pow_f4(<4 x float> %wide.load6, <4 x float> %wide.load10)
  %7 = tail call <4 x float> @_simd_pow_f4(<4 x float> %wide.load7, <4 x float> %wide.load11)
  %8 = tail call <4 x float> @_simd_pow_f4(<4 x float> %wide.load8, <4 x float> %wide.load12)
  %scevgep56 = getelementptr i8, ptr %lsr.iv54, i64 -32
  %scevgep58 = getelementptr i8, ptr %lsr.iv54, i64 -16
  %scevgep57 = getelementptr i8, ptr %lsr.iv54, i64 16
  store <4 x float> %5, ptr %scevgep56, align 4
  store <4 x float> %6, ptr %scevgep58, align 4
  store <4 x float> %7, ptr %lsr.iv54, align 4
  store <4 x float> %8, ptr %scevgep57, align 4
  %lsr.iv.next40 = add nsw i64 %lsr.iv39, -16
  %scevgep43 = getelementptr i8, ptr %lsr.iv42, i64 64
  %scevgep49 = getelementptr i8, ptr %lsr.iv48, i64 64
  %scevgep55 = getelementptr i8, ptr %lsr.iv54, i64 64
  %9 = icmp eq i64 %lsr.iv.next40, 0
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !0

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %arg.x.2, %n.vec
  br i1 %cmp.n, label %B88, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %min.epilog.iters.check = icmp eq i64 %n.mod.vf, 0
  br i1 %min.epilog.iters.check, label %B52.preheader, label %vec.epilog.ph, !prof !3

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec14 = and i64 %arg.x.2, 9223372036854775804
  %10 = sub i64 %vec.epilog.resume.val, %n.vec14
  %11 = shl i64 %vec.epilog.resume.val, 2
  %scevgep30 = getelementptr i8, ptr %arg.out.4, i64 %11
  %scevgep33 = getelementptr i8, ptr %arg.y.4, i64 %11
  %scevgep36 = getelementptr i8, ptr %arg.x.4, i64 %11
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %lsr.iv37 = phi ptr [ %scevgep38, %vec.epilog.vector.body ], [ %scevgep36, %vec.epilog.ph ]
  %lsr.iv34 = phi ptr [ %scevgep35, %vec.epilog.vector.body ], [ %scevgep33, %vec.epilog.ph ]
  %lsr.iv31 = phi ptr [ %scevgep32, %vec.epilog.vector.body ], [ %scevgep30, %vec.epilog.ph ]
  %lsr.iv28 = phi i64 [ %lsr.iv.next29, %vec.epilog.vector.body ], [ %10, %vec.epilog.ph ]
  %wide.load16 = load <4 x float>, ptr %lsr.iv37, align 4
  %wide.load17 = load <4 x float>, ptr %lsr.iv34, align 4
  %12 = tail call <4 x float> @_simd_pow_f4(<4 x float> %wide.load16, <4 x float> %wide.load17)
  store <4 x float> %12, ptr %lsr.iv31, align 4
  %lsr.iv.next29 = add i64 %lsr.iv28, 4
  %scevgep32 = getelementptr i8, ptr %lsr.iv31, i64 16
  %scevgep35 = getelementptr i8, ptr %lsr.iv34, i64 16
  %scevgep38 = getelementptr i8, ptr %lsr.iv37, i64 16
  %13 = icmp eq i64 %lsr.iv.next29, 0
  br i1 %13, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !4

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n19 = icmp eq i64 %arg.x.2, %n.vec14
  br i1 %cmp.n19, label %B88, label %B52.preheader

B52.preheader:                                    ; preds = %vector.memcheck, %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %.140111113.ph = phi i64 [ %n.vec14, %vec.epilog.middle.block ], [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.memcheck ], [ 0, %iter.check ]
  %14 = shl i64 %.140111113.ph, 2
  %scevgep = getelementptr i8, ptr %arg.out.4, i64 %14
  %scevgep21 = getelementptr i8, ptr %arg.y.4, i64 %14
  %scevgep24 = getelementptr i8, ptr %arg.x.4, i64 %14
  %15 = sub i64 %arg.x.2, %.140111113.ph
  br label %B52

B52:                                              ; preds = %B52.preheader, %B52
  %lsr.iv27 = phi i64 [ %15, %B52.preheader ], [ %lsr.iv.next, %B52 ]
  %lsr.iv25 = phi ptr [ %scevgep24, %B52.preheader ], [ %scevgep26, %B52 ]
  %lsr.iv22 = phi ptr [ %scevgep21, %B52.preheader ], [ %scevgep23, %B52 ]
  %lsr.iv = phi ptr [ %scevgep, %B52.preheader ], [ %scevgep20, %B52 ]
  %.201 = load float, ptr %lsr.iv25, align 4
  %.231 = load float, ptr %lsr.iv22, align 4
  %.241.le = tail call float @llvm.pow.f32(float %.201, float %.231) #5
  store float %.241.le, ptr %lsr.iv, align 4
  %scevgep20 = getelementptr i8, ptr %lsr.iv, i64 4
  %scevgep23 = getelementptr i8, ptr %lsr.iv22, i64 4
  %scevgep26 = getelementptr i8, ptr %lsr.iv25, i64 4
  %lsr.iv.next = add i64 %lsr.iv27, -1
  %exitcond.not = icmp eq i64 %lsr.iv.next, 0
  br i1 %exitcond.not, label %B88, label %B52, !llvm.loop !5

B88:                                              ; preds = %B52, %middle.block, %vec.epilog.middle.block, %B0.endif
  store ptr null, ptr %retptr, align 8
  ret i32 0
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.pow.f32(float, float) #1

define noundef ptr @_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE(ptr readnone captures(none) %py_closure, ptr %py_args, ptr readnone captures(none) %py_kws) local_unnamed_addr {
entry:
  %.5 = alloca ptr, align 8
  %.6 = alloca ptr, align 8
  %.7 = alloca ptr, align 8
  %.8 = call i32 (ptr, ptr, i64, i64, ...) @PyArg_UnpackTuple(ptr %py_args, ptr nonnull @".const.make_kernel.<locals>.kernel", i64 3, i64 3, ptr nonnull %.5, ptr nonnull %.6, ptr nonnull %.7)
  %.9 = icmp eq i32 %.8, 0
  %.21 = alloca { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] }, align 8
  %.44 = alloca { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] }, align 8
  %.67 = alloca { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] }, align 8
  %.89 = alloca ptr, align 8
  br i1 %.9, label %common.ret, label %entry.endif, !prof !6

common.ret:                                       ; preds = %entry.endif.endif.endif.thread, %arg0.err, %entry, %entry.endif.endif.endif.endif.endif.endif.endif.endif, %entry.endif.if
  %common.ret.op = phi ptr [ null, %arg0.err ], [ null, %entry ], [ null, %entry.endif.if ], [ null, %entry.endif.endif.endif.thread ], [ @_Py_NoneStruct, %entry.endif.endif.endif.endif.endif.endif.endif.endif ]
  ret ptr %common.ret.op

entry.endif:                                      ; preds = %entry
  %.13 = load ptr, ptr @_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, align 8
  %.16 = icmp eq ptr %.13, null
  br i1 %.16, label %entry.endif.if, label %entry.endif.endif, !prof !6

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_RuntimeError, ptr nonnull @".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE")
  br label %common.ret

entry.endif.endif:                                ; preds = %entry.endif
  %.20 = load ptr, ptr %.5, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %.21, i8 0, i64 56, i1 false)
  %.25 = call i32 @NRT_adapt_ndarray_from_python(ptr %.20, ptr nonnull %.21)
  %sunkaddr = getelementptr inbounds i8, ptr %.21, i64 24
  %.29 = load i64, ptr %sunkaddr, align 8
  %.30 = icmp ne i64 %.29, 4
  %.31 = icmp ne i32 %.25, 0
  %.32 = or i1 %.31, %.30
  br i1 %.32, label %entry.endif.endif.endif.thread, label %entry.endif.endif.endif.endif, !prof !6

entry.endif.endif.endif.thread:                   ; preds = %entry.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  br label %common.ret

entry.endif.endif.endif.endif:                    ; preds = %entry.endif.endif
  %.36.fca.0.load = load ptr, ptr %.21, align 8
  %sunkaddr1 = getelementptr inbounds i8, ptr %.21, i64 16
  %.36.fca.2.load = load i64, ptr %sunkaddr1, align 8
  %sunkaddr2 = getelementptr inbounds i8, ptr %.21, i64 32
  %.36.fca.4.load = load ptr, ptr %sunkaddr2, align 8
  %.43 = load ptr, ptr %.6, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %.44, i8 0, i64 56, i1 false)
  %.48 = call i32 @NRT_adapt_ndarray_from_python(ptr %.43, ptr nonnull %.44)
  %sunkaddr3 = getelementptr inbounds i8, ptr %.44, i64 24
  %.52 = load i64, ptr %sunkaddr3, align 8
  %.53 = icmp ne i64 %.52, 4
  %.54 = icmp ne i32 %.48, 0
  %.55 = or i1 %.54, %.53
  br i1 %.55, label %entry.endif.endif.endif.endif.endif.thread, label %entry.endif.endif.endif.endif.endif.endif, !prof !6

arg0.err:                                         ; preds = %entry.endif.endif.endif.endif.endif.thread, %entry.endif.endif.endif.endif.endif.endif.if
  call void @NRT_decref(ptr %.36.fca.0.load)
  br label %common.ret

entry.endif.endif.endif.endif.endif.thread:       ; preds = %entry.endif.endif.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  br label %arg0.err

entry.endif.endif.endif.endif.endif.endif:        ; preds = %entry.endif.endif.endif.endif
  %.59.fca.0.load = load ptr, ptr %.44, align 8
  %sunkaddr4 = getelementptr inbounds i8, ptr %.44, i64 32
  %.59.fca.4.load = load ptr, ptr %sunkaddr4, align 8
  %.66 = load ptr, ptr %.7, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %.67, i8 0, i64 56, i1 false)
  %.71 = call i32 @NRT_adapt_ndarray_from_python(ptr %.66, ptr nonnull %.67)
  %sunkaddr5 = getelementptr inbounds i8, ptr %.67, i64 24
  %.75 = load i64, ptr %sunkaddr5, align 8
  %.76 = icmp ne i64 %.75, 4
  %.77 = icmp ne i32 %.71, 0
  %.78 = or i1 %.77, %.76
  br i1 %.78, label %entry.endif.endif.endif.endif.endif.endif.if, label %entry.endif.endif.endif.endif.endif.endif.endif.endif, !prof !6

entry.endif.endif.endif.endif.endif.endif.if:     ; preds = %entry.endif.endif.endif.endif.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  call void @NRT_decref(ptr %.59.fca.0.load)
  br label %arg0.err

entry.endif.endif.endif.endif.endif.endif.endif.endif: ; preds = %entry.endif.endif.endif.endif.endif.endif
  %.82.fca.0.load = load ptr, ptr %.67, align 8
  %sunkaddr6 = getelementptr inbounds i8, ptr %.67, i64 32
  %.82.fca.4.load = load ptr, ptr %sunkaddr6, align 8
  %.99 = call i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE(ptr nonnull %.89, ptr nonnull poison, ptr poison, ptr poison, i64 %.36.fca.2.load, i64 poison, ptr %.36.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.59.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.82.fca.4.load, i64 poison, i64 poison) #4
  call void @NRT_decref(ptr %.36.fca.0.load)
  call void @NRT_decref(ptr %.59.fca.0.load)
  call void @NRT_decref(ptr %.82.fca.0.load)
  call void @Py_IncRef(ptr nonnull @_Py_NoneStruct)
  br label %common.ret
}

declare i32 @PyArg_UnpackTuple(ptr, ptr, i64, i64, ...) local_unnamed_addr

declare void @PyErr_SetString(ptr, ptr) local_unnamed_addr

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #2

declare i32 @NRT_adapt_ndarray_from_python(ptr captures(none), ptr captures(none)) local_unnamed_addr

declare void @Py_IncRef(ptr) local_unnamed_addr

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define ptr @cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE({ ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3) local_unnamed_addr #3 {
entry:
  %.5 = alloca ptr, align 8
  store ptr null, ptr %.5, align 8
  %extracted.nitems = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 2
  %extracted.data = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 4
  %extracted.data.1 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, 4
  %extracted.data.2 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3, 4
  %.15 = call i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v41B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE(ptr nonnull %.5, ptr nonnull poison, ptr poison, ptr poison, i64 %extracted.nitems, i64 poison, ptr %extracted.data, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.1, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.2, i64 poison, i64 poison) #4
  %.25 = load ptr, ptr %.5, align 8
  ret ptr %.25
}

; Function Attrs: noinline
define linkonce_odr void @NRT_decref(ptr %.1) local_unnamed_addr #4 {
.3:
  %.4 = icmp eq ptr %.1, null
  br i1 %.4, label %common.ret1, label %.3.endif, !prof !6

common.ret1:                                      ; preds = %.3, %.3.endif
  ret void

.3.endif:                                         ; preds = %.3
  fence release
  %.4.i = atomicrmw sub ptr %.1, i64 1 monotonic, align 8
  %.10 = icmp eq i64 %.4.i, 1
  br i1 %.10, label %.3.endif.if, label %common.ret1, !prof !6

.3.endif.if:                                      ; preds = %.3.endif
  fence acquire
  tail call void @NRT_MemInfo_call_dtor(ptr nonnull %.1)
  ret void
}

declare void @NRT_MemInfo_call_dtor(ptr) local_unnamed_addr

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @_simd_pow_f4(<4 x float>, <4 x float>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) }
attributes #4 = { noinline }
attributes #5 = { "vector-function-abi-variant"="_ZGV_LLVM_N4vv_llvm.pow.f32(_simd_pow_f4)" }

!0 = distinct !{!0, !1, !2}
!1 = !{!"llvm.loop.isvectorized", i32 1}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"branch_weights", i32 4, i32 12}
!4 = distinct !{!4, !1, !2}
!5 = distinct !{!5, !1}
!6 = !{!"branch_weights", i32 1, i32 99}
