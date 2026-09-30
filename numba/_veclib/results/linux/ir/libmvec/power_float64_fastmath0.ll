; ModuleID = 'make_kernel.<locals>.kernel'
source_filename = "<string>"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@".const.make_kernel.<locals>.kernel" = internal constant [28 x i8] c"make_kernel.<locals>.kernel\00"
@_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE = common local_unnamed_addr global ptr null
@".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE" = internal constant [218 x i8] c"missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE\00"
@PyExc_TypeError = external global i8
@".const.can't unbox array from PyObject into native value.  The object maybe of a different type" = internal constant [89 x i8] c"can't unbox array from PyObject into native value.  The object maybe of a different type\00"
@_Py_NoneStruct = external global i8
@PyExc_RuntimeError = external global i8
@llvm.compiler.used = appending global [2 x ptr] [ptr @_ZGVbN2vv_pow, ptr @_ZGVdN4vv_pow], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define noundef i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr noalias writeonly captures(none) %retptr, ptr noalias readnone captures(none) %excinfo, ptr readnone captures(none) %arg.x.0, ptr readnone captures(none) %arg.x.1, i64 %arg.x.2, i64 %arg.x.3, ptr readonly captures(none) %arg.x.4, i64 %arg.x.5.0, i64 %arg.x.6.0, ptr readnone captures(none) %arg.y.0, ptr readnone captures(none) %arg.y.1, i64 %arg.y.2, i64 %arg.y.3, ptr readonly captures(none) %arg.y.4, i64 %arg.y.5.0, i64 %arg.y.6.0, ptr readnone captures(none) %arg.out.0, ptr readnone captures(none) %arg.out.1, i64 %arg.out.2, i64 %arg.out.3, ptr writeonly captures(none) %arg.out.4, i64 %arg.out.5.0, i64 %arg.out.6.0) local_unnamed_addr #0 {
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
  %const = bitcast i64 9223372036854775792 to i64
  %min.iters.check5 = icmp ult i64 %arg.x.2, 16
  br i1 %min.iters.check5, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %arg.x.2, %const
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %sunkaddr = mul i64 %index, 8
  %sunkaddr98 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr
  %wide.load = load <4 x double>, ptr %sunkaddr98, align 8
  %sunkaddr99 = mul i64 %index, 8
  %sunkaddr100 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr99
  %sunkaddr101 = getelementptr i8, ptr %sunkaddr100, i64 32
  %wide.load6 = load <4 x double>, ptr %sunkaddr101, align 8
  %sunkaddr102 = mul i64 %index, 8
  %sunkaddr103 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr102
  %sunkaddr104 = getelementptr i8, ptr %sunkaddr103, i64 64
  %wide.load7 = load <4 x double>, ptr %sunkaddr104, align 8
  %sunkaddr105 = mul i64 %index, 8
  %sunkaddr106 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr105
  %sunkaddr107 = getelementptr i8, ptr %sunkaddr106, i64 96
  %wide.load8 = load <4 x double>, ptr %sunkaddr107, align 8
  %sunkaddr108 = mul i64 %index, 8
  %sunkaddr109 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr108
  %wide.load9 = load <4 x double>, ptr %sunkaddr109, align 8
  %sunkaddr110 = mul i64 %index, 8
  %sunkaddr111 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr110
  %sunkaddr112 = getelementptr i8, ptr %sunkaddr111, i64 32
  %wide.load10 = load <4 x double>, ptr %sunkaddr112, align 8
  %sunkaddr113 = mul i64 %index, 8
  %sunkaddr114 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr113
  %sunkaddr115 = getelementptr i8, ptr %sunkaddr114, i64 64
  %wide.load11 = load <4 x double>, ptr %sunkaddr115, align 8
  %sunkaddr116 = mul i64 %index, 8
  %sunkaddr117 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr116
  %sunkaddr118 = getelementptr i8, ptr %sunkaddr117, i64 96
  %wide.load12 = load <4 x double>, ptr %sunkaddr118, align 8
  %5 = tail call <4 x double> @_ZGVdN4vv_pow(<4 x double> %wide.load, <4 x double> %wide.load9)
  %6 = tail call <4 x double> @_ZGVdN4vv_pow(<4 x double> %wide.load6, <4 x double> %wide.load10)
  %7 = tail call <4 x double> @_ZGVdN4vv_pow(<4 x double> %wide.load7, <4 x double> %wide.load11)
  %8 = tail call <4 x double> @_ZGVdN4vv_pow(<4 x double> %wide.load8, <4 x double> %wide.load12)
  %sunkaddr119 = mul i64 %index, 8
  %sunkaddr120 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr119
  store <4 x double> %5, ptr %sunkaddr120, align 8
  %sunkaddr121 = mul i64 %index, 8
  %sunkaddr122 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr121
  %sunkaddr123 = getelementptr i8, ptr %sunkaddr122, i64 32
  store <4 x double> %6, ptr %sunkaddr123, align 8
  %sunkaddr124 = mul i64 %index, 8
  %sunkaddr125 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr124
  %sunkaddr126 = getelementptr i8, ptr %sunkaddr125, i64 64
  store <4 x double> %7, ptr %sunkaddr126, align 8
  %sunkaddr127 = mul i64 %index, 8
  %sunkaddr128 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr127
  %sunkaddr129 = getelementptr i8, ptr %sunkaddr128, i64 96
  store <4 x double> %8, ptr %sunkaddr129, align 8
  %index.next = add nuw i64 %index, 16
  %9 = icmp eq i64 %n.vec, %index.next
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !0

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %arg.x.2, %n.vec
  br i1 %cmp.n, label %B92, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %10 = and i64 %arg.x.2, 12
  %min.epilog.iters.check = icmp eq i64 %10, 0
  br i1 %min.epilog.iters.check, label %B52.preheader, label %vec.epilog.ph, !prof !3

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %const_mat = add i64 %const, 12
  %n.vec14 = and i64 %arg.x.2, %const_mat
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index15 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next18, %vec.epilog.vector.body ]
  %11 = shl i64 %index15, 3
  %scevgep73 = getelementptr i8, ptr %arg.x.4, i64 %11
  %wide.load16 = load <4 x double>, ptr %scevgep73, align 8
  %12 = shl i64 %index15, 3
  %scevgep72 = getelementptr i8, ptr %arg.y.4, i64 %12
  %wide.load17 = load <4 x double>, ptr %scevgep72, align 8
  %13 = tail call <4 x double> @_ZGVdN4vv_pow(<4 x double> %wide.load16, <4 x double> %wide.load17)
  %14 = shl i64 %index15, 3
  %scevgep71 = getelementptr i8, ptr %arg.out.4, i64 %14
  store <4 x double> %13, ptr %scevgep71, align 8
  %index.next18 = add nuw i64 %index15, 4
  %15 = icmp eq i64 %n.vec14, %index.next18
  br i1 %15, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !4

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n19 = icmp eq i64 %arg.x.2, %n.vec14
  br i1 %cmp.n19, label %B92, label %B52.preheader

