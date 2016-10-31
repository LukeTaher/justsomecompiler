open Some_types

(* Functions *)
let funs = Hashtbl.create 100

(* Store *)
(* let store = ref (Hashtbl.create 100) *)

(* Store fetch *)
(* let rec store_fetch key =
	try Some (Hashtbl.find !store key)
				 with Not_found -> None *)

(* Adress generation *)
(* let addr = ref 0
let newref () = addr:=!addr+1; !addr *)

let cur_fun = ref ""

(* Environment lookup *)
let rec lookup env s =
	match env with
	| (s',v)::env -> if s = s' then Some v else lookup env s
	| _ -> None

let opt_op op e e' =
	match (op, e, e') with
	  | (Add, Const e, Const e') -> Const (e+e')
	  | (Sub, Const e, Const e') -> Const (e-e')
	  | (Mul, Const e, Const e') -> Const (e*e')
	  | (Div, Const e, Const e') -> Const (e/e')
	  | (Eq, Const e, Const e') -> if (e==e') then Const 1 else Const 0
	  | (Le, Const e, Const e') -> if (e<e') then Const 1 else Const 0
	  | (Ge, Const e, Const e') -> if (e>e') then Const 1 else Const 0
	  | (Leq, Const e, Const e') -> if (e<=e') then Const 1 else Const 0
	  | (Geq, Const e, Const e') -> if (e>=e') then Const 1 else Const 0
	  | (And, Const e, Const e') -> if e > 0 && e' > 0 then Const 1 else Const 0
	  | (Or, Const e, Const e') -> if e > 0 || e' > 0 then Const 1 else Const 0
    | (op, e, e') -> Operation (op, e, e')

let rec opt_exp env = function
  | Operation (op, e, e') -> opt_op op (opt_exp env e) (opt_exp env e')
  | Let (s, e, e') -> let v = opt_exp env e in
                      (match v with
                        | Const i -> opt_exp ((s,v)::env) e'
                        | _ as v -> Let (s, v, (opt_exp env e')))
  | New (s, e, e') -> let v = opt_exp env e in New (s, v, (opt_exp env e'))
                      (* (match v with
                        | Const i -> (let addr = Address(newref ()) in
                                      Hashtbl.replace !store addr v;
                                      let v' = opt_exp ((s, addr)::env) e' in
                                      Hashtbl.remove !store addr;
                                      v')
                        | _ as v -> New (s, v, (opt_exp env e'))) *)
  | Application (s, args) -> if !cur_fun = s then Application (s, List.map (opt_exp env) args)
                             else opt_fundef (s, List.map (opt_exp env) args)
	| Identifier s -> (match (lookup env s) with
                    | Some x -> opt_exp env x
                    | _ -> Identifier s)
  | Seq (e, e') -> let v = opt_exp env e in
                   let v' = opt_exp env e' in
                   Seq (v, v')
  | Asg (e, e') -> let left = opt_exp env e in
                   let right = opt_exp env e' in
                   Asg (left, right)
  | Negation e -> Negation (opt_exp env e)
  (* | Deref e -> let v = opt_exp env e in
               (match (store_fetch v) with
                | Some (Address a) -> Const a
                | _ as v' -> v') *)
  | Return e -> Return (opt_exp env e)
  | Printint e -> Printint (opt_exp env e)
  | If (e, e', e'') -> let branch = (opt_exp env e) in
                       (match branch with
                       | Const 1 -> (opt_exp env e')
                       | Const 0 -> (opt_exp env e'')
                       | _ -> If (branch, (opt_exp env e'), (opt_exp env e'')))
  | While (e, e') -> While ((opt_exp env e), (opt_exp env e'))
  | _ as exp -> exp

(* Function optimisation *)
and opt_fundef (name, argvs) =
  try
  (let (args, exp) = (Hashtbl.find funs name) in
                      (cur_fun := name;
                      let res = opt_exp [] exp in
                    	match res with
                      | Const i -> Const i
                      | _ -> Application (name, argvs)))
  with Not_found -> Application (name, argvs)

let rec pop_funs = function
  | (name, (args:string list), exp)::prog -> Hashtbl.replace funs name (args, exp); pop_funs prog
  | [] -> ()

let rec opt_prog' = function
  | (name, args, exp)::prog -> cur_fun := name; (name, args, opt_exp [] exp)::(opt_prog' prog)
  | [] -> []

let opt_prog prog = pop_funs prog; opt_prog' prog
