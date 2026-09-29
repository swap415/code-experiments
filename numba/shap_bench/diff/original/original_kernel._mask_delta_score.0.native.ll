define range(i32 0, 2) i32 @_ZN15original_kernel17_mask_delta_scoreB2v9B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIbLi1E1C7mutable7alignedE5ArrayIbLi1E1C7mutable7alignedE(ptr noalias writeonly captures(none) %retptr, ptr noalias writeonly captures(none) %excinfo, ptr %arg.m1.0, ptr readnone captures(none) %arg.m1.1, i64 %arg.m1.2, i64 %arg.m1.3, ptr readonly captures(none) %arg.m1.4, i64 %arg.m1.5.0, i64 %arg.m1.6.0, ptr %arg.m2.0, ptr readnone captures(none) %arg.m2.1, i64 %arg.m2.2, i64 %arg.m2.3, ptr readonly captures(none) %arg.m2.4, i64 %arg.m2.5.0, i64 %arg.m2.6.0) local_unnamed_addr {
B102.i:
  %arg.m2.5.0.fr = freeze i64 %arg.m2.5.0
  %arg.m1.5.0.fr = freeze i64 %arg.m1.5.0
  tail call void @NRT_incref(ptr %arg.m1.0)
  tail call void @NRT_incref(ptr %arg.m2.0)
  %.95.not.i = icmp eq i64 %arg.m1.5.0.fr, 1
  br i1 %.95.not.i, label %B122.i22, label %B70.i18

common.ret:                                       ; preds = %for.end.endif, %B0.endif.endif.endif.endif.endif.if.if, %B0.endif.endif.endif.if
  %common.ret.op = phi i32 [ 0, %for.end.endif ], [ 1, %B0.endif.endif.endif.if ], [ 1, %B0.endif.endif.endif.endif.endif.if.if ]
  ret i32 %common.ret.op

B70.i18:                                          ; preds = %B102.i
  %.68.i19 = icmp ne i64 %arg.m2.5.0.fr, %arg.m1.5.0.fr
  %.73.i20 = icmp ne i64 %arg.m2.5.0.fr, 1
  %or.cond.i21 = and i1 %.73.i20, %.68.i19
  br i1 %or.cond.i21, label %B0.endif.endif.endif.if, label %B122.i22

B122.i22:                                         ; preds = %B70.i18, %B102.i
  %dest_shape.1 = phi i64 [ %arg.m1.5.0.fr, %B70.i18 ], [ %arg.m2.5.0.fr, %B102.i ]
  %.7.i.i = tail call ptr @NRT_MemInfo_alloc_aligned(i64 %dest_shape.1, i32 32), !noalias !0
  %.8.i.i = icmp eq ptr %.7.i.i, null
  br i1 %.8.i.i, label %B0.endif.endif.endif.endif.endif.if.if, label %B0.endif.endif.endif.endif.endif.endif, !prof !7

B0.endif.endif.endif.if:                          ; preds = %B70.i18
  store ptr @.const.picklebuf.c609a61042a044ba6291d5da2e507179b42ccfbc, ptr %excinfo, align 8, !numba_exception_output !8
  br label %common.ret

B0.endif.endif.endif.endif.endif.endif:           ; preds = %B122.i22
  %.5.i = getelementptr i8, ptr %.7.i.i, i64 24
  %.6.i = load ptr, ptr %.5.i, align 8
  %.20733 = icmp sgt i64 %dest_shape.1, 0
  br i1 %.20733, label %for.body.lr.ph, label %for.end.endif

for.body.lr.ph:                                   ; preds = %B0.endif.endif.endif.endif.endif.endif
  %const = bitcast i64 9223372036854775800 to i64
  %.209 = icmp ugt i64 %arg.m1.5.0.fr, 1
  br i1 %.209, label %for.body.lr.ph.split.us, label %for.body.lr.ph.split

for.body.lr.ph.split.us:                          ; preds = %for.body.lr.ph
  %0 = icmp ugt i64 %arg.m2.5.0.fr, 1
  br i1 %0, label %iter.check185, label %iter.check144

iter.check144:                                    ; preds = %for.body.lr.ph.split.us
  %1 = icmp ult i64 %dest_shape.1, 8
  br i1 %1, label %for.body.endif.endif.endif.endif.endif.endif.us.preheader, label %vector.memcheck131

vector.memcheck131:                               ; preds = %iter.check144
  %scevgep132 = getelementptr i8, ptr %.6.i, i64 %dest_shape.1
  %scevgep133 = getelementptr i8, ptr %arg.m1.4, i64 %dest_shape.1
  %scevgep134 = getelementptr i8, ptr %arg.m2.4, i64 1
  %bound0135 = icmp ult ptr %.6.i, %scevgep133
  %bound1136 = icmp ult ptr %arg.m1.4, %scevgep132
  %found.conflict137 = and i1 %bound0135, %bound1136
  %bound0138 = icmp ult ptr %.6.i, %scevgep134
  %bound1139 = icmp ult ptr %arg.m2.4, %scevgep132
  %found.conflict140 = and i1 %bound0138, %bound1139
  %conflict.rdx141 = or i1 %found.conflict137, %found.conflict140
  br i1 %conflict.rdx141, label %for.body.endif.endif.endif.endif.endif.endif.us.preheader, label %vector.main.loop.iter.check146

vector.main.loop.iter.check146:                   ; preds = %vector.memcheck131
  %min.iters.check145 = icmp ult i64 %dest_shape.1, 128
  br i1 %min.iters.check145, label %vec.epilog.ph165, label %vector.ph147

vector.ph147:                                     ; preds = %vector.main.loop.iter.check146
  %const_mat = add i64 %const, -120
  %n.vec149 = and i64 %dest_shape.1, %const_mat
  %2 = load i8, ptr %arg.m2.4, align 1, !alias.scope !9
  %3 = icmp ne i8 %2, 0
  %broadcast.splatinsert156 = insertelement <32 x i1> poison, i1 %3, i64 0
  %broadcast.splat157 = shufflevector <32 x i1> %broadcast.splatinsert156, <32 x i1> poison, <32 x i32> zeroinitializer
  br label %vector.body150

vector.body150:                                   ; preds = %vector.body150, %vector.ph147
  %index151 = phi i64 [ 0, %vector.ph147 ], [ %index.next158, %vector.body150 ]
  %sunkaddr = getelementptr i8, ptr %arg.m1.4, i64 %index151
  %wide.load152 = load <32 x i8>, ptr %sunkaddr, align 1, !alias.scope !12
  %sunkaddr361 = getelementptr i8, ptr %arg.m1.4, i64 %index151
  %sunkaddr362 = getelementptr i8, ptr %sunkaddr361, i64 32
  %wide.load153 = load <32 x i8>, ptr %sunkaddr362, align 1, !alias.scope !12
  %sunkaddr363 = getelementptr i8, ptr %arg.m1.4, i64 %index151
  %sunkaddr364 = getelementptr i8, ptr %sunkaddr363, i64 64
  %wide.load154 = load <32 x i8>, ptr %sunkaddr364, align 1, !alias.scope !12
  %sunkaddr365 = getelementptr i8, ptr %arg.m1.4, i64 %index151
  %sunkaddr366 = getelementptr i8, ptr %sunkaddr365, i64 96
  %wide.load155 = load <32 x i8>, ptr %sunkaddr366, align 1, !alias.scope !12
  %4 = icmp ne <32 x i8> %wide.load152, zeroinitializer
  %5 = icmp ne <32 x i8> %wide.load153, zeroinitializer
  %6 = icmp ne <32 x i8> %wide.load154, zeroinitializer
  %7 = icmp ne <32 x i8> %wide.load155, zeroinitializer
  %8 = xor <32 x i1> %4, %broadcast.splat157
  %9 = xor <32 x i1> %5, %broadcast.splat157
  %10 = xor <32 x i1> %6, %broadcast.splat157
  %11 = xor <32 x i1> %7, %broadcast.splat157
  %12 = zext <32 x i1> %8 to <32 x i8>
  %13 = zext <32 x i1> %9 to <32 x i8>
  %14 = zext <32 x i1> %10 to <32 x i8>
  %15 = zext <32 x i1> %11 to <32 x i8>
  %sunkaddr367 = getelementptr i8, ptr %.6.i, i64 %index151
  store <32 x i8> %12, ptr %sunkaddr367, align 1, !alias.scope !14, !noalias !16
  %sunkaddr368 = getelementptr i8, ptr %.6.i, i64 %index151
  %sunkaddr369 = getelementptr i8, ptr %sunkaddr368, i64 32
  store <32 x i8> %13, ptr %sunkaddr369, align 1, !alias.scope !14, !noalias !16
  %sunkaddr370 = getelementptr i8, ptr %.6.i, i64 %index151
  %sunkaddr371 = getelementptr i8, ptr %sunkaddr370, i64 64
  store <32 x i8> %14, ptr %sunkaddr371, align 1, !alias.scope !14, !noalias !16
  %sunkaddr372 = getelementptr i8, ptr %.6.i, i64 %index151
  %sunkaddr373 = getelementptr i8, ptr %sunkaddr372, i64 96
  store <32 x i8> %15, ptr %sunkaddr373, align 1, !alias.scope !14, !noalias !16
  %index.next158 = add nuw i64 %index151, 128
  %16 = icmp eq i64 %n.vec149, %index.next158
  br i1 %16, label %middle.block159, label %vector.body150, !llvm.loop !17

middle.block159:                                  ; preds = %vector.body150
  %cmp.n160 = icmp eq i64 %dest_shape.1, %n.vec149
  br i1 %cmp.n160, label %.51.endif.preheader.i, label %vec.epilog.iter.check163

vec.epilog.iter.check163:                         ; preds = %middle.block159
  %17 = and i64 %dest_shape.1, 120
  %min.epilog.iters.check164 = icmp eq i64 %17, 0
  br i1 %min.epilog.iters.check164, label %for.body.endif.endif.endif.endif.endif.endif.us.preheader, label %vec.epilog.ph165, !prof !20

vec.epilog.ph165:                                 ; preds = %vec.epilog.iter.check163, %vector.main.loop.iter.check146
  %vec.epilog.resume.val161 = phi i64 [ %n.vec149, %vec.epilog.iter.check163 ], [ 0, %vector.main.loop.iter.check146 ]
  %n.vec167 = and i64 %dest_shape.1, %const
  %18 = load i8, ptr %arg.m2.4, align 1, !alias.scope !9
  %19 = icmp ne i8 %18, 0
  %broadcast.splatinsert171 = insertelement <8 x i1> poison, i1 %19, i64 0
  %broadcast.splat172 = shufflevector <8 x i1> %broadcast.splatinsert171, <8 x i1> poison, <8 x i32> zeroinitializer
  br label %vec.epilog.vector.body168

vec.epilog.vector.body168:                        ; preds = %vec.epilog.vector.body168, %vec.epilog.ph165
  %index169 = phi i64 [ %vec.epilog.resume.val161, %vec.epilog.ph165 ], [ %index.next173, %vec.epilog.vector.body168 ]
  %20 = getelementptr i8, ptr %arg.m1.4, i64 %index169
  %wide.load170 = load <8 x i8>, ptr %20, align 1, !alias.scope !12
  %21 = icmp ne <8 x i8> %wide.load170, zeroinitializer
  %22 = xor <8 x i1> %21, %broadcast.splat172
  %23 = zext <8 x i1> %22 to <8 x i8>
  %24 = getelementptr i8, ptr %.6.i, i64 %index169
  store <8 x i8> %23, ptr %24, align 1, !alias.scope !14, !noalias !16
  %index.next173 = add nuw i64 %index169, 8
  %25 = icmp eq i64 %n.vec167, %index.next173
  br i1 %25, label %vec.epilog.middle.block174, label %vec.epilog.vector.body168, !llvm.loop !21

vec.epilog.middle.block174:                       ; preds = %vec.epilog.vector.body168
  %cmp.n175 = icmp eq i64 %dest_shape.1, %n.vec167
  br i1 %cmp.n175, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.us.preheader

for.body.endif.endif.endif.endif.endif.endif.us.preheader: ; preds = %vec.epilog.middle.block174, %vec.epilog.iter.check163, %vector.memcheck131, %iter.check144
  %loop.index36.us.ph = phi i64 [ 0, %iter.check144 ], [ 0, %vector.memcheck131 ], [ %n.vec149, %vec.epilog.iter.check163 ], [ %n.vec167, %vec.epilog.middle.block174 ]
  %xtraiter226 = and i64 %dest_shape.1, 3
  %lcmp.mod227.not = icmp eq i64 %xtraiter226, 0
  br i1 %lcmp.mod227.not, label %for.body.endif.endif.endif.endif.endif.endif.us.prol.loopexit, label %for.body.endif.endif.endif.endif.endif.endif.us.prol.preheader

for.body.endif.endif.endif.endif.endif.endif.us.prol.preheader: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us.preheader
  br label %for.body.endif.endif.endif.endif.endif.endif.us.prol

for.body.endif.endif.endif.endif.endif.endif.us.prol: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us.prol, %for.body.endif.endif.endif.endif.endif.endif.us.prol.preheader
  %lsr.iv303 = phi i64 [ %xtraiter226, %for.body.endif.endif.endif.endif.endif.endif.us.prol.preheader ], [ %lsr.iv.next304, %for.body.endif.endif.endif.endif.endif.endif.us.prol ]
  %loop.index36.us.prol = phi i64 [ %.285.us.prol, %for.body.endif.endif.endif.endif.endif.endif.us.prol ], [ %loop.index36.us.ph, %for.body.endif.endif.endif.endif.endif.endif.us.prol.preheader ]
  %.216.us.prol = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us.prol
  %.217.us.prol = load i8, ptr %.216.us.prol, align 1
  %.220.us.prol = icmp ne i8 %.217.us.prol, 0
  %.235.us.prol = load i8, ptr %arg.m2.4, align 1
  %.238.us.prol = icmp ne i8 %.235.us.prol, 0
  %.24.i31.prol = xor i1 %.220.us.prol, %.238.us.prol
  %.25.i32.prol = zext i1 %.24.i31.prol to i8
  %.283.us.prol = getelementptr i8, ptr %.6.i, i64 %loop.index36.us.prol
  store i8 %.25.i32.prol, ptr %.283.us.prol, align 1
  %.285.us.prol = add nuw nsw i64 %loop.index36.us.prol, 1
  %lsr.iv.next304 = add nsw i64 %lsr.iv303, -1
  %prol.iter228.cmp.not = icmp eq i64 %lsr.iv.next304, 0
  br i1 %prol.iter228.cmp.not, label %for.body.endif.endif.endif.endif.endif.endif.us.prol.loopexit, label %for.body.endif.endif.endif.endif.endif.endif.us.prol, !llvm.loop !22

for.body.endif.endif.endif.endif.endif.endif.us.prol.loopexit: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us.prol, %for.body.endif.endif.endif.endif.endif.endif.us.preheader
  %loop.index36.us.unr = phi i64 [ %loop.index36.us.ph, %for.body.endif.endif.endif.endif.endif.endif.us.preheader ], [ %.285.us.prol, %for.body.endif.endif.endif.endif.endif.endif.us.prol ]
  %26 = sub nsw i64 %loop.index36.us.ph, %dest_shape.1
  %27 = icmp ugt i64 %26, -4
  br i1 %27, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.us.preheader237

for.body.endif.endif.endif.endif.endif.endif.us.preheader237: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us.prol.loopexit
  br label %for.body.endif.endif.endif.endif.endif.endif.us

iter.check185:                                    ; preds = %for.body.lr.ph.split.us
  %28 = icmp ult i64 %dest_shape.1, 8
  br i1 %28, label %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader, label %vector.memcheck177

vector.memcheck177:                               ; preds = %iter.check185
  %29 = ptrtoint ptr %.6.i to i64
  %30 = ptrtoint ptr %arg.m1.4 to i64
  %31 = ptrtoint ptr %arg.m2.4 to i64
  %32 = sub i64 %29, %30
  %diff.check = icmp ult i64 %32, 128
  %33 = sub i64 %29, %31
  %diff.check181 = icmp ult i64 %33, 128
  %conflict.rdx182 = or i1 %diff.check, %diff.check181
  br i1 %conflict.rdx182, label %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader, label %vector.main.loop.iter.check187

vector.main.loop.iter.check187:                   ; preds = %vector.memcheck177
  %min.iters.check186 = icmp ult i64 %dest_shape.1, 128
  br i1 %min.iters.check186, label %vec.epilog.ph208, label %vector.ph188

vector.ph188:                                     ; preds = %vector.main.loop.iter.check187
  %const_mat358 = add i64 %const, -120
  %n.vec190 = and i64 %dest_shape.1, %const_mat358
  br label %vector.body191

vector.body191:                                   ; preds = %vector.body191, %vector.ph188
  %index192 = phi i64 [ 0, %vector.ph188 ], [ %index.next201, %vector.body191 ]
  %sunkaddr374 = getelementptr i8, ptr %arg.m1.4, i64 %index192
  %wide.load193 = load <32 x i8>, ptr %sunkaddr374, align 1
  %sunkaddr375 = getelementptr i8, ptr %arg.m1.4, i64 %index192
  %sunkaddr376 = getelementptr i8, ptr %sunkaddr375, i64 32
  %wide.load194 = load <32 x i8>, ptr %sunkaddr376, align 1
  %sunkaddr377 = getelementptr i8, ptr %arg.m1.4, i64 %index192
  %sunkaddr378 = getelementptr i8, ptr %sunkaddr377, i64 64
  %wide.load195 = load <32 x i8>, ptr %sunkaddr378, align 1
  %sunkaddr379 = getelementptr i8, ptr %arg.m1.4, i64 %index192
  %sunkaddr380 = getelementptr i8, ptr %sunkaddr379, i64 96
  %wide.load196 = load <32 x i8>, ptr %sunkaddr380, align 1
  %34 = icmp ne <32 x i8> %wide.load193, zeroinitializer
  %35 = icmp ne <32 x i8> %wide.load194, zeroinitializer
  %36 = icmp ne <32 x i8> %wide.load195, zeroinitializer
  %37 = icmp ne <32 x i8> %wide.load196, zeroinitializer
  %sunkaddr381 = getelementptr i8, ptr %arg.m2.4, i64 %index192
  %wide.load197 = load <32 x i8>, ptr %sunkaddr381, align 1
  %sunkaddr382 = getelementptr i8, ptr %arg.m2.4, i64 %index192
  %sunkaddr383 = getelementptr i8, ptr %sunkaddr382, i64 32
  %wide.load198 = load <32 x i8>, ptr %sunkaddr383, align 1
  %sunkaddr384 = getelementptr i8, ptr %arg.m2.4, i64 %index192
  %sunkaddr385 = getelementptr i8, ptr %sunkaddr384, i64 64
  %wide.load199 = load <32 x i8>, ptr %sunkaddr385, align 1
  %sunkaddr386 = getelementptr i8, ptr %arg.m2.4, i64 %index192
  %sunkaddr387 = getelementptr i8, ptr %sunkaddr386, i64 96
  %wide.load200 = load <32 x i8>, ptr %sunkaddr387, align 1
  %38 = icmp ne <32 x i8> %wide.load197, zeroinitializer
  %39 = icmp ne <32 x i8> %wide.load198, zeroinitializer
  %40 = icmp ne <32 x i8> %wide.load199, zeroinitializer
  %41 = icmp ne <32 x i8> %wide.load200, zeroinitializer
  %42 = xor <32 x i1> %34, %38
  %43 = xor <32 x i1> %35, %39
  %44 = xor <32 x i1> %36, %40
  %45 = xor <32 x i1> %37, %41
  %46 = zext <32 x i1> %42 to <32 x i8>
  %47 = zext <32 x i1> %43 to <32 x i8>
  %48 = zext <32 x i1> %44 to <32 x i8>
  %49 = zext <32 x i1> %45 to <32 x i8>
  %sunkaddr388 = getelementptr i8, ptr %.6.i, i64 %index192
  store <32 x i8> %46, ptr %sunkaddr388, align 1
  %sunkaddr389 = getelementptr i8, ptr %.6.i, i64 %index192
  %sunkaddr390 = getelementptr i8, ptr %sunkaddr389, i64 32
  store <32 x i8> %47, ptr %sunkaddr390, align 1
  %sunkaddr391 = getelementptr i8, ptr %.6.i, i64 %index192
  %sunkaddr392 = getelementptr i8, ptr %sunkaddr391, i64 64
  store <32 x i8> %48, ptr %sunkaddr392, align 1
  %sunkaddr393 = getelementptr i8, ptr %.6.i, i64 %index192
  %sunkaddr394 = getelementptr i8, ptr %sunkaddr393, i64 96
  store <32 x i8> %49, ptr %sunkaddr394, align 1
  %index.next201 = add nuw i64 %index192, 128
  %50 = icmp eq i64 %n.vec190, %index.next201
  br i1 %50, label %middle.block202, label %vector.body191, !llvm.loop !24

middle.block202:                                  ; preds = %vector.body191
  %cmp.n203 = icmp eq i64 %dest_shape.1, %n.vec190
  br i1 %cmp.n203, label %.51.endif.preheader.i, label %vec.epilog.iter.check206

vec.epilog.iter.check206:                         ; preds = %middle.block202
  %51 = and i64 %dest_shape.1, 120
  %min.epilog.iters.check207 = icmp eq i64 %51, 0
  br i1 %min.epilog.iters.check207, label %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader, label %vec.epilog.ph208, !prof !20

vec.epilog.ph208:                                 ; preds = %vec.epilog.iter.check206, %vector.main.loop.iter.check187
  %vec.epilog.resume.val204 = phi i64 [ %n.vec190, %vec.epilog.iter.check206 ], [ 0, %vector.main.loop.iter.check187 ]
  %n.vec210 = and i64 %dest_shape.1, %const
  br label %vec.epilog.vector.body211

vec.epilog.vector.body211:                        ; preds = %vec.epilog.vector.body211, %vec.epilog.ph208
  %index212 = phi i64 [ %vec.epilog.resume.val204, %vec.epilog.ph208 ], [ %index.next215, %vec.epilog.vector.body211 ]
  %52 = getelementptr i8, ptr %arg.m1.4, i64 %index212
  %wide.load213 = load <8 x i8>, ptr %52, align 1
  %53 = icmp ne <8 x i8> %wide.load213, zeroinitializer
  %54 = getelementptr i8, ptr %arg.m2.4, i64 %index212
  %wide.load214 = load <8 x i8>, ptr %54, align 1
  %55 = icmp ne <8 x i8> %wide.load214, zeroinitializer
  %56 = xor <8 x i1> %53, %55
  %57 = zext <8 x i1> %56 to <8 x i8>
  %58 = getelementptr i8, ptr %.6.i, i64 %index212
  store <8 x i8> %57, ptr %58, align 1
  %index.next215 = add nuw i64 %index212, 8
  %59 = icmp eq i64 %n.vec210, %index.next215
  br i1 %59, label %vec.epilog.middle.block216, label %vec.epilog.vector.body211, !llvm.loop !25

vec.epilog.middle.block216:                       ; preds = %vec.epilog.vector.body211
  %cmp.n217 = icmp eq i64 %dest_shape.1, %n.vec210
  br i1 %cmp.n217, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader

for.body.endif.endif.endif.endif.endif.endif.us.us.preheader: ; preds = %vec.epilog.middle.block216, %vec.epilog.iter.check206, %vector.memcheck177, %iter.check185
  %loop.index36.us.us.ph = phi i64 [ 0, %iter.check185 ], [ 0, %vector.memcheck177 ], [ %n.vec190, %vec.epilog.iter.check206 ], [ %n.vec210, %vec.epilog.middle.block216 ]
  %xtraiter229 = and i64 %dest_shape.1, 3
  %lcmp.mod230.not = icmp eq i64 %xtraiter229, 0
  br i1 %lcmp.mod230.not, label %for.body.endif.endif.endif.endif.endif.endif.us.us.prol.loopexit, label %for.body.endif.endif.endif.endif.endif.endif.us.us.prol.preheader

for.body.endif.endif.endif.endif.endif.endif.us.us.prol.preheader: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader
  br label %for.body.endif.endif.endif.endif.endif.endif.us.us.prol

for.body.endif.endif.endif.endif.endif.endif.us.us.prol: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us.us.prol, %for.body.endif.endif.endif.endif.endif.endif.us.us.prol.preheader
  %lsr.iv270 = phi i64 [ %xtraiter229, %for.body.endif.endif.endif.endif.endif.endif.us.us.prol.preheader ], [ %lsr.iv.next271, %for.body.endif.endif.endif.endif.endif.endif.us.us.prol ]
  %loop.index36.us.us.prol = phi i64 [ %.285.us.us.prol, %for.body.endif.endif.endif.endif.endif.endif.us.us.prol ], [ %loop.index36.us.us.ph, %for.body.endif.endif.endif.endif.endif.endif.us.us.prol.preheader ]
  %.216.us.us.prol = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us.us.prol
  %.217.us.us.prol = load i8, ptr %.216.us.us.prol, align 1
  %.220.us.us.prol = icmp ne i8 %.217.us.us.prol, 0
  %.234.us.us.prol = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us.us.prol
  %.235.us.us.prol = load i8, ptr %.234.us.us.prol, align 1
  %.238.us.us.prol = icmp ne i8 %.235.us.us.prol, 0
  %.24.i.prol = xor i1 %.220.us.us.prol, %.238.us.us.prol
  %.25.i.prol = zext i1 %.24.i.prol to i8
  %.283.us.us.prol = getelementptr i8, ptr %.6.i, i64 %loop.index36.us.us.prol
  store i8 %.25.i.prol, ptr %.283.us.us.prol, align 1
  %.285.us.us.prol = add nuw nsw i64 %loop.index36.us.us.prol, 1
  %lsr.iv.next271 = add nsw i64 %lsr.iv270, -1
  %prol.iter231.cmp.not = icmp eq i64 %lsr.iv.next271, 0
  br i1 %prol.iter231.cmp.not, label %for.body.endif.endif.endif.endif.endif.endif.us.us.prol.loopexit, label %for.body.endif.endif.endif.endif.endif.endif.us.us.prol, !llvm.loop !26

for.body.endif.endif.endif.endif.endif.endif.us.us.prol.loopexit: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us.us.prol, %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader
  %loop.index36.us.us.unr = phi i64 [ %loop.index36.us.us.ph, %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader ], [ %.285.us.us.prol, %for.body.endif.endif.endif.endif.endif.endif.us.us.prol ]
  %60 = sub nsw i64 %loop.index36.us.us.ph, %dest_shape.1
  %61 = icmp ugt i64 %60, -4
  br i1 %61, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader236

for.body.endif.endif.endif.endif.endif.endif.us.us.preheader236: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us.us.prol.loopexit
  br label %for.body.endif.endif.endif.endif.endif.endif.us.us

for.body.endif.endif.endif.endif.endif.endif.us.us: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us.us, %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader236
  %loop.index36.us.us = phi i64 [ %.285.us.us.3, %for.body.endif.endif.endif.endif.endif.endif.us.us ], [ %loop.index36.us.us.unr, %for.body.endif.endif.endif.endif.endif.endif.us.us.preheader236 ]
  %sunkaddr395 = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us.us
  %.217.us.us = load i8, ptr %sunkaddr395, align 1
  %.220.us.us = icmp ne i8 %.217.us.us, 0
  %sunkaddr396 = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us.us
  %.235.us.us = load i8, ptr %sunkaddr396, align 1
  %.238.us.us = icmp ne i8 %.235.us.us, 0
  %.24.i = xor i1 %.220.us.us, %.238.us.us
  %.25.i = zext i1 %.24.i to i8
  %sunkaddr397 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us.us
  store i8 %.25.i, ptr %sunkaddr397, align 1
  %sunkaddr398 = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us.us
  %sunkaddr399 = getelementptr i8, ptr %sunkaddr398, i64 1
  %.217.us.us.1 = load i8, ptr %sunkaddr399, align 1
  %.220.us.us.1 = icmp ne i8 %.217.us.us.1, 0
  %sunkaddr400 = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us.us
  %sunkaddr401 = getelementptr i8, ptr %sunkaddr400, i64 1
  %.235.us.us.1 = load i8, ptr %sunkaddr401, align 1
  %.238.us.us.1 = icmp ne i8 %.235.us.us.1, 0
  %.24.i.1 = xor i1 %.220.us.us.1, %.238.us.us.1
  %.25.i.1 = zext i1 %.24.i.1 to i8
  %sunkaddr402 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us.us
  %sunkaddr403 = getelementptr i8, ptr %sunkaddr402, i64 1
  store i8 %.25.i.1, ptr %sunkaddr403, align 1
  %sunkaddr404 = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us.us
  %sunkaddr405 = getelementptr i8, ptr %sunkaddr404, i64 2
  %.217.us.us.2 = load i8, ptr %sunkaddr405, align 1
  %.220.us.us.2 = icmp ne i8 %.217.us.us.2, 0
  %sunkaddr406 = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us.us
  %sunkaddr407 = getelementptr i8, ptr %sunkaddr406, i64 2
  %.235.us.us.2 = load i8, ptr %sunkaddr407, align 1
  %.238.us.us.2 = icmp ne i8 %.235.us.us.2, 0
  %.24.i.2 = xor i1 %.220.us.us.2, %.238.us.us.2
  %.25.i.2 = zext i1 %.24.i.2 to i8
  %sunkaddr408 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us.us
  %sunkaddr409 = getelementptr i8, ptr %sunkaddr408, i64 2
  store i8 %.25.i.2, ptr %sunkaddr409, align 1
  %sunkaddr410 = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us.us
  %sunkaddr411 = getelementptr i8, ptr %sunkaddr410, i64 3
  %.217.us.us.3 = load i8, ptr %sunkaddr411, align 1
  %.220.us.us.3 = icmp ne i8 %.217.us.us.3, 0
  %sunkaddr412 = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us.us
  %sunkaddr413 = getelementptr i8, ptr %sunkaddr412, i64 3
  %.235.us.us.3 = load i8, ptr %sunkaddr413, align 1
  %.238.us.us.3 = icmp ne i8 %.235.us.us.3, 0
  %.24.i.3 = xor i1 %.220.us.us.3, %.238.us.us.3
  %.25.i.3 = zext i1 %.24.i.3 to i8
  %sunkaddr414 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us.us
  %sunkaddr415 = getelementptr i8, ptr %sunkaddr414, i64 3
  store i8 %.25.i.3, ptr %sunkaddr415, align 1
  %.285.us.us.3 = add nuw nsw i64 %loop.index36.us.us, 4
  %exitcond72.not.3 = icmp eq i64 %dest_shape.1, %.285.us.us.3
  br i1 %exitcond72.not.3, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.us.us, !llvm.loop !27

for.body.endif.endif.endif.endif.endif.endif.us:  ; preds = %for.body.endif.endif.endif.endif.endif.endif.us, %for.body.endif.endif.endif.endif.endif.endif.us.preheader237
  %loop.index36.us = phi i64 [ %.285.us.3, %for.body.endif.endif.endif.endif.endif.endif.us ], [ %loop.index36.us.unr, %for.body.endif.endif.endif.endif.endif.endif.us.preheader237 ]
  %sunkaddr416 = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us
  %.217.us = load i8, ptr %sunkaddr416, align 1
  %.220.us = icmp ne i8 %.217.us, 0
  %.235.us = load i8, ptr %arg.m2.4, align 1
  %.238.us = icmp ne i8 %.235.us, 0
  %.24.i31 = xor i1 %.220.us, %.238.us
  %.25.i32 = zext i1 %.24.i31 to i8
  %sunkaddr417 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us
  store i8 %.25.i32, ptr %sunkaddr417, align 1
  %sunkaddr418 = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us
  %sunkaddr419 = getelementptr i8, ptr %sunkaddr418, i64 1
  %.217.us.1 = load i8, ptr %sunkaddr419, align 1
  %.220.us.1 = icmp ne i8 %.217.us.1, 0
  %.235.us.1 = load i8, ptr %arg.m2.4, align 1
  %.238.us.1 = icmp ne i8 %.235.us.1, 0
  %.24.i31.1 = xor i1 %.220.us.1, %.238.us.1
  %.25.i32.1 = zext i1 %.24.i31.1 to i8
  %sunkaddr420 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us
  %sunkaddr421 = getelementptr i8, ptr %sunkaddr420, i64 1
  store i8 %.25.i32.1, ptr %sunkaddr421, align 1
  %sunkaddr422 = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us
  %sunkaddr423 = getelementptr i8, ptr %sunkaddr422, i64 2
  %.217.us.2 = load i8, ptr %sunkaddr423, align 1
  %.220.us.2 = icmp ne i8 %.217.us.2, 0
  %.235.us.2 = load i8, ptr %arg.m2.4, align 1
  %.238.us.2 = icmp ne i8 %.235.us.2, 0
  %.24.i31.2 = xor i1 %.220.us.2, %.238.us.2
  %.25.i32.2 = zext i1 %.24.i31.2 to i8
  %sunkaddr424 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us
  %sunkaddr425 = getelementptr i8, ptr %sunkaddr424, i64 2
  store i8 %.25.i32.2, ptr %sunkaddr425, align 1
  %sunkaddr426 = getelementptr i8, ptr %arg.m1.4, i64 %loop.index36.us
  %sunkaddr427 = getelementptr i8, ptr %sunkaddr426, i64 3
  %.217.us.3 = load i8, ptr %sunkaddr427, align 1
  %.220.us.3 = icmp ne i8 %.217.us.3, 0
  %.235.us.3 = load i8, ptr %arg.m2.4, align 1
  %.238.us.3 = icmp ne i8 %.235.us.3, 0
  %.24.i31.3 = xor i1 %.220.us.3, %.238.us.3
  %.25.i32.3 = zext i1 %.24.i31.3 to i8
  %sunkaddr428 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us
  %sunkaddr429 = getelementptr i8, ptr %sunkaddr428, i64 3
  store i8 %.25.i32.3, ptr %sunkaddr429, align 1
  %.285.us.3 = add nuw nsw i64 %loop.index36.us, 4
  %exitcond71.not.3 = icmp eq i64 %dest_shape.1, %.285.us.3
  br i1 %exitcond71.not.3, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.us, !llvm.loop !28

for.body.lr.ph.split:                             ; preds = %for.body.lr.ph
  %62 = icmp ugt i64 %arg.m2.5.0.fr, 1
  br i1 %62, label %iter.check99, label %iter.check

iter.check:                                       ; preds = %for.body.lr.ph.split
  %63 = icmp ult i64 %dest_shape.1, 8
  br i1 %63, label %for.body.endif.endif.endif.endif.endif.endif.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %scevgep68 = getelementptr i8, ptr %.6.i, i64 %dest_shape.1
  %scevgep69 = getelementptr i8, ptr %arg.m1.4, i64 1
  %scevgep70 = getelementptr i8, ptr %arg.m2.4, i64 1
  %bound0 = icmp ult ptr %.6.i, %scevgep69
  %bound1 = icmp ult ptr %arg.m1.4, %scevgep68
  %found.conflict = and i1 %bound0, %bound1
  %bound071 = icmp ult ptr %.6.i, %scevgep70
  %bound172 = icmp ult ptr %arg.m2.4, %scevgep68
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx = or i1 %found.conflict, %found.conflict73
  br i1 %conflict.rdx, label %for.body.endif.endif.endif.endif.endif.endif.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %min.iters.check74 = icmp ult i64 %dest_shape.1, 128
  br i1 %min.iters.check74, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %const_mat359 = add i64 %const, -120
  %n.vec = and i64 %dest_shape.1, %const_mat359
  %64 = load i8, ptr %arg.m2.4, align 1, !alias.scope !29
  %65 = load i8, ptr %arg.m1.4, align 1, !alias.scope !32
  %66 = icmp ne i8 %65, 0
  %67 = icmp ne i8 %64, 0
  %.scalar = xor i1 %66, %67
  %68 = insertelement <32 x i1> poison, i1 %.scalar, i64 0
  %69 = shufflevector <32 x i1> %68, <32 x i1> poison, <32 x i32> zeroinitializer
  %70 = zext <32 x i1> %69 to <32 x i8>
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %sunkaddr430 = getelementptr i8, ptr %.6.i, i64 %index
  store <32 x i8> %70, ptr %sunkaddr430, align 1, !alias.scope !34, !noalias !36
  %sunkaddr431 = getelementptr i8, ptr %.6.i, i64 %index
  %sunkaddr432 = getelementptr i8, ptr %sunkaddr431, i64 32
  store <32 x i8> %70, ptr %sunkaddr432, align 1, !alias.scope !34, !noalias !36
  %sunkaddr433 = getelementptr i8, ptr %.6.i, i64 %index
  %sunkaddr434 = getelementptr i8, ptr %sunkaddr433, i64 64
  store <32 x i8> %70, ptr %sunkaddr434, align 1, !alias.scope !34, !noalias !36
  %sunkaddr435 = getelementptr i8, ptr %.6.i, i64 %index
  %sunkaddr436 = getelementptr i8, ptr %sunkaddr435, i64 96
  store <32 x i8> %70, ptr %sunkaddr436, align 1, !alias.scope !34, !noalias !36
  %index.next = add nuw i64 %index, 128
  %71 = icmp eq i64 %n.vec, %index.next
  br i1 %71, label %middle.block, label %vector.body, !llvm.loop !37

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %dest_shape.1, %n.vec
  br i1 %cmp.n, label %.51.endif.preheader.i, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %72 = and i64 %dest_shape.1, 120
  %min.epilog.iters.check = icmp eq i64 %72, 0
  br i1 %min.epilog.iters.check, label %for.body.endif.endif.endif.endif.endif.endif.preheader, label %vec.epilog.ph, !prof !20

vec.epilog.ph:                                    ; preds = %vec.epilog.iter.check, %vector.main.loop.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec78 = and i64 %dest_shape.1, %const
  %73 = load i8, ptr %arg.m2.4, align 1, !alias.scope !29
  %74 = load i8, ptr %arg.m1.4, align 1, !alias.scope !32
  %75 = icmp ne i8 %74, 0
  %76 = icmp ne i8 %73, 0
  %.scalar219 = xor i1 %75, %76
  %77 = insertelement <8 x i1> poison, i1 %.scalar219, i64 0
  %78 = shufflevector <8 x i1> %77, <8 x i1> poison, <8 x i32> zeroinitializer
  %79 = zext <8 x i1> %78 to <8 x i8>
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index83 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next84, %vec.epilog.vector.body ]
  %80 = getelementptr i8, ptr %.6.i, i64 %index83
  store <8 x i8> %79, ptr %80, align 1, !alias.scope !34, !noalias !36
  %index.next84 = add nuw i64 %index83, 8
  %81 = icmp eq i64 %n.vec78, %index.next84
  br i1 %81, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !38

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n85 = icmp eq i64 %dest_shape.1, %n.vec78
  br i1 %cmp.n85, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.preheader

