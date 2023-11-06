; ModuleID = 'subject.c'
source_filename = "subject.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [23 x i8] c"Loading input file...\0A\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"input\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"Completed.\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @vulnerable(i8* noundef %0) #0 {
  %2 = alloca i8*, align 4
  %3 = alloca [12 x i8], align 1
  store i8* %0, i8** %2, align 4
  %4 = getelementptr inbounds [12 x i8], [12 x i8]* %3, i32 0, i32 0
  %5 = load i8*, i8** %2, align 4
  %6 = call i8* @strcpy(i8* noundef %4, i8* noundef %5) #3
  ret i32 1
}

; Function Attrs: nounwind
declare i8* @strcpy(i8* noundef, i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 4
  %6 = alloca [1024 x i8], align 1
  %7 = alloca %struct._IO_FILE*, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 4
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0))
  %9 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %9, %struct._IO_FILE** %7, align 4
  %10 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i32 0, i32 0
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 4
  %12 = call i32 @fread(i8* noundef %10, i32 noundef 1, i32 noundef 1024, %struct._IO_FILE* noundef %11)
  %13 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i32 0, i32 0
  %14 = call i32 @vulnerable(i8* noundef %13)
  %15 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #2

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #2

declare i32 @fread(i8* noundef, i32 noundef, i32 noundef, %struct._IO_FILE* noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cx8,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cx8,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="i686" "target-features"="+cx8,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"Debian clang version 14.0.6-2"}
