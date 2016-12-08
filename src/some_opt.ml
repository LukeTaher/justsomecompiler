open Some_types
open Printf

(* Functions *)
let funs = Hashtbl.create 100
let mem = Hashtbl.create 100

(* Current function *)
let cur_fun = ref ""

(* Var generation *)
let addr = ref 0
let newref () = addr:=!addr+1; !addr

(* Environment lookup *)
let rec lookup env s =
	match env with
	| (s',v)::env -> if s = s' then Some v else lookup env s
	| _ -> None

(* Find shadowed vars *)
let rec shadow_check' = function
  | Printint e -> shadow_check' e
  | Let (s, e, e') -> s::(shadow_check' e')
  | New (s, e, e') -> s::(shadow_check' e')
  | Identifier s -> [s]
  | Seq (e, e') -> shadow_check' e'
  | Asg (e, e') -> shadow_check' e'
  | If (e, e', e'') -> (shadow_check' e')@(shadow_check' e'')
  | While (e, e') -> shadow_check' e'
  | Return e -> shadow_check' e
  | _ -> []

(* Check if expression is shadowed *)
let rec shadow_check term exp = let terms = shadow_check' term in
                                let exps = shadow_check' exp in
                                List.exists (fun x -> List.exists (fun y -> x = y) exps) terms

(* Eliminate given expression *)
let rec elim_exp' (name, term) = function
  | Operation (op, e, e') as exp -> if exp = term then Identifier name
                                    else Operation (op, (elim_exp' (name, term) e), (elim_exp' (name, term) e'))
  | Printint e -> Printint (elim_exp' (name, term) e)
  | Let (s, e, e') as exp -> if (shadow_check term (Identifier s)) then exp
                              else Let (s, (elim_exp' (name, term) e), (elim_exp' (name, term) e'))
  | New (s, e, e') as exp -> if (shadow_check term (Identifier s)) then exp
                              else New (s, (elim_exp' (name, term) e), (elim_exp' (name, term) e'))
  | Application (s, args) -> Application (s, List.map (elim_exp' (name, term)) args)
  | Seq (e, e') -> Seq ((elim_exp' (name, term) e), (elim_exp' (name, term) e'))
  | Asg (e, e') as exp -> if (shadow_check term e) then exp
                              else Asg ((elim_exp' (name, term) e), (elim_exp' (name, term) e'))
  | Negation e -> Negation (elim_exp' (name, term) e)
  | If (e, e', e'') -> If ((elim_exp' (name, term) e), (elim_exp' (name, term) e'), (elim_exp' (name, term) e''))
  | While (e, e') -> While ((elim_exp' (name, term) e), (elim_exp' (name, term) e'))
  | Deref e -> Deref (elim_exp' (name, term) e)
  | Return e -> Return (elim_exp' (name, term) e)
  | _ as exp -> exp

(* Expression effects check *)
let rec has_effects = function
  | Const i -> false
  | Let (s, e, e') -> has_effects e || has_effects e'
  | New (s, e, e') -> has_effects e || has_effects e'
  | Identifier s -> false
  | Seq (e, e') -> has_effects e || has_effects e'
  | Asg (e, e') -> has_effects e || has_effects e'
  | Operation (op, e, e') -> has_effects e || has_effects e'
  | Negation e -> has_effects e
  | If (e, e', e'') -> has_effects e || has_effects e' || has_effects e''
  | While (e, e') -> has_effects e || has_effects e'
  | Deref e -> has_effects e
  | Return e -> has_effects e
  | _ -> true

(* Subexpression elimination *)
let rec elim_exp = function
  | Operation (op, e, e') -> Operation (op, (elim_exp e), (elim_exp e'))
  | Printint e -> Printint (elim_exp e)
  | Let (s, e, e') as term -> (if not (has_effects term)
                               then (let name = "opt"^(string_of_int (newref ())) in
                               let rexp = elim_exp' (name, e) e' in
                                  if e' <> rexp then Let (name, e, Let(s, Identifier name, rexp))
                                  else Let (s, (elim_exp e), (elim_exp e')))
                               else Let (s, (elim_exp e), (elim_exp e')))
  | New (s, e, e') as term -> (if not (has_effects term)
                               then (let name = "opt"^(string_of_int (newref ())) in
                               let rexp = elim_exp' (name, e) e' in
                                  if e' <> rexp then Let (name, e, New(s, Identifier name, rexp))
                                  else New (s, (elim_exp e), (elim_exp e')))
                               else New (s, (elim_exp e), (elim_exp e')))
  | Application (s, args) -> Application (s, List.map elim_exp args)
  | Seq (e, e') -> Seq ((elim_exp e), (elim_exp e'))
  | Asg (e, e') -> Asg ((elim_exp e), (elim_exp e'))
  | Negation e -> Negation (elim_exp e)
  | If (e, e', e'') -> If ((elim_exp e), (elim_exp e'), (elim_exp e''))
  | While (e, e') -> While ((elim_exp e), (elim_exp e'))
  | Deref e -> Deref (elim_exp e)
  | Return e -> Return (elim_exp e)
  | _ as exp -> exp

(* Operation optimisation *)
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

(* Expression optimisation *)
let rec opt_exp env = function
  | Operation (op, e, e') -> opt_op op (opt_exp env e) (opt_exp env e')
  | Let (s, e, e') -> let v = opt_exp env e in
                      (match v with
                        | Const i -> opt_exp ((s, v)::env) e'
                        | Identifier s' -> opt_exp ((s, v)::env) e'
                        | _ as v -> Let (s, v, (opt_exp env e')))
  | New (s, e, e') -> let v = opt_exp env e in New (s, v, (opt_exp env e'))
  | Application (s, args) -> let fun_opt = (s, List.map (opt_exp env) args) in
														 let (s', args') = fun_opt in
														 (try (Hashtbl.find mem fun_opt)
 															with Not_found -> (if !cur_fun == s
 																								 then let res = Application (s', args') in
 																								 			Hashtbl.replace mem fun_opt res;
 																											res
                        													 else let res = opt_fundef fun_opt in
 																										  Hashtbl.replace mem fun_opt res;
 																										  res))
	| Identifier s -> (match (lookup env s) with
                    | Some x -> x
                    | _ -> Identifier s)
  | Seq (e, e') -> let v = opt_exp env e in
                   let v' = opt_exp env e' in
                   Seq (v, v')
  | Asg (e, e') -> let left = opt_exp env e in
                   let right = opt_exp env e' in
                   Asg (left, right)
  | Negation e -> Negation (opt_exp env e)
  | Return e -> Return (opt_exp env e)
  | Printint e -> Printint (opt_exp env e)
  | If (e, e', e'') -> let branch = (opt_exp env e) in
                       (match branch with
                       | Const 1 -> (opt_exp env e')
                       | Const 0 -> (opt_exp env e'')
                       | _ -> If (branch, (opt_exp env e'), (opt_exp env e'')))
  | While (e, e') -> let break = (opt_exp env e) in
                     let op = (opt_exp env e') in
                     While (break, If (break, op, If (break, op, If (break, op, Seq(op, op)))))
  | _ as exp -> exp

(* Function optimisation *)
and opt_fundef (name, argvs) =
  try
  (let (args, exp) = (Hashtbl.find funs name) in
                      (cur_fun := name;
                      let res = elim_exp (opt_exp (List.map2 (fun x y -> (x, y)) args argvs) exp) in
                    	match res with
                      | Const i -> Const i
                      | _ -> Application (name, argvs)))
  with Not_found -> Application (name, argvs)

(* Function table population *)
let rec pop_funs = function
  | (name, (args:string list), exp)::prog -> Hashtbl.replace funs name (args, exp); pop_funs prog
  | [] -> ()

(* Program Optimisation *)
let rec opt_prog' = function
  | (name, args, exp)::prog -> cur_fun := name; (name, args, elim_exp (opt_exp [] exp))::(opt_prog' prog)
  | [] -> []

let opt_prog prog = pop_funs prog; opt_prog' prog
