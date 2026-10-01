; ModuleID = 'kernel_for.<locals>.kernel'
source_filename = "<string>"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@".const.kernel_for.<locals>.kernel" = internal constant [27 x i8] c"kernel_for.<locals>.kernel\00"
@_ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE = common local_unnamed_addr global ptr null
@".const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE" = internal constant [217 x i8] c"missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE\00"
@PyExc_TypeError = external global i8
@".const.can't unbox array from PyObject into native value.  The object maybe of a different type" = internal constant [89 x i8] c"can't unbox array from PyObject into native value.  The object maybe of a different type\00"
@_Py_NoneStruct = external global i8
@PyExc_RuntimeError = external global i8

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define noundef i32 @_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr noalias writeonly captures(none) %retptr, ptr noalias readnone captures(none) %excinfo, ptr readnone captures(none) %arg.x.0, ptr readnone captures(none) %arg.x.1, i64 %arg.x.2, i64 %arg.x.3, ptr readonly captures(none) %arg.x.4, i64 %arg.x.5.0, i64 %arg.x.6.0, ptr readnone captures(none) %arg.y.0, ptr readnone captures(none) %arg.y.1, i64 %arg.y.2, i64 %arg.y.3, ptr readonly captures(none) %arg.y.4, i64 %arg.y.5.0, i64 %arg.y.6.0, ptr readnone captures(none) %arg.out.0, ptr readnone captures(none) %arg.out.1, i64 %arg.out.2, i64 %arg.out.3, ptr writeonly captures(none) %arg.out.4, i64 %arg.out.5.0, i64 %arg.out.6.0) local_unnamed_addr #0 {
B0.endif:
  %.134112.not = icmp slt i64 %arg.x.2, 1
  br i1 %.134112.not, label %B92, label %B52.preheader

B52.preheader:                                    ; preds = %B0.endif
  %min.iters.check = icmp ult i64 %arg.x.2, 4
  br i1 %min.iters.check, label %B52.preheader6, label %vector.memcheck

vector.memcheck:                                  ; preds = %B52.preheader
  %0 = ptrtoint ptr %arg.out.4 to i64
  %1 = ptrtoint ptr %arg.x.4 to i64
  %2 = ptrtoint ptr %arg.y.4 to i64
  %3 = sub i64 %0, %1
  %diff.check = icmp ult i64 %3, 32
  %4 = sub i64 %0, %2
  %diff.check4 = icmp ult i64 %4, 32
  %conflict.rdx = or i1 %diff.check, %diff.check4
  br i1 %conflict.rdx, label %B52.preheader6, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %arg.x.2, 9223372036854775804
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %5 = shl i64 %index, 3
  %scevgep60 = getelementptr i8, ptr %arg.x.4, i64 %5
  %wide.load = load <4 x double>, ptr %scevgep60, align 8
  %6 = shl i64 %index, 3
  %scevgep59 = getelementptr i8, ptr %arg.y.4, i64 %6
  %wide.load5 = load <4 x double>, ptr %scevgep59, align 8
  %7 = tail call <4 x double> @llvm.pow.v4f64(<4 x double> %wide.load, <4 x double> %wide.load5)
  %8 = shl i64 %index, 3
  %scevgep58 = getelementptr i8, ptr %arg.out.4, i64 %8
  store <4 x double> %7, ptr %scevgep58, align 8
  %index.next = add nuw i64 %index, 4
  %9 = icmp eq i64 %n.vec, %index.next
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !0

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %arg.x.2, %n.vec
  br i1 %cmp.n, label %B92, label %B52.preheader6

B52.preheader6:                                   ; preds = %vector.memcheck, %B52.preheader, %middle.block
  %.140111113.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %B52.preheader ], [ %n.vec, %middle.block ]
  %10 = sub nsw i64 %arg.x.2, %.140111113.ph
  %xtraiter = and i64 %10, 7
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %B52.prol.loopexit, label %B52.prol.preheader

