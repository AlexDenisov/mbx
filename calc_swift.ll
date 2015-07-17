; ModuleID = 'calc_swift.ll'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin14.4.0"

%Sd = type <{ double }>
%VSs5Int32 = type <{ i32 }>
%VSs20UnsafeMutablePointer = type <{ i8* }>
%swift.refcounted = type { %swift.type*, i32, i32 }
%swift.type = type { i64 }

@_Tv10calc_swift6factorSd = global %Sd zeroinitializer, align 8
@globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_token4 = external global i64, align 8
@_TZvOSs7Process5_argcVSs5Int32 = external global %VSs5Int32, align 4
@globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_token5 = external global i64, align 8
@_TZvOSs7Process11_unsafeArgvGVSs20UnsafeMutablePointerGS0_VSs4Int8__ = external global %VSs20UnsafeMutablePointer, align 8
@llvm.used = appending global [1 x i8*] [i8* bitcast (%Sd* @_Tv10calc_swift6factorSd to i8*)], section "llvm.metadata", align 8

define i32 @main(i32, i8**) {
entry:
  %2 = bitcast i8** %1 to i8*
  call void @swift_once(i64* @globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_token4, i8* bitcast (void ()* @globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_func4 to i8*), %swift.refcounted* null)
  store i32 %0, i32* getelementptr inbounds (%VSs5Int32* @_TZvOSs7Process5_argcVSs5Int32, i32 0, i32 0), align 4
  call void @swift_once(i64* @globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_token5, i8* bitcast (void ()* @globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_func5 to i8*), %swift.refcounted* null)
  store i8* %2, i8** getelementptr inbounds (%VSs20UnsafeMutablePointer* @_TZvOSs7Process11_unsafeArgvGVSs20UnsafeMutablePointerGS0_VSs4Int8__, i32 0, i32 0), align 8
  store double 4.200000e+01, double* getelementptr inbounds (%Sd* @_Tv10calc_swift6factorSd, i32 0, i32 0), align 8
  ret i32 0
}

declare void @globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_func4()

declare void @swift_once(i64*, i8*, %swift.refcounted*)

declare void @globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_func5()

define hidden double @_TF10calc_swift4calcFSdSd(double) {
entry:
  %1 = load double* getelementptr inbounds (%Sd* @_Tv10calc_swift6factorSd, i32 0, i32 0), align 8
  %2 = fmul double %0, %1
  ret double %2
}

!llvm.module.flags = !{!0, !1, !2, !5, !6, !7, !8, !9}

!0 = metadata !{i32 2, metadata !"Dwarf Version", i32 3}
!1 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!2 = metadata !{i32 6, metadata !"Linker Options", metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"-lswiftCore"}
!5 = metadata !{i32 1, metadata !"Objective-C Version", i32 2}
!6 = metadata !{i32 1, metadata !"Swift Version", i32 2}
!7 = metadata !{i32 1, metadata !"Objective-C Image Info Version", i32 0}
!8 = metadata !{i32 1, metadata !"Objective-C Image Info Section", metadata !"__DATA, __objc_imageinfo, regular, no_dead_strip"}
!9 = metadata !{i32 4, metadata !"Objective-C Garbage Collection", i32 512}
