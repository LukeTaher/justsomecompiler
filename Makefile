all:	
	ocamlbuild -use-menhir -use-ocamlfind -I src some_lang.native

clean:	
	rm -fr _build
	rm -f some_lang.native
