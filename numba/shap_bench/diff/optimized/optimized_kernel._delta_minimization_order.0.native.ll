define range(i32 -1, -2) i32 @_ZN16optimized_kernel25_delta_minimization_orderB3v15B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE26omitted_28default_3d100_2924omitted_28default_3d2_29(ptr noalias writeonly captures(none) %retptr, ptr noalias writeonly captures(none) %excinfo, ptr %arg.all_masks.0, ptr readnone captures(none) %arg.all_masks.1, i64 %arg.all_masks.2, i64 %arg.all_masks.3, ptr readonly captures(none) %arg.all_masks.4, i64 %arg.all_masks.5.0, i64 %arg.all_masks.5.1, i64 %arg.all_masks.6.0, i64 %arg.all_masks.6.1) local_unnamed_addr {
B0:
  %.496 = alloca ptr, align 8
  %excinfo.3 = alloca ptr, align 8
  %arg.all_masks.5.1.fr = freeze i64 %arg.all_masks.5.1
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
  %const = bitcast i64 9223372036854775792 to i64
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
  %sunkaddr196 = getelementptr i8, ptr %.6.i.i.i, i64 %sunkaddr
  store <4 x i64> %vec.ind.i, ptr %sunkaddr196, align 8, !noalias !14
  %sunkaddr197 = mul i64 %index.i, 8
  %sunkaddr198 = getelementptr i8, ptr %.6.i.i.i, i64 %sunkaddr197
  %sunkaddr199 = getelementptr i8, ptr %sunkaddr198, i64 32
  store <4 x i64> %step.add.i, ptr %sunkaddr199, align 8, !noalias !14
  %sunkaddr200 = mul i64 %index.i, 8
  %sunkaddr201 = getelementptr i8, ptr %.6.i.i.i, i64 %sunkaddr200
  %sunkaddr202 = getelementptr i8, ptr %sunkaddr201, i64 64
  store <4 x i64> %step.add.2.i, ptr %sunkaddr202, align 8, !noalias !14
  %sunkaddr203 = mul i64 %index.i, 8
  %sunkaddr204 = getelementptr i8, ptr %.6.i.i.i, i64 %sunkaddr203
  %sunkaddr205 = getelementptr i8, ptr %sunkaddr204, i64 96
  store <4 x i64> %step.add.3.i, ptr %sunkaddr205, align 8, !noalias !14
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
  %const_mat189 = add i64 %const, 12
  %n.vec13.i = and i64 %.115.i, %const_mat189
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

common.ret:                                       ; preds = %B212.if.if, %B0.if.if, %B248
  %common.ret.op = phi i32 [ 0, %B248 ], [ 1, %B0.if.if ], [ %.502.us.lcssa, %B212.if.if ]
  ret i32 %common.ret.op

B248:                                             ; preds = %B116.loopexit.us.1, %B90.endif.endif.us.preheader
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
  %.272229.not.i = icmp slt i64 %arg.all_masks.5.1.fr, 1
  %const_mat = add i64 %const, 8
  %n.vec.i11 = and i64 %arg.all_masks.5.1.fr, %const_mat
  br i1 %.272229.not.i, label %B248, label %B120.endif.us.preheader

B120.endif.us.preheader:                          ; preds = %B90.endif.endif.us.preheader
  %5 = add nsw i64 %.13.i.i, -2
  %invariant.op = add nsw i64 %.13.i.i, -2
  br label %B120.endif.us

B120.endif.us:                                    ; preds = %B116.loopexit.us, %B120.endif.us.preheader
  %indvars.iv = phi i64 [ %5, %B120.endif.us.preheader ], [ %indvars.iv.next, %B116.loopexit.us ]
  %.285233241.us = phi i64 [ 2, %B120.endif.us.preheader ], [ %.292.us, %B116.loopexit.us ]
  %.292.us = add nuw nsw i64 %.285233241.us, 1
  %.411227.us.not = icmp sgt i64 %.285233241.us, %invariant.op
  br i1 %.411227.us.not, label %B116.loopexit.us, label %B174.us.preheader

B174.us.preheader:                                ; preds = %B120.endif.us
  br label %B174.us

B174.us:                                          ; preds = %B249.us, %B174.us.preheader
  %.417225228.us = phi i64 [ %.424.us, %B249.us ], [ 1, %B174.us.preheader ]
  %6 = icmp ult i64 %arg.all_masks.5.1.fr, 8
  %.424.us = add i64 %.417225228.us, 1
  %.103.i = add nsw i64 %.417225228.us, %.285233241.us
  %7 = getelementptr i64, ptr %.6.i.i.i, i64 %.103.i
  %.150.i = icmp slt i64 %.103.i, 0
  %.151.i = select i1 %.150.i, i64 %.13.i.i, i64 0
  %.165.i = getelementptr i64, ptr %7, i64 %.151.i
  %.166.i = load i64, ptr %.165.i, align 8, !noalias !22
  %8 = getelementptr i8, ptr %7, i64 -8
  %.117.inv.i = icmp sgt i64 %.103.i, 0
  %.118.i = select i1 %.117.inv.i, i64 0, i64 %.13.i.i
  %.132.i = getelementptr i64, ptr %8, i64 %.118.i
  %.133.i = load i64, ptr %.132.i, align 8, !noalias !22
  %9 = getelementptr i64, ptr %.6.i.i.i, i64 %.417225228.us
  %.83.i = icmp slt i64 %.417225228.us, 0
  %.84.i = select i1 %.83.i, i64 %.13.i.i, i64 0
  %.98.i = getelementptr i64, ptr %9, i64 %.84.i
  %.99.i = load i64, ptr %.98.i, align 8, !noalias !22
  %10 = getelementptr i8, ptr %9, i64 -8
  %.51.inv.i = icmp sgt i64 %.417225228.us, 0
  %.52.i = select i1 %.51.inv.i, i64 0, i64 %.13.i.i
  %.66.i = getelementptr i64, ptr %10, i64 %.52.i
  %.67.i = load i64, ptr %.66.i, align 8, !noalias !22
  %.335.i = icmp slt i64 %.67.i, 0
  %.336.i = select i1 %.335.i, i64 %arg.all_masks.5.0, i64 0
  %.337.i = add i64 %.336.i, %.67.i
  %.357.i = mul i64 %.337.i, %arg.all_masks.5.1.fr
  %11 = getelementptr i8, ptr %arg.all_masks.4, i64 %.357.i
  %.399.i = icmp slt i64 %.99.i, 0
  %.400.i = select i1 %.399.i, i64 %arg.all_masks.5.0, i64 0
  %.401.i = add i64 %.400.i, %.99.i
  %.421.i = mul i64 %.401.i, %arg.all_masks.5.1.fr
  %12 = getelementptr i8, ptr %arg.all_masks.4, i64 %.421.i
  %.463.i = icmp slt i64 %.133.i, 0
  %.464.i = select i1 %.463.i, i64 %arg.all_masks.5.0, i64 0
  %.465.i = add i64 %.464.i, %.133.i
  %.485.i = mul i64 %.465.i, %arg.all_masks.5.1.fr
  %13 = getelementptr i8, ptr %arg.all_masks.4, i64 %.485.i
  %.527.i = icmp slt i64 %.166.i, 0
  %.528.i = select i1 %.527.i, i64 %arg.all_masks.5.0, i64 0
  %.529.i = add i64 %.528.i, %.166.i
  %.549.i = mul i64 %.529.i, %arg.all_masks.5.1.fr
  %14 = getelementptr i8, ptr %arg.all_masks.4, i64 %.549.i
  br i1 %6, label %B124.endif.endif.endif.endif.endif.endif.endif.endif.i.preheader, label %vector.ph.i10

vector.ph.i10:                                    ; preds = %B174.us
  br label %vector.body.i13

vector.body.i13:                                  ; preds = %vector.body.i13, %vector.ph.i10
  %index.i14 = phi i64 [ 0, %vector.ph.i10 ], [ %index.next.i15, %vector.body.i13 ]
  %vec.phi.i = phi <4 x i64> [ zeroinitializer, %vector.ph.i10 ], [ %45, %vector.body.i13 ]
  %vec.phi15.i = phi <4 x i64> [ zeroinitializer, %vector.ph.i10 ], [ %46, %vector.body.i13 ]
  %sunkaddr206 = getelementptr i8, ptr %11, i64 %index.i14
  %wide.load.i = load <4 x i8>, ptr %sunkaddr206, align 1, !noalias !22
  %sunkaddr207 = getelementptr i8, ptr %11, i64 %index.i14
  %sunkaddr208 = getelementptr i8, ptr %sunkaddr207, i64 4
  %wide.load16.i = load <4 x i8>, ptr %sunkaddr208, align 1, !noalias !22
  %15 = icmp ne <4 x i8> %wide.load.i, zeroinitializer
  %16 = icmp ne <4 x i8> %wide.load16.i, zeroinitializer
  %sunkaddr209 = getelementptr i8, ptr %12, i64 %index.i14
  %wide.load17.i = load <4 x i8>, ptr %sunkaddr209, align 1, !noalias !22
  %sunkaddr210 = getelementptr i8, ptr %12, i64 %index.i14
  %sunkaddr211 = getelementptr i8, ptr %sunkaddr210, i64 4
  %wide.load18.i = load <4 x i8>, ptr %sunkaddr211, align 1, !noalias !22
  %17 = icmp ne <4 x i8> %wide.load17.i, zeroinitializer
  %18 = icmp ne <4 x i8> %wide.load18.i, zeroinitializer
  %sunkaddr212 = getelementptr i8, ptr %13, i64 %index.i14
  %wide.load19.i = load <4 x i8>, ptr %sunkaddr212, align 1, !noalias !22
  %sunkaddr213 = getelementptr i8, ptr %13, i64 %index.i14
  %sunkaddr214 = getelementptr i8, ptr %sunkaddr213, i64 4
  %wide.load20.i = load <4 x i8>, ptr %sunkaddr214, align 1, !noalias !22
  %19 = icmp ne <4 x i8> %wide.load19.i, zeroinitializer
  %20 = icmp ne <4 x i8> %wide.load20.i, zeroinitializer
  %sunkaddr215 = getelementptr i8, ptr %14, i64 %index.i14
  %wide.load21.i = load <4 x i8>, ptr %sunkaddr215, align 1, !noalias !22
  %sunkaddr216 = getelementptr i8, ptr %14, i64 %index.i14
  %sunkaddr217 = getelementptr i8, ptr %sunkaddr216, i64 4
  %wide.load22.i = load <4 x i8>, ptr %sunkaddr217, align 1, !noalias !22
  %21 = icmp ne <4 x i8> %wide.load21.i, zeroinitializer
  %22 = icmp ne <4 x i8> %wide.load22.i, zeroinitializer
  %23 = xor <4 x i1> %15, %17
  %24 = xor <4 x i1> %16, %18
  %25 = zext <4 x i1> %23 to <4 x i64>
  %26 = zext <4 x i1> %24 to <4 x i64>
  %27 = xor <4 x i1> %19, %21
  %28 = xor <4 x i1> %20, %22
  %29 = zext <4 x i1> %27 to <4 x i64>
  %30 = zext <4 x i1> %28 to <4 x i64>
  %31 = xor <4 x i1> %15, %19
  %32 = xor <4 x i1> %16, %20
  %33 = sext <4 x i1> %31 to <4 x i64>
  %34 = sext <4 x i1> %32 to <4 x i64>
  %35 = xor <4 x i1> %17, %21
  %36 = xor <4 x i1> %18, %22
  %37 = sext <4 x i1> %35 to <4 x i64>
  %38 = sext <4 x i1> %36 to <4 x i64>
  %39 = add <4 x i64> %vec.phi.i, %25
  %40 = add <4 x i64> %vec.phi15.i, %26
  %41 = add <4 x i64> %39, %33
  %42 = add <4 x i64> %40, %34
  %43 = add <4 x i64> %41, %37
  %44 = add <4 x i64> %42, %38
  %45 = add <4 x i64> %43, %29
  %46 = add <4 x i64> %44, %30
  %index.next.i15 = add nuw nsw i64 %index.i14, 8
  %47 = icmp eq i64 %n.vec.i11, %index.next.i15
  br i1 %47, label %middle.block.i16, label %vector.body.i13, !llvm.loop !25

middle.block.i16:                                 ; preds = %vector.body.i13
  %48 = icmp eq i64 %arg.all_masks.5.1.fr, %n.vec.i11
  %bin.rdx.i = add <4 x i64> %46, %45
  %rdx.shuf = shufflevector <4 x i64> %bin.rdx.i, <4 x i64> poison, <4 x i32> <i32 2, i32 3, i32 poison, i32 poison>
  %bin.rdx = add <4 x i64> %bin.rdx.i, %rdx.shuf
  %rdx.shuf190 = shufflevector <4 x i64> %bin.rdx, <4 x i64> poison, <4 x i32> <i32 1, i32 poison, i32 poison, i32 poison>
  %bin.rdx191 = add <4 x i64> %bin.rdx, %rdx.shuf190
  %49 = extractelement <4 x i64> %bin.rdx191, i32 0
  br i1 %48, label %B174.endif.us, label %B124.endif.endif.endif.endif.endif.endif.endif.endif.i.preheader

B124.endif.endif.endif.endif.endif.endif.endif.endif.i.preheader: ; preds = %middle.block.i16, %B174.us
  %gain.2.0232.i.ph = phi i64 [ %49, %middle.block.i16 ], [ 0, %B174.us ]
  %.278225230.i.ph = phi i64 [ %n.vec.i11, %middle.block.i16 ], [ 0, %B174.us ]
  br label %B124.endif.endif.endif.endif.endif.endif.endif.endif.i

B124.endif.endif.endif.endif.endif.endif.endif.endif.i: ; preds = %B124.endif.endif.endif.endif.endif.endif.endif.endif.i, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i.preheader
  %gain.2.0232.i = phi i64 [ %.674.i, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i ], [ %gain.2.0232.i.ph, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i.preheader ]
  %.278225230.i = phi i64 [ %.285.i, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i ], [ %.278225230.i.ph, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i.preheader ]
  %.285.i = add nuw nsw i64 %.278225230.i, 1
  %.361.i = getelementptr i8, ptr %11, i64 %.278225230.i
  %.362.i = load i8, ptr %.361.i, align 1, !noalias !22
  %.365.i = icmp ne i8 %.362.i, 0
  %.425.i = getelementptr i8, ptr %12, i64 %.278225230.i
  %.426.i = load i8, ptr %.425.i, align 1, !noalias !22
  %.429.i = icmp ne i8 %.426.i, 0
  %.489.i = getelementptr i8, ptr %13, i64 %.278225230.i
  %.490.i = load i8, ptr %.489.i, align 1, !noalias !22
  %.493.i = icmp ne i8 %.490.i, 0
  %.553.i = getelementptr i8, ptr %14, i64 %.278225230.i
  %.554.i = load i8, ptr %.553.i, align 1, !noalias !22
  %.557.i = icmp ne i8 %.554.i, 0
  %.566.i = xor i1 %.365.i, %.429.i
  %.15.i.i = zext i1 %.566.i to i64
  %.592.i = xor i1 %.493.i, %.557.i
  %.15.i11.i = zext i1 %.592.i to i64
  %.619.i = xor i1 %.365.i, %.493.i
  %.15.i12.neg.i = sext i1 %.619.i to i64
  %.646.i = xor i1 %.429.i, %.557.i
  %.15.i13.neg.i = sext i1 %.646.i to i64
  %.neg.i = add i64 %gain.2.0232.i, %.15.i.i
  %.618.i = add i64 %.neg.i, %.15.i12.neg.i
  %.neg14.i = add i64 %.618.i, %.15.i13.neg.i
  %.674.i = add i64 %.neg14.i, %.15.i11.i
  %exitcond.not.i18 = icmp eq i64 %arg.all_masks.5.1.fr, %.285.i
  br i1 %exitcond.not.i18, label %B174.endif.us, label %B124.endif.endif.endif.endif.endif.endif.endif.endif.i, !llvm.loop !26

B174.endif.us:                                    ; preds = %B124.endif.endif.endif.endif.endif.endif.endif.endif.i, %middle.block.i16
  %gain.2.0.lcssa.i = phi i64 [ %49, %middle.block.i16 ], [ %.674.i, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i ]
  %.487.us = icmp sgt i64 %gain.2.0.lcssa.i, 0
  br i1 %.487.us, label %B212.us, label %B249.us

B212.us:                                          ; preds = %B174.endif.us
  %.502.us = call i32 @_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.496, ptr nonnull %excinfo.3, ptr nonnull %.7.i.i.i.i, ptr null, i64 %.13.i.i, i64 8, ptr nonnull %.6.i.i.i, i64 %.13.i.i, i64 8, i64 %.417225228.us, i64 %.285233241.us)
  switch i32 %.502.us, label %B212.if.if.loopexit181 [
    i32 -2, label %B249.us
    i32 0, label %B249.us
  ], !prof !27

