; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d,+zvfh,+v -target-abi=ilp32d \
; RUN:     -verify-machineinstrs < %s | FileCheck %s
; RUN: llc -mtriple=riscv64 -mattr=+d,+zvfh,+v -target-abi=lp64d \
; RUN:     -verify-machineinstrs < %s | FileCheck %s

define <2 x i1> @isnan_v2f16(<2 x half> %x, <2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8, v0.t
; CHECK-NEXT:    li a0, 768
; CHECK-NEXT:    vand.vx v8, v8, a0, v0.t
; CHECK-NEXT:    vmsne.vi v0, v8, 0, v0.t
; CHECK-NEXT:    ret
  %1 = call <2 x i1> @llvm.vp.is.fpclass.v2f16(<2 x half> %x, i32 3, <2 x i1> %m, i32 %evl)  ; nan
  ret <2 x i1> %1
}

define <2 x i1> @isnan_v2f16_unmasked(<2 x half> %x, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v2f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    li a0, 768
; CHECK-NEXT:    vand.vx v8, v8, a0
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %1 = call <2 x i1> @llvm.vp.is.fpclass.v2f16(<2 x half> %x, i32 3, <2 x i1> splat (i1 true), i32 %evl)  ; nan
  ret <2 x i1> %1
}

define <2 x i1> @isnan_v2f32(<2 x float> %x, <2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8, v0.t
; CHECK-NEXT:    li a0, 927
; CHECK-NEXT:    vand.vx v8, v8, a0, v0.t
; CHECK-NEXT:    vmsne.vi v0, v8, 0, v0.t
; CHECK-NEXT:    ret
  %1 = call <2 x i1> @llvm.vp.is.fpclass.v2f32(<2 x float> %x, i32 639, <2 x i1> %m, i32 %evl)
  ret <2 x i1> %1
}

define <2 x i1> @isnan_v2f32_unmasked(<2 x float> %x, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v2f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    li a0, 927
; CHECK-NEXT:    vand.vx v8, v8, a0
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %1 = call <2 x i1> @llvm.vp.is.fpclass.v2f32(<2 x float> %x, i32 639, <2 x i1> splat (i1 true), i32 %evl)
  ret <2 x i1> %1
}

define <4 x i1> @isnan_v4f32(<4 x float> %x, <4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8, v0.t
; CHECK-NEXT:    li a0, 768
; CHECK-NEXT:    vand.vx v8, v8, a0, v0.t
; CHECK-NEXT:    vmsne.vi v0, v8, 0, v0.t
; CHECK-NEXT:    ret
  %1 = call <4 x i1> @llvm.vp.is.fpclass.v4f32(<4 x float> %x, i32 3, <4 x i1> %m, i32 %evl)  ; nan
  ret <4 x i1> %1
}

define <4 x i1> @isnan_v4f32_unmasked(<4 x float> %x, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v4f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    li a0, 768
; CHECK-NEXT:    vand.vx v8, v8, a0
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %1 = call <4 x i1> @llvm.vp.is.fpclass.v4f32(<4 x float> %x, i32 3, <4 x i1> splat (i1 true), i32 %evl)  ; nan
  ret <4 x i1> %1
}

define <8 x i1> @isnan_v8f32(<8 x float> %x,  <8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, ma
; CHECK-NEXT:    vfclass.v v10, v8, v0.t
; CHECK-NEXT:    li a0, 512
; CHECK-NEXT:    vmseq.vx v8, v10, a0, v0.t
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    ret
  %1 = call <8 x i1> @llvm.vp.is.fpclass.v8f32(<8 x float> %x, i32 2, <8 x i1> %m, i32 %evl)
  ret <8 x i1> %1
}

define <8 x i1> @isnan_v8f32_unmasked(<8 x float> %x, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v8f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    li a0, 512
; CHECK-NEXT:    vmseq.vx v0, v8, a0
; CHECK-NEXT:    ret
  %1 = call <8 x i1> @llvm.vp.is.fpclass.v8f32(<8 x float> %x, i32 2, <8 x i1> splat (i1 true), i32 %evl)
  ret <8 x i1> %1
}