for.body.endif.endif.endif.endif.endif.endif.preheader: ; preds = %vec.epilog.middle.block, %vec.epilog.iter.check, %vector.memcheck, %iter.check
  %loop.index36.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec78, %vec.epilog.middle.block ]
  %xtraiter = and i64 %dest_shape.1, 3
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body.endif.endif.endif.endif.endif.endif.prol.loopexit, label %for.body.endif.endif.endif.endif.endif.endif.prol.preheader

for.body.endif.endif.endif.endif.endif.endif.prol.preheader: ; preds = %for.body.endif.endif.endif.endif.endif.endif.preheader
  br label %for.body.endif.endif.endif.endif.endif.endif.prol

for.body.endif.endif.endif.endif.endif.endif.prol: ; preds = %for.body.endif.endif.endif.endif.endif.endif.prol, %for.body.endif.endif.endif.endif.endif.endif.prol.preheader
  %lsr.iv351 = phi i64 [ %xtraiter, %for.body.endif.endif.endif.endif.endif.endif.prol.preheader ], [ %lsr.iv.next352, %for.body.endif.endif.endif.endif.endif.endif.prol ]
  %loop.index36.prol = phi i64 [ %.285.prol, %for.body.endif.endif.endif.endif.endif.endif.prol ], [ %loop.index36.ph, %for.body.endif.endif.endif.endif.endif.endif.prol.preheader ]
  %.217.prol = load i8, ptr %arg.m1.4, align 1
  %.220.prol = icmp ne i8 %.217.prol, 0
  %.235.prol = load i8, ptr %arg.m2.4, align 1
  %.238.prol = icmp ne i8 %.235.prol, 0
  %.24.i35.prol = xor i1 %.220.prol, %.238.prol
  %.25.i36.prol = zext i1 %.24.i35.prol to i8
  %.283.prol = getelementptr i8, ptr %.6.i, i64 %loop.index36.prol
  store i8 %.25.i36.prol, ptr %.283.prol, align 1
  %.285.prol = add nuw nsw i64 %loop.index36.prol, 1
  %lsr.iv.next352 = add nsw i64 %lsr.iv351, -1
  %prol.iter.cmp.not = icmp eq i64 %lsr.iv.next352, 0
  br i1 %prol.iter.cmp.not, label %for.body.endif.endif.endif.endif.endif.endif.prol.loopexit, label %for.body.endif.endif.endif.endif.endif.endif.prol, !llvm.loop !39

