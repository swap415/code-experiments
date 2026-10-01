; ModuleID = 'kernel_for.<locals>.kernel'
source_filename = "<string>"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@".const.kernel_for.<locals>.kernel" = internal constant [27 x i8] c"kernel_for.<locals>.kernel\00"
@_ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE = common local_unnamed_addr global ptr null
@".const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE" = internal constant [217 x i8] c"missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE\00"
@PyExc_TypeError = external global i8
@".const.can't unbox array from PyObject into native value.  The object maybe of a different type" = internal constant [89 x i8] c"can't unbox array from PyObject into native value.  The object maybe of a different type\00"
@_Py_NoneStruct = external global i8
@PyExc_RuntimeError = external global i8
@llvm.compiler.used = appending global [2 x ptr] [ptr @_ZGVbN4vv_powf, ptr @_ZGVdN8vv_powf], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define noundef i32 @_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE(ptr noalias writeonly captures(none) %retptr, ptr noalias readnone captures(none) %excinfo, ptr readnone captures(none) %arg.x.0, ptr readnone captures(none) %arg.x.1, i64 %arg.x.2, i64 %arg.x.3, ptr readonly captures(none) %arg.x.4, i64 %arg.x.5.0, i64 %arg.x.6.0, ptr readnone captures(none) %arg.y.0, ptr readnone captures(none) %arg.y.1, i64 %arg.y.2, i64 %arg.y.3, ptr readonly captures(none) %arg.y.4, i64 %arg.y.5.0, i64 %arg.y.6.0, ptr readnone captures(none) %arg.out.0, ptr readnone captures(none) %arg.out.1, i64 %arg.out.2, i64 %arg.out.3, ptr writeonly captures(none) %arg.out.4, i64 %arg.out.5.0, i64 %arg.out.6.0) local_unnamed_addr #0 {
B0.endif:
  %.134112.not = icmp slt i64 %arg.x.2, 1
  br i1 %.134112.not, label %B92, label %iter.check