B52.prol.preheader:                               ; preds = %B52.preheader6
  br label %B52.prol

B52.prol:                                         ; preds = %B52.prol.preheader, %B52.prol
  %lsr.iv = phi i64 [ %xtraiter, %B52.prol.preheader ], [ %lsr.iv.next, %B52.prol ]
  %.140111113.prol = phi i64 [ %.147.prol, %B52.prol ], [ %.140111113.ph, %B52.prol.preheader ]
  %.147.prol = add nuw i64 %.140111113.prol, 1
  %11 = shl i64 %.140111113.prol, 3
  %scevgep57 = getelementptr i8, ptr %arg.x.4, i64 %11
  %.201.prol = load double, ptr %scevgep57, align 8
  %12 = shl i64 %.140111113.prol, 3
  %scevgep56 = getelementptr i8, ptr %arg.y.4, i64 %12
  %.231.prol = load double, ptr %scevgep56, align 8
  %.241.le.prol = tail call double @llvm.pow.f64(double %.201.prol, double %.231.prol)
  %13 = shl i64 %.140111113.prol, 3
  %scevgep55 = getelementptr i8, ptr %arg.out.4, i64 %13
  store double %.241.le.prol, ptr %scevgep55, align 8
  %lsr.iv.next = add nsw i64 %lsr.iv, -1
  %prol.iter.cmp.not = icmp eq i64 %lsr.iv.next, 0
  br i1 %prol.iter.cmp.not, label %B52.prol.loopexit, label %B52.prol, !llvm.loop !3

B52.prol.loopexit:                                ; preds = %B52.prol, %B52.preheader6
  %.140111113.unr = phi i64 [ %.140111113.ph, %B52.preheader6 ], [ %.147.prol, %B52.prol ]
  %14 = sub nsw i64 %.140111113.ph, %arg.x.2
  %15 = icmp ugt i64 %14, -8
  br i1 %15, label %B92, label %B52.preheader7

B52.preheader7:                                   ; preds = %B52.prol.loopexit
  br label %B52