B52.preheader:                                    ; preds = %vector.memcheck, %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %.140111113.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec14, %vec.epilog.middle.block ]
  %16 = sub nsw i64 %arg.x.2, %.140111113.ph
  %xtraiter = and i64 %16, 7
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %B52.prol.loopexit, label %B52.prol.preheader

B52.prol.preheader:                               ; preds = %B52.preheader
  br label %B52.prol

B52.prol:                                         ; preds = %B52.prol.preheader, %B52.prol
  %lsr.iv = phi i64 [ %xtraiter, %B52.prol.preheader ], [ %lsr.iv.next, %B52.prol ]
  %.140111113.prol = phi i64 [ %.147.prol, %B52.prol ], [ %.140111113.ph, %B52.prol.preheader ]
  %.147.prol = add nuw i64 %.140111113.prol, 1
  %17 = shl i64 %.140111113.prol, 3
  %scevgep70 = getelementptr i8, ptr %arg.x.4, i64 %17
  %.201.prol = load double, ptr %scevgep70, align 8
  %18 = shl i64 %.140111113.prol, 3
  %scevgep69 = getelementptr i8, ptr %arg.y.4, i64 %18
  %.231.prol = load double, ptr %scevgep69, align 8
  %.241.le.prol = tail call double @llvm.pow.f64(double %.201.prol, double %.231.prol) #6
  %19 = shl i64 %.140111113.prol, 3
  %scevgep68 = getelementptr i8, ptr %arg.out.4, i64 %19
  store double %.241.le.prol, ptr %scevgep68, align 8
  %lsr.iv.next = add nsw i64 %lsr.iv, -1
  %prol.iter.cmp.not = icmp eq i64 %lsr.iv.next, 0
  br i1 %prol.iter.cmp.not, label %B52.prol.loopexit, label %B52.prol, !llvm.loop !5