for.body.endif.endif.endif.endif.endif.endif.prol.loopexit: ; preds = %for.body.endif.endif.endif.endif.endif.endif.prol, %for.body.endif.endif.endif.endif.endif.endif.preheader
  %loop.index36.unr = phi i64 [ %loop.index36.ph, %for.body.endif.endif.endif.endif.endif.endif.preheader ], [ %.285.prol, %for.body.endif.endif.endif.endif.endif.endif.prol ]
  %82 = sub nsw i64 %loop.index36.ph, %dest_shape.1
  %83 = icmp ugt i64 %82, -4
  br i1 %83, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.preheader241

for.body.endif.endif.endif.endif.endif.endif.preheader241: ; preds = %for.body.endif.endif.endif.endif.endif.endif.prol.loopexit
  br label %for.body.endif.endif.endif.endif.endif.endif

iter.check99:                                     ; preds = %for.body.lr.ph.split
  %84 = icmp ult i64 %dest_shape.1, 8
  br i1 %84, label %for.body.endif.endif.endif.endif.endif.endif.us42.preheader, label %vector.memcheck86

vector.memcheck86:                                ; preds = %iter.check99
  %scevgep87 = getelementptr i8, ptr %.6.i, i64 %dest_shape.1
  %scevgep88 = getelementptr i8, ptr %arg.m1.4, i64 1
  %scevgep89 = getelementptr i8, ptr %arg.m2.4, i64 %dest_shape.1
  %bound090 = icmp ult ptr %.6.i, %scevgep88
  %bound191 = icmp ult ptr %arg.m1.4, %scevgep87
  %found.conflict92 = and i1 %bound090, %bound191
  %bound093 = icmp ult ptr %.6.i, %scevgep89
  %bound194 = icmp ult ptr %arg.m2.4, %scevgep87
  %found.conflict95 = and i1 %bound093, %bound194
  %conflict.rdx96 = or i1 %found.conflict92, %found.conflict95
  br i1 %conflict.rdx96, label %for.body.endif.endif.endif.endif.endif.endif.us42.preheader, label %vector.main.loop.iter.check101

