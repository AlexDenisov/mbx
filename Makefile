linker:
	clang -c calc.c -o calc.o
	clang -c main.c -o main.o
	nm calc.o
	nm main.o
	ld -macosx_version_min 10.10 -lc calc.o main.o -o main
	nm main

dump_tokens_clang:
	clang -cc1 -dump-tokens calc.c

dump_ast_clang:
	clang -cc1 -ast-dump ast_clang.m

dump_ast_swift:
	swiftc -dump-ast ast_swift.swift

dump_classes_swift:
	swiftc -dump-ast ast_swift.swift 2> swift.ast
	ruby dump_classes_swift.rb

TOOLCHAIN_LIB=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/
dump_classes_clang:
	clang dump_classes_clang.c -o dump_objc \
					-lclang -L$(TOOLCHAIN_LIB) \
					-Xlinker -rpath -Xlinker $(TOOLCHAIN_LIB)\
					-fblocks
	./dump_objc

dump_ir_clang:
	clang -S -emit-llvm calc.c -o calc_clang.ll
	cat calc_clang.ll

dump_ir_swift:
	swiftc -emit-ir calc.swift -o calc_swift.ll
	cat calc_swift.ll

clean:
	rm -f calc.o
	rm -f main.o
	rm -f main
	rm -f swift.ast
	rm -f dump_objc

