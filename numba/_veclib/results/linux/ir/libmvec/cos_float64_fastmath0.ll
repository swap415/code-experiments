; ModuleID = 'make_kernel.<locals>.kernel'
source_filename = "<string>"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@".const.make_kernel.<locals>.kernel" = internal constant [28 x i8] c"make_kernel.<locals>.kernel\00"
@_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE = common local_unnamed_addr global ptr null
@".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE" = internal constant [217 x i8] c"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE\00"
@PyExc_TypeError = external global i8
@".const.can't unbox array from PyObject into native value.  The object maybe of a different type" = internal constant [89 x i8] c"can't unbox array from PyObject into native value.  The object maybe of a different type\00"
@_Py_NoneStruct = external global i8
@PyExc_RuntimeError = external global i8
@llvm.compiler.used = appending global [2 x ptr] [ptr @_ZGVbN2v_cos, ptr @_ZGVdN4v_cos], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define noundef i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr noalias writeonly captures(none) %retptr, ptr noalias readnone captures(none) %excinfo, ptr readnone captures(none) %arg.x.0, ptr readnone captures(none) %arg.x.1, i64 %arg.x.2, i64 %arg.x.3, ptr readonly captures(none) %arg.x.4, i64 %arg.x.5.0, i64 %arg.x.6.0, ptr readnone captures(none) %arg.y.0, ptr readnone captures(none) %arg.y.1, i64 %arg.y.2, i64 %arg.y.3, ptr readnone captures(none) %arg.y.4, i64 %arg.y.5.0, i64 %arg.y.6.0, ptr readnone captures(none) %arg.out.0, ptr readnone captures(none) %arg.out.1, i64 %arg.out.2, i64 %arg.out.3, ptr writeonly captures(none) %arg.out.4, i64 %arg.out.5.0, i64 %arg.out.6.0) local_unnamed_addr #0 {
B0.endif:
  %.13592.not = icmp slt i64 %arg.x.2, 1
  br i1 %.13592.not, label %B84, label %iter.check

iter.check:                                       ; preds = %B0.endif
  %arg.out.41 = ptrtoint ptr %arg.out.4 to i64
  %arg.x.42 = ptrtoint ptr %arg.x.4 to i64
  %min.iters.check = icmp ult i64 %arg.x.2, 4
  %0 = sub i64 %arg.out.41, %arg.x.42
  %diff.check = icmp ult i64 %0, 128
  %or.cond = select i1 %min.iters.check, i1 true, i1 %diff.check
  br i1 %or.cond, label %B52.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  %const = bitcast i64 9223372036854775792 to i64
  %min.iters.check3 = icmp ult i64 %arg.x.2, 16
  br i1 %min.iters.check3, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %arg.x.2, %const
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %sunkaddr = mul i64 %index, 8
  %sunkaddr65 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr
  %wide.load = load <4 x double>, ptr %sunkaddr65, align 8
  %sunkaddr66 = mul i64 %index, 8
  %sunkaddr67 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr66
  %sunkaddr68 = getelementptr i8, ptr %sunkaddr67, i64 32
  %wide.load4 = load <4 x double>, ptr %sunkaddr68, align 8
  %sunkaddr69 = mul i64 %index, 8
  %sunkaddr70 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr69
  %sunkaddr71 = getelementptr i8, ptr %sunkaddr70, i64 64
  %wide.load5 = load <4 x double>, ptr %sunkaddr71, align 8
  %sunkaddr72 = mul i64 %index, 8
  %sunkaddr73 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr72
  %sunkaddr74 = getelementptr i8, ptr %sunkaddr73, i64 96
  %wide.load6 = load <4 x double>, ptr %sunkaddr74, align 8
  %1 = tail call <4 x double> @_ZGVdN4v_cos(<4 x double> %wide.load)
  %2 = tail call <4 x double> @_ZGVdN4v_cos(<4 x double> %wide.load4)
  %3 = tail call <4 x double> @_ZGVdN4v_cos(<4 x double> %wide.load5)
  %4 = tail call <4 x double> @_ZGVdN4v_cos(<4 x double> %wide.load6)
  %sunkaddr75 = mul i64 %index, 8
  %sunkaddr76 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr75
  store <4 x double> %1, ptr %sunkaddr76, align 8
  %sunkaddr77 = mul i64 %index, 8
  %sunkaddr78 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr77
  %sunkaddr79 = getelementptr i8, ptr %sunkaddr78, i64 32
  store <4 x double> %2, ptr %sunkaddr79, align 8
  %sunkaddr80 = mul i64 %index, 8
  %sunkaddr81 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr80
  %sunkaddr82 = getelementptr i8, ptr %sunkaddr81, i64 64
  store <4 x double> %3, ptr %sunkaddr82, align 8
  %sunkaddr83 = mul i64 %index, 8
  %sunkaddr84 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr83
  %sunkaddr85 = getelementptr i8, ptr %sunkaddr84, i64 96
  store <4 x double> %4, ptr %sunkaddr85, align 8
  %index.next = add nuw i64 %index, 16
  %5 = icmp eq i64 %n.vec, %index.next
  br i1 %5, label %middle.block, label %vector.body, !llvm.loop !0

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %arg.x.2, %n.vec
  br i1 %cmp.n, label %B84, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %6 = and i64 %arg.x.2, 12
  %min.epilog.iters.check = icmp eq i64 %6, 0
  br i1 %min.epilog.iters.check, label %B52.preheader, label %vec.epilog.ph, !prof !3

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %const_mat = add i64 %const, 12
  %n.vec8 = and i64 %arg.x.2, %const_mat
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index9 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next11, %vec.epilog.vector.body ]
  %7 = shl i64 %index9, 3
  %scevgep48 = getelementptr i8, ptr %arg.x.4, i64 %7
  %wide.load10 = load <4 x double>, ptr %scevgep48, align 8
  %8 = tail call <4 x double> @_ZGVdN4v_cos(<4 x double> %wide.load10)
  %9 = shl i64 %index9, 3
  %scevgep47 = getelementptr i8, ptr %arg.out.4, i64 %9
  store <4 x double> %8, ptr %scevgep47, align 8
  %index.next11 = add nuw i64 %index9, 4
  %10 = icmp eq i64 %n.vec8, %index.next11
  br i1 %10, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !4

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n12 = icmp eq i64 %arg.x.2, %n.vec8
  br i1 %cmp.n12, label %B84, label %B52.preheader