vector.main.loop.iter.check101:                   ; preds = %vector.memcheck86
  %min.iters.check100 = icmp ult i64 %dest_shape.1, 128
  br i1 %min.iters.check100, label %vec.epilog.ph119, label %vector.ph102

vector.ph102:                                     ; preds = %vector.main.loop.iter.check101
  %const_mat360 = add i64 %const, -120
  %n.vec104 = and i64 %dest_shape.1, %const_mat360
  %85 = load i8, ptr %arg.m1.4, align 1, !alias.scope !40
  %86 = icmp ne i8 %85, 0
  %broadcast.splatinsert110 = insertelement <32 x i1> poison, i1 %86, i64 0
  %broadcast.splat111 = shufflevector <32 x i1> %broadcast.splatinsert110, <32 x i1> poison, <32 x i32> zeroinitializer
  br label %vector.body105

vector.body105:                                   ; preds = %vector.body105, %vector.ph102
  %index106 = phi i64 [ 0, %vector.ph102 ], [ %index.next112, %vector.body105 ]
  %sunkaddr437 = getelementptr i8, ptr %arg.m2.4, i64 %index106
  %wide.load = load <32 x i8>, ptr %sunkaddr437, align 1, !alias.scope !43
  %sunkaddr438 = getelementptr i8, ptr %arg.m2.4, i64 %index106
  %sunkaddr439 = getelementptr i8, ptr %sunkaddr438, i64 32
  %wide.load107 = load <32 x i8>, ptr %sunkaddr439, align 1, !alias.scope !43
  %sunkaddr440 = getelementptr i8, ptr %arg.m2.4, i64 %index106
  %sunkaddr441 = getelementptr i8, ptr %sunkaddr440, i64 64
  %wide.load108 = load <32 x i8>, ptr %sunkaddr441, align 1, !alias.scope !43
  %sunkaddr442 = getelementptr i8, ptr %arg.m2.4, i64 %index106
  %sunkaddr443 = getelementptr i8, ptr %sunkaddr442, i64 96
  %wide.load109 = load <32 x i8>, ptr %sunkaddr443, align 1, !alias.scope !43
  %87 = icmp ne <32 x i8> %wide.load, zeroinitializer
  %88 = icmp ne <32 x i8> %wide.load107, zeroinitializer
  %89 = icmp ne <32 x i8> %wide.load108, zeroinitializer
  %90 = icmp ne <32 x i8> %wide.load109, zeroinitializer
  %91 = xor <32 x i1> %broadcast.splat111, %87
  %92 = xor <32 x i1> %broadcast.splat111, %88
  %93 = xor <32 x i1> %broadcast.splat111, %89
  %94 = xor <32 x i1> %broadcast.splat111, %90
  %95 = zext <32 x i1> %91 to <32 x i8>
  %96 = zext <32 x i1> %92 to <32 x i8>
  %97 = zext <32 x i1> %93 to <32 x i8>
  %98 = zext <32 x i1> %94 to <32 x i8>
  %sunkaddr444 = getelementptr i8, ptr %.6.i, i64 %index106
  store <32 x i8> %95, ptr %sunkaddr444, align 1, !alias.scope !45, !noalias !47
  %sunkaddr445 = getelementptr i8, ptr %.6.i, i64 %index106
  %sunkaddr446 = getelementptr i8, ptr %sunkaddr445, i64 32
  store <32 x i8> %96, ptr %sunkaddr446, align 1, !alias.scope !45, !noalias !47
  %sunkaddr447 = getelementptr i8, ptr %.6.i, i64 %index106
  %sunkaddr448 = getelementptr i8, ptr %sunkaddr447, i64 64
  store <32 x i8> %97, ptr %sunkaddr448, align 1, !alias.scope !45, !noalias !47
  %sunkaddr449 = getelementptr i8, ptr %.6.i, i64 %index106
  %sunkaddr450 = getelementptr i8, ptr %sunkaddr449, i64 96
  store <32 x i8> %98, ptr %sunkaddr450, align 1, !alias.scope !45, !noalias !47
  %index.next112 = add nuw i64 %index106, 128
  %99 = icmp eq i64 %n.vec104, %index.next112
  br i1 %99, label %middle.block113, label %vector.body105, !llvm.loop !48

