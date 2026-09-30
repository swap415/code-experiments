; ModuleID = 'make_kernel.<locals>.kernel'
source_filename = "<string>"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@".const.make_kernel.<locals>.kernel" = internal constant [28 x i8] c"make_kernel.<locals>.kernel\00"
@_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE = common local_unnamed_addr global ptr null
@".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE" = internal constant [217 x i8] c"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE\00"
@PyExc_TypeError = external global i8
@".const.can't unbox array from PyObject into native value.  The object maybe of a different type" = internal constant [89 x i8] c"can't unbox array from PyObject into native value.  The object maybe of a different type\00"
@_Py_NoneStruct = external global i8
@PyExc_RuntimeError = external global i8

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define noundef i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr noalias writeonly captures(none) %retptr, ptr noalias readnone captures(none) %excinfo, ptr readnone captures(none) %arg.x.0, ptr readnone captures(none) %arg.x.1, i64 %arg.x.2, i64 %arg.x.3, ptr readonly captures(none) %arg.x.4, i64 %arg.x.5.0, i64 %arg.x.6.0, ptr readnone captures(none) %arg.y.0, ptr readnone captures(none) %arg.y.1, i64 %arg.y.2, i64 %arg.y.3, ptr readnone captures(none) %arg.y.4, i64 %arg.y.5.0, i64 %arg.y.6.0, ptr readnone captures(none) %arg.out.0, ptr readnone captures(none) %arg.out.1, i64 %arg.out.2, i64 %arg.out.3, ptr writeonly captures(none) %arg.out.4, i64 %arg.out.5.0, i64 %arg.out.6.0) local_unnamed_addr #0 {
B0.endif:
  %.13592.not = icmp slt i64 %arg.x.2, 1
  br i1 %.13592.not, label %B84, label %B52.preheader

B52.preheader:                                    ; preds = %B0.endif
  %arg.out.41 = ptrtoint ptr %arg.out.4 to i64
  %arg.x.42 = ptrtoint ptr %arg.x.4 to i64
  %min.iters.check = icmp ult i64 %arg.x.2, 4
  %0 = sub i64 %arg.out.41, %arg.x.42
  %diff.check = icmp ult i64 %0, 32
  %or.cond = select i1 %min.iters.check, i1 true, i1 %diff.check
  br i1 %or.cond, label %B52.preheader3, label %vector.ph

vector.ph:                                        ; preds = %B52.preheader
  %n.vec = and i64 %arg.x.2, 9223372036854775804
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = shl i64 %index, 3
  %scevgep39 = getelementptr i8, ptr %arg.x.4, i64 %1
  %wide.load = load <4 x double>, ptr %scevgep39, align 8
  %2 = tail call <4 x double> @llvm.sin.v4f64(<4 x double> %wide.load)
  %3 = shl i64 %index, 3
  %scevgep38 = getelementptr i8, ptr %arg.out.4, i64 %3
  store <4 x double> %2, ptr %scevgep38, align 8
  %index.next = add nuw i64 %index, 4
  %4 = icmp eq i64 %n.vec, %index.next
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !0

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %arg.x.2, %n.vec
  br i1 %cmp.n, label %B84, label %B52.preheader3

B52.preheader3:                                   ; preds = %B52.preheader, %middle.block
  %.1419193.ph = phi i64 [ 0, %B52.preheader ], [ %n.vec, %middle.block ]
  %5 = sub nsw i64 %arg.x.2, %.1419193.ph
  %xtraiter = and i64 %5, 7
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %B52.prol.loopexit, label %B52.prol.preheader

B52.prol.preheader:                               ; preds = %B52.preheader3
  br label %B52.prol

B52.prol:                                         ; preds = %B52.prol.preheader, %B52.prol
  %lsr.iv = phi i64 [ %xtraiter, %B52.prol.preheader ], [ %lsr.iv.next, %B52.prol ]
  %.1419193.prol = phi i64 [ %.148.prol, %B52.prol ], [ %.1419193.ph, %B52.prol.preheader ]
  %.148.prol = add nuw i64 %.1419193.prol, 1
  %6 = shl i64 %.1419193.prol, 3
  %scevgep37 = getelementptr i8, ptr %arg.x.4, i64 %6
  %.202.prol = load double, ptr %scevgep37, align 8
  %.210.le.prol = tail call double @llvm.sin.f64(double %.202.prol)
  %7 = shl i64 %.1419193.prol, 3
  %scevgep36 = getelementptr i8, ptr %arg.out.4, i64 %7
  store double %.210.le.prol, ptr %scevgep36, align 8
  %lsr.iv.next = add nsw i64 %lsr.iv, -1
  %prol.iter.cmp.not = icmp eq i64 %lsr.iv.next, 0
  br i1 %prol.iter.cmp.not, label %B52.prol.loopexit, label %B52.prol, !llvm.loop !3