define <16 x i1> @isnan_v16f32(<16 x float> %x, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v16f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, ma
; CHECK-NEXT:    vfclass.v v12, v8, v0.t
; CHECK-NEXT:    li a0, 256
; CHECK-NEXT:    vmseq.vx v8, v12, a0, v0.t
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    ret
  %1 = call <16 x i1> @llvm.vp.is.fpclass.v16f32(<16 x float> %x, i32 1, <16 x i1> %m, i32 %evl)
  ret <16 x i1> %1
}

define <16 x i1> @isnan_v16f32_unmasked(<16 x float> %x, i32 zeroext %evl) {
; CHECK-LABEL: isnan_v16f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    li a0, 256
; CHECK-NEXT:    vmseq.vx v0, v8, a0
; CHECK-NEXT:    ret
  %1 = call <16 x i1> @llvm.vp.is.fpclass.v16f32(<16 x float> %x, i32 1, <16 x i1> splat (i1 true), i32 %evl)
  ret <16 x i1> %1
}

define <2 x i1> @isnormal_v2f64(<2 x double> %x, <2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isnormal_v2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8, v0.t
; CHECK-NEXT:    li a0, 129
; CHECK-NEXT:    vand.vx v8, v8, a0, v0.t
; CHECK-NEXT:    vmsne.vi v0, v8, 0, v0.t
; CHECK-NEXT:    ret
  %1 = call <2 x i1> @llvm.vp.is.fpclass.v2f64(<2 x double> %x, i32 516, <2 x i1> %m, i32 %evl) ; 0x204 = "inf"
  ret <2 x i1> %1
}

define <2 x i1> @isnormal_v2f64_unmasked(<2 x double> %x, i32 zeroext %evl) {
; CHECK-LABEL: isnormal_v2f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    li a0, 129
; CHECK-NEXT:    vand.vx v8, v8, a0
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %1 = call <2 x i1> @llvm.vp.is.fpclass.v2f64(<2 x double> %x, i32 516, <2 x i1> splat (i1 true), i32 %evl) ; 0x204 = "inf"
  ret <2 x i1> %1
}

define <4 x i1> @isposinf_v4f64(<4 x double> %x, <4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isposinf_v4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vfclass.v v10, v8, v0.t
; CHECK-NEXT:    li a0, 128
; CHECK-NEXT:    vmseq.vx v8, v10, a0, v0.t
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    ret
  %1 = call <4 x i1> @llvm.vp.is.fpclass.v4f64(<4 x double> %x, i32 512, <4 x i1> %m, i32 %evl) ; 0x200 = "+inf"
  ret <4 x i1> %1
}

define <4 x i1> @isposinf_v4f64_unmasked(<4 x double> %x, i32 zeroext %evl) {
; CHECK-LABEL: isposinf_v4f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    li a0, 128
; CHECK-NEXT:    vmseq.vx v0, v8, a0
; CHECK-NEXT:    ret
  %1 = call <4 x i1> @llvm.vp.is.fpclass.v4f64(<4 x double> %x, i32 512, <4 x i1> splat (i1 true), i32 %evl) ; 0x200 = "+inf"
  ret <4 x i1> %1
}

define <8 x i1> @isneginf_v8f64(<8 x double> %x, <8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isneginf_v8f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, ma
; CHECK-NEXT:    vfclass.v v12, v8, v0.t
; CHECK-NEXT:    vmseq.vi v8, v12, 1, v0.t
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    ret
  %1 = call <8 x i1> @llvm.vp.is.fpclass.v8f64(<8 x double> %x, i32 4, <8 x i1> %m, i32 %evl) ; "-inf"
  ret <8 x i1> %1
}

define <8 x i1> @isneginf_v8f64_unmasked(<8 x double> %x, i32 zeroext %evl) {
; CHECK-LABEL: isneginf_v8f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    vmseq.vi v0, v8, 1
; CHECK-NEXT:    ret
  %1 = call <8 x i1> @llvm.vp.is.fpclass.v8f64(<8 x double> %x, i32 4, <8 x i1> splat (i1 true), i32 %evl) ; "-inf"
  ret <8 x i1> %1
}