middle.block113:                                  ; preds = %vector.body105
  %cmp.n114 = icmp eq i64 %dest_shape.1, %n.vec104
  br i1 %cmp.n114, label %.51.endif.preheader.i, label %vec.epilog.iter.check117

vec.epilog.iter.check117:                         ; preds = %middle.block113
  %100 = and i64 %dest_shape.1, 120
  %min.epilog.iters.check118 = icmp eq i64 %100, 0
  br i1 %min.epilog.iters.check118, label %for.body.endif.endif.endif.endif.endif.endif.us42.preheader, label %vec.epilog.ph119, !prof !20

vec.epilog.ph119:                                 ; preds = %vec.epilog.iter.check117, %vector.main.loop.iter.check101
  %vec.epilog.resume.val115 = phi i64 [ %n.vec104, %vec.epilog.iter.check117 ], [ 0, %vector.main.loop.iter.check101 ]
  %n.vec121 = and i64 %dest_shape.1, %const
  %101 = load i8, ptr %arg.m1.4, align 1, !alias.scope !40
  %102 = icmp ne i8 %101, 0
  %broadcast.splatinsert125 = insertelement <8 x i1> poison, i1 %102, i64 0
  %broadcast.splat126 = shufflevector <8 x i1> %broadcast.splatinsert125, <8 x i1> poison, <8 x i32> zeroinitializer
  br label %vec.epilog.vector.body122