B52.prol.loopexit:                                ; preds = %B52.prol, %B52.preheader
  %.140111113.unr = phi i64 [ %.140111113.ph, %B52.preheader ], [ %.147.prol, %B52.prol ]
  %20 = sub nsw i64 %.140111113.ph, %arg.x.2
  %21 = icmp ugt i64 %20, -8
  br i1 %21, label %B92, label %B52.preheader20

B52.preheader20:                                  ; preds = %B52.prol.loopexit
  br label %B52

B52:                                              ; preds = %B52.preheader20, %B52
  %.140111113 = phi i64 [ %.147.7, %B52 ], [ %.140111113.unr, %B52.preheader20 ]
  %sunkaddr130 = mul i64 %.140111113, 8
  %sunkaddr131 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr130
  %.201 = load double, ptr %sunkaddr131, align 8
  %sunkaddr132 = mul i64 %.140111113, 8
  %sunkaddr133 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr132
  %.231 = load double, ptr %sunkaddr133, align 8
  %.241.le = tail call double @llvm.pow.f64(double %.201, double %.231) #6
  %sunkaddr134 = mul i64 %.140111113, 8
  %sunkaddr135 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr134
  store double %.241.le, ptr %sunkaddr135, align 8
  %sunkaddr136 = mul i64 %.140111113, 8
  %sunkaddr137 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr136
  %sunkaddr138 = getelementptr i8, ptr %sunkaddr137, i64 8
  %.201.1 = load double, ptr %sunkaddr138, align 8
  %sunkaddr139 = mul i64 %.140111113, 8
  %sunkaddr140 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr139
  %sunkaddr141 = getelementptr i8, ptr %sunkaddr140, i64 8
  %.231.1 = load double, ptr %sunkaddr141, align 8
  %.241.le.1 = tail call double @llvm.pow.f64(double %.201.1, double %.231.1) #6
  %sunkaddr142 = mul i64 %.140111113, 8
  %sunkaddr143 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr142
  %sunkaddr144 = getelementptr i8, ptr %sunkaddr143, i64 8
  store double %.241.le.1, ptr %sunkaddr144, align 8
  %sunkaddr145 = mul i64 %.140111113, 8
  %sunkaddr146 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr145
  %sunkaddr147 = getelementptr i8, ptr %sunkaddr146, i64 16
  %.201.2 = load double, ptr %sunkaddr147, align 8
  %sunkaddr148 = mul i64 %.140111113, 8
  %sunkaddr149 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr148
  %sunkaddr150 = getelementptr i8, ptr %sunkaddr149, i64 16
  %.231.2 = load double, ptr %sunkaddr150, align 8
  %.241.le.2 = tail call double @llvm.pow.f64(double %.201.2, double %.231.2) #6
  %sunkaddr151 = mul i64 %.140111113, 8
  %sunkaddr152 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr151
  %sunkaddr153 = getelementptr i8, ptr %sunkaddr152, i64 16
  store double %.241.le.2, ptr %sunkaddr153, align 8
  %sunkaddr154 = mul i64 %.140111113, 8
  %sunkaddr155 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr154
  %sunkaddr156 = getelementptr i8, ptr %sunkaddr155, i64 24
  %.201.3 = load double, ptr %sunkaddr156, align 8
  %sunkaddr157 = mul i64 %.140111113, 8
  %sunkaddr158 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr157
  %sunkaddr159 = getelementptr i8, ptr %sunkaddr158, i64 24
  %.231.3 = load double, ptr %sunkaddr159, align 8
  %.241.le.3 = tail call double @llvm.pow.f64(double %.201.3, double %.231.3) #6
  %sunkaddr160 = mul i64 %.140111113, 8
  %sunkaddr161 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr160
  %sunkaddr162 = getelementptr i8, ptr %sunkaddr161, i64 24
  store double %.241.le.3, ptr %sunkaddr162, align 8
  %sunkaddr163 = mul i64 %.140111113, 8
  %sunkaddr164 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr163
  %sunkaddr165 = getelementptr i8, ptr %sunkaddr164, i64 32
  %.201.4 = load double, ptr %sunkaddr165, align 8
  %sunkaddr166 = mul i64 %.140111113, 8
  %sunkaddr167 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr166
  %sunkaddr168 = getelementptr i8, ptr %sunkaddr167, i64 32
  %.231.4 = load double, ptr %sunkaddr168, align 8
  %.241.le.4 = tail call double @llvm.pow.f64(double %.201.4, double %.231.4) #6
  %sunkaddr169 = mul i64 %.140111113, 8
  %sunkaddr170 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr169
  %sunkaddr171 = getelementptr i8, ptr %sunkaddr170, i64 32
  store double %.241.le.4, ptr %sunkaddr171, align 8
  %sunkaddr172 = mul i64 %.140111113, 8
  %sunkaddr173 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr172
  %sunkaddr174 = getelementptr i8, ptr %sunkaddr173, i64 40
  %.201.5 = load double, ptr %sunkaddr174, align 8
  %sunkaddr175 = mul i64 %.140111113, 8
  %sunkaddr176 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr175
  %sunkaddr177 = getelementptr i8, ptr %sunkaddr176, i64 40
  %.231.5 = load double, ptr %sunkaddr177, align 8
  %.241.le.5 = tail call double @llvm.pow.f64(double %.201.5, double %.231.5) #6
  %sunkaddr178 = mul i64 %.140111113, 8
  %sunkaddr179 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr178
  %sunkaddr180 = getelementptr i8, ptr %sunkaddr179, i64 40
  store double %.241.le.5, ptr %sunkaddr180, align 8
  %sunkaddr181 = mul i64 %.140111113, 8
  %sunkaddr182 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr181
  %sunkaddr183 = getelementptr i8, ptr %sunkaddr182, i64 48
  %.201.6 = load double, ptr %sunkaddr183, align 8
  %sunkaddr184 = mul i64 %.140111113, 8
  %sunkaddr185 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr184
  %sunkaddr186 = getelementptr i8, ptr %sunkaddr185, i64 48
  %.231.6 = load double, ptr %sunkaddr186, align 8
  %.241.le.6 = tail call double @llvm.pow.f64(double %.201.6, double %.231.6) #6
  %sunkaddr187 = mul i64 %.140111113, 8
  %sunkaddr188 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr187
  %sunkaddr189 = getelementptr i8, ptr %sunkaddr188, i64 48
  store double %.241.le.6, ptr %sunkaddr189, align 8
  %.147.7 = add nuw nsw i64 %.140111113, 8
  %sunkaddr190 = mul i64 %.140111113, 8
  %sunkaddr191 = getelementptr i8, ptr %arg.x.4, i64 %sunkaddr190
  %sunkaddr192 = getelementptr i8, ptr %sunkaddr191, i64 56
  %.201.7 = load double, ptr %sunkaddr192, align 8
  %sunkaddr193 = mul i64 %.140111113, 8
  %sunkaddr194 = getelementptr i8, ptr %arg.y.4, i64 %sunkaddr193
  %sunkaddr195 = getelementptr i8, ptr %sunkaddr194, i64 56
  %.231.7 = load double, ptr %sunkaddr195, align 8
  %.241.le.7 = tail call double @llvm.pow.f64(double %.201.7, double %.231.7) #6
  %sunkaddr196 = mul i64 %.140111113, 8
  %sunkaddr197 = getelementptr i8, ptr %arg.out.4, i64 %sunkaddr196
  %sunkaddr198 = getelementptr i8, ptr %sunkaddr197, i64 56
  store double %.241.le.7, ptr %sunkaddr198, align 8
  %exitcond.not.7 = icmp eq i64 %arg.x.2, %.147.7
  br i1 %exitcond.not.7, label %B92, label %B52, !llvm.loop !7