B52.preheader:                                    ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %.1419193.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec8, %vec.epilog.middle.block ]
  %11 = sub nsw i64 %arg.x.2, %.1419193.ph
  %xtraiter = and i64 %11, 7
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %B52.prol.loopexit, label %B52.prol.preheader

B52.prol.preheader:                               ; preds = %B52.preheader
  br label %B52.prol

B52.prol:                                         ; preds = %B52.prol.preheader, %B52.prol
  %lsr.iv = phi i64 [ %xtraiter, %B52.prol.preheader ], [ %lsr.iv.next, %B52.prol ]
  %.1419193.prol = phi i64 [ %.148.prol, %B52.prol ], [ %.1419193.ph, %B52.prol.preheader ]
  %.148.prol = add nuw i64 %.1419193.prol, 1
  %12 = shl i64 %.1419193.prol, 3
  %scevgep46 = getelementptr i8, ptr %arg.x.4, i64 %12
  %.202.prol = load double, ptr %scevgep46, align 8
  %.210.le.prol = tail call double @llvm.cos.f64(double %.202.prol) #6
  %13 = shl i64 %.1419193.prol, 3
  %scevgep45 = getelementptr i8, ptr %arg.out.4, i64 %13
  store double %.210.le.prol, ptr %scevgep45, align 8
  %lsr.iv.next = add nsw i64 %lsr.iv, -1
  %prol.iter.cmp.not = icmp eq i64 %lsr.iv.next, 0
  br i1 %prol.iter.cmp.not, label %B52.prol.loopexit, label %B52.prol, !llvm.loop !5

B52.prol.loopexit:                                ; preds = %B52.prol, %B52.preheader
  %.1419193.unr = phi i64 [ %.1419193.ph, %B52.preheader ], [ %.148.prol, %B52.prol ]
  %14 = sub nsw i64 %.1419193.ph, %arg.x.2
  %15 = icmp ugt i64 %14, -8
  br i1 %15, label %B84, label %B52.preheader13

B52.preheader13:                                  ; preds = %B52.prol.loopexit
  br label %B52

