open Some_types

type value = 
	| Bool of bool
	| Integer of int 
	| Unit of unit

let store = Hashtbl.create 100

let rec eval_exp_left = function
	| Identifier s -> s
	| _ -> failwith "unable to match"

let rec eval_exp = function
	| Const i -> Integer i
	| Seq (e, e') -> eval_exp e |> ignore;
					 eval_exp e'
	| Asg (e, e') -> let left = eval_exp_left e in
					 let right = eval_exp e' in
					 Hashtbl.replace store left right;
					 Unit ()
	| Deref Identifier s -> Hashtbl.find store s
	| Return e -> eval_exp e
	| _ -> failwith "unable to match"


let eval_fundef (name, ps, exp) = eval_exp exp

let rec eval_prog = function
	| [] -> Integer 0
	| ("main", ps, exp)::xs -> eval_fundef ("main", ps, exp)
	| x::xs -> eval_prog xs

let rec string_of_eval = function
	| Bool b -> string_of_bool b
	| Integer i -> string_of_int i
	| _ -> "()"