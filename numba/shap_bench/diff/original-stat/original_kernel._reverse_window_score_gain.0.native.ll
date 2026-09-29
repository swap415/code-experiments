define range(i32 0, 2) i32 @_ZN15original_kernel26_reverse_window_score_gainB2v8B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi2E1C7mutable7alignedE5ArrayIxLi1E1C7mutable7alignedExx(ptr noalias writeonly captures(none) %retptr, ptr noalias writeonly captures(none) %excinfo, ptr %arg.masks.0, ptr readnone captures(none) %arg.masks.1, i64 %arg.masks.2, i64 %arg.masks.3, ptr readonly captures(none) %arg.masks.4, i64 %arg.masks.5.0, i64 %arg.masks.5.1, i64 %arg.masks.6.0, i64 %arg.masks.6.1, ptr %arg.order.0, ptr readnone captures(none) %arg.order.1, i64 %arg.order.2, i64 %arg.order.3, ptr readonly captures(none) %arg.order.4, i64 %arg.order.5.0, i64 %arg.order.6.0, i64 %arg.start, i64 %arg.length) local_unnamed_addr {
B0:
  %.236 = alloca i64, align 8
  %excinfo.1 = alloca ptr, align 8
  store ptr null, ptr %excinfo.1, align 8
  %.474 = alloca i64, align 8
  %excinfo.2 = alloca ptr, align 8
  store ptr null, ptr %excinfo.2, align 8
  %.711 = alloca i64, align 8
  %excinfo.3 = alloca ptr, align 8
  store ptr null, ptr %excinfo.3, align 8
  %.953 = alloca i64, align 8
  %excinfo.4 = alloca ptr, align 8
  store ptr null, ptr %excinfo.4, align 8
  tail call void @NRT_incref(ptr %arg.masks.0)
  tail call void @NRT_incref(ptr %arg.order.0)
  %.50.inv = icmp sgt i64 %arg.start, 0
  %.51 = select i1 %.50.inv, i64 0, i64 %arg.order.5.0
  %0 = getelementptr i64, ptr %arg.order.4, i64 %arg.start
  %1 = getelementptr i8, ptr %0, i64 -8
  %.65 = getelementptr i64, ptr %1, i64 %.51
  %.66 = load i64, ptr %.65, align 8
  %.84 = icmp slt i64 %.66, 0
  %.85 = select i1 %.84, i64 %arg.masks.5.0, i64 0
  %.86 = add i64 %.85, %.66
  %.103 = mul i64 %.86, %arg.masks.5.1
  %.105 = getelementptr i8, ptr %arg.masks.4, i64 %.103
  tail call void @NRT_incref(ptr %arg.masks.0)
  %.149 = icmp slt i64 %arg.start, 0
  %.150 = select i1 %.149, i64 %arg.order.5.0, i64 0
  %.164 = getelementptr i64, ptr %0, i64 %.150
  %.165 = load i64, ptr %.164, align 8
  %.183 = icmp slt i64 %.165, 0
  %.184 = select i1 %.183, i64 %arg.masks.5.0, i64 0
  %.185 = add i64 %.184, %.165
  %.202 = mul i64 %.185, %arg.masks.5.1
  %.204 = getelementptr i8, ptr %arg.masks.4, i64 %.202
  tail call void @NRT_incref(ptr %arg.masks.0)
  store i64 0, ptr %.236, align 8
  %.244 = call i32 @_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE(ptr nonnull %.236, ptr nonnull %excinfo.1, ptr %arg.masks.0, ptr %arg.masks.1, i64 %arg.masks.5.1, i64 %arg.masks.3, ptr %.105, i64 %arg.masks.5.1, i64 %arg.masks.6.1, ptr %arg.masks.0, ptr %arg.masks.1, i64 %arg.masks.5.1, i64 %arg.masks.3, ptr %.204, i64 %arg.masks.5.1, i64 %arg.masks.6.1)
  %.254 = load i64, ptr %.236, align 8
  %cond = icmp eq i32 %.244, 0
  br i1 %cond, label %B0.endif, label %B0.if.if, !prof !0

B0.endif:                                         ; preds = %B0
  %.273 = add nsw i64 %arg.length, %arg.start
  %.287.inv = icmp sgt i64 %.273, 0
  %.288 = select i1 %.287.inv, i64 0, i64 %arg.order.5.0
  %2 = getelementptr i64, ptr %arg.order.4, i64 %.273
  %3 = getelementptr i8, ptr %2, i64 -8
  %.302 = getelementptr i64, ptr %3, i64 %.288
  %.303 = load i64, ptr %.302, align 8
  %.321 = icmp slt i64 %.303, 0
  %.322 = select i1 %.321, i64 %arg.masks.5.0, i64 0
  %.323 = add i64 %.322, %.303
  %.340 = mul i64 %.323, %arg.masks.5.1
  %.342 = getelementptr i8, ptr %arg.masks.4, i64 %.340
  %.387 = icmp slt i64 %.273, 0
  %.388 = select i1 %.387, i64 %arg.order.5.0, i64 0
  %.402 = getelementptr i64, ptr %2, i64 %.388
  %.403 = load i64, ptr %.402, align 8
  %.421 = icmp slt i64 %.403, 0
  %.422 = select i1 %.421, i64 %arg.masks.5.0, i64 0
  %.423 = add i64 %.422, %.403
  %.440 = mul i64 %.423, %arg.masks.5.1
  %.442 = getelementptr i8, ptr %arg.masks.4, i64 %.440
  store i64 0, ptr %.474, align 8
  %.482 = call i32 @_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE(ptr nonnull %.474, ptr nonnull %excinfo.2, ptr %arg.masks.0, ptr %arg.masks.1, i64 %arg.masks.5.1, i64 %arg.masks.3, ptr %.342, i64 %arg.masks.5.1, i64 %arg.masks.6.1, ptr %arg.masks.0, ptr %arg.masks.1, i64 %arg.masks.5.1, i64 %arg.masks.3, ptr %.442, i64 %arg.masks.5.1, i64 %arg.masks.6.1)
  %cond1 = icmp eq i32 %.482, 0
  br i1 %cond1, label %B0.endif.endif, label %B0.endif.if.if, !prof !0

common.ret:                                       ; preds = %B0.endif.endif.endif.if.if, %B0.endif.endif.endif.endif, %B0.endif.endif.if.if, %B0.endif.if.if, %B0.if.if
  %common.ret.op = phi i32 [ 1, %B0.if.if ], [ 1, %B0.endif.if.if ], [ 1, %B0.endif.endif.if.if ], [ 0, %B0.endif.endif.endif.endif ], [ 1, %B0.endif.endif.endif.if.if ]
  ret i32 %common.ret.op

B0.if.if:                                         ; preds = %B0
  %.245 = load ptr, ptr %excinfo.1, align 8
  store ptr %.245, ptr %excinfo, align 8
  br label %common.ret

B0.endif.endif:                                   ; preds = %B0.endif
  %.492 = load i64, ptr %.474, align 8
  %sunkaddr = mul i64 %.51, 8
  %sunkaddr4 = getelementptr i8, ptr %0, i64 %sunkaddr
  %sunkaddr5 = getelementptr i8, ptr %sunkaddr4, i64 -8
  %.539 = load i64, ptr %sunkaddr5, align 8
  %.557 = icmp slt i64 %.539, 0
  %.558 = select i1 %.557, i64 %arg.masks.5.0, i64 0
  %.559 = add i64 %.558, %.539
  %.576 = mul i64 %.559, %arg.masks.5.1
  %.578 = getelementptr i8, ptr %arg.masks.4, i64 %.576
  %sunkaddr6 = mul i64 %.288, 8
  %sunkaddr7 = getelementptr i8, ptr %2, i64 %sunkaddr6
  %sunkaddr8 = getelementptr i8, ptr %sunkaddr7, i64 -8
  %.640 = load i64, ptr %sunkaddr8, align 8
  %.658 = icmp slt i64 %.640, 0
  %.659 = select i1 %.658, i64 %arg.masks.5.0, i64 0
  %.660 = add i64 %.659, %.640
  %.677 = mul i64 %.660, %arg.masks.5.1
  %.679 = getelementptr i8, ptr %arg.masks.4, i64 %.677
  store i64 0, ptr %.711, align 8
  %.719 = call i32 @_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE(ptr nonnull %.711, ptr nonnull %excinfo.3, ptr %arg.masks.0, ptr %arg.masks.1, i64 %arg.masks.5.1, i64 %arg.masks.3, ptr %.578, i64 %arg.masks.5.1, i64 %arg.masks.6.1, ptr %arg.masks.0, ptr %arg.masks.1, i64 %arg.masks.5.1, i64 %arg.masks.3, ptr %.679, i64 %arg.masks.5.1, i64 %arg.masks.6.1)
  %.729 = load i64, ptr %.711, align 8
  %cond2 = icmp eq i32 %.719, 0
  br i1 %cond2, label %B0.endif.endif.endif, label %B0.endif.endif.if.if, !prof !0

B0.endif.if.if:                                   ; preds = %B0.endif
  %.483 = load ptr, ptr %excinfo.2, align 8
  store ptr %.483, ptr %excinfo, align 8
  br label %common.ret

B0.endif.endif.endif:                             ; preds = %B0.endif.endif
  %sunkaddr9 = mul i64 %.150, 8
  %sunkaddr10 = getelementptr i8, ptr %0, i64 %sunkaddr9
  %.774 = load i64, ptr %sunkaddr10, align 8
  %.792 = icmp slt i64 %.774, 0
  %.793 = select i1 %.792, i64 %arg.masks.5.0, i64 0
  %.794 = add i64 %.793, %.774
  %.811 = mul i64 %.794, %arg.masks.5.1
  %.813 = getelementptr i8, ptr %arg.masks.4, i64 %.811
  %sunkaddr11 = mul i64 %.388, 8
  %sunkaddr12 = getelementptr i8, ptr %2, i64 %sunkaddr11
  %.874 = load i64, ptr %sunkaddr12, align 8
  %.895 = icmp slt i64 %.874, 0
  %.896 = select i1 %.895, i64 %arg.masks.5.0, i64 0
  %.897 = add i64 %.896, %.874
  %.914 = mul i64 %.897, %arg.masks.5.1
  %.916 = getelementptr i8, ptr %arg.masks.4, i64 %.914
  store i64 0, ptr %.953, align 8
  %.961 = call i32 @_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE(ptr nonnull %.953, ptr nonnull %excinfo.4, ptr %arg.masks.0, ptr %arg.masks.1, i64 %arg.masks.5.1, i64 %arg.masks.3, ptr %.813, i64 %arg.masks.5.1, i64 %arg.masks.6.1, ptr %arg.masks.0, ptr %arg.masks.1, i64 %arg.masks.5.1, i64 %arg.masks.3, ptr %.916, i64 %arg.masks.5.1, i64 %arg.masks.6.1)
  tail call void @NRT_decref(ptr %arg.order.0)
  tail call void @NRT_decref(ptr %arg.masks.0)
  %cond3 = icmp eq i32 %.961, 0
  br i1 %cond3, label %B0.endif.endif.endif.endif, label %B0.endif.endif.endif.if.if, !prof !0

B0.endif.endif.if.if:                             ; preds = %B0.endif.endif
  %.720 = load ptr, ptr %excinfo.3, align 8
  store ptr %.720, ptr %excinfo, align 8
  br label %common.ret

B0.endif.endif.endif.endif:                       ; preds = %B0.endif.endif.endif
  %.971 = load i64, ptr %.953, align 8
  tail call void @NRT_decref(ptr %arg.masks.0)
  tail call void @NRT_decref(ptr %arg.masks.0)
  %.neg = add i64 %.492, %.254
  %4 = add i64 %.729, %.971
  %.988 = sub i64 %.neg, %4
  store i64 %.988, ptr %retptr, align 8
  br label %common.ret

B0.endif.endif.endif.if.if:                       ; preds = %B0.endif.endif.endif
  %.962 = load ptr, ptr %excinfo.4, align 8
  store ptr %.962, ptr %excinfo, align 8
  br label %common.ret
}
