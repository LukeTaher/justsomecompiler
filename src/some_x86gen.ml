open Some_types
open Some_asm
open Hashtbl
open Printf

(* Functions *)
(* let funs = Hashtbl.create 100 *)

(* Code string *)
let code = Buffer.create 100

(* Registers *)
let sp = ref 0
let bp = ref 0

(* Instruction Set *)
let lblno = ref 0
let genlblno () = lblno := !lblno+1; !lblno

let string_of_op = function
	  | Add -> "add"
	  | Sub -> "sub"
	  | Mul -> "imul"
	  | Div -> ""
	  | Eq -> ""
	  | Le -> ""
	  | Ge -> ""
	  | Leq -> ""
	  | Geq -> ""
	  | And -> "and"
	  | Or -> "or"

let st n = "\tpushq\t$" ^ (string_of_int n) ^ "\n" |> Buffer.add_string code
let op oper = "popq %rax\n" ^ "popq %rbx \n" ^ (string_of_op oper) ^ " %rax, %rbx\n" ^
            "pushq %rbx\n" |> Buffer.add_string code
let id addr = "movq " ^ (-16 -8 * addr |> string_of_int) ^ "(%rbp), %rax\n" ^
              "pushq %rax\n" |> Buffer.add_string code
let ilet () = "popq %rax\n" ^ "popq %rbx\n" ^ "pushq %rax\n" |> Buffer.add_string code
let neg () = "popq %rax\n" ^ "neg %rax\n" ^ "push %rax\n" |> Buffer.add_string code
let lea addr = "leaq " ^ (-16 -8 * addr |> string_of_int) ^ "(%rbp), %rax\n" ^
               "pushq %rax\n" |> Buffer.add_string code
let deref () = "popq %rax\n" ^ "movq (%rax), %rax\n" ^ "pushq %rax\n" |> Buffer.add_string code

(* Address lookup *)
let rec lookup s = function
  | [] -> failwith "Unable to match - Address out of bounds"
  | (s', addr)::symt -> if s = s' then addr else lookup s symt

(* Code generation *)
let rec x86gen_exp symt = function
  | Const i -> st i; sp := !sp + 1
  (* | Readint ->
  | Printint e -> *)
  | Let (s, e, e') -> x86gen_exp symt e;
                      x86gen_exp ((s, !sp) :: symt) e';
                      ilet ()
  | New (s, e, e') -> x86gen_exp symt e;
                      lea !sp;
                      sp := !sp + 1;
                      x86gen_exp ((s, !sp) :: symt) e'
  (* | Application (s, args) -> *)
  | Identifier s -> let addr = lookup s symt in
                    id addr;
                    sp := !sp + 1
  | Seq (e, e') -> x86gen_exp symt e;
                   x86gen_exp symt e';
                   ilet ()
  (* | Lambda (args, e') -> *)
  (* | Asg (e, e') -> *)
  | Operation (oper, e, e') -> x86gen_exp symt e;
                               x86gen_exp symt e';
                               op oper;
                               sp := !sp - 1
  | Negation e -> x86gen_exp symt e;
                  neg ();
                  sp := !sp - 1
  (* | If (e, e', e'') -> *)
  (* | While (e, e') -> *)
  | Deref e -> x86gen_exp symt e;
               deref ();
               sp := !sp + 1
  (* | Return e -> *)
  | _ -> failwith "Unable to Compile"

(* Function generation *)
(* and x86gen_fundef (name, argvs) symt = *)

(* Store functions *)
(* let rec add_funs = function
  | (name, (args:string list), exp)::prog -> replace funs name (args, exp); add_funs prog
  | _ -> () *)

(* Program code generation *)
(* let rec x86gen_prog' = *)

(* let rec x86gen_prog prog = add_funs prog; x86gen_prog' prog; Buffer.output_buffer stdout code *)

let rec x86gen_prog = function
  | ("main", args, exp)::prog -> x86gen_exp [] exp;
                                  printf "%s" x86_prefix;
                                  Buffer.output_buffer stdout code;
                                  printf "%s" x86_postfix;
  | x::prog -> x86gen_prog prog
  | [] -> failwith "Unable to Compile"
