linker: clean
	clang -c calc.c -o calc.o
	clang -c main.c -o main.o
	nm calc.o
	nm main.o
	ld -macosx_version_min 10.10 -lc calc.o main.o -o main
	nm main

clang_tokens:
	clang -cc1 -dump-tokens calc.c

clang_ast:
	clang -cc1 -ast-dump clang_ast.m

swift_ast:
	swiftc -dump-ast swift_ast.swift

dump_swift_structs:
	swiftc -dump-ast swift_ast.swift 2> swift.ast
	ruby dump_swift_struct.rb

TOOLCHAIN_LIB=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/
dump_objc_classes:
	clang dump_objc_classes.c -o dump_objc \
					-lclang -L$(TOOLCHAIN_LIB) \
					-Xlinker -rpath -Xlinker $(TOOLCHAIN_LIB)\
					-fblocks
	./dump_objc

clean:
	rm -f calc.o
	rm -f main.o
	rm -f main
	rm -f swift.ast
	rm -f dump_objc