iter.check:                                       ; preds = %B0.endif
  %min.iters.check = icmp ult i64 %arg.x.2, 4
  br i1 %min.iters.check, label %B52.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %0 = ptrtoint ptr %arg.out.4 to i64
  %1 = ptrtoint ptr %arg.x.4 to i64
  %2 = ptrtoint ptr %arg.y.4 to i64
  %3 = sub i64 %0, %1
  %diff.check = icmp ult i64 %3, 128
  %4 = sub i64 %0, %2
  %diff.check4 = icmp ult i64 %4, 128
  %conflict.rdx = or i1 %diff.check, %diff.check4
  br i1 %conflict.rdx, label %B52.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %const270 = bitcast i64 9223372036854775776 to i64
  %min.iters.check5 = icmp ult i64 %arg.x.2, 32
  br i1 %min.iters.check5, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %5 = bitcast i64 %const270 to i64
  %n.vec = and i64 %arg.x.2, %5
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %sunkaddr = mul i64 %index, 4
  %sunkaddr443 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr
  %wide.load = load <8 x float>, ptr %sunkaddr443, align 4
  %sunkaddr444 = mul i64 %index, 4
  %sunkaddr445 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr444
  %sunkaddr446 = getelementptr i8, ptr %sunkaddr445, i64 32
  %wide.load6 = load <8 x float>, ptr %sunkaddr446, align 4
  %sunkaddr447 = mul i64 %index, 4
  %sunkaddr448 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr447
  %sunkaddr449 = getelementptr i8, ptr %sunkaddr448, i64 64
  %wide.load7 = load <8 x float>, ptr %sunkaddr449, align 4
  %sunkaddr450 = mul i64 %index, 4
  %sunkaddr451 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr450
  %sunkaddr452 = getelementptr i8, ptr %sunkaddr451, i64 96
  %wide.load8 = load <8 x float>, ptr %sunkaddr452, align 4
  %sunkaddr453 = mul i64 %index, 4
  %sunkaddr454 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr453
  %wide.load9 = load <8 x float>, ptr %sunkaddr454, align 4
  %sunkaddr455 = mul i64 %index, 4
  %sunkaddr456 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr455
  %sunkaddr457 = getelementptr i8, ptr %sunkaddr456, i64 32
  %wide.load10 = load <8 x float>, ptr %sunkaddr457, align 4
  %sunkaddr458 = mul i64 %index, 4
  %sunkaddr459 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr458
  %sunkaddr460 = getelementptr i8, ptr %sunkaddr459, i64 64
  %wide.load11 = load <8 x float>, ptr %sunkaddr460, align 4
  %sunkaddr461 = mul i64 %index, 4
  %sunkaddr462 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr461
  %sunkaddr463 = getelementptr i8, ptr %sunkaddr462, i64 96
  %wide.load12 = load <8 x float>, ptr %sunkaddr463, align 4
  %6 = tail call <8 x float> @_ZGVdN8vv_powf(<8 x float> %wide.load, <8 x float> %wide.load9)
  %7 = tail call <8 x float> @_ZGVdN8vv_powf(<8 x float> %wide.load6, <8 x float> %wide.load10)
  %8 = tail call <8 x float> @_ZGVdN8vv_powf(<8 x float> %wide.load7, <8 x float> %wide.load11)
  %9 = tail call <8 x float> @_ZGVdN8vv_powf(<8 x float> %wide.load8, <8 x float> %wide.load12)
  %sunkaddr464 = mul i64 %index, 4
  %sunkaddr465 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr464
  store <8 x float> %6, ptr %sunkaddr465, align 4
  %sunkaddr466 = mul i64 %index, 4
  %sunkaddr467 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr466
  %sunkaddr468 = getelementptr i8, ptr %sunkaddr467, i64 32
  store <8 x float> %7, ptr %sunkaddr468, align 4
  %sunkaddr469 = mul i64 %index, 4
  %sunkaddr470 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr469
  %sunkaddr471 = getelementptr i8, ptr %sunkaddr470, i64 64
  store <8 x float> %8, ptr %sunkaddr471, align 4
  %sunkaddr472 = mul i64 %index, 4
  %sunkaddr473 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr472
  %sunkaddr474 = getelementptr i8, ptr %sunkaddr473, i64 96
  store <8 x float> %9, ptr %sunkaddr474, align 4
  %index.next = add nuw i64 %index, 32
  %10 = icmp eq i64 %n.vec, %index.next
  br i1 %10, label %middle.block, label %vector.body, !llvm.loop !0

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %arg.x.2, %n.vec
  br i1 %cmp.n, label %B92, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %11 = and i64 %arg.x.2, 28
  %min.epilog.iters.check = icmp eq i64 %11, 0
  br i1 %min.epilog.iters.check, label %B52.preheader, label %vec.epilog.ph, !prof !3

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %12 = bitcast i64 %const270 to i64
  %const_mat = add i64 %12, 28
  %n.vec14 = and i64 %arg.x.2, %const_mat
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index15 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next18, %vec.epilog.vector.body ]
  %13 = shl i64 %index15, 2
  %scevgep73 = getelementptr i8, ptr %arg.x.4, i64 %13
  %wide.load16 = load <4 x float>, ptr %scevgep73, align 4
  %14 = shl i64 %index15, 2
  %scevgep72 = getelementptr i8, ptr %arg.y.4, i64 %14
  %wide.load17 = load <4 x float>, ptr %scevgep72, align 4
  %15 = tail call <4 x float> @_ZGVbN4vv_powf(<4 x float> %wide.load16, <4 x float> %wide.load17)
  %16 = shl i64 %index15, 2
  %scevgep71 = getelementptr i8, ptr %arg.out.4, i64 %16
  store <4 x float> %15, ptr %scevgep71, align 4
  %index.next18 = add nuw i64 %index15, 4
  %17 = icmp eq i64 %n.vec14, %index.next18
  br i1 %17, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !4

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n19 = icmp eq i64 %arg.x.2, %n.vec14
  br i1 %cmp.n19, label %B92, label %B52.preheader

B52.preheader:                                    ; preds = %vec.epilog.middle.block, %vec.epilog.iter.check, %vector.memcheck, %iter.check
  %.140111113.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec14, %vec.epilog.middle.block ]
  %18 = sub nsw i64 %arg.x.2, %.140111113.ph
  %xtraiter = and i64 %18, 7
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %B52.prol.loopexit, label %B52.prol.preheader

B52.prol.preheader:                               ; preds = %B52.preheader
  br label %B52.prol

