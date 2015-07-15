#define NULL 0

typedef struct {
  const void *data;
  unsigned private_flags;
} CXString;

enum CXTranslationUnit_Flags {
  CXTranslationUnit_None = 0x0,
};

enum CXCursorKind {
  CXCursor_ObjCInterfaceDecl = 11,
  CXCursor_ObjCPropertyDecl = 14,
};

typedef struct {
  enum CXCursorKind kind;
  int xdata;
  const void *data[3];
} CXCursor;

enum CXChildVisitResult {
  CXChildVisit_Recurse = 2
};

typedef void *CXIndex;
struct CXUnsavedFile;
typedef struct CXTranslationUnitImpl *CXTranslationUnit;
typedef enum CXChildVisitResult (^CXCursorVisitorBlock)(CXCursor cursor, CXCursor parent);

extern int printf(const char *fmt, ...);

extern CXIndex clang_createIndex(int excludeDeclarationsFromPCH, int displayDiagnostics);
extern CXTranslationUnit clang_parseTranslationUnit(CXIndex CIdx,
                                                    const char *source_filename,
                                                    const char * const *command_line_args,
                                                    int num_command_line_args,
                                                    struct CXUnsavedFile *unsaved_files,
                                                    unsigned num_unsaved_files,
                                                    unsigned options);
extern void clang_disposeTranslationUnit(CXTranslationUnit);
extern void clang_disposeIndex(CXIndex);
extern CXCursor clang_getTranslationUnitCursor(CXTranslationUnit);
extern unsigned clang_visitChildrenWithBlock(CXCursor, CXCursorVisitorBlock);
extern enum CXCursorKind clang_getCursorKind(CXCursor);
extern CXString clang_getCursorSpelling(CXCursor);
extern const char *clang_getCString(CXString string);
extern void clang_disposeString(CXString string);

int main(int argc, char *argv[]) {
  CXIndex index = clang_createIndex(0, 1);
  CXTranslationUnit tu = clang_parseTranslationUnit(index, "ast_clang.m", NULL, 0, NULL, 0, 
                                                    CXTranslationUnit_None);

  clang_visitChildrenWithBlock(clang_getTranslationUnitCursor(tu), ^enum CXChildVisitResult (CXCursor cursor, CXCursor parent) {
    enum CXCursorKind cursor_kind = clang_getCursorKind(cursor);
    switch(cursor_kind) {
      case CXCursor_ObjCInterfaceDecl:{
        CXString cxname = clang_getCursorSpelling(cursor);
        printf("class: %s\n", clang_getCString(cxname));
        clang_disposeString(cxname);
      } break;
      case CXCursor_ObjCPropertyDecl:{
        CXString cxname = clang_getCursorSpelling(cursor);
        printf(" -> %s\n", clang_getCString(cxname));
        clang_disposeString(cxname);
      } break;
      default:{}break;
    }
    return CXChildVisit_Recurse;
  });

  clang_disposeTranslationUnit(tu);
  clang_disposeIndex(index);

  return 0;
}