B249.us:                                          ; preds = %B212.us, %B212.us, %B174.endif.us
  %exitcond.not160 = icmp eq i64 %.424.us, %indvars.iv
  br i1 %exitcond.not160, label %B116.loopexit.us, label %B174.us

B116.loopexit.us:                                 ; preds = %B249.us, %B120.endif.us
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %exitcond.not = icmp eq i64 %.292.us, 100
  br i1 %exitcond.not, label %B120.endif.us.1.preheader149, label %B120.endif.us

B120.endif.us.1.preheader149:                     ; preds = %B116.loopexit.us
  %50 = add nsw i64 %.13.i.i, -2
  %invariant.op166 = add nsw i64 %.13.i.i, -2
  br label %B120.endif.us.1

B120.endif.us.1:                                  ; preds = %B116.loopexit.us.1, %B120.endif.us.1.preheader149
  %indvars.iv157 = phi i64 [ %50, %B120.endif.us.1.preheader149 ], [ %indvars.iv.next158, %B116.loopexit.us.1 ]
  %.285233241.us.1 = phi i64 [ 2, %B120.endif.us.1.preheader149 ], [ %.292.us.1, %B116.loopexit.us.1 ]
  %.292.us.1 = add nuw nsw i64 %.285233241.us.1, 1
  %.411227.us.not.1 = icmp sgt i64 %.285233241.us.1, %invariant.op166
  br i1 %.411227.us.not.1, label %B116.loopexit.us.1, label %B174.us.1.preheader