B52.prol:                                         ; preds = %B52.prol.preheader, %B52.prol
  %lsr.iv = phi i64 [ %xtraiter, %B52.prol.preheader ], [ %lsr.iv.next, %B52.prol ]
  %.140111113.prol = phi i64 [ %.147.prol, %B52.prol ], [ %.140111113.ph, %B52.prol.preheader ]
  %.147.prol = add nuw i64 %.140111113.prol, 1
  %19 = shl i64 %.140111113.prol, 2
  %scevgep70 = getelementptr i8, ptr %arg.x.4, i64 %19
  %.201.prol = load float, ptr %scevgep70, align 4
  %20 = shl i64 %.140111113.prol, 2
  %scevgep69 = getelementptr i8, ptr %arg.y.4, i64 %20
  %.231.prol = load float, ptr %scevgep69, align 4
  %.241.le.prol = tail call float @llvm.pow.f32(float %.201.prol, float %.231.prol) #6
  %21 = shl i64 %.140111113.prol, 2
  %scevgep68 = getelementptr i8, ptr %arg.out.4, i64 %21
  store float %.241.le.prol, ptr %scevgep68, align 4
  %lsr.iv.next = add nsw i64 %lsr.iv, -1
  %prol.iter.cmp.not = icmp eq i64 %lsr.iv.next, 0
  br i1 %prol.iter.cmp.not, label %B52.prol.loopexit, label %B52.prol, !llvm.loop !5

B52.prol.loopexit:                                ; preds = %B52.prol, %B52.preheader
  %.140111113.unr = phi i64 [ %.140111113.ph, %B52.preheader ], [ %.147.prol, %B52.prol ]
  %22 = sub nsw i64 %.140111113.ph, %arg.x.2
  %23 = icmp ugt i64 %22, -8
  br i1 %23, label %B92, label %B52.preheader20

B52.preheader20:                                  ; preds = %B52.prol.loopexit
  br label %B52

