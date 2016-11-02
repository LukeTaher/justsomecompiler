all:
	ocamlbuild -use-menhir -use-ocamlfind -I src -pkg unix some_lang.native

tests:
	cd test && ./runTests.sh

clean:
	rm -fr _build
	rm -f some_lang.native
	rm -f test/test.log
