open Some_types
open Some_lex
open Lexing
open Printf

let rec read_to_empty buf file =
	try
		let s = input_line file in
			Buffer.add_string buf s;
			read_to_empty buf file
	with End_of_file ->
			close_in file;
			buf

let print_position lexbuf = 
	let curpos = lexbuf.lex_curr_p.pos_cnum in
	let token = Lexing.lexeme lexbuf in
	eprintf "Unexpected token %s found at position %i \n" token curpos

let parse_with_error lexbuf = 
	try Some_par.top Some_lex.read lexbuf with 
		| SyntaxError msg -> prerr_string (msg ^ ": ");
							 print_position lexbuf;
							 exit (-1)
		| Some_par.Error -> prerr_string "Parse error: ";
							print_position lexbuf;
							exit (-1)

let _ =
		open_in Sys.argv.(1)
		|> read_to_empty (Buffer.create 1)
		|> Buffer.contents
		|> Lexing.from_string
		|> parse_with_error
		|> string_of_prog
		|> printf "%s"