B52.prol.loopexit:                                ; preds = %B52.prol, %B52.preheader3
  %.1419193.unr = phi i64 [ %.1419193.ph, %B52.preheader3 ], [ %.148.prol, %B52.prol ]
  %8 = sub nsw i64 %.1419193.ph, %arg.x.2
  %9 = icmp ugt i64 %8, -8
  br i1 %9, label %B84, label %B52.preheader4

B52.preheader4:                                   ; preds = %B52.prol.loopexit
  br label %B52

B52:                                              ; preds = %B52.preheader4, %B52
  %.1419193 = phi i64 [ %.148.7, %B52 ], [ %.1419193.unr, %B52.preheader4 ]
  %sunkaddr = mul i64 %.1419193, 8
  %sunkaddr40 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr
  %.202 = load double, ptr %sunkaddr40, align 8
  %.210.le = tail call double @llvm.sin.f64(double %.202)
  %sunkaddr41 = mul i64 %.1419193, 8
  %sunkaddr42 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr41
  store double %.210.le, ptr %sunkaddr42, align 8
  %sunkaddr43 = mul i64 %.1419193, 8
  %sunkaddr44 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr43
  %sunkaddr45 = getelementptr i8, ptr %sunkaddr44, i64 8
  %.202.1 = load double, ptr %sunkaddr45, align 8
  %.210.le.1 = tail call double @llvm.sin.f64(double %.202.1)
  %sunkaddr46 = mul i64 %.1419193, 8
  %sunkaddr47 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr46
  %sunkaddr48 = getelementptr i8, ptr %sunkaddr47, i64 8
  store double %.210.le.1, ptr %sunkaddr48, align 8
  %sunkaddr49 = mul i64 %.1419193, 8
  %sunkaddr50 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr49
  %sunkaddr51 = getelementptr i8, ptr %sunkaddr50, i64 16
  %.202.2 = load double, ptr %sunkaddr51, align 8
  %.210.le.2 = tail call double @llvm.sin.f64(double %.202.2)
  %sunkaddr52 = mul i64 %.1419193, 8
  %sunkaddr53 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr52
  %sunkaddr54 = getelementptr i8, ptr %sunkaddr53, i64 16
  store double %.210.le.2, ptr %sunkaddr54, align 8
  %sunkaddr55 = mul i64 %.1419193, 8
  %sunkaddr56 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr55
  %sunkaddr57 = getelementptr i8, ptr %sunkaddr56, i64 24
  %.202.3 = load double, ptr %sunkaddr57, align 8
  %.210.le.3 = tail call double @llvm.sin.f64(double %.202.3)
  %sunkaddr58 = mul i64 %.1419193, 8
  %sunkaddr59 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr58
  %sunkaddr60 = getelementptr i8, ptr %sunkaddr59, i64 24
  store double %.210.le.3, ptr %sunkaddr60, align 8
  %sunkaddr61 = mul i64 %.1419193, 8
  %sunkaddr62 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr61
  %sunkaddr63 = getelementptr i8, ptr %sunkaddr62, i64 32
  %.202.4 = load double, ptr %sunkaddr63, align 8
  %.210.le.4 = tail call double @llvm.sin.f64(double %.202.4)
  %sunkaddr64 = mul i64 %.1419193, 8
  %sunkaddr65 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr64
  %sunkaddr66 = getelementptr i8, ptr %sunkaddr65, i64 32
  store double %.210.le.4, ptr %sunkaddr66, align 8
  %sunkaddr67 = mul i64 %.1419193, 8
  %sunkaddr68 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr67
  %sunkaddr69 = getelementptr i8, ptr %sunkaddr68, i64 40
  %.202.5 = load double, ptr %sunkaddr69, align 8
  %.210.le.5 = tail call double @llvm.sin.f64(double %.202.5)
  %sunkaddr70 = mul i64 %.1419193, 8
  %sunkaddr71 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr70
  %sunkaddr72 = getelementptr i8, ptr %sunkaddr71, i64 40
  store double %.210.le.5, ptr %sunkaddr72, align 8
  %sunkaddr73 = mul i64 %.1419193, 8
  %sunkaddr74 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr73
  %sunkaddr75 = getelementptr i8, ptr %sunkaddr74, i64 48
  %.202.6 = load double, ptr %sunkaddr75, align 8
  %.210.le.6 = tail call double @llvm.sin.f64(double %.202.6)
  %sunkaddr76 = mul i64 %.1419193, 8
  %sunkaddr77 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr76
  %sunkaddr78 = getelementptr i8, ptr %sunkaddr77, i64 48
  store double %.210.le.6, ptr %sunkaddr78, align 8
  %.148.7 = add nuw nsw i64 %.1419193, 8
  %sunkaddr79 = mul i64 %.1419193, 8
  %sunkaddr80 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr79
  %sunkaddr81 = getelementptr i8, ptr %sunkaddr80, i64 56
  %.202.7 = load double, ptr %sunkaddr81, align 8
  %.210.le.7 = tail call double @llvm.sin.f64(double %.202.7)
  %sunkaddr82 = mul i64 %.1419193, 8
  %sunkaddr83 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr82
  %sunkaddr84 = getelementptr i8, ptr %sunkaddr83, i64 56
  store double %.210.le.7, ptr %sunkaddr84, align 8
  %exitcond.not.7 = icmp eq i64 %arg.x.2, %.148.7
  br i1 %exitcond.not.7, label %B84, label %B52, !llvm.loop !5

