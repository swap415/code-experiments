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

B124.endif.endif.endif.endif.endif.endif.endif.endif.preheader: ; preds = %middle.block, %B124.lr.ph
  %gain.2.0232.ph = phi i64 [ 0, %B124.lr.ph ], [ %45, %middle.block ]
  %.278225230.ph = phi i64 [ 0, %B124.lr.ph ], [ %n.vec, %middle.block ]
  br label %B124.endif.endif.endif.endif.endif.endif.endif.endif

common.ret:                                       ; preds = %B124.endif.endif.endif.endif.endif.endif.endif.endif, %middle.block, %B0.endif
  %gain.2.0.lcssa = phi i64 [ 0, %B0.endif ], [ %45, %middle.block ], [ %.674, %B124.endif.endif.endif.endif.endif.endif.endif.endif ]
  store i64 %gain.2.0.lcssa, ptr %retptr, align 8
  ret i32 0

B124.endif.endif.endif.endif.endif.endif.endif.endif: ; preds = %B124.endif.endif.endif.endif.endif.endif.endif.endif, %B124.endif.endif.endif.endif.endif.endif.endif.endif.preheader
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
