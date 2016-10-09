{
	open Some_par
	exception SyntaxError of string
}

let int = ['0'-'9']+
let string = ['a'-'z' 'A'-'Z']+
let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read = 
	parse
	| white		   {read lexbuf}
	| newline	   {read lexbuf}
	| int		   {CONST (int_of_string (Lexing.lexeme lexbuf))}
	| "if"		   {IF}
	| "else" 	   {ELSE}
	| "while"      {WHILE}
	| "read_int"   {RINT}
	| "print_int"  {PINT}
(*	| "let"		   {LET}
	| "in"		   {IN}*)
	| string 	   {IDENT (Lexing.lexeme lexbuf)}
	| "&&"		   {AND}
	| "||" 		   {OR}
	| "=="		   {EQ}
	| ">="		   {GEQ}
	| "<="		   {LEQ}
	| '>'		   {GE}
	| '<'		   {LE}
	| '='		   {ASG}
	| '!'		   {NEG}
	| '('		   {LBRACK}
	| ')'		   {RBRACK}
	| '['		   {LSBRACK}
	| ']'		   {RSBRACK}
	| '{'		   {LBRACE}
	| '}'		   {RBRACE}
	| '+'		   {ADD}
	| '-'		   {SUB}
	| '*'		   {MUL}	
	| '/'		   {DIV}
	| ','		   {COMMA}
	| ';'		   {SEMCO}
	| _			   {raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf))}	
	| eof		   {EOF}