B92:                                              ; preds = %B52, %B52.prol.loopexit, %middle.block, %vec.epilog.middle.block, %B0.endif
  store ptr null, ptr %retptr, align 8
  ret i32 0
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.pow.f64(double, double) #1

define noundef ptr @_ZN7cpython8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr readnone captures(none) %py_closure, ptr %py_args, ptr readnone captures(none) %py_kws) local_unnamed_addr {
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
  %.13 = load ptr, ptr @_ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE, align 8
  %.16 = icmp eq ptr %.13, null
  br i1 %.16, label %entry.endif.if, label %entry.endif.endif, !prof !8

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_RuntimeError, ptr nonnull @".const.missing Environment: _ZN08NumbaEnv8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE")
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
  br i1 %.78, label %entry.endif.endif.endif.endif.endif.endif.if, label %entry.endif.endif.endif.endif.endif.endif.endif.endif, !prof !8

entry.endif.endif.endif.endif.endif.endif.if:     ; preds = %entry.endif.endif.endif.endif.endif.endif
  call void @PyErr_SetString(ptr nonnull @PyExc_TypeError, ptr nonnull @".const.can't unbox array from PyObject into native value.  The object maybe of a different type")
  call void @NRT_decref(ptr %.59.fca.0.load)
  br label %arg0.err

