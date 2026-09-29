define range(i32 -1, -2) i32 @_ZN15original_kernel25_delta_minimization_orderB2v1B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29(ptr noalias writeonly captures(none) %retptr, ptr noalias writeonly captures(none) %excinfo, ptr %arg.all_masks.0, ptr readnone captures(none) %arg.all_masks.1, i64 %arg.all_masks.2, i64 %arg.all_masks.3, ptr readonly captures(none) %arg.all_masks.4, i64 %arg.all_masks.5.0, i64 %arg.all_masks.5.1, i64 %arg.all_masks.6.0, i64 %arg.all_masks.6.1) local_unnamed_addr {
B0:
  %.457 = alloca i64, align 8
  %excinfo.2 = alloca ptr, align 8
  store ptr null, ptr %excinfo.2, align 8
  %.496 = alloca ptr, align 8
  %excinfo.3 = alloca ptr, align 8
  tail call void @NRT_incref(ptr %arg.all_masks.0)
  %.104.i = sitofp i64 %arg.all_masks.5.0 to double
  %.115.i = fptosi double %.104.i to i64
  %.13.i.i = tail call i64 @llvm.smax.i64(i64 %.115.i, i64 0)
  %.31.i.i = icmp sgt i64 %.115.i, 1152921504606846975
  br i1 %.31.i.i, label %B0.if.if, label %B0.endif.endif.endif.i.i, !prof !0

B0.endif.endif.endif.i.i:                         ; preds = %B0
  %.30.i.i = shl nuw nsw i64 %.13.i.i, 3
  %.7.i.i.i.i = tail call ptr @NRT_MemInfo_alloc_aligned(i64 %.30.i.i, i32 32), !noalias !1
  %.8.i.i.i.i = icmp eq ptr %.7.i.i.i.i, null
  br i1 %.8.i.i.i.i, label %B0.if.if, label %B362.endif.endif.i, !prof !0

B436.i:                                           ; preds = %B436.i.preheader, %B436.i
  %.315121123.i = phi i64 [ %.322.i, %B436.i ], [ %.315121123.i.ph, %B436.i.preheader ]
  %.322.i = add nuw nsw i64 %.315121123.i, 1
  %0 = shl i64 %.315121123.i, 3
  %scevgep.i = getelementptr i8, ptr %.6.i.i.i, i64 %0
  store i64 %.315121123.i, ptr %scevgep.i, align 8, !noalias !14
  %exitcond.not.i = icmp eq i64 %.115.i, %.322.i
  br i1 %exitcond.not.i, label %B90.endif.endif.us.preheader, label %B436.i, !llvm.loop !15

B362.endif.endif.i:                               ; preds = %B0.endif.endif.endif.i.i
  %.5.i.i.i = getelementptr i8, ptr %.7.i.i.i.i, i64 24
  %.6.i.i.i = load ptr, ptr %.5.i.i.i, align 8, !noalias !18
  %.309122.not.i = icmp slt i64 %.115.i, 1
  br i1 %.309122.not.i, label %B90.endif.endif.us.preheader, label %iter.check.i

iter.check.i:                                     ; preds = %B362.endif.endif.i
  %min.iters.check.i = icmp samesign ult i64 %.115.i, 4
  br i1 %min.iters.check.i, label %B436.i.preheader, label %vector.main.loop.iter.check.i

B436.i.preheader:                                 ; preds = %vec.epilog.middle.block.i, %vec.epilog.iter.check.i, %iter.check.i
  %.315121123.i.ph = phi i64 [ %n.vec13.i, %vec.epilog.middle.block.i ], [ %n.vec.i, %vec.epilog.iter.check.i ], [ 0, %iter.check.i ]
  br label %B436.i

vector.main.loop.iter.check.i:                    ; preds = %iter.check.i
  %const = bitcast i64 9223372036854775792 to i64
  %min.iters.check11.i = icmp samesign ult i64 %.115.i, 16
  br i1 %min.iters.check11.i, label %vec.epilog.ph.i, label %vector.ph.i

vector.ph.i:                                      ; preds = %vector.main.loop.iter.check.i
  %n.vec.i = and i64 %.115.i, %const
  br label %vector.body.i

vector.body.i:                                    ; preds = %vector.body.i, %vector.ph.i
  %index.i = phi i64 [ 0, %vector.ph.i ], [ %index.next.i, %vector.body.i ]
  %vec.ind.i = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph.i ], [ %vec.ind.next.i, %vector.body.i ]
  %step.add.i = add <4 x i64> %vec.ind.i, splat (i64 4)
  %step.add.2.i = add <4 x i64> %vec.ind.i, splat (i64 8)
  %step.add.3.i = add <4 x i64> %vec.ind.i, splat (i64 12)
  %sunkaddr = mul i64 %index.i, 8
  %sunkaddr58 = getelementptr i8, ptr %.6.i.i.i, i64 %sunkaddr
  store <4 x i64> %vec.ind.i, ptr %sunkaddr58, align 8, !noalias !14
  %sunkaddr59 = mul i64 %index.i, 8
  %sunkaddr60 = getelementptr i8, ptr %.6.i.i.i, i64 %sunkaddr59
  %sunkaddr61 = getelementptr i8, ptr %sunkaddr60, i64 32
  store <4 x i64> %step.add.i, ptr %sunkaddr61, align 8, !noalias !14
  %sunkaddr62 = mul i64 %index.i, 8
  %sunkaddr63 = getelementptr i8, ptr %.6.i.i.i, i64 %sunkaddr62
  %sunkaddr64 = getelementptr i8, ptr %sunkaddr63, i64 64
  store <4 x i64> %step.add.2.i, ptr %sunkaddr64, align 8, !noalias !14
  %sunkaddr65 = mul i64 %index.i, 8
  %sunkaddr66 = getelementptr i8, ptr %.6.i.i.i, i64 %sunkaddr65
  %sunkaddr67 = getelementptr i8, ptr %sunkaddr66, i64 96
  store <4 x i64> %step.add.3.i, ptr %sunkaddr67, align 8, !noalias !14
  %index.next.i = add nuw nsw i64 %index.i, 16
  %vec.ind.next.i = add <4 x i64> %vec.ind.i, splat (i64 16)
  %1 = icmp eq i64 %n.vec.i, %index.next.i
  br i1 %1, label %middle.block.i, label %vector.body.i, !llvm.loop !19