B84:                                              ; preds = %B52, %B52.prol.loopexit, %middle.block, %B0.endif
  store ptr null, ptr %retptr, align 8
  ret i32 0
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sin.f64(double) #1

define noundef ptr @_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr readnone captures(none) %py_closure, ptr %py_args, ptr readnone captures(none) %py_kws) local_unnamed_addr {
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
  %.13 = load ptr, ptr @_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, align 8
  %.16 = icmp eq ptr %.13, null
  br i1 %.16, label %entry.endif.if, label %entry.endif.endif, !prof !6

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_RuntimeError, ptr nonnull @".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE")
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
  %.53 = icmp ne i64 %.52, 8
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
  %.66 = load ptr, ptr %.7, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %.67, i8 0, i64 56, i1 false)
  %.71 = call i32 @NRT_adapt_ndarray_from_python(ptr %.66, ptr nonnull %.67)
  %sunkaddr4 = getelementptr inbounds i8, ptr %.67, i64 24
  %.75 = load i64, ptr %sunkaddr4, align 8
  %.76 = icmp ne i64 %.75, 8
  %.77 = icmp ne i32 %.71, 0
  %.78 = or i1 %.77, %.76
  br i1 %.78, label %entry.endif.endif.endif.endif.endif.endif.if, label %entry.endif.endif.endif.endif.endif.endif.endif.endif, !prof !6

entry.endif.endif.endif.endif.endif.endif.if:     ; preds = %entry.endif.endif.endif.endif.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  call void @NRT_decref(ptr %.59.fca.0.load)
  br label %arg0.err

entry.endif.endif.endif.endif.endif.endif.endif.endif: ; preds = %entry.endif.endif.endif.endif.endif.endif
  %.82.fca.0.load = load ptr, ptr %.67, align 8
  %sunkaddr5 = getelementptr inbounds i8, ptr %.67, i64 32
  %.82.fca.4.load = load ptr, ptr %sunkaddr5, align 8
  %.99 = call i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr nonnull %.89, ptr nonnull poison, ptr poison, ptr poison, i64 %.36.fca.2.load, i64 poison, ptr %.36.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr poison, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.82.fca.4.load, i64 poison, i64 poison) #4
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
define ptr @cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE({ ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3) local_unnamed_addr #3 {
entry:
  %.5 = alloca ptr, align 8
  store ptr null, ptr %.5, align 8
  %extracted.nitems = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 2
  %extracted.data = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 4
  %extracted.data.2 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3, 4
  %.15 = call i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v2B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr nonnull %.5, ptr nonnull poison, ptr poison, ptr poison, i64 %extracted.nitems, i64 poison, ptr %extracted.data, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr poison, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.2, i64 poison, i64 poison) #4
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
  %0 = tail call i8 @llvm.x86.atomic.sub.cc.i64(ptr nonnull %.1, i64 1, i32 4)
  %1 = trunc i8 %0 to i1
  br i1 %1, label %.3.endif.if, label %common.ret1, !prof !6

.3.endif.if:                                      ; preds = %.3.endif
  fence acquire
  tail call void @NRT_MemInfo_call_dtor(ptr nonnull %.1)
  ret void
}

; Function Attrs: nounwind
declare i8 @llvm.x86.atomic.sub.cc.i64(ptr, i64, i32 immarg) #5

declare void @NRT_MemInfo_call_dtor(ptr) local_unnamed_addr

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.sin.v4f64(<4 x double>) #6

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) }
attributes #4 = { noinline }
attributes #5 = { nounwind }
attributes #6 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!0 = distinct !{!0, !1, !2}
!1 = !{!"llvm.loop.isvectorized", i32 1}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.unroll.disable"}
!5 = distinct !{!5, !1}
!6 = !{!"branch_weights", i32 1, i32 99}