B174.us.1.preheader:                              ; preds = %B120.endif.us.1
  br label %B174.us.1

B174.us.1:                                        ; preds = %B249.us.1, %B174.us.1.preheader
  %.417225228.us.1 = phi i64 [ %.424.us.1, %B249.us.1 ], [ 1, %B174.us.1.preheader ]
  %51 = icmp ult i64 %arg.all_masks.5.1.fr, 8
  %.424.us.1 = add i64 %.417225228.us.1, 1
  %.103.i21 = add nsw i64 %.417225228.us.1, %.285233241.us.1
  %52 = getelementptr i64, ptr %.6.i.i.i, i64 %.103.i21
  %.150.i22 = icmp slt i64 %.103.i21, 0
  %.151.i23 = select i1 %.150.i22, i64 %.13.i.i, i64 0
  %.165.i24 = getelementptr i64, ptr %52, i64 %.151.i23
  %.166.i25 = load i64, ptr %.165.i24, align 8, !noalias !28
  %53 = getelementptr i8, ptr %52, i64 -8
  %.117.inv.i26 = icmp sgt i64 %.103.i21, 0
  %.118.i27 = select i1 %.117.inv.i26, i64 0, i64 %.13.i.i
  %.132.i28 = getelementptr i64, ptr %53, i64 %.118.i27
  %.133.i29 = load i64, ptr %.132.i28, align 8, !noalias !28
  %54 = getelementptr i64, ptr %.6.i.i.i, i64 %.417225228.us.1
  %.83.i30 = icmp slt i64 %.417225228.us.1, 0
  %.84.i31 = select i1 %.83.i30, i64 %.13.i.i, i64 0
  %.98.i32 = getelementptr i64, ptr %54, i64 %.84.i31
  %.99.i33 = load i64, ptr %.98.i32, align 8, !noalias !28
  %55 = getelementptr i8, ptr %54, i64 -8
  %.51.inv.i34 = icmp sgt i64 %.417225228.us.1, 0
  %.52.i35 = select i1 %.51.inv.i34, i64 0, i64 %.13.i.i
  %.66.i36 = getelementptr i64, ptr %55, i64 %.52.i35
  %.67.i37 = load i64, ptr %.66.i36, align 8, !noalias !28
  %.335.i38 = icmp slt i64 %.67.i37, 0
  %.336.i39 = select i1 %.335.i38, i64 %arg.all_masks.5.0, i64 0
  %.337.i40 = add i64 %.336.i39, %.67.i37
  %.357.i41 = mul i64 %.337.i40, %arg.all_masks.5.1.fr
  %56 = getelementptr i8, ptr %arg.all_masks.4, i64 %.357.i41
  %.399.i42 = icmp slt i64 %.99.i33, 0
  %.400.i43 = select i1 %.399.i42, i64 %arg.all_masks.5.0, i64 0
  %.401.i44 = add i64 %.400.i43, %.99.i33
  %.421.i45 = mul i64 %.401.i44, %arg.all_masks.5.1.fr
  %57 = getelementptr i8, ptr %arg.all_masks.4, i64 %.421.i45
  %.463.i46 = icmp slt i64 %.133.i29, 0
  %.464.i47 = select i1 %.463.i46, i64 %arg.all_masks.5.0, i64 0
  %.465.i48 = add i64 %.464.i47, %.133.i29
  %.485.i49 = mul i64 %.465.i48, %arg.all_masks.5.1.fr
  %58 = getelementptr i8, ptr %arg.all_masks.4, i64 %.485.i49
  %.527.i50 = icmp slt i64 %.166.i25, 0
  %.528.i51 = select i1 %.527.i50, i64 %arg.all_masks.5.0, i64 0
  %.529.i52 = add i64 %.528.i51, %.166.i25
  %.549.i53 = mul i64 %.529.i52, %arg.all_masks.5.1.fr
  %59 = getelementptr i8, ptr %arg.all_masks.4, i64 %.549.i53
  br i1 %51, label %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92.preheader, label %vector.ph.i55