middle.block.i:                                   ; preds = %vector.body.i
  %cmp.n.i = icmp eq i64 %n.vec.i, %.115.i
  br i1 %cmp.n.i, label %B90.endif.endif.us.preheader, label %vec.epilog.iter.check.i

vec.epilog.iter.check.i:                          ; preds = %middle.block.i
  %2 = and i64 %.115.i, 12
  %min.epilog.iters.check.i = icmp eq i64 %2, 0
  br i1 %min.epilog.iters.check.i, label %B436.i.preheader, label %vec.epilog.ph.i, !prof !20

vec.epilog.ph.i:                                  ; preds = %vec.epilog.iter.check.i, %vector.main.loop.iter.check.i
  %bc.resume.val.i = phi i64 [ %n.vec.i, %vec.epilog.iter.check.i ], [ 0, %vector.main.loop.iter.check.i ]
  %const_mat = add i64 %const, 12
  %n.vec13.i = and i64 %.115.i, %const_mat
  %broadcast.splatinsert.i = insertelement <4 x i64> poison, i64 %bc.resume.val.i, i64 0
  %broadcast.splat.i = shufflevector <4 x i64> %broadcast.splatinsert.i, <4 x i64> poison, <4 x i32> zeroinitializer
  %induction.i = or disjoint <4 x i64> %broadcast.splat.i, <i64 0, i64 1, i64 2, i64 3>
  br label %vec.epilog.vector.body.i

vec.epilog.vector.body.i:                         ; preds = %vec.epilog.vector.body.i, %vec.epilog.ph.i
  %index14.i = phi i64 [ %bc.resume.val.i, %vec.epilog.ph.i ], [ %index.next16.i, %vec.epilog.vector.body.i ]
  %vec.ind15.i = phi <4 x i64> [ %induction.i, %vec.epilog.ph.i ], [ %vec.ind.next17.i, %vec.epilog.vector.body.i ]
  %3 = shl i64 %index14.i, 3
  %scevgep20.i = getelementptr i8, ptr %.6.i.i.i, i64 %3
  store <4 x i64> %vec.ind15.i, ptr %scevgep20.i, align 8, !noalias !14
  %index.next16.i = add nuw i64 %index14.i, 4
  %vec.ind.next17.i = add nuw nsw <4 x i64> %vec.ind15.i, splat (i64 4)
  %4 = icmp eq i64 %n.vec13.i, %index.next16.i
  br i1 %4, label %vec.epilog.middle.block.i, label %vec.epilog.vector.body.i, !llvm.loop !21

vec.epilog.middle.block.i:                        ; preds = %vec.epilog.vector.body.i
  %cmp.n18.i = icmp eq i64 %n.vec13.i, %.115.i
  br i1 %cmp.n18.i, label %B90.endif.endif.us.preheader, label %B436.i.preheader

common.ret:                                       ; preds = %B212.if.if, %B174.if.if, %B0.if.if, %B248
  %common.ret.op = phi i32 [ 0, %B248 ], [ 1, %B0.if.if ], [ 1, %B174.if.if ], [ %.502.us.lcssa, %B212.if.if ]
  ret i32 %common.ret.op