define <16 x i1> @isfinite_v16f64(<16 x double> %x, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isfinite_v16f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8, v0.t
; CHECK-NEXT:    li a0, 126
; CHECK-NEXT:    vand.vx v16, v8, a0, v0.t
; CHECK-NEXT:    vmsne.vi v8, v16, 0, v0.t
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    ret
  %1 = call <16 x i1> @llvm.vp.is.fpclass.v16f64(<16 x double> %x, i32 504, <16 x i1> %m, i32 %evl) ; 0x1f8 = "finite"
  ret <16 x i1> %1
}

define <16 x i1> @isfinite_v16f64_unmasked(<16 x double> %x, i32 zeroext %evl) {
; CHECK-LABEL: isfinite_v16f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    li a0, 126
; CHECK-NEXT:    vand.vx v8, v8, a0
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %1 = call <16 x i1> @llvm.vp.is.fpclass.v16f64(<16 x double> %x, i32 504, <16 x i1> splat (i1 true), i32 %evl) ; 0x1f8 = "finite"
  ret <16 x i1> %1
}

define <16 x i1> @isposfinite_v16f64(<16 x double> %x, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isposfinite_v16f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8, v0.t
; CHECK-NEXT:    li a0, 112
; CHECK-NEXT:    vand.vx v16, v8, a0, v0.t
; CHECK-NEXT:    vmsne.vi v8, v16, 0, v0.t
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    ret
  %1 = call <16 x i1> @llvm.vp.is.fpclass.v16f64(<16 x double> %x, i32 448, <16 x i1> %m, i32 %evl) ; 0x1c0 = "+finite"
  ret <16 x i1> %1
}

define <16 x i1> @isnegfinite_v16f64_unmasked(<16 x double> %x, i32 zeroext %evl) {
; CHECK-LABEL: isnegfinite_v16f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    vand.vi v8, v8, 14
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %1 = call <16 x i1> @llvm.vp.is.fpclass.v16f64(<16 x double> %x, i32 56, <16 x i1> splat (i1 true), i32 %evl) ; 0x38 = "-finite"
  ret <16 x i1> %1
}

define <16 x i1> @isnotfinite_v16f64(<16 x double> %x, <16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: isnotfinite_v16f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8, v0.t
; CHECK-NEXT:    li a0, 897
; CHECK-NEXT:    vand.vx v16, v8, a0, v0.t
; CHECK-NEXT:    vmsne.vi v8, v16, 0, v0.t
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    ret
  %1 = call <16 x i1> @llvm.vp.is.fpclass.v16f64(<16 x double> %x, i32 519, <16 x i1> %m, i32 %evl) ; 0x207 = "inf|nan"
  ret <16 x i1> %1
}

define <16 x i1> @isnotfinite_v16f64_unmasked(<16 x double> %x, i32 zeroext %evl) {
; CHECK-LABEL: isnotfinite_v16f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, ma
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    li a0, 897
; CHECK-NEXT:    vand.vx v8, v8, a0
; CHECK-NEXT:    vmsne.vi v0, v8, 0
; CHECK-NEXT:    ret
  %1 = call <16 x i1> @llvm.vp.is.fpclass.v16f64(<16 x double> %x, i32 519, <16 x i1> splat (i1 true), i32 %evl) ; 0x207 = "inf|nan"
  ret <16 x i1> %1
}

declare <2 x i1> @llvm.vp.is.fpclass.v2f16(<2 x half>, i32, <2 x i1>, i32)
declare <2 x i1> @llvm.vp.is.fpclass.v2f32(<2 x float>, i32, <2 x i1>, i32)
declare <4 x i1> @llvm.vp.is.fpclass.v4f32(<4 x float>, i32, <4 x i1>, i32)
declare <8 x i1> @llvm.vp.is.fpclass.v8f32(<8 x float>, i32, <8 x i1>, i32)
declare <16 x i1> @llvm.vp.is.fpclass.v16f32(<16 x float>, i32, <16 x i1>, i32)
declare <2 x i1> @llvm.vp.is.fpclass.v2f64(<2 x double>, i32, <2 x i1>, i32)
declare <4 x i1> @llvm.vp.is.fpclass.v4f64(<4 x double>, i32, <4 x i1>, i32)
declare <8 x i1> @llvm.vp.is.fpclass.v8f64(<8 x double>, i32, <8 x i1>, i32)
declare <16 x i1> @llvm.vp.is.fpclass.v16f64(<16 x double>, i32, <16 x i1>, i32)
