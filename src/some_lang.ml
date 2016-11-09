open Some_types
open Some_lex
open Some_eval
open Some_opt
open Some_inter
open Some_cgen
open Lexing
open Printf

(* read file into buffer *)
let rec read_to_empty buf file =
	try
		let s = input_line file in
			Buffer.add_string buf s;
			read_to_empty buf file
	with End_of_file ->
			close_in file;
			buf

(* print error *)
let print_position lexbuf =
	let curpos = lexbuf.lex_curr_p.pos_cnum in
	let token = Lexing.lexeme lexbuf in
	eprintf "Unexpected token %s found at position %i \n" token curpos

(* parse *)
let parse_with_error lexbuf =
	try Some_par.top Some_lex.read lexbuf with
		| SyntaxError msg -> prerr_string (msg ^ ": ");
							 print_position lexbuf;
							 exit (-1)
		| Some_par.Error -> prerr_string "Parse error: ";
							print_position lexbuf;
							exit (-1)

let parse buf = read_to_empty (Buffer.create 1) buf
						|> Buffer.contents
						|> Lexing.from_string
						|> parse_with_error

let eval_prog_stat ast = let t0 = Unix.gettimeofday() in
											eval_prog ast |> ignore;
											let t = Unix.gettimeofday() in
	 										("Evaluation Steps: " ^ (string_of_int !count) ^
											"\nExecution Time: " ^ (string_of_float (t -. t0)))

let _ = match Sys.argv.(1) with
		| "-i" -> open_in Sys.argv.(2)
				|> parse
				|> inter_prog
				|> printf "%i\n"
		| "-io" | "-oi" -> open_in Sys.argv.(2)
				|> parse
				|> opt_prog
				|> inter_prog
				|> printf "%i\n"
		| "-c" -> open_in Sys.argv.(2)
				|> parse
				|> cgen_prog
		| "-co" | "-oc" -> open_in Sys.argv.(2)
				|> parse
				|> opt_prog
				|> cgen_prog
		| "-v" -> open_in Sys.argv.(2)
				|> parse
				|> string_of_prog
				|> printf "%s"
		| "-s" -> open_in Sys.argv.(2)
			|> parse
			|> eval_prog_stat
			|> printf "%s\n"
		| "-so" | "-os" -> open_in Sys.argv.(2)
			|> parse
			|> opt_prog
			|> eval_prog_stat
			|> printf "%s\n"
		| "-ov" | "-vo" -> open_in Sys.argv.(2)
				|> parse
				|> opt_prog
				|> string_of_prog
				|> printf "%s"
		| "-o" -> open_in Sys.argv.(2)
			|> parse
			|> opt_prog
			|> eval_prog
			|> string_of_eval
			|> printf "%s\n"
		| _ -> open_in Sys.argv.(1)
			|> parse
			|> eval_prog
			|> string_of_eval
			|> printf "%s\n"
