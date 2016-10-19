open Some_types

type value = 
	| Bool of bool
	| Integer of int 
	| Unit of unit

let store = Hashtbl.create 100

let eval_op op e e' =
	match (op, e, e') with 
	  | (Add, Integer e, Integer e') -> Integer (e+e')
	  | (Sub, Integer e, Integer e') -> Integer (e-e') 
	  | (Mul, Integer e, Integer e') -> Integer (e*e') 
	  | (Div, Integer e, Integer e') -> Integer (e/e')
	  | (Eq, Integer e, Integer e') -> Bool (e==e')
	  | (Le, Integer e, Integer e') -> Bool (e<e') 
	  | (Ge, Integer e, Integer e') -> Bool (e>e') 
	  | (Leq, Integer e, Integer e') -> Bool (e<=e') 
	  | (Geq, Integer e, Integer e') -> Bool (e>=e')
	  | (And, Bool e, Bool e') -> Bool (e&&e') 
	  | (Or, Bool e, Bool e') -> Bool (e||e')
	  | _ -> failwith "unable to match"

let rec eval_exp_left = function
	| Identifier s -> s
	| If (e, e', e'') -> let branch = eval_exp e in (match branch with
												| Bool true -> eval_exp_left e'
												| Bool false -> eval_exp_left e''
												| _ -> failwith "unable to match")
	| _ -> failwith "unable to match LHS"

and eval_exp = function
	| Const i -> Integer i
	| Seq (e, e') -> eval_exp e |> ignore;
					 eval_exp e'
	| Asg (e, e') -> let left = eval_exp_left e in
					 let right = eval_exp e' in
					 Hashtbl.replace store left right;
					 Unit ()
	| Operation (op, e, e') -> eval_op op (eval_exp e) (eval_exp e')
	| Negation e -> let exp = eval_exp e in (match exp with
											| Bool a -> Bool (not a)
											| _ -> failwith "unable to match")
	| If (e, e', e'') -> let branch = eval_exp e in (match branch with
													| Bool true -> eval_exp e'
													| Bool false -> eval_exp e''
													| _ -> failwith "unable to match")
	| While (e, e') -> let branch = eval_exp e in (match branch with
													| Bool true -> eval_exp e' |> ignore;
																	eval_exp (While (e, e'))
													| Bool false -> Unit ()
													| _ -> failwith "unable to match")
	| Deref Identifier s -> Hashtbl.find store s
	| Return e -> eval_exp e
	| _ -> failwith "unable to match"


let eval_fundef (name, ps, exp) = eval_exp exp

let rec eval_prog = function
	| [] -> Unit ()
	| ("main", ps, exp)::xs -> eval_fundef ("main", ps, exp)
	| x::xs -> eval_prog xs

let rec string_of_eval = function
	| Bool b -> string_of_bool b
	| Integer i -> string_of_int i
	| _ -> "()"

