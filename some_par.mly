%token <int> CONST

%token <string> IDENT

%token IF
%token ELSE
%token WHILE

%token RINT
%token PINT

(*%token LET
%token IN*)
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
%token LSBRACK
%token RSBRACK
%token LBRACE
%token RBRACE

%token ADD
%token SUB
%token MUL
%token DIV

%token COMMA
%token SEMCO

%token EOF

%left COMMA
%right ASG
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
%right NEG


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
	| v = value; SEMCO; {v}
	| c = const; {c}
	| st = stmt; SEMCO; {st}
	| e = exp; f = exp; {Seq(e,f)}

const: (* TODO: rename *)
	(*| e = exp; SEMCO; f = exp {Seq(e, f)} 
	TODO: modify and add deref*)
	| WHILE; LBRACK; v = value; RBRACK; LBRACE; e = exp; RBRACE {While(v, e)}
	| IF; LBRACK; v = value; RBRACK; LBRACE; e = exp; RBRACE;
	  ELSE; LBRACE; f = exp RBRACE; {If(v, e, f)}

stmt:
	| s = IDENT; ASG; st = stmt {Asg(Identifier s, st)}
	| s = IDENT {Identifier s} 
	| v = value {v}

value:
	| a = apps 	 {a}
	| m = mathop {m}
	| b = boolop {b}
	| s = IDENT {Some_types.Identifier s}

mathop:
	| i = CONST 			  {Const(i)}
	| a = apps; 			  {a}
	| s = IDENT {Some_types.Identifier s}
	| m = mathop; ADD; n = mathop   {Operation(Add, m, n)}
	| m = mathop; SUB; n = mathop   {Operation(Sub, m, n)}
	| m = mathop; MUL; n = mathop   {Operation(Mul, m, n)}
	| m = mathop; DIV; n = mathop   {Operation(Div, m, n)}

boolop:
	| v = value; EQ; w = value 		{Operation(Eq, v, w)}
	| v = value; GEQ; w = value 		{Operation(Geq, v, w)}
	| v = value; LEQ; w = value 		{Operation(Leq, v, w)}
	| v = value; GE; w = value 		{Operation(Ge, v, w)}
	| v = value; LE; w = value 		{Operation(Le, v, w)}
	| b = boolop; AND; c = boolop 	{Operation(And, b, c)}
	| b = boolop; OR; c = boolop 	{Operation(Or, b, c)}
	| NEG; b = boolop	{Negation(b)}

apps:
	| s = IDENT; LBRACK; v = value; RBRACK {Application(Identifier s, v)} (*TODO: change to  value list*)
	| RINT; LBRACK; RBRACK {Readint}
	| PINT; LBRACK; m = mathop; RBRACK {Printint m}