entry.endif.endif.endif.endif.endif.endif.endif.endif: ; preds = %entry.endif.endif.endif.endif.endif.endif
  %.82.fca.0.load = load ptr, ptr %.67, align 8
  %sunkaddr6 = getelementptr inbounds i8, ptr %.67, i64 32
  %.82.fca.4.load = load ptr, ptr %sunkaddr6, align 8
  %.99 = call i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr nonnull %.89, ptr nonnull poison, ptr poison, ptr poison, i64 %.36.fca.2.load, i64 poison, ptr %.36.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.59.fca.4.load, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %.82.fca.4.load, i64 poison, i64 poison) #4
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
define ptr @cfunc._ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE({ ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3) local_unnamed_addr #3 {
entry:
  %.5 = alloca ptr, align 8
  store ptr null, ptr %.5, align 8
  %extracted.nitems = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 2
  %extracted.data = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.1, 4
  %extracted.data.1 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.2, 4
  %extracted.data.2 = extractvalue { ptr, ptr, i64, i64, ptr, [1 x i64], [1 x i64] } %.3, 4
  %.15 = call i32 @_ZN8__main__11make_kernel12_3clocals_3e6kernelB3v42B38c8tJTIeFIjxB2IKSgI4CrvQClQZ6FczSBAA_3dE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE5ArrayIdLi1E1C7mutable7alignedE(ptr nonnull %.5, ptr nonnull poison, ptr poison, ptr poison, i64 %extracted.nitems, i64 poison, ptr %extracted.data, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.1, i64 poison, i64 poison, ptr poison, ptr poison, i64 poison, i64 poison, ptr %extracted.data.2, i64 poison, i64 poison) #4
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
declare <2 x double> @_ZGVbN2vv_pow(<2 x double>, <2 x double>) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @_ZGVdN4vv_pow(<4 x double>, <4 x double>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) }
attributes #4 = { noinline }
attributes #5 = { nounwind }
attributes #6 = { "vector-function-abi-variant"="_ZGV_LLVM_N2vv_llvm.pow.f64(_ZGVbN2vv_pow),_ZGV_LLVM_N4vv_llvm.pow.f64(_ZGVdN4vv_pow)" }

!0 = distinct !{!0, !1, !2}
!1 = !{!"llvm.loop.isvectorized", i32 1}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"branch_weights", i32 4, i32 12}
!4 = distinct !{!4, !1, !2}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !1}
!8 = !{!"branch_weights", i32 1, i32 99}
