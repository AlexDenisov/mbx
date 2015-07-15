linker: clean
	clang -c calc.c -o calc.o
	clang -c main.c -o main.o
	nm calc.o
	nm main.o
	ld -macosx_version_min 10.10 -lc calc.o main.o -o main
	nm main
	
clean:
	rm -f calc.o
	rm -f main.o
	rm -f main

