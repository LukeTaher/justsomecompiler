{
	open Some_par
	exception SyntaxError of string
}

let int = ['0'-'9']+
let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read = 
	parse
	| white		   {read lexbuf}
	| newline	   {read lexbuf}
	| int		   {INT (int_of_string (Lexing.lexeme lexbuf))}
	| '+'		   {ADD}
	| '-'		   {SUB}
	| '*'		   {MUL}	
	| '/'		   {DIV}
	| _			   {raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf))}	
	| eof		   {EOF}