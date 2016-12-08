all:
	ocamlbuild -use-menhir -use-ocamlfind -I src -pkg unix some_lang.native

tests:
	cd test/final && ./runTests.sh

oldtests:
	cd test && ./runTests.sh

clean:
	rm -fr _build
	rm -f some_lang.native
	rm -f test/test.log

program:
	./some_lang.native -x86 prog.sm > "prog.s"
	as prog.s -o prog.o
	ld -lc -macosx_version_min 10.11 prog.o -o prog 2> /dev/null
	rm -f prog.o