B52:                                              ; preds = %B52.preheader20, %B52
  %.140111113 = phi i64 [ %.147.7, %B52 ], [ %.140111113.unr, %B52.preheader20 ]
  %sunkaddr475 = mul i64 %.140111113, 4
  %sunkaddr476 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr475
  %.201 = load float, ptr %sunkaddr476, align 4
  %sunkaddr477 = mul i64 %.140111113, 4
  %sunkaddr478 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr477
  %.231 = load float, ptr %sunkaddr478, align 4
  %.241.le = tail call float @llvm.pow.f32(float %.201, float %.231) #6
  %sunkaddr479 = mul i64 %.140111113, 4
  %sunkaddr480 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr479
  store float %.241.le, ptr %sunkaddr480, align 4
  %sunkaddr481 = mul i64 %.140111113, 4
  %sunkaddr482 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr481
  %sunkaddr483 = getelementptr i8, ptr %sunkaddr482, i64 4
  %.201.1 = load float, ptr %sunkaddr483, align 4
  %sunkaddr484 = mul i64 %.140111113, 4
  %sunkaddr485 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr484
  %sunkaddr486 = getelementptr i8, ptr %sunkaddr485, i64 4
  %.231.1 = load float, ptr %sunkaddr486, align 4
  %.241.le.1 = tail call float @llvm.pow.f32(float %.201.1, float %.231.1) #6
  %sunkaddr487 = mul i64 %.140111113, 4
  %sunkaddr488 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr487
  %sunkaddr489 = getelementptr i8, ptr %sunkaddr488, i64 4
  store float %.241.le.1, ptr %sunkaddr489, align 4
  %sunkaddr490 = mul i64 %.140111113, 4
  %sunkaddr491 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr490
  %sunkaddr492 = getelementptr i8, ptr %sunkaddr491, i64 8
  %.201.2 = load float, ptr %sunkaddr492, align 4
  %sunkaddr493 = mul i64 %.140111113, 4
  %sunkaddr494 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr493
  %sunkaddr495 = getelementptr i8, ptr %sunkaddr494, i64 8
  %.231.2 = load float, ptr %sunkaddr495, align 4
  %.241.le.2 = tail call float @llvm.pow.f32(float %.201.2, float %.231.2) #6
  %sunkaddr496 = mul i64 %.140111113, 4
  %sunkaddr497 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr496
  %sunkaddr498 = getelementptr i8, ptr %sunkaddr497, i64 8
  store float %.241.le.2, ptr %sunkaddr498, align 4
  %sunkaddr499 = mul i64 %.140111113, 4
  %sunkaddr500 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr499
  %sunkaddr501 = getelementptr i8, ptr %sunkaddr500, i64 12
  %.201.3 = load float, ptr %sunkaddr501, align 4
  %sunkaddr502 = mul i64 %.140111113, 4
  %sunkaddr503 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr502
  %sunkaddr504 = getelementptr i8, ptr %sunkaddr503, i64 12
  %.231.3 = load float, ptr %sunkaddr504, align 4
  %.241.le.3 = tail call float @llvm.pow.f32(float %.201.3, float %.231.3) #6
  %sunkaddr505 = mul i64 %.140111113, 4
  %sunkaddr506 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr505
  %sunkaddr507 = getelementptr i8, ptr %sunkaddr506, i64 12
  store float %.241.le.3, ptr %sunkaddr507, align 4
  %sunkaddr508 = mul i64 %.140111113, 4
  %sunkaddr509 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr508
  %sunkaddr510 = getelementptr i8, ptr %sunkaddr509, i64 16
  %.201.4 = load float, ptr %sunkaddr510, align 4
  %sunkaddr511 = mul i64 %.140111113, 4
  %sunkaddr512 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr511
  %sunkaddr513 = getelementptr i8, ptr %sunkaddr512, i64 16
  %.231.4 = load float, ptr %sunkaddr513, align 4
  %.241.le.4 = tail call float @llvm.pow.f32(float %.201.4, float %.231.4) #6
  %sunkaddr514 = mul i64 %.140111113, 4
  %sunkaddr515 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr514
  %sunkaddr516 = getelementptr i8, ptr %sunkaddr515, i64 16
  store float %.241.le.4, ptr %sunkaddr516, align 4
  %sunkaddr517 = mul i64 %.140111113, 4
  %sunkaddr518 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr517
  %sunkaddr519 = getelementptr i8, ptr %sunkaddr518, i64 20
  %.201.5 = load float, ptr %sunkaddr519, align 4
  %sunkaddr520 = mul i64 %.140111113, 4
  %sunkaddr521 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr520
  %sunkaddr522 = getelementptr i8, ptr %sunkaddr521, i64 20
  %.231.5 = load float, ptr %sunkaddr522, align 4
  %.241.le.5 = tail call float @llvm.pow.f32(float %.201.5, float %.231.5) #6
  %sunkaddr523 = mul i64 %.140111113, 4
  %sunkaddr524 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr523
  %sunkaddr525 = getelementptr i8, ptr %sunkaddr524, i64 20
  store float %.241.le.5, ptr %sunkaddr525, align 4
  %sunkaddr526 = mul i64 %.140111113, 4
  %sunkaddr527 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr526
  %sunkaddr528 = getelementptr i8, ptr %sunkaddr527, i64 24
  %.201.6 = load float, ptr %sunkaddr528, align 4
  %sunkaddr529 = mul i64 %.140111113, 4
  %sunkaddr530 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr529
  %sunkaddr531 = getelementptr i8, ptr %sunkaddr530, i64 24
  %.231.6 = load float, ptr %sunkaddr531, align 4
  %.241.le.6 = tail call float @llvm.pow.f32(float %.201.6, float %.231.6) #6
  %sunkaddr532 = mul i64 %.140111113, 4
  %sunkaddr533 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr532
  %sunkaddr534 = getelementptr i8, ptr %sunkaddr533, i64 24
  store float %.241.le.6, ptr %sunkaddr534, align 4
  %.147.7 = add nuw nsw i64 %.140111113, 8
  %sunkaddr535 = mul i64 %.140111113, 4
  %sunkaddr536 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr535
  %sunkaddr537 = getelementptr i8, ptr %sunkaddr536, i64 28
  %.201.7 = load float, ptr %sunkaddr537, align 4
  %sunkaddr538 = mul i64 %.140111113, 4
  %sunkaddr539 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr538
  %sunkaddr540 = getelementptr i8, ptr %sunkaddr539, i64 28
  %.231.7 = load float, ptr %sunkaddr540, align 4
  %.241.le.7 = tail call float @llvm.pow.f32(float %.201.7, float %.231.7) #6
  %sunkaddr541 = mul i64 %.140111113, 4
  %sunkaddr542 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr541
  %sunkaddr543 = getelementptr i8, ptr %sunkaddr542, i64 28
  store float %.241.le.7, ptr %sunkaddr543, align 4
  %exitcond.not.7 = icmp eq i64 %arg.x.2, %.147.7
  br i1 %exitcond.not.7, label %B92, label %B52, !llvm.loop !7

