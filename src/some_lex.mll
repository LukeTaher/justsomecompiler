{
  open Some_par
  exception SyntaxError of string
}

let int = ['0'-'9']+
let string = ['a'-'z' 'A'-'Z']+
let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"
let comment = "/*"[^'*''/']*"*/"

rule read =
  parse
  | white		   {read lexbuf}
  | newline	   {read lexbuf}
  | int		   {CONST (int_of_string (Lexing.lexeme lexbuf))}
  | comment	   {read lexbuf}
  | "if"		   {IF}
  | "else" 	   {ELSE}
  | "while"      {WHILE}
  | "read_int"   {RINT}
  | "print"  {PINT}
  | "const"  {CVAR}
  | "var"		   {VAR}
  | "fun"		   {FUN}
  | "return"	   {RETURN}
  | "break"	   {BREAK}
  | "continue"	   {CONT}
  | string 	   {IDENT (Lexing.lexeme lexbuf)}
  | "->"		   {ARROW}
  | "&&"		   {AND}
  | "||" 		   {OR}
  | "=="		   {EQ}
  | ">="		   {GEQ}
  | "<="		   {LEQ}
  | '>'		   {GE}
  | '<'		   {LE}
  | '='		   {ASG}
  | '~'		   {DEREF}
  | '!'		   {NEG}
  | '('		   {LBRACK}
  | ')'		   {RBRACK}
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