B52:                                              ; preds = %B52.preheader13, %B52
  %.1419193 = phi i64 [ %.148.7, %B52 ], [ %.1419193.unr, %B52.preheader13 ]
  %sunkaddr86 = mul i64 %.1419193, 8
  %sunkaddr87 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr86
  %.202 = load double, ptr %sunkaddr87, align 8
  %.210.le = tail call double @llvm.cos.f64(double %.202) #6
  %sunkaddr88 = mul i64 %.1419193, 8
  %sunkaddr89 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr88
  store double %.210.le, ptr %sunkaddr89, align 8
  %sunkaddr90 = mul i64 %.1419193, 8
  %sunkaddr91 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr90
  %sunkaddr92 = getelementptr i8, ptr %sunkaddr91, i64 8
  %.202.1 = load double, ptr %sunkaddr92, align 8
  %.210.le.1 = tail call double @llvm.cos.f64(double %.202.1) #6
  %sunkaddr93 = mul i64 %.1419193, 8
  %sunkaddr94 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr93
  %sunkaddr95 = getelementptr i8, ptr %sunkaddr94, i64 8
  store double %.210.le.1, ptr %sunkaddr95, align 8
  %sunkaddr96 = mul i64 %.1419193, 8
  %sunkaddr97 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr96
  %sunkaddr98 = getelementptr i8, ptr %sunkaddr97, i64 16
  %.202.2 = load double, ptr %sunkaddr98, align 8
  %.210.le.2 = tail call double @llvm.cos.f64(double %.202.2) #6
  %sunkaddr99 = mul i64 %.1419193, 8
  %sunkaddr100 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr99
  %sunkaddr101 = getelementptr i8, ptr %sunkaddr100, i64 16
  store double %.210.le.2, ptr %sunkaddr101, align 8
  %sunkaddr102 = mul i64 %.1419193, 8
  %sunkaddr103 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr102
  %sunkaddr104 = getelementptr i8, ptr %sunkaddr103, i64 24
  %.202.3 = load double, ptr %sunkaddr104, align 8
  %.210.le.3 = tail call double @llvm.cos.f64(double %.202.3) #6
  %sunkaddr105 = mul i64 %.1419193, 8
  %sunkaddr106 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr105
  %sunkaddr107 = getelementptr i8, ptr %sunkaddr106, i64 24
  store double %.210.le.3, ptr %sunkaddr107, align 8
  %sunkaddr108 = mul i64 %.1419193, 8
  %sunkaddr109 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr108
  %sunkaddr110 = getelementptr i8, ptr %sunkaddr109, i64 32
  %.202.4 = load double, ptr %sunkaddr110, align 8
  %.210.le.4 = tail call double @llvm.cos.f64(double %.202.4) #6
  %sunkaddr111 = mul i64 %.1419193, 8
  %sunkaddr112 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr111
  %sunkaddr113 = getelementptr i8, ptr %sunkaddr112, i64 32
  store double %.210.le.4, ptr %sunkaddr113, align 8
  %sunkaddr114 = mul i64 %.1419193, 8
  %sunkaddr115 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr114
  %sunkaddr116 = getelementptr i8, ptr %sunkaddr115, i64 40
  %.202.5 = load double, ptr %sunkaddr116, align 8
  %.210.le.5 = tail call double @llvm.cos.f64(double %.202.5) #6
  %sunkaddr117 = mul i64 %.1419193, 8
  %sunkaddr118 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr117
  %sunkaddr119 = getelementptr i8, ptr %sunkaddr118, i64 40
  store double %.210.le.5, ptr %sunkaddr119, align 8
  %sunkaddr120 = mul i64 %.1419193, 8
  %sunkaddr121 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr120
  %sunkaddr122 = getelementptr i8, ptr %sunkaddr121, i64 48
  %.202.6 = load double, ptr %sunkaddr122, align 8
  %.210.le.6 = tail call double @llvm.cos.f64(double %.202.6) #6
  %sunkaddr123 = mul i64 %.1419193, 8
  %sunkaddr124 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr123
  %sunkaddr125 = getelementptr i8, ptr %sunkaddr124, i64 48
  store double %.210.le.6, ptr %sunkaddr125, align 8
  %.148.7 = add nuw nsw i64 %.1419193, 8
  %sunkaddr126 = mul i64 %.1419193, 8
  %sunkaddr127 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr126
  %sunkaddr128 = getelementptr i8, ptr %sunkaddr127, i64 56
  %.202.7 = load double, ptr %sunkaddr128, align 8
  %.210.le.7 = tail call double @llvm.cos.f64(double %.202.7) #6
  %sunkaddr129 = mul i64 %.1419193, 8
  %sunkaddr130 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr129
  %sunkaddr131 = getelementptr i8, ptr %sunkaddr130, i64 56
  store double %.210.le.7, ptr %sunkaddr131, align 8
  %exitcond.not.7 = icmp eq i64 %arg.x.2, %.148.7
  br i1 %exitcond.not.7, label %B84, label %B52, !llvm.loop !7

B84:                                              ; preds = %B52, %B52.prol.loopexit, %middle.block, %vec.epilog.middle.block, %B0.endif
  store ptr null, ptr %retptr, align 8
  ret i32 0
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.cos.f64(double) #1

define noundef ptr @_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr readnone captures(none) %py_closure, ptr %py_args, ptr readnone captures(none) %py_kws) local_unnamed_addr {
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
  br i1 %.9, label %common.ret, label %entry.endif, !prof !8

common.ret:                                       ; preds = %entry.endif.endif.endif.thread, %arg0.err, %entry, %entry.endif.endif.endif.endif.endif.endif.endif.endif, %entry.endif.if
  %common.ret.op = phi ptr [ null, %arg0.err ], [ null, %entry ], [ null, %entry.endif.if ], [ null, %entry.endif.endif.endif.thread ], [ @_Py_NoneStruct, %entry.endif.endif.endif.endif.endif.endif.endif.endif ]
  ret ptr %common.ret.op

entry.endif:                                      ; preds = %entry
  %.13 = load ptr, ptr @_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, align 8
  %.16 = icmp eq ptr %.13, null
  br i1 %.16, label %entry.endif.if, label %entry.endif.endif, !prof !8

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_RuntimeError, ptr nonnull @".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE")
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
  br i1 %.32, label %entry.endif.endif.endif.thread, label %entry.endif.endif.endif.endif, !prof !8

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
  br i1 %.55, label %entry.endif.endif.endif.endif.endif.thread, label %entry.endif.endif.endif.endif.endif.endif, !prof !8

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
  br i1 %.78, label %entry.endif.endif.endif.endif.endif.endif.if, label %entry.endif.endif.endif.endif.endif.endif.endif.endif, !prof !8

entry.endif.endif.endif.endif.endif.endif.if:     ; preds = %entry.endif.endif.endif.endif.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  call void @NRT_decref(ptr %.59.fca.0.load)
  br label %arg0.err

entry.endif.endif.endif.endif.endif.endif.endif.endif: ; preds = %entry.endif.endif.endif.endif.endif.endif
  %.82.fca.0.load = load ptr, ptr %.67, align 8
  %sunkaddr5 = getelementptr inbounds i8, ptr %.67, i64 32
  %.82.fca.4.load = load ptr, ptr %sunkaddr5, align 8
  %.99 = call i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr nonnull %.89, ptr nonnull poison, ptr poison, ptr poison, i64 %.36.fca.2.load, i64 poison, ptr %.36.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr poison, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.82.fca.4.load, i64 poison, i64 poison) #4
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
define ptr @cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE({ ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3) local_unnamed_addr #3 {
entry:
  %.5 = alloca ptr, align 8
  store ptr null, ptr %.5, align 8
  %extracted.nitems = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 2
  %extracted.data = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 4
  %extracted.data.2 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3, 4
  %.15 = call i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB2v6B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr nonnull %.5, ptr nonnull poison, ptr poison, ptr poison, i64 %extracted.nitems, i64 poison, ptr %extracted.data, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr poison, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.2, i64 poison, i64 poison) #4
  %.25 = load ptr, ptr %.5, align 8
  ret ptr %.25
}

; Function Attrs: noinline
define linkonce_odr void @NRT_decref(ptr %.1) local_unnamed_addr #4 {
.3:
  %.4 = icmp eq ptr %.1, null
  br i1 %.4, label %common.ret1, label %.3.endif, !prof !8

common.ret1:                                      ; preds = %.3, %.3.endif
  ret void

.3.endif:                                         ; preds = %.3
  fence release
  %0 = tail call i8 @llvm.x86.atomic.sub.cc.i64(ptr nonnull %.1, i64 1, i32 4)
  %1 = trunc i8 %0 to i1
  br i1 %1, label %.3.endif.if, label %common.ret1, !prof !8

.3.endif.if:                                      ; preds = %.3.endif
  fence acquire
  tail call void @NRT_MemInfo_call_dtor(ptr nonnull %.1)
  ret void
}

; Function Attrs: nounwind
declare i8 @llvm.x86.atomic.sub.cc.i64(ptr, i64, i32 immarg) #5

declare void @NRT_MemInfo_call_dtor(ptr) local_unnamed_addr

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @_ZGVbN2v_cos(<2 x double>) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @_ZGVdN4v_cos(<4 x double>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) }
attributes #4 = { noinline }
attributes #5 = { nounwind }
attributes #6 = { "vector-function-abi-variant"="_ZGV_LLVM_N2v_llvm.cos.f64(_ZGVbN2v_cos),_ZGV_LLVM_N4v_llvm.cos.f64(_ZGVdN4v_cos)" }

!0 = distinct !{!0, !1, !2}
!1 = !{!"llvm.loop.isvectorized", i32 1}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"branch_weights", i32 4, i32 12}
!4 = distinct !{!4, !1, !2}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !1}
!8 = !{!"branch_weights", i32 1, i32 99}