B92:                                              ; preds = %B52, %B52.prol.loopexit, %middle.block, %vec.epilog.middle.block, %B0.endif
  store ptr null, ptr %retptr, align 8
  ret i32 0
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.pow.f32(float, float) #1

define noundef ptr @_ZN7cpython8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE(ptr readnone captures(none) %py_closure, ptr %py_args, ptr readnone captures(none) %py_kws) local_unnamed_addr {
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
  br i1 %.9, label %common.ret, label %entry.endif, !prof !8

common.ret:                                       ; preds = %entry.endif.endif.endif.thread, %arg0.err, %entry, %entry.endif.endif.endif.endif.endif.endif.endif.endif, %entry.endif.if
  %common.ret.op = phi ptr [ null, %arg0.err ], [ null, %entry ], [ null, %entry.endif.if ], [ null, %entry.endif.endif.endif.thread ], [ @_Py_NoneStruct, %entry.endif.endif.endif.endif.endif.endif.endif.endif ]
  ret ptr %common.ret.op

entry.endif:                                      ; preds = %entry
  %.13 = load ptr, ptr @_ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE, align 8
  %.16 = icmp eq ptr %.13, null
  br i1 %.16, label %entry.endif.if, label %entry.endif.endif, !prof !8

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_RuntimeError, ptr nonnull @".const.missing Environment: _ZN08NumbaEnv8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE")
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
  %.53 = icmp ne i64 %.52, 4
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
  br i1 %.78, label %entry.endif.endif.endif.endif.endif.endif.if, label %entry.endif.endif.endif.endif.endif.endif.endif.endif, !prof !8

entry.endif.endif.endif.endif.endif.endif.if:     ; preds = %entry.endif.endif.endif.endif.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  call void @NRT_decref(ptr %.59.fca.0.load)
  br label %arg0.err

entry.endif.endif.endif.endif.endif.endif.endif.endif: ; preds = %entry.endif.endif.endif.endif.endif.endif
  %.82.fca.0.load = load ptr, ptr %.67, align 8
  %sunkaddr6 = getelementptr inbounds i8, ptr %.67, i64 32
  %.82.fca.4.load = load ptr, ptr %sunkaddr6, align 8
  %.99 = call i32 @_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE(ptr nonnull %.89, ptr nonnull poison, ptr poison, ptr poison, i64 %.36.fca.2.load, i64 poison, ptr %.36.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.59.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.82.fca.4.load, i64 poison, i64 poison) #4
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
define ptr @cfunc._ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE({ ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3) local_unnamed_addr #3 {
entry:
  %.5 = alloca ptr, align 8
  store ptr null, ptr %.5, align 8
  %extracted.nitems = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 2
  %extracted.data = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 4
  %extracted.data.1 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, 4
  %extracted.data.2 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3, 4
  %.15 = call i32 @_ZN8__main__10kernel_for12_3clocals_3e6kernelB3v21B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE5ArrayIfLi1E1C7mutable7alignedE(ptr nonnull %.5, ptr nonnull poison, ptr poison, ptr poison, i64 %extracted.nitems, i64 poison, ptr %extracted.data, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.1, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.2, i64 poison, i64 poison) #4
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
declare <4 x float> @_ZGVbN4vv_powf(<4 x float>, <4 x float>) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @_ZGVdN8vv_powf(<8 x float>, <8 x float>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) }
attributes #4 = { noinline }
attributes #5 = { nounwind }
attributes #6 = { "vector-function-abi-variant"="_ZGV_LLVM_N4vv_llvm.pow.f32(_ZGVbN4vv_powf),_ZGV_LLVM_N8vv_llvm.pow.f32(_ZGVdN8vv_powf)" }

!0 = distinct !{!0, !1, !2}
!1 = !{!"llvm.loop.isvectorized", i32 1}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"branch_weights", i32 4, i32 28}
!4 = distinct !{!4, !1, !2}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !1}
!8 = !{!"branch_weights", i32 1, i32 99}
