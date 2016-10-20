open Some_types

(* Store data type *)
type value = 
	| Bool of bool
	| Integer of int 
	| Unit of unit

(* Store *)
let store = Hashtbl.create 100

(* Operation evaluation *)
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
	  | _ -> failwith "Unable to match - Operator applied to invalid operands"

(* Type of value *)
let bool_of_value = function
	| Bool b -> b
	| Integer 0 -> false
	| Integer 1 -> true
	| _ -> failwith "Unable to match - boolean condition does not evaluate to type bool"

(* Identifier evaluation *)
let rec eval_exp_left = function
	| Identifier s -> s
	| If (e, e', e'') -> let branch = eval_exp e in (match branch with
												| Bool true -> eval_exp_left e'
												| Bool false -> eval_exp_left e''
												| _ -> failwith "Unable to match - If condition does not evaluate to type bool")
	| _ -> failwith "Unable to match - LHS of assignment does not evaluate to identifier"

(* Expression evaluation *)
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
											| _ -> failwith "Unable to match - Negation condition does not evaluate to type bool")
	| If (e, e', e'') -> let branch = bool_of_value (eval_exp e) in 
							if branch then eval_exp e' else eval_exp e''
	| While (e, e') -> let branch = bool_of_value (eval_exp e) in 
							if branch then (let res = eval_exp e' in 
										   	let rebranch = bool_of_value (eval_exp e) in
										   		if rebranch then eval_exp (While (e, e')) else res)
							else Unit ()
	| Deref Identifier s -> (try Hashtbl.find store s with Not_found -> failwith ("Unable to match - Undefined variable "^s))
	| Return e -> eval_exp e
	| _ -> failwith "Unable to match - expression could not be evaluated"

(* Function evaluation *)
let eval_fundef (name, ps, exp) = eval_exp exp

(* Program evaluation *)
let rec eval_prog = function
	| [] -> Unit ()
	| ("main", ps, exp)::xs -> eval_fundef ("main", ps, exp)
	| x::xs -> eval_prog xs

(* Result to string *)
let rec string_of_eval = function
	| Bool b -> string_of_bool b
	| Integer i -> string_of_int i
	| _ -> "()"

