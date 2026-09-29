; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define noundef i32 @_ZN15original_kernel15_reverse_windowB3v14B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIxLi1E1C7mutable7alignedExx(ptr noalias writeonly captures(none) %retptr, ptr noalias readnone captures(none) %excinfo, ptr readnone captures(none) %arg.order.0, ptr readnone captures(none) %arg.order.1, i64 %arg.order.2, i64 %arg.order.3, ptr captures(none) %arg.order.4, i64 %arg.order.5.0, i64 %arg.order.6.0, i64 %arg.start, i64 %arg.length) local_unnamed_addr #0 {
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