B248:                                             ; preds = %B116.loopexit.us.1
  store ptr %.7.i.i.i.i, ptr %retptr, align 8
  %retptr.repack210 = getelementptr inbounds nuw i8, ptr %retptr, i64 8
  store ptr null, ptr %retptr.repack210, align 8
  %retptr.repack212 = getelementptr inbounds nuw i8, ptr %retptr, i64 16
  store i64 %.13.i.i, ptr %retptr.repack212, align 8
  %retptr.repack214 = getelementptr inbounds nuw i8, ptr %retptr, i64 24
  store i64 8, ptr %retptr.repack214, align 8
  %retptr.repack216 = getelementptr inbounds nuw i8, ptr %retptr, i64 32
  store ptr %.6.i.i.i, ptr %retptr.repack216, align 8
  %retptr.repack218 = getelementptr inbounds nuw i8, ptr %retptr, i64 40
  store i64 %.13.i.i, ptr %retptr.repack218, align 8
  %retptr.repack220 = getelementptr inbounds nuw i8, ptr %retptr, i64 48
  store i64 8, ptr %retptr.repack220, align 8
  tail call void @NRT_decref(ptr %arg.all_masks.0)
  br label %common.ret

B0.if.if:                                         ; preds = %B0.endif.endif.endif.i.i, %B0
  %excinfo.1.0 = phi ptr [ @.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209, %B0.endif.endif.endif.i.i ], [ @.const.picklebuf.58e14eccb507b1e0206981740223e685cb8c3c57, %B0 ]
  store ptr %excinfo.1.0, ptr %excinfo, align 8
  br label %common.ret

B90.endif.endif.us.preheader:                     ; preds = %vec.epilog.middle.block.i, %middle.block.i, %B362.endif.endif.i, %B436.i
  %invariant.op = add nsw i64 %.13.i.i, -2
  %5 = sub i64 3, %.13.i.i
  br label %B120.endif.us

B120.endif.us:                                    ; preds = %B116.loopexit.us, %B90.endif.endif.us.preheader
  %lsr.iv49 = phi i64 [ %5, %B90.endif.endif.us.preheader ], [ %lsr.iv.next50, %B116.loopexit.us ]
  %.285233241.us = phi i64 [ 2, %B90.endif.endif.us.preheader ], [ %.292.us, %B116.loopexit.us ]
  %.292.us = add nuw nsw i64 %.285233241.us, 1
  %.411227.us.not = icmp sgt i64 %.285233241.us, %invariant.op
  br i1 %.411227.us.not, label %B116.loopexit.us, label %B174.us.preheader

B174.us.preheader:                                ; preds = %B120.endif.us
  br label %B174.us

B174.us:                                          ; preds = %B249.us, %B174.us.preheader
  %.417225228.us = phi i64 [ %.424.us, %B249.us ], [ 1, %B174.us.preheader ]
  %.424.us = add i64 %.417225228.us, 1
  store i64 0, ptr %.457, align 8
  %.467.us = call i32 @_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.457, ptr nonnull %excinfo.2, ptr %arg.all_masks.0, ptr %arg.all_masks.1, i64 %arg.all_masks.2, i64 %arg.all_masks.3, ptr %arg.all_masks.4, i64 %arg.all_masks.5.0, i64 %arg.all_masks.5.1, i64 %arg.all_masks.6.0, i64 %arg.all_masks.6.1, ptr nonnull %.7.i.i.i.i, ptr null, i64 %.13.i.i, i64 8, ptr %.6.i.i.i, i64 %.13.i.i, i64 8, i64 %.417225228.us, i64 %.285233241.us)
  %cond9 = icmp eq i32 %.467.us, 0
  br i1 %cond9, label %B174.endif.us, label %B174.if.if, !prof !22

B174.endif.us:                                    ; preds = %B174.us
  %.477.us = load i64, ptr %.457, align 8
  %.487.us = icmp sgt i64 %.477.us, 0
  br i1 %.487.us, label %B212.us, label %B249.us

B212.us:                                          ; preds = %B174.endif.us
  %.502.us = call i32 @_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.496, ptr nonnull %excinfo.3, ptr nonnull %.7.i.i.i.i, ptr null, i64 %.13.i.i, i64 8, ptr %.6.i.i.i, i64 %.13.i.i, i64 8, i64 %.417225228.us, i64 %.285233241.us)
  switch i32 %.502.us, label %B212.if.if.loopexit48 [
    i32 -2, label %B249.us
    i32 0, label %B249.us
  ], !prof !23

B249.us:                                          ; preds = %B212.us, %B212.us, %B174.endif.us
  %6 = add i64 %lsr.iv49, %.424.us
  %exitcond.not35 = icmp eq i64 %6, 1
  br i1 %exitcond.not35, label %B116.loopexit.us, label %B174.us