B52:                                              ; preds = %B52.preheader7, %B52
  %.140111113 = phi i64 [ %.147.7, %B52 ], [ %.140111113.unr, %B52.preheader7 ]
  %sunkaddr = mul i64 %.140111113, 8
  %sunkaddr291 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr
  %.201 = load double, ptr %sunkaddr291, align 8
  %sunkaddr292 = mul i64 %.140111113, 8
  %sunkaddr293 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr292
  %.231 = load double, ptr %sunkaddr293, align 8
  %.241.le = tail call double @llvm.pow.f64(double %.201, double %.231)
  %sunkaddr294 = mul i64 %.140111113, 8
  %sunkaddr295 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr294
  store double %.241.le, ptr %sunkaddr295, align 8
  %sunkaddr296 = mul i64 %.140111113, 8
  %sunkaddr297 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr296
  %sunkaddr298 = getelementptr i8, ptr %sunkaddr297, i64 8
  %.201.1 = load double, ptr %sunkaddr298, align 8
  %sunkaddr299 = mul i64 %.140111113, 8
  %sunkaddr300 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr299
  %sunkaddr301 = getelementptr i8, ptr %sunkaddr300, i64 8
  %.231.1 = load double, ptr %sunkaddr301, align 8
  %.241.le.1 = tail call double @llvm.pow.f64(double %.201.1, double %.231.1)
  %sunkaddr302 = mul i64 %.140111113, 8
  %sunkaddr303 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr302
  %sunkaddr304 = getelementptr i8, ptr %sunkaddr303, i64 8
  store double %.241.le.1, ptr %sunkaddr304, align 8
  %sunkaddr305 = mul i64 %.140111113, 8
  %sunkaddr306 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr305
  %sunkaddr307 = getelementptr i8, ptr %sunkaddr306, i64 16
  %.201.2 = load double, ptr %sunkaddr307, align 8
  %sunkaddr308 = mul i64 %.140111113, 8
  %sunkaddr309 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr308
  %sunkaddr310 = getelementptr i8, ptr %sunkaddr309, i64 16
  %.231.2 = load double, ptr %sunkaddr310, align 8
  %.241.le.2 = tail call double @llvm.pow.f64(double %.201.2, double %.231.2)
  %sunkaddr311 = mul i64 %.140111113, 8
  %sunkaddr312 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr311
  %sunkaddr313 = getelementptr i8, ptr %sunkaddr312, i64 16
  store double %.241.le.2, ptr %sunkaddr313, align 8
  %sunkaddr314 = mul i64 %.140111113, 8
  %sunkaddr315 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr314
  %sunkaddr316 = getelementptr i8, ptr %sunkaddr315, i64 24
  %.201.3 = load double, ptr %sunkaddr316, align 8
  %sunkaddr317 = mul i64 %.140111113, 8
  %sunkaddr318 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr317
  %sunkaddr319 = getelementptr i8, ptr %sunkaddr318, i64 24
  %.231.3 = load double, ptr %sunkaddr319, align 8
  %.241.le.3 = tail call double @llvm.pow.f64(double %.201.3, double %.231.3)
  %sunkaddr320 = mul i64 %.140111113, 8
  %sunkaddr321 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr320
  %sunkaddr322 = getelementptr i8, ptr %sunkaddr321, i64 24
  store double %.241.le.3, ptr %sunkaddr322, align 8
  %sunkaddr323 = mul i64 %.140111113, 8
  %sunkaddr324 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr323
  %sunkaddr325 = getelementptr i8, ptr %sunkaddr324, i64 32
  %.201.4 = load double, ptr %sunkaddr325, align 8
  %sunkaddr326 = mul i64 %.140111113, 8
  %sunkaddr327 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr326
  %sunkaddr328 = getelementptr i8, ptr %sunkaddr327, i64 32
  %.231.4 = load double, ptr %sunkaddr328, align 8
  %.241.le.4 = tail call double @llvm.pow.f64(double %.201.4, double %.231.4)
  %sunkaddr329 = mul i64 %.140111113, 8
  %sunkaddr330 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr329
  %sunkaddr331 = getelementptr i8, ptr %sunkaddr330, i64 32
  store double %.241.le.4, ptr %sunkaddr331, align 8
  %sunkaddr332 = mul i64 %.140111113, 8
  %sunkaddr333 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr332
  %sunkaddr334 = getelementptr i8, ptr %sunkaddr333, i64 40
  %.201.5 = load double, ptr %sunkaddr334, align 8
  %sunkaddr335 = mul i64 %.140111113, 8
  %sunkaddr336 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr335
  %sunkaddr337 = getelementptr i8, ptr %sunkaddr336, i64 40
  %.231.5 = load double, ptr %sunkaddr337, align 8
  %.241.le.5 = tail call double @llvm.pow.f64(double %.201.5, double %.231.5)
  %sunkaddr338 = mul i64 %.140111113, 8
  %sunkaddr339 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr338
  %sunkaddr340 = getelementptr i8, ptr %sunkaddr339, i64 40
  store double %.241.le.5, ptr %sunkaddr340, align 8
  %sunkaddr341 = mul i64 %.140111113, 8
  %sunkaddr342 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr341
  %sunkaddr343 = getelementptr i8, ptr %sunkaddr342, i64 48
  %.201.6 = load double, ptr %sunkaddr343, align 8
  %sunkaddr344 = mul i64 %.140111113, 8
  %sunkaddr345 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr344
  %sunkaddr346 = getelementptr i8, ptr %sunkaddr345, i64 48
  %.231.6 = load double, ptr %sunkaddr346, align 8
  %.241.le.6 = tail call double @llvm.pow.f64(double %.201.6, double %.231.6)
  %sunkaddr347 = mul i64 %.140111113, 8
  %sunkaddr348 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr347
  %sunkaddr349 = getelementptr i8, ptr %sunkaddr348, i64 48
  store double %.241.le.6, ptr %sunkaddr349, align 8
  %.147.7 = add nuw nsw i64 %.140111113, 8
  %sunkaddr350 = mul i64 %.140111113, 8
  %sunkaddr351 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr350
  %sunkaddr352 = getelementptr i8, ptr %sunkaddr351, i64 56
  %.201.7 = load double, ptr %sunkaddr352, align 8
  %sunkaddr353 = mul i64 %.140111113, 8
  %sunkaddr354 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr353
  %sunkaddr355 = getelementptr i8, ptr %sunkaddr354, i64 56
  %.231.7 = load double, ptr %sunkaddr355, align 8
  %.241.le.7 = tail call double @llvm.pow.f64(double %.201.7, double %.231.7)
  %sunkaddr356 = mul i64 %.140111113, 8
  %sunkaddr357 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr356
  %sunkaddr358 = getelementptr i8, ptr %sunkaddr357, i64 56
  store double %.241.le.7, ptr %sunkaddr358, align 8
  %exitcond.not.7 = icmp eq i64 %arg.x.2, %.147.7
  br i1 %exitcond.not.7, label %B92, label %B52, !llvm.loop !5