vec.epilog.vector.body122:                        ; preds = %vec.epilog.vector.body122, %vec.epilog.ph119
  %index123 = phi i64 [ %vec.epilog.resume.val115, %vec.epilog.ph119 ], [ %index.next127, %vec.epilog.vector.body122 ]
  %103 = getelementptr i8, ptr %arg.m2.4, i64 %index123
  %wide.load124 = load <8 x i8>, ptr %103, align 1, !alias.scope !43
  %104 = icmp ne <8 x i8> %wide.load124, zeroinitializer
  %105 = xor <8 x i1> %broadcast.splat126, %104
  %106 = zext <8 x i1> %105 to <8 x i8>
  %107 = getelementptr i8, ptr %.6.i, i64 %index123
  store <8 x i8> %106, ptr %107, align 1, !alias.scope !45, !noalias !47
  %index.next127 = add nuw i64 %index123, 8
  %108 = icmp eq i64 %n.vec121, %index.next127
  br i1 %108, label %vec.epilog.middle.block128, label %vec.epilog.vector.body122, !llvm.loop !49

vec.epilog.middle.block128:                       ; preds = %vec.epilog.vector.body122
  %cmp.n129 = icmp eq i64 %dest_shape.1, %n.vec121
  br i1 %cmp.n129, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.us42.preheader

for.body.endif.endif.endif.endif.endif.endif.us42.preheader: ; preds = %vec.epilog.middle.block128, %vec.epilog.iter.check117, %vector.memcheck86, %iter.check99
  %loop.index36.us38.ph = phi i64 [ 0, %iter.check99 ], [ 0, %vector.memcheck86 ], [ %n.vec104, %vec.epilog.iter.check117 ], [ %n.vec121, %vec.epilog.middle.block128 ]
  %xtraiter223 = and i64 %dest_shape.1, 3
  %lcmp.mod224.not = icmp eq i64 %xtraiter223, 0
  br i1 %lcmp.mod224.not, label %for.body.endif.endif.endif.endif.endif.endif.us42.prol.loopexit, label %for.body.endif.endif.endif.endif.endif.endif.us42.prol.preheader

for.body.endif.endif.endif.endif.endif.endif.us42.prol.preheader: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us42.preheader
  br label %for.body.endif.endif.endif.endif.endif.endif.us42.prol

for.body.endif.endif.endif.endif.endif.endif.us42.prol: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us42.prol, %for.body.endif.endif.endif.endif.endif.endif.us42.prol.preheader
  %lsr.iv331 = phi i64 [ %xtraiter223, %for.body.endif.endif.endif.endif.endif.endif.us42.prol.preheader ], [ %lsr.iv.next332, %for.body.endif.endif.endif.endif.endif.endif.us42.prol ]
  %loop.index36.us38.prol = phi i64 [ %.285.us47.prol, %for.body.endif.endif.endif.endif.endif.endif.us42.prol ], [ %loop.index36.us38.ph, %for.body.endif.endif.endif.endif.endif.endif.us42.prol.preheader ]
  %.217.us40.prol = load i8, ptr %arg.m1.4, align 1
  %.220.us41.prol = icmp ne i8 %.217.us40.prol, 0
  %.234.us50.prol = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us38.prol
  %.235.us51.prol = load i8, ptr %.234.us50.prol, align 1
  %.238.us52.prol = icmp ne i8 %.235.us51.prol, 0
  %.24.i33.prol = xor i1 %.220.us41.prol, %.238.us52.prol
  %.25.i34.prol = zext i1 %.24.i33.prol to i8
  %.283.us46.prol = getelementptr i8, ptr %.6.i, i64 %loop.index36.us38.prol
  store i8 %.25.i34.prol, ptr %.283.us46.prol, align 1
  %.285.us47.prol = add nuw nsw i64 %loop.index36.us38.prol, 1
  %lsr.iv.next332 = add nsw i64 %lsr.iv331, -1
  %prol.iter225.cmp.not = icmp eq i64 %lsr.iv.next332, 0
  br i1 %prol.iter225.cmp.not, label %for.body.endif.endif.endif.endif.endif.endif.us42.prol.loopexit, label %for.body.endif.endif.endif.endif.endif.endif.us42.prol, !llvm.loop !50

for.body.endif.endif.endif.endif.endif.endif.us42.prol.loopexit: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us42.prol, %for.body.endif.endif.endif.endif.endif.endif.us42.preheader
  %loop.index36.us38.unr = phi i64 [ %loop.index36.us38.ph, %for.body.endif.endif.endif.endif.endif.endif.us42.preheader ], [ %.285.us47.prol, %for.body.endif.endif.endif.endif.endif.endif.us42.prol ]
  %109 = sub nsw i64 %loop.index36.us38.ph, %dest_shape.1
  %110 = icmp ugt i64 %109, -4
  br i1 %110, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.us42.preheader239

for.body.endif.endif.endif.endif.endif.endif.us42.preheader239: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us42.prol.loopexit
  br label %for.body.endif.endif.endif.endif.endif.endif.us42

for.body.endif.endif.endif.endif.endif.endif.us42: ; preds = %for.body.endif.endif.endif.endif.endif.endif.us42, %for.body.endif.endif.endif.endif.endif.endif.us42.preheader239
  %loop.index36.us38 = phi i64 [ %.285.us47.3, %for.body.endif.endif.endif.endif.endif.endif.us42 ], [ %loop.index36.us38.unr, %for.body.endif.endif.endif.endif.endif.endif.us42.preheader239 ]
  %.217.us40 = load i8, ptr %arg.m1.4, align 1
  %.220.us41 = icmp ne i8 %.217.us40, 0
  %sunkaddr451 = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us38
  %.235.us51 = load i8, ptr %sunkaddr451, align 1
  %.238.us52 = icmp ne i8 %.235.us51, 0
  %.24.i33 = xor i1 %.220.us41, %.238.us52
  %.25.i34 = zext i1 %.24.i33 to i8
  %sunkaddr452 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us38
  store i8 %.25.i34, ptr %sunkaddr452, align 1
  %.217.us40.1 = load i8, ptr %arg.m1.4, align 1
  %.220.us41.1 = icmp ne i8 %.217.us40.1, 0
  %sunkaddr453 = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us38
  %sunkaddr454 = getelementptr i8, ptr %sunkaddr453, i64 1
  %.235.us51.1 = load i8, ptr %sunkaddr454, align 1
  %.238.us52.1 = icmp ne i8 %.235.us51.1, 0
  %.24.i33.1 = xor i1 %.220.us41.1, %.238.us52.1
  %.25.i34.1 = zext i1 %.24.i33.1 to i8
  %sunkaddr455 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us38
  %sunkaddr456 = getelementptr i8, ptr %sunkaddr455, i64 1
  store i8 %.25.i34.1, ptr %sunkaddr456, align 1
  %.217.us40.2 = load i8, ptr %arg.m1.4, align 1
  %.220.us41.2 = icmp ne i8 %.217.us40.2, 0
  %sunkaddr457 = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us38
  %sunkaddr458 = getelementptr i8, ptr %sunkaddr457, i64 2
  %.235.us51.2 = load i8, ptr %sunkaddr458, align 1
  %.238.us52.2 = icmp ne i8 %.235.us51.2, 0
  %.24.i33.2 = xor i1 %.220.us41.2, %.238.us52.2
  %.25.i34.2 = zext i1 %.24.i33.2 to i8
  %sunkaddr459 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us38
  %sunkaddr460 = getelementptr i8, ptr %sunkaddr459, i64 2
  store i8 %.25.i34.2, ptr %sunkaddr460, align 1
  %.217.us40.3 = load i8, ptr %arg.m1.4, align 1
  %.220.us41.3 = icmp ne i8 %.217.us40.3, 0
  %sunkaddr461 = getelementptr i8, ptr %arg.m2.4, i64 %loop.index36.us38
  %sunkaddr462 = getelementptr i8, ptr %sunkaddr461, i64 3
  %.235.us51.3 = load i8, ptr %sunkaddr462, align 1
  %.238.us52.3 = icmp ne i8 %.235.us51.3, 0
  %.24.i33.3 = xor i1 %.220.us41.3, %.238.us52.3
  %.25.i34.3 = zext i1 %.24.i33.3 to i8
  %sunkaddr463 = getelementptr i8, ptr %.6.i, i64 %loop.index36.us38
  %sunkaddr464 = getelementptr i8, ptr %sunkaddr463, i64 3
  store i8 %.25.i34.3, ptr %sunkaddr464, align 1
  %.285.us47.3 = add nuw nsw i64 %loop.index36.us38, 4
  %exitcond70.not.3 = icmp eq i64 %dest_shape.1, %.285.us47.3
  br i1 %exitcond70.not.3, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif.us42, !llvm.loop !51

B0.endif.endif.endif.endif.endif.if.if:           ; preds = %B122.i22
  store ptr @.const.picklebuf.ba289d81f05c7020f3477c15734804df65abe209, ptr %excinfo, align 8
  br label %common.ret

