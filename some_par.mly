%token <int> INT

%token ADD
%token SUB
%token MUL
%token DIV

(* %token COMMA *)
%token SEMCO
(* %token SEQ *)

%token EOF

%left ADD
%left SUB
%left MUL
%left DIV

%start <int list> top
%%

top:
	| expl = separated_list(SEMCO, exp); EOF {expl}

exp:
	| i = INT 				  {i}
	| e = exp; ADD; f = exp   {e + f}
	| e = exp; SUB; f = exp   {e - f}
	| e = exp; MUL; f = exp   {e * f}
	| e = exp; DIV; f = exp   {e / f}