B92:                                              ; preds = %B52, %B52.prol.loopexit, %middle.block, %B0.endif
  store ptr null, ptr %retptr, align 8
  ret i32 0
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.pow.f64(double, double) #1

define noundef ptr @_ZN7cpython8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr readnone captures(none) %py_closure, ptr %py_args, ptr readnone captures(none) %py_kws) local_unnamed_addr {
entry:
  %.5 = alloca ptr, align 8
  %.6 = alloca ptr, align 8
  %.7 = alloca ptr, align 8
  %.8 = call i32 (ptr, ptr, i64, i64, ...) @PyArg_UnpackTuple(ptr %py_args, ptr nonnull @".const.kernel_for.<locals>.kernel", i64 3, i64 3, ptr nonnull %.5, ptr nonnull %.6, ptr nonnull %.7)
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
  %.13 = load ptr, ptr @_ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, align 8
  %.16 = icmp eq ptr %.13, null
  br i1 %.16, label %entry.endif.if, label %entry.endif.endif, !prof !6

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_RuntimeError, ptr nonnull @".const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE")
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
  %sunkaddr4 = getelementptr inbounds i8, ptr %.44, i64 32
  %.59.fca.4.load = load ptr, ptr %sunkaddr4, align 8
  %.66 = load ptr, ptr %.7, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %.67, i8 0, i64 56, i1 false)
  %.71 = call i32 @NRT_adapt_ndarray_from_python(ptr %.66, ptr nonnull %.67)
  %sunkaddr5 = getelementptr inbounds i8, ptr %.67, i64 24
  %.75 = load i64, ptr %sunkaddr5, align 8
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
  %sunkaddr6 = getelementptr inbounds i8, ptr %.67, i64 32
  %.82.fca.4.load = load ptr, ptr %sunkaddr6, align 8
  %.99 = call i32 @_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr nonnull %.89, ptr nonnull poison, ptr poison, ptr poison, i64 %.36.fca.2.load, i64 poison, ptr %.36.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.59.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.82.fca.4.load, i64 poison, i64 poison) #4
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
define ptr @cfunc._ZN8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE({ ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3) local_unnamed_addr #3 {
entry:
  %.5 = alloca ptr, align 8
  store ptr null, ptr %.5, align 8
  %extracted.nitems = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 2
  %extracted.data = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 4
  %extracted.data.1 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, 4
  %extracted.data.2 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3, 4
  %.15 = call i32 @_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v22B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr nonnull %.5, ptr nonnull poison, ptr poison, ptr poison, i64 %extracted.nitems, i64 poison, ptr %extracted.data, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.1, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.2, i64 poison, i64 poison) #4
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
declare <4 x double> @llvm.pow.v4f64(<4 x double>, <4 x double>) #6

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