.51.endif.preheader.i:                            ; preds = %for.body.endif.endif.endif.endif.endif.endif, %for.body.endif.endif.endif.endif.endif.endif.us42, %for.body.endif.endif.endif.endif.endif.endif.us42.prol.loopexit, %vec.epilog.middle.block128, %middle.block113, %for.body.endif.endif.endif.endif.endif.endif.prol.loopexit, %vec.epilog.middle.block, %middle.block, %for.body.endif.endif.endif.endif.endif.endif.us, %for.body.endif.endif.endif.endif.endif.endif.us.us, %for.body.endif.endif.endif.endif.endif.endif.us.us.prol.loopexit, %vec.epilog.middle.block216, %middle.block202, %for.body.endif.endif.endif.endif.endif.endif.us.prol.loopexit, %vec.epilog.middle.block174, %middle.block159
  %xtraiter.i = and i64 %dest_shape.1, 7
  %111 = icmp samesign ult i64 %dest_shape.1, 8
  br i1 %111, label %.51.endif.epil.i.preheader, label %.51.endif.preheader.new.i, !prof !52

.51.endif.preheader.new.i:                        ; preds = %.51.endif.preheader.i
  %unroll_iter.i = and i64 %dest_shape.1, %const
  %112 = add nsw i64 %dest_shape.1, -8
  %113 = lshr i64 %112, 3
  %114 = add nuw nsw i64 %113, 1
  %115 = icmp eq i64 %113, 0
  br i1 %115, label %.51.endif.i.epil.preheader, label %.51.endif.preheader.new.i.new, !prof !53

.51.endif.preheader.new.i.new:                    ; preds = %.51.endif.preheader.new.i
  %unroll_iter = and i64 %114, 4611686018427387902
  br label %.51.endif.i

.52.loopexit.unr-lcssa.i.unr-lcssa:               ; preds = %.51.endif.i
  %116 = and i64 %114, 1
  %lcmp.mod233.not = icmp eq i64 %116, 0
  br i1 %lcmp.mod233.not, label %.52.loopexit.unr-lcssa.i, label %.51.endif.i.epil.preheader, !prof !54

.51.endif.i.epil.preheader:                       ; preds = %.52.loopexit.unr-lcssa.i.unr-lcssa, %.51.endif.preheader.new.i
  %.36.024.i.epil.init = phi ptr [ %.6.i, %.51.endif.preheader.new.i ], [ %.84.7.i.1, %.52.loopexit.unr-lcssa.i.unr-lcssa ]
  %.31.023.i.epil.init = phi i64 [ 0, %.51.endif.preheader.new.i ], [ %.79.7.i.1, %.52.loopexit.unr-lcssa.i.unr-lcssa ]
  %.66.i.epil = load i8, ptr %.36.024.i.epil.init, align 1, !noalias !55
  %.69.i.epil = icmp ne i8 %.66.i.epil, 0
  %.78.i.epil = zext i1 %.69.i.epil to i64
  %.79.i.epil = add nuw nsw i64 %.31.023.i.epil.init, %.78.i.epil
  %.84.i.epil = getelementptr i8, ptr %.36.024.i.epil.init, i64 1
  %.66.1.i.epil = load i8, ptr %.84.i.epil, align 1, !noalias !55
  %.69.1.i.epil = icmp ne i8 %.66.1.i.epil, 0
  %.78.1.i.epil = zext i1 %.69.1.i.epil to i64
  %.79.1.i.epil = add nuw nsw i64 %.79.i.epil, %.78.1.i.epil
  %.84.1.i.epil = getelementptr i8, ptr %.36.024.i.epil.init, i64 2
  %.66.2.i.epil = load i8, ptr %.84.1.i.epil, align 1, !noalias !55
  %.69.2.i.epil = icmp ne i8 %.66.2.i.epil, 0
  %.78.2.i.epil = zext i1 %.69.2.i.epil to i64
  %.79.2.i.epil = add nuw nsw i64 %.79.1.i.epil, %.78.2.i.epil
  %.84.2.i.epil = getelementptr i8, ptr %.36.024.i.epil.init, i64 3
  %.66.3.i.epil = load i8, ptr %.84.2.i.epil, align 1, !noalias !55
  %.69.3.i.epil = icmp ne i8 %.66.3.i.epil, 0
  %.78.3.i.epil = zext i1 %.69.3.i.epil to i64
  %.79.3.i.epil = add nuw nsw i64 %.79.2.i.epil, %.78.3.i.epil
  %.84.3.i.epil = getelementptr i8, ptr %.36.024.i.epil.init, i64 4
  %.66.4.i.epil = load i8, ptr %.84.3.i.epil, align 1, !noalias !55
  %.69.4.i.epil = icmp ne i8 %.66.4.i.epil, 0
  %.78.4.i.epil = zext i1 %.69.4.i.epil to i64
  %.79.4.i.epil = add nuw nsw i64 %.79.3.i.epil, %.78.4.i.epil
  %.84.4.i.epil = getelementptr i8, ptr %.36.024.i.epil.init, i64 5
  %.66.5.i.epil = load i8, ptr %.84.4.i.epil, align 1, !noalias !55
  %.69.5.i.epil = icmp ne i8 %.66.5.i.epil, 0
  %.78.5.i.epil = zext i1 %.69.5.i.epil to i64
  %.79.5.i.epil = add nuw nsw i64 %.79.4.i.epil, %.78.5.i.epil
  %.84.5.i.epil = getelementptr i8, ptr %.36.024.i.epil.init, i64 6
  %.66.6.i.epil = load i8, ptr %.84.5.i.epil, align 1, !noalias !55
  %.69.6.i.epil = icmp ne i8 %.66.6.i.epil, 0
  %.78.6.i.epil = zext i1 %.69.6.i.epil to i64
  %.79.6.i.epil = add nuw nsw i64 %.79.5.i.epil, %.78.6.i.epil
  %.84.6.i.epil = getelementptr i8, ptr %.36.024.i.epil.init, i64 7
  %.66.7.i.epil = load i8, ptr %.84.6.i.epil, align 1, !noalias !55
  %.69.7.i.epil = icmp ne i8 %.66.7.i.epil, 0
  %.78.7.i.epil = zext i1 %.69.7.i.epil to i64
  %.79.7.i.epil = add nuw nsw i64 %.79.6.i.epil, %.78.7.i.epil
  br label %.52.loopexit.unr-lcssa.i

.52.loopexit.unr-lcssa.i:                         ; preds = %.51.endif.i.epil.preheader, %.52.loopexit.unr-lcssa.i.unr-lcssa
  %.79.7.i.lcssa = phi i64 [ %.79.7.i.1, %.52.loopexit.unr-lcssa.i.unr-lcssa ], [ %.79.7.i.epil, %.51.endif.i.epil.preheader ]
  %scevgep = getelementptr i8, ptr %.6.i, i64 %unroll_iter.i
  %lcmp.mod.not.i = icmp eq i64 %xtraiter.i, 0
  br i1 %lcmp.mod.not.i, label %for.end.endif, label %.51.endif.epil.i.preheader, !prof !58

.51.endif.epil.i.preheader:                       ; preds = %.52.loopexit.unr-lcssa.i, %.51.endif.preheader.i
  %.36.024.epil.i.ph = phi ptr [ %.6.i, %.51.endif.preheader.i ], [ %scevgep, %.52.loopexit.unr-lcssa.i ]
  %.31.023.epil.i.ph = phi i64 [ 0, %.51.endif.preheader.i ], [ %.79.7.i.lcssa, %.52.loopexit.unr-lcssa.i ]
  br label %.51.endif.epil.i

.51.endif.epil.i:                                 ; preds = %.51.endif.epil.i, %.51.endif.epil.i.preheader
  %lsr.iv = phi i64 [ 0, %.51.endif.epil.i.preheader ], [ %lsr.iv.next, %.51.endif.epil.i ]
  %.31.023.epil.i = phi i64 [ %.79.epil.i, %.51.endif.epil.i ], [ %.31.023.epil.i.ph, %.51.endif.epil.i.preheader ]
  %scevgep243 = getelementptr i8, ptr %.36.024.epil.i.ph, i64 %lsr.iv
  %.66.epil.i = load i8, ptr %scevgep243, align 1, !noalias !55
  %.69.epil.i = icmp ne i8 %.66.epil.i, 0
  %.78.epil.i = zext i1 %.69.epil.i to i64
  %.79.epil.i = add nuw nsw i64 %.31.023.epil.i, %.78.epil.i
  %lsr.iv.next = add i64 %lsr.iv, 1
  %epil.iter.cmp.not.i = icmp eq i64 %xtraiter.i, %lsr.iv.next
  br i1 %epil.iter.cmp.not.i, label %for.end.endif, label %.51.endif.epil.i, !prof !59, !llvm.loop !60

