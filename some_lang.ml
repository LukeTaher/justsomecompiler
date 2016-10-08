open Some_lex
open Lexing
open Printf

let rec read_to_empty buf =
	let s = read_line () in
	if s = "" then buf
	else (Buffer.add_string buf s;
		  Buffer.add_string buf "\n";
		  read_to_empty buf)

let print_position lexbuf = 
	let pos = lexbuf.lex_curr_p in
	eprintf "Pos %d:%d:%d\n" pos.pos_lnum pos.pos_bol pos.pos_cnum

let parse_with_error lexbuf = 
	try Some_par.top Some_lex.read lexbuf with 
		| SyntaxError msg -> prerr_string (msg ^ ": ");
							 print_position lexbuf;
							 exit (-1)
		| Some_par.Error -> prerr_string "Parse error: ";
							print_position lexbuf;
							exit (-1)

let _ =
		read_to_empty (Buffer.create 1)
		|> Buffer.contents
		|> Lexing.from_string
		|> parse_with_error
		|> List.map string_of_int
		|> String.concat ",\n"
		|> print_endline