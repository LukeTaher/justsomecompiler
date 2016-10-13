%{
open Some_types
%}

%token <int> CONST

%token <string> IDENT

%token IF
%token ELSE
%token WHILE

%token RINT
%token PINT

%token CVAR
%token VAR
%token ASG

%token EQ
%token NEG
%token AND
%token OR
%token GEQ
%token LEQ
%token GE
%token LE

%token LBRACK
%token RBRACK
%token LBRACE
%token RBRACE

%token ADD
%token SUB
%token MUL
%token DIV

%token COMMA
%token SEMCO
%token END

%token EOF

(*%left COMMA
%left SEMCO
*)
(*%right VAR
%right CVAR
%right PINT
%right RINT*)


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

top:
	| prog = list(fundef); EOF {prog}

fundef:
	| s = IDENT; LBRACK; ss = separated_list(COMMA, args); RBRACK; 
		  LBRACE; e = exp; RBRACE;	{(s, ss, e)} 

args:
	| s = IDENT; 	{s}

exp:
	| e = exps 	{e}
	| e = exps; f = exp {Seq(e, f)}
	| v = var {v}

exps:
	(*| v = value; SEMCO {v}*)
	| st = stmt; SEMCO {st}
	(*| e = exp; f = exp {Seq(e,f)}*)
	| c = cstruct; END {c}

var:
	| CVAR; s = IDENT; ASG; st = stmt; SEMCO; e = exp {Let(s,st,e)}
	| VAR; s = IDENT; ASG; st = stmt; SEMCO; e = exp {New(s,st,e)}

cstruct:
	| WHILE; LBRACK; v = value; RBRACK; LBRACE; e = exp; RBRACE {While(v, e)}
	| IF; LBRACK; v = value; RBRACK; LBRACE; e = exp; RBRACE;
	  ELSE; LBRACE; f = exp; RBRACE {If(v, e, f)}

stmt:
	| s = IDENT; ASG; st = stmt {Asg(Identifier s, st)}
	(*| s = IDENT {Identifier s}*) 
	| v = value {v}

value:
	| a = apps 	 {a}
	| m = mathop {m}
	| b = boolop {b}
	| s = IDENT {Identifier s}

mathop:
	| i = CONST 			  {Const(i)}
	(*| s = IDENT {Identifier s}*)
	| m = value; ADD; n = value   {Operation(Add, m, n)}
	| m = value; SUB; n = value   {Operation(Sub, m, n)}
	| m = value; MUL; n = value   {Operation(Mul, m, n)}
	| m = value; DIV; n = value   {Operation(Div, m, n)}

boolop:
	(*| a = apps; 			  {a}*)
	| v = value; EQ; w = value 		{Operation(Eq, v, w)}
	| v = value; GEQ; w = value 		{Operation(Geq, v, w)}
	| v = value; LEQ; w = value 		{Operation(Leq, v, w)}
	| v = value; GE; w = value 		{Operation(Ge, v, w)}
	| v = value; LE; w = value 		{Operation(Le, v, w)}
	| b = value; AND; c = value 	{Operation(And, b, c)}
	| b = value; OR; c = value 	{Operation(Or, b, c)}
	| NEG; LBRACK; b = value; RBRACK	{Negation(b)}

apps:
	| s = IDENT; LBRACK; v = value; RBRACK {Application(Identifier s, v)} (*TODO: change to  value list*)
	| RINT; LBRACK; RBRACK {Readint}
	| PINT; LBRACK; m = mathop; RBRACK {Printint m}
