; ModuleID = 'calc.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.10.0"

@factor = constant float 4.200000e+01, align 4

; Function Attrs: nounwind ssp uwtable
define i32 @calc(float %x) #0 {
  %1 = alloca float, align 4
  store float %x, float* %1, align 4
  %2 = load float* %1, align 4
  %3 = fmul float 4.200000e+01, %2
  %4 = fptosi float %3 to i32
  ret i32 %4
}

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Apple LLVM version 6.1.0 (clang-602.0.53) (based on LLVM 3.6.0svn)"}
