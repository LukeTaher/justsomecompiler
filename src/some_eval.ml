open Some_types
open Printf

(* Store data type *)
type value = 
	| Bool of bool
	| Integer of int
	| Address of int
	| Unit of unit

(* Result to string *)
let rec string_of_eval = function
	| Bool b -> string_of_bool b
	| Integer i -> string_of_int i
	| Address a -> "Address: " ^ string_of_int a
	| _ -> "()"

(* Functions *)
let funs = Hashtbl.create 100

(* Store *)
let store = ref (Hashtbl.create 100)

(* Store fetch *)
let rec store_fetch key = 
	try Hashtbl.find !store key 
				 with Not_found -> failwith ("Unable to match - Address out of bounds")

(* Adress generation *)
let addr = ref 0
let newref () = addr:=!addr+1; !addr

(* Environment lookup *)
let rec lookup env s =
	match env with
	| (s',v)::env -> if s = s' then v else lookup env s
	| _ -> failwith ("Unable to match - Undefined value "^s)

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

(* Expression evaluation *)
let rec eval_exp env = function
	| Const i -> Integer i
	| Printint e -> (eval_exp env e) |> string_of_eval |> printf "%s\n"; Unit ()
	| Let (s, e, e') -> let v = eval_exp env e in
							eval_exp ((s, v)::env) e'
	| New (s, e, e') -> let v = eval_exp env e in
						let addr = Address(newref ()) in
						Hashtbl.replace !store addr v;
						let v' = eval_exp ((s, addr)::env) e' in
						Hashtbl.remove !store addr;
						v'
	| Application (s, args) -> eval_fundef (s, List.map (eval_exp env) args)
	| Identifier s -> lookup env s
	| Seq (e, e') -> eval_exp env e |> ignore;
					 eval_exp env e'
	| Asg (e, e') -> let left = eval_exp env e in
					 let right = eval_exp env e' in
					 Hashtbl.replace !store left right;
					 Unit ()
	| Operation (op, e, e') -> eval_op op (eval_exp env e) (eval_exp env e')
	| Negation e -> let exp = eval_exp env e in (match exp with
											| Bool a -> Bool (not a)
											| _ -> failwith "Unable to match - Negation condition does not evaluate to type bool")
	| If (e, e', e'') -> let branch = bool_of_value (eval_exp env e) in 
							if branch then eval_exp env e' else eval_exp env e''
	| While (e, e') -> let branch = bool_of_value (eval_exp env e) in 
							if branch then (let res = eval_exp env e' in 
										   	let rebranch = bool_of_value (eval_exp env e) in
										   		if rebranch then eval_exp env (While (e, e')) else res)
							else Unit ()
	| Deref e -> store_fetch (eval_exp env e)
	| Return e -> eval_exp env e
	| _ -> failwith "Unable to match - expression could not be evaluated"

(* Function evaluation *)
and eval_fundef (name, argvs) =
	let (args, exp) = try Hashtbl.find funs name 
				 	  with Not_found -> failwith ("Unable to match - Function definition " ^ name ^ " not found") in
	let tempStore = Hashtbl.copy !store in
	Hashtbl.clear !store;
	let env = List.map2 (fun arg argv -> let addr = Address(newref ()) in
								Hashtbl.replace !store addr argv;
								(arg, addr)) args argvs in
	let res = eval_exp env exp in
	store := tempStore;
	res

(* Program evaluation *)
let rec eval_prog = function
	| (name, args, exp)::prog -> Hashtbl.replace funs name (args, exp); eval_prog prog
	| _ -> eval_fundef ("main", [])

