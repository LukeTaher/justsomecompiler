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

(* Functions *)
%token RINT
%token PINT

(* Declarations *)
%token CVAR
%token VAR
%token ASG

(* Operators *)
%token EQ
%token NEG
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
	| s = IDENT; LBRACK; ss = separated_list(COMMA, value); RBRACK; 
		  LBRACE; e = exp; RBRACE										{(s, ss, e)} 

(* expressions - function contents *)
exp:
	| e = sexp 					{e}
	| e = sexp; f = exp 		{Seq(e, f)}
	| v = var 					{v}
	| RETURN; v = value; SEMCO	{Return(v)} 

(* subexpressions - expression contents *)
sexp:
	| st = stmt; SEMCO	{st}
	| c = cstruct 		{c}

(* variable definitions - expression contents *)
var:
	| CVAR; s = IDENT; ASG; st = stmt; SEMCO; e = exp 	{Let(s,st,e)}
	| VAR; s = IDENT; ASG; st = stmt; SEMCO; e = exp 	{New(s,st,e)}

(* constructs - subexpression contents *)
cstruct:
	| WHILE; LBRACK; v = value; RBRACK; LBRACE; e = exp; RBRACE	{While(v, e)}
	| IF; LBRACK; v = value; RBRACK; LBRACE; e = exp; RBRACE;
	  ELSE; LBRACE; f = exp; RBRACE 							{If(v, e, f)}

(* statements - subexpression contents *)
stmt:
	| s = IDENT; ASG; st = stmt	{Asg(Identifier s, st)}
	| v = value 				{v}

(* values - statement contents *)
value:
	| a = apps 	 	{a}
	| m = mathexp	{m}
	| b = boolexp 	{b}
	| s = IDENT  	{Deref(Identifier s)}

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
	| s = IDENT; LBRACK; ss = separated_list(COMMA, value); RBRACK	{Application(Deref(Identifier s), ss)}
	| RINT; LBRACK; RBRACK 										    {Readint}
	| PINT; LBRACK; m = mathexp; RBRACK 							{Printint m}