.51.endif.i:                                      ; preds = %.51.endif.i, %.51.endif.preheader.new.i.new
  %lsr.iv244 = phi i64 [ %lsr.iv.next245, %.51.endif.i ], [ %unroll_iter, %.51.endif.preheader.new.i.new ]
  %.36.024.i = phi ptr [ %.6.i, %.51.endif.preheader.new.i.new ], [ %.84.7.i.1, %.51.endif.i ]
  %.31.023.i = phi i64 [ 0, %.51.endif.preheader.new.i.new ], [ %.79.7.i.1, %.51.endif.i ]
  %.66.i = load i8, ptr %.36.024.i, align 1, !noalias !55
  %.69.i = icmp ne i8 %.66.i, 0
  %.78.i = zext i1 %.69.i to i64
  %.79.i = add nuw nsw i64 %.31.023.i, %.78.i
  %.84.i = getelementptr i8, ptr %.36.024.i, i64 1
  %.66.1.i = load i8, ptr %.84.i, align 1, !noalias !55
  %.69.1.i = icmp ne i8 %.66.1.i, 0
  %.78.1.i = zext i1 %.69.1.i to i64
  %.79.1.i = add nuw nsw i64 %.79.i, %.78.1.i
  %.84.1.i = getelementptr i8, ptr %.36.024.i, i64 2
  %.66.2.i = load i8, ptr %.84.1.i, align 1, !noalias !55
  %.69.2.i = icmp ne i8 %.66.2.i, 0
  %.78.2.i = zext i1 %.69.2.i to i64
  %.79.2.i = add nuw nsw i64 %.79.1.i, %.78.2.i
  %.84.2.i = getelementptr i8, ptr %.36.024.i, i64 3
  %.66.3.i = load i8, ptr %.84.2.i, align 1, !noalias !55
  %.69.3.i = icmp ne i8 %.66.3.i, 0
  %.78.3.i = zext i1 %.69.3.i to i64
  %.79.3.i = add nuw nsw i64 %.79.2.i, %.78.3.i
  %.84.3.i = getelementptr i8, ptr %.36.024.i, i64 4
  %.66.4.i = load i8, ptr %.84.3.i, align 1, !noalias !55
  %.69.4.i = icmp ne i8 %.66.4.i, 0
  %.78.4.i = zext i1 %.69.4.i to i64
  %.79.4.i = add nuw nsw i64 %.79.3.i, %.78.4.i
  %.84.4.i = getelementptr i8, ptr %.36.024.i, i64 5
  %.66.5.i = load i8, ptr %.84.4.i, align 1, !noalias !55
  %.69.5.i = icmp ne i8 %.66.5.i, 0
  %.78.5.i = zext i1 %.69.5.i to i64
  %.79.5.i = add nuw nsw i64 %.79.4.i, %.78.5.i
  %.84.5.i = getelementptr i8, ptr %.36.024.i, i64 6
  %.66.6.i = load i8, ptr %.84.5.i, align 1, !noalias !55
  %.69.6.i = icmp ne i8 %.66.6.i, 0
  %.78.6.i = zext i1 %.69.6.i to i64
  %.79.6.i = add nuw nsw i64 %.79.5.i, %.78.6.i
  %.84.6.i = getelementptr i8, ptr %.36.024.i, i64 7
  %.66.7.i = load i8, ptr %.84.6.i, align 1, !noalias !55
  %.69.7.i = icmp ne i8 %.66.7.i, 0
  %.78.7.i = zext i1 %.69.7.i to i64
  %.79.7.i = add nuw nsw i64 %.79.6.i, %.78.7.i
  %.84.7.i = getelementptr i8, ptr %.36.024.i, i64 8
  %.66.i.1 = load i8, ptr %.84.7.i, align 1, !noalias !55
  %.69.i.1 = icmp ne i8 %.66.i.1, 0
  %.78.i.1 = zext i1 %.69.i.1 to i64
  %.79.i.1 = add nuw nsw i64 %.79.7.i, %.78.i.1
  %.84.i.1 = getelementptr i8, ptr %.36.024.i, i64 9
  %.66.1.i.1 = load i8, ptr %.84.i.1, align 1, !noalias !55
  %.69.1.i.1 = icmp ne i8 %.66.1.i.1, 0
  %.78.1.i.1 = zext i1 %.69.1.i.1 to i64
  %.79.1.i.1 = add nuw nsw i64 %.79.i.1, %.78.1.i.1
  %.84.1.i.1 = getelementptr i8, ptr %.36.024.i, i64 10
  %.66.2.i.1 = load i8, ptr %.84.1.i.1, align 1, !noalias !55
  %.69.2.i.1 = icmp ne i8 %.66.2.i.1, 0
  %.78.2.i.1 = zext i1 %.69.2.i.1 to i64
  %.79.2.i.1 = add nuw nsw i64 %.79.1.i.1, %.78.2.i.1
  %.84.2.i.1 = getelementptr i8, ptr %.36.024.i, i64 11
  %.66.3.i.1 = load i8, ptr %.84.2.i.1, align 1, !noalias !55
  %.69.3.i.1 = icmp ne i8 %.66.3.i.1, 0
  %.78.3.i.1 = zext i1 %.69.3.i.1 to i64
  %.79.3.i.1 = add nuw nsw i64 %.79.2.i.1, %.78.3.i.1
  %.84.3.i.1 = getelementptr i8, ptr %.36.024.i, i64 12
  %.66.4.i.1 = load i8, ptr %.84.3.i.1, align 1, !noalias !55
  %.69.4.i.1 = icmp ne i8 %.66.4.i.1, 0
  %.78.4.i.1 = zext i1 %.69.4.i.1 to i64
  %.79.4.i.1 = add nuw nsw i64 %.79.3.i.1, %.78.4.i.1
  %.84.4.i.1 = getelementptr i8, ptr %.36.024.i, i64 13
  %.66.5.i.1 = load i8, ptr %.84.4.i.1, align 1, !noalias !55
  %.69.5.i.1 = icmp ne i8 %.66.5.i.1, 0
  %.78.5.i.1 = zext i1 %.69.5.i.1 to i64
  %.79.5.i.1 = add nuw nsw i64 %.79.4.i.1, %.78.5.i.1
  %.84.5.i.1 = getelementptr i8, ptr %.36.024.i, i64 14
  %.66.6.i.1 = load i8, ptr %.84.5.i.1, align 1, !noalias !55
  %.69.6.i.1 = icmp ne i8 %.66.6.i.1, 0
  %.78.6.i.1 = zext i1 %.69.6.i.1 to i64
  %.79.6.i.1 = add nuw nsw i64 %.79.5.i.1, %.78.6.i.1
  %.84.6.i.1 = getelementptr i8, ptr %.36.024.i, i64 15
  %.66.7.i.1 = load i8, ptr %.84.6.i.1, align 1, !noalias !55
  %.69.7.i.1 = icmp ne i8 %.66.7.i.1, 0
  %.78.7.i.1 = zext i1 %.69.7.i.1 to i64
  %.79.7.i.1 = add nuw nsw i64 %.79.6.i.1, %.78.7.i.1
  %.84.7.i.1 = getelementptr i8, ptr %.36.024.i, i64 16
  %lsr.iv.next245 = add i64 %lsr.iv244, -2
  %niter.ncmp.1 = icmp eq i64 %lsr.iv.next245, 0
  br i1 %niter.ncmp.1, label %.52.loopexit.unr-lcssa.i.unr-lcssa, label %.51.endif.i, !prof !62, !llvm.loop !63

for.body.endif.endif.endif.endif.endif.endif:     ; preds = %for.body.endif.endif.endif.endif.endif.endif, %for.body.endif.endif.endif.endif.endif.endif.preheader241
  %loop.index36 = phi i64 [ %.285.3, %for.body.endif.endif.endif.endif.endif.endif ], [ %loop.index36.unr, %for.body.endif.endif.endif.endif.endif.endif.preheader241 ]
  %.217 = load i8, ptr %arg.m1.4, align 1
  %.220 = icmp ne i8 %.217, 0
  %.235 = load i8, ptr %arg.m2.4, align 1
  %.238 = icmp ne i8 %.235, 0
  %.24.i35 = xor i1 %.220, %.238
  %.25.i36 = zext i1 %.24.i35 to i8
  %sunkaddr465 = getelementptr i8, ptr %.6.i, i64 %loop.index36
  store i8 %.25.i36, ptr %sunkaddr465, align 1
  %.217.1 = load i8, ptr %arg.m1.4, align 1
  %.220.1 = icmp ne i8 %.217.1, 0
  %.235.1 = load i8, ptr %arg.m2.4, align 1
  %.238.1 = icmp ne i8 %.235.1, 0
  %.24.i35.1 = xor i1 %.220.1, %.238.1
  %.25.i36.1 = zext i1 %.24.i35.1 to i8
  %sunkaddr466 = getelementptr i8, ptr %.6.i, i64 %loop.index36
  %sunkaddr467 = getelementptr i8, ptr %sunkaddr466, i64 1
  store i8 %.25.i36.1, ptr %sunkaddr467, align 1
  %.217.2 = load i8, ptr %arg.m1.4, align 1
  %.220.2 = icmp ne i8 %.217.2, 0
  %.235.2 = load i8, ptr %arg.m2.4, align 1
  %.238.2 = icmp ne i8 %.235.2, 0
  %.24.i35.2 = xor i1 %.220.2, %.238.2
  %.25.i36.2 = zext i1 %.24.i35.2 to i8
  %sunkaddr468 = getelementptr i8, ptr %.6.i, i64 %loop.index36
  %sunkaddr469 = getelementptr i8, ptr %sunkaddr468, i64 2
  store i8 %.25.i36.2, ptr %sunkaddr469, align 1
  %.217.3 = load i8, ptr %arg.m1.4, align 1
  %.220.3 = icmp ne i8 %.217.3, 0
  %.235.3 = load i8, ptr %arg.m2.4, align 1
  %.238.3 = icmp ne i8 %.235.3, 0
  %.24.i35.3 = xor i1 %.220.3, %.238.3
  %.25.i36.3 = zext i1 %.24.i35.3 to i8
  %sunkaddr470 = getelementptr i8, ptr %.6.i, i64 %loop.index36
  %sunkaddr471 = getelementptr i8, ptr %sunkaddr470, i64 3
  store i8 %.25.i36.3, ptr %sunkaddr471, align 1
  %.285.3 = add nuw nsw i64 %loop.index36, 4
  %exitcond.not.3 = icmp eq i64 %dest_shape.1, %.285.3
  br i1 %exitcond.not.3, label %.51.endif.preheader.i, label %for.body.endif.endif.endif.endif.endif.endif, !llvm.loop !65

for.end.endif:                                    ; preds = %.51.endif.epil.i, %.52.loopexit.unr-lcssa.i, %B0.endif.endif.endif.endif.endif.endif
  %.31.0.lcssa.i = phi i64 [ 0, %B0.endif.endif.endif.endif.endif.endif ], [ %.79.7.i.lcssa, %.52.loopexit.unr-lcssa.i ], [ %.79.epil.i, %.51.endif.epil.i ]
  tail call void @NRT_decref(ptr %arg.m2.0)
  tail call void @NRT_decref(ptr %arg.m1.0)
  tail call void @NRT_decref(ptr nonnull %.7.i.i)
  store i64 %.31.0.lcssa.i, ptr %retptr, align 8
  br label %common.ret
}