vector.ph.i55:                                    ; preds = %B174.us.1
  br label %vector.body.i61

vector.body.i61:                                  ; preds = %vector.body.i61, %vector.ph.i55
  %index.i62 = phi i64 [ 0, %vector.ph.i55 ], [ %index.next.i81, %vector.body.i61 ]
  %vec.phi.i63 = phi <4 x i64> [ zeroinitializer, %vector.ph.i55 ], [ %90, %vector.body.i61 ]
  %vec.phi15.i64 = phi <4 x i64> [ zeroinitializer, %vector.ph.i55 ], [ %91, %vector.body.i61 ]
  %sunkaddr218 = getelementptr i8, ptr %56, i64 %index.i62
  %wide.load.i67 = load <4 x i8>, ptr %sunkaddr218, align 1, !noalias !28
  %sunkaddr219 = getelementptr i8, ptr %56, i64 %index.i62
  %sunkaddr220 = getelementptr i8, ptr %sunkaddr219, i64 4
  %wide.load16.i68 = load <4 x i8>, ptr %sunkaddr220, align 1, !noalias !28
  %60 = icmp ne <4 x i8> %wide.load.i67, zeroinitializer
  %61 = icmp ne <4 x i8> %wide.load16.i68, zeroinitializer
  %sunkaddr221 = getelementptr i8, ptr %57, i64 %index.i62
  %wide.load17.i71 = load <4 x i8>, ptr %sunkaddr221, align 1, !noalias !28
  %sunkaddr222 = getelementptr i8, ptr %57, i64 %index.i62
  %sunkaddr223 = getelementptr i8, ptr %sunkaddr222, i64 4
  %wide.load18.i72 = load <4 x i8>, ptr %sunkaddr223, align 1, !noalias !28
  %62 = icmp ne <4 x i8> %wide.load17.i71, zeroinitializer
  %63 = icmp ne <4 x i8> %wide.load18.i72, zeroinitializer
  %sunkaddr224 = getelementptr i8, ptr %58, i64 %index.i62
  %wide.load19.i75 = load <4 x i8>, ptr %sunkaddr224, align 1, !noalias !28
  %sunkaddr225 = getelementptr i8, ptr %58, i64 %index.i62
  %sunkaddr226 = getelementptr i8, ptr %sunkaddr225, i64 4
  %wide.load20.i76 = load <4 x i8>, ptr %sunkaddr226, align 1, !noalias !28
  %64 = icmp ne <4 x i8> %wide.load19.i75, zeroinitializer
  %65 = icmp ne <4 x i8> %wide.load20.i76, zeroinitializer
  %sunkaddr227 = getelementptr i8, ptr %59, i64 %index.i62
  %wide.load21.i79 = load <4 x i8>, ptr %sunkaddr227, align 1, !noalias !28
  %sunkaddr228 = getelementptr i8, ptr %59, i64 %index.i62
  %sunkaddr229 = getelementptr i8, ptr %sunkaddr228, i64 4
  %wide.load22.i80 = load <4 x i8>, ptr %sunkaddr229, align 1, !noalias !28
  %66 = icmp ne <4 x i8> %wide.load21.i79, zeroinitializer
  %67 = icmp ne <4 x i8> %wide.load22.i80, zeroinitializer
  %68 = xor <4 x i1> %60, %62
  %69 = xor <4 x i1> %61, %63
  %70 = zext <4 x i1> %68 to <4 x i64>
  %71 = zext <4 x i1> %69 to <4 x i64>
  %72 = xor <4 x i1> %64, %66
  %73 = xor <4 x i1> %65, %67
  %74 = zext <4 x i1> %72 to <4 x i64>
  %75 = zext <4 x i1> %73 to <4 x i64>
  %76 = xor <4 x i1> %60, %64
  %77 = xor <4 x i1> %61, %65
  %78 = sext <4 x i1> %76 to <4 x i64>
  %79 = sext <4 x i1> %77 to <4 x i64>
  %80 = xor <4 x i1> %62, %66
  %81 = xor <4 x i1> %63, %67
  %82 = sext <4 x i1> %80 to <4 x i64>
  %83 = sext <4 x i1> %81 to <4 x i64>
  %84 = add <4 x i64> %vec.phi.i63, %70
  %85 = add <4 x i64> %vec.phi15.i64, %71
  %86 = add <4 x i64> %84, %78
  %87 = add <4 x i64> %85, %79
  %88 = add <4 x i64> %86, %82
  %89 = add <4 x i64> %87, %83
  %90 = add <4 x i64> %88, %74
  %91 = add <4 x i64> %89, %75
  %index.next.i81 = add nuw nsw i64 %index.i62, 8
  %92 = icmp eq i64 %n.vec.i11, %index.next.i81
  br i1 %92, label %middle.block.i82, label %vector.body.i61, !llvm.loop !25