B116.loopexit.us:                                 ; preds = %B249.us, %B120.endif.us
  %lsr.iv.next50 = add nsw i64 %lsr.iv49, 1
  %exitcond.not = icmp eq i64 %.292.us, 100
  br i1 %exitcond.not, label %B120.endif.us.1.preheader, label %B120.endif.us

B120.endif.us.1.preheader:                        ; preds = %B116.loopexit.us
  %invariant.op39 = add nsw i64 %.13.i.i, -2
  %7 = sub i64 3, %.13.i.i
  br label %B120.endif.us.1

B120.endif.us.1:                                  ; preds = %B116.loopexit.us.1, %B120.endif.us.1.preheader
  %lsr.iv = phi i64 [ %7, %B120.endif.us.1.preheader ], [ %lsr.iv.next, %B116.loopexit.us.1 ]
  %.285233241.us.1 = phi i64 [ 2, %B120.endif.us.1.preheader ], [ %.292.us.1, %B116.loopexit.us.1 ]
  %.292.us.1 = add nuw nsw i64 %.285233241.us.1, 1
  %.411227.us.not.1 = icmp sgt i64 %.285233241.us.1, %invariant.op39
  br i1 %.411227.us.not.1, label %B116.loopexit.us.1, label %B174.us.1.preheader

B174.us.1.preheader:                              ; preds = %B120.endif.us.1
  br label %B174.us.1

B174.us.1:                                        ; preds = %B249.us.1, %B174.us.1.preheader
  %.417225228.us.1 = phi i64 [ %.424.us.1, %B249.us.1 ], [ 1, %B174.us.1.preheader ]
  %.424.us.1 = add i64 %.417225228.us.1, 1
  store i64 0, ptr %.457, align 8
  %.467.us.1 = call i32 @_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.457, ptr nonnull %excinfo.2, ptr %arg.all_masks.0, ptr %arg.all_masks.1, i64 %arg.all_masks.2, i64 %arg.all_masks.3, ptr %arg.all_masks.4, i64 %arg.all_masks.5.0, i64 %arg.all_masks.5.1, i64 %arg.all_masks.6.0, i64 %arg.all_masks.6.1, ptr nonnull %.7.i.i.i.i, ptr null, i64 %.13.i.i, i64 8, ptr %.6.i.i.i, i64 %.13.i.i, i64 8, i64 %.417225228.us.1, i64 %.285233241.us.1)
  %cond10 = icmp eq i32 %.467.us.1, 0
  br i1 %cond10, label %B174.endif.us.1, label %B174.if.if, !prof !22

B174.endif.us.1:                                  ; preds = %B174.us.1
  %.477.us.1 = load i64, ptr %.457, align 8
  %.487.us.1 = icmp sgt i64 %.477.us.1, 0
  br i1 %.487.us.1, label %B212.us.1, label %B249.us.1

B212.us.1:                                        ; preds = %B174.endif.us.1
  %.502.us.1 = call i32 @_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.496, ptr nonnull %excinfo.3, ptr nonnull %.7.i.i.i.i, ptr null, i64 %.13.i.i, i64 8, ptr %.6.i.i.i, i64 %.13.i.i, i64 8, i64 %.417225228.us.1, i64 %.285233241.us.1)
  switch i32 %.502.us.1, label %B212.if.if.loopexit [
    i32 -2, label %B249.us.1
    i32 0, label %B249.us.1
  ], !prof !23

B249.us.1:                                        ; preds = %B212.us.1, %B212.us.1, %B174.endif.us.1
  %8 = add i64 %lsr.iv, %.424.us.1
  %exitcond34.not = icmp eq i64 %8, 1
  br i1 %exitcond34.not, label %B116.loopexit.us.1, label %B174.us.1

B116.loopexit.us.1:                               ; preds = %B249.us.1, %B120.endif.us.1
  %lsr.iv.next = add nsw i64 %lsr.iv, 1
  %exitcond.1.not = icmp eq i64 %.292.us.1, 100
  br i1 %exitcond.1.not, label %B248, label %B120.endif.us.1

B174.if.if:                                       ; preds = %B174.us.1, %B174.us
  %.468 = load ptr, ptr %excinfo.2, align 8
  store ptr %.468, ptr %excinfo, align 8
  br label %common.ret

B212.if.if.loopexit:                              ; preds = %B212.us.1
  br label %B212.if.if

B212.if.if.loopexit48:                            ; preds = %B212.us
  br label %B212.if.if

B212.if.if:                                       ; preds = %B212.if.if.loopexit48, %B212.if.if.loopexit
  %.502.us.lcssa = phi i32 [ %.502.us.1, %B212.if.if.loopexit ], [ %.502.us, %B212.if.if.loopexit48 ]
  store ptr null, ptr %excinfo, align 8
  br label %common.ret
}
