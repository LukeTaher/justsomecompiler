%{
open Some_types
%}

(* Data types *)
%token <int> CONST
%token <string> IDENT

(* Constructs *)
%token IF
%token ELSE
%token WHILE
%token BREAK
%token CONT

(* Functions *)
%token RINT
%token PINT

(* Declarations *)
%token CVAR
%token VAR
%token ASG
%token FUN
%token ARROW

(* Operators *)
%token EQ
%token NEG
%token DEREF
%token AND
%token OR
%token GEQ
%token LEQ
%token GE
%token LE
%token ADD
%token SUB
%token MUL
%token DIV

(* Brackets *)
%token LBRACK
%token RBRACK
%token LBRACE
%token RBRACE

(* Separators *)
%token COMMA
%token SEMCO

(* Return *)
%token RETURN

(* End of file *)
%token EOF

(* Derivation and precedence rules *)
%left OR
%left AND
%left EQ
%left GEQ
%left GE
%left LEQ
%left LE
%left SUB
%left ADD
%left DIV
%left MUL

%start <Some_types.program> top
%%

(* program *)
top:
  | prog = list(fundef); EOF	{prog}

(* functions - program contents *)
fundef:
  | s = IDENT; LBRACK; ss = separated_list(COMMA, IDENT); RBRACK;
      LBRACE; e = exp; RBRACE										{(s, ss, e)}

(* expressions - function contents *)
exp:
  | e = stmt 					{e}
  | e = stmt; SEMCO; f = exp 		{Seq(e, f)}
  | d = def 					{d}
  | RETURN; v = def			{Return(v)}
  | RETURN; e = stmt 			{Return(e)}

(* statements - expression contents *)
stmt:
  | v = value; ASG; tt = stmt	{Asg(v, tt)}
  | v = value 					{v}


(* values - statement contents *)
value:
  | LBRACK; v = value; RBRACK {v}
  | a = apps 	 				{a}
  | m = mathexp				{m}
  | b = boolexp 				{b}
  | v = vars 					{v}
  | LBRACK; d = def; RBRACK	{d}

(* variable definitions - expression contents *)
def:
  | CVAR; s = IDENT; ASG; st = stmt; SEMCO; e = exp 	{Let(s,st,e)}
  | VAR; s = IDENT; ASG; st = stmt; SEMCO; e = exp 	{New(s,st,e)}

(* variables - expression contents *)
vars:
  | s = IDENT  				{Identifier s}
  | DEREF; v = vars 			{Deref(v)}

(* math expressions - value contents *)
mathexp:
  | i = CONST 			  	  {Const(i)}
  | m = value; ADD; n = value   {Operation(Add, m, n)}
  | m = value; SUB; n = value   {Operation(Sub, m, n)}
  | m = value; MUL; n = value   {Operation(Mul, m, n)}
  | m = value; DIV; n = value   {Operation(Div, m, n)}

(* bool expressions - value contents *)
boolexp:
  | v = value; EQ; w = value 			{Operation(Eq, v, w)}
  | v = value; GEQ; w = value 		{Operation(Geq, v, w)}
  | v = value; LEQ; w = value 		{Operation(Leq, v, w)}
  | v = value; GE; w = value 			{Operation(Ge, v, w)}
  | v = value; LE; w = value 			{Operation(Le, v, w)}
  | b = value; AND; c = value 		{Operation(And, b, c)}
  | b = value; OR; c = value 			{Operation(Or, b, c)}
  | NEG; LBRACK; b = value; RBRACK	{Negation(b)}

(* application expressions - value contents *)
apps:
  | s = IDENT; LBRACK; ss = separated_list(COMMA, value); RBRACK	{Application(s, ss)}
  | RINT; LBRACK; RBRACK 										    {Readint}
  | PINT; LBRACK; v = value; RBRACK 							{Printint v}
  | IF; LBRACK; v = value; RBRACK; LBRACE; e = exp; RBRACE;
    ELSE; LBRACE; f = exp; RBRACE 								{If(v, e, f)}
  | WHILE; LBRACK; v = value; RBRACK; LBRACE; e = exp; RBRACE	{While(v, e)}
  | FUN; ss = separated_list(COMMA, IDENT); ARROW; LBRACK; e = exp; RBRACK  			{Lambda(ss, e)}
  | BREAK {Break}
  | CONT {Continue}