middle.block.i82:                                 ; preds = %vector.body.i61
  %93 = icmp eq i64 %arg.all_masks.5.1.fr, %n.vec.i11
  %bin.rdx.i83 = add <4 x i64> %91, %90
  %rdx.shuf192 = shufflevector <4 x i64> %bin.rdx.i83, <4 x i64> poison, <4 x i32> <i32 2, i32 3, i32 poison, i32 poison>
  %bin.rdx193 = add <4 x i64> %bin.rdx.i83, %rdx.shuf192
  %rdx.shuf194 = shufflevector <4 x i64> %bin.rdx193, <4 x i64> poison, <4 x i32> <i32 1, i32 poison, i32 poison, i32 poison>
  %bin.rdx195 = add <4 x i64> %bin.rdx193, %rdx.shuf194
  %94 = extractelement <4 x i64> %bin.rdx195, i32 0
  br i1 %93, label %B174.endif.us.1, label %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92.preheader

B124.endif.endif.endif.endif.endif.endif.endif.endif.i92.preheader: ; preds = %middle.block.i82, %B174.us.1
  %gain.2.0232.i93.ph = phi i64 [ %94, %middle.block.i82 ], [ 0, %B174.us.1 ]
  %.278225230.i94.ph = phi i64 [ %n.vec.i11, %middle.block.i82 ], [ 0, %B174.us.1 ]
  br label %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92

B124.endif.endif.endif.endif.endif.endif.endif.endif.i92: ; preds = %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92.preheader
  %gain.2.0232.i93 = phi i64 [ %.674.i119, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92 ], [ %gain.2.0232.i93.ph, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92.preheader ]
  %.278225230.i94 = phi i64 [ %.285.i95, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92 ], [ %.278225230.i94.ph, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92.preheader ]
  %.285.i95 = add nuw nsw i64 %.278225230.i94, 1
  %.361.i96 = getelementptr i8, ptr %56, i64 %.278225230.i94
  %.362.i97 = load i8, ptr %.361.i96, align 1, !noalias !28
  %.365.i98 = icmp ne i8 %.362.i97, 0
  %.425.i99 = getelementptr i8, ptr %57, i64 %.278225230.i94
  %.426.i100 = load i8, ptr %.425.i99, align 1, !noalias !28
  %.429.i101 = icmp ne i8 %.426.i100, 0
  %.489.i102 = getelementptr i8, ptr %58, i64 %.278225230.i94
  %.490.i103 = load i8, ptr %.489.i102, align 1, !noalias !28
  %.493.i104 = icmp ne i8 %.490.i103, 0
  %.553.i105 = getelementptr i8, ptr %59, i64 %.278225230.i94
  %.554.i106 = load i8, ptr %.553.i105, align 1, !noalias !28
  %.557.i107 = icmp ne i8 %.554.i106, 0
  %.566.i108 = xor i1 %.365.i98, %.429.i101
  %.15.i.i109 = zext i1 %.566.i108 to i64
  %.592.i110 = xor i1 %.493.i104, %.557.i107
  %.15.i11.i111 = zext i1 %.592.i110 to i64
  %.619.i112 = xor i1 %.365.i98, %.493.i104
  %.15.i12.neg.i113 = sext i1 %.619.i112 to i64
  %.646.i114 = xor i1 %.429.i101, %.557.i107
  %.15.i13.neg.i115 = sext i1 %.646.i114 to i64
  %.neg.i116 = add i64 %gain.2.0232.i93, %.15.i.i109
  %.618.i117 = add i64 %.neg.i116, %.15.i12.neg.i113
  %.neg14.i118 = add i64 %.618.i117, %.15.i13.neg.i115
  %.674.i119 = add i64 %.neg14.i118, %.15.i11.i111
  %exitcond.not.i120 = icmp eq i64 %arg.all_masks.5.1.fr, %.285.i95
  br i1 %exitcond.not.i120, label %B174.endif.us.1, label %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92, !llvm.loop !26

B174.endif.us.1:                                  ; preds = %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92, %middle.block.i82
  %gain.2.0.lcssa.i121 = phi i64 [ %94, %middle.block.i82 ], [ %.674.i119, %B124.endif.endif.endif.endif.endif.endif.endif.endif.i92 ]
  %.487.us.1 = icmp sgt i64 %gain.2.0.lcssa.i121, 0
  br i1 %.487.us.1, label %B212.us.1, label %B249.us.1

B212.us.1:                                        ; preds = %B174.endif.us.1
  %.502.us.1 = call i32 @_ZN16optimized_kernel15_reverse_windowB3v18B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx(ptr nonnull %.496, ptr nonnull %excinfo.3, ptr nonnull %.7.i.i.i.i, ptr null, i64 %.13.i.i, i64 8, ptr nonnull %.6.i.i.i, i64 %.13.i.i, i64 8, i64 %.417225228.us.1, i64 %.285233241.us.1)
  switch i32 %.502.us.1, label %B212.if.if.loopexit [
    i32 -2, label %B249.us.1
    i32 0, label %B249.us.1
  ], !prof !27

B249.us.1:                                        ; preds = %B212.us.1, %B212.us.1, %B174.endif.us.1
  %exitcond159.not = icmp eq i64 %.424.us.1, %indvars.iv157
  br i1 %exitcond159.not, label %B116.loopexit.us.1, label %B174.us.1

B116.loopexit.us.1:                               ; preds = %B249.us.1, %B120.endif.us.1
  %indvars.iv.next158 = add nsw i64 %indvars.iv157, -1
  %exitcond.1.not = icmp eq i64 %.292.us.1, 100
  br i1 %exitcond.1.not, label %B248, label %B120.endif.us.1

B212.if.if.loopexit:                              ; preds = %B212.us.1
  br label %B212.if.if

B212.if.if.loopexit181:                           ; preds = %B212.us
  br label %B212.if.if

B212.if.if:                                       ; preds = %B212.if.if.loopexit181, %B212.if.if.loopexit
  %.502.us.lcssa = phi i32 [ %.502.us.1, %B212.if.if.loopexit ], [ %.502.us, %B212.if.if.loopexit181 ]
  store ptr null, ptr %excinfo, align 8
  br label %common.ret
}
