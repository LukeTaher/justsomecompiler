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
let regs = ["%rdi"; "%rsi"; "%rdx"; "%rcx"; "%r8"; "%r9"]

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

let str r = "pushq " ^ r ^ "\n" |> Buffer.add_string code

let sta addr = "pushq " ^ (-16 -8 * addr |> string_of_int) ^ "(%rbp)\n" |> Buffer.add_string code

let ldr r = "popq " ^ r ^ "\n" |> Buffer.add_string code

let op oper = "popq %rax\n" ^ "popq %rbx \n" ^ (string_of_op oper) ^
              " %rax, %rbx\n" ^ "pushq %rbx\n" |> Buffer.add_string code

let id addr = "movq " ^ (-16 -8 * addr |> string_of_int) ^ "(%rbp), %rax\n" ^
              "pushq %rax\n" |> Buffer.add_string code

let ilet () = "popq %rax\n" ^ "popq %rbx\n" ^
              "pushq %rax\n" |> Buffer.add_string code

let neg () = "popq %rax\n" ^ "neg %rax\n" ^
             "push %rax\n" |> Buffer.add_string code

let lea addr = "leaq " ^ (-16 -8 * addr |> string_of_int) ^ "(%rbp), %rax\n" ^
               "pushq %rax\n" |> Buffer.add_string code

let deref () = "popq %rax\n" ^ "movq (%rax), %rax\n" ^
               "pushq %rax\n" |> Buffer.add_string code

let asg () = "popq %rax\n" ^ "popq %rbx\n" ^
             "movq %rax, (%rbx)\n" |> Buffer.add_string code

let bcheck () = "popq %rax\n" ^ "cmpq $0, %rax\n" |> Buffer.add_string code

let jle label = "jle " ^ label ^ "\n" |> Buffer.add_string code

let jmp label = "jmp " ^ label ^ "\n" |> Buffer.add_string code

let printlbl label = label ^ ":\n" |> Buffer.add_string code

let call label = "callq _" ^ label ^ "\n" |> Buffer.add_string code

(* Address lookup *)
let rec lookup s = function
  | [] -> failwith "Unable to match - Address out of bounds"
  | (s', addr)::symt -> if s = s' then addr else lookup s symt

(* Code generation *)
let rec x86gen_exp symt = function
  | Const i -> st i; sp := !sp + 1
  | Readint -> call "read";
							 str "%rax";
							 sp := !sp + 1
  | Printint e -> x86gen_exp symt e;
                  ldr "%rdi";
									sp := !sp - 1;
                  call "print"
  | Let (s, e, e') -> x86gen_exp symt e;
                      x86gen_exp ((s, !sp) :: symt) e';
                      ilet ()
  | New (s, e, e') -> x86gen_exp symt e;
                      lea !sp;
                      sp := !sp + 1;
                      x86gen_exp ((s, !sp) :: symt) e'
  | Application (s, args) -> x86gen_storeargs args regs symt; call s; str "%rax"
  | Identifier s -> let addr = lookup s symt in
                    id addr;
                    sp := !sp + 1
  | Seq (e, e') -> x86gen_exp symt e;
                   x86gen_exp symt e'
  (* | Lambda (args, e') -> *)
  | Asg (e, e') -> x86gen_exp symt e;
                   x86gen_exp symt e';
                   asg ();
                   sp := !sp - 2
  | Operation (oper, e, e') -> x86gen_exp symt e;
                               x86gen_exp symt e';
                               op oper;
                               sp := !sp - 1
  | Negation e -> x86gen_exp symt e;
                  neg ();
                  sp := !sp - 1
  | If (e, e', e'') -> let lbl = "BRANCH"^(string_of_int (genlblno())) in
                       let endlbl = "END_"^lbl in
                       x86gen_exp symt e;
                       bcheck ();
                       jle lbl;
                       x86gen_exp symt e';
                       jmp endlbl;
                       printlbl lbl;
                       x86gen_exp symt e'';
                       printlbl endlbl
  | While (e, e') -> let lbl = "LOOP"^(string_of_int (genlblno())) in
                     let endlbl = "END_"^lbl in
                     printlbl lbl;
                     x86gen_exp symt e;
                     bcheck ();
                     jle endlbl;
                     x86gen_exp symt e';
                     jmp lbl;
                     printlbl endlbl
  | Deref e -> x86gen_exp symt e;
               deref ();
               sp := !sp + 1
  | Return e -> x86gen_exp symt e
  | _ -> failwith "Unable to Compile"

and x86gen_storeargs es rs symt =
  match (es, rs) with
  | ([], _) -> ()
  | (e::es, []) -> x86gen_exp symt e; x86gen_storeargs es [] symt (* fix? *)
  | (e::es, r::rs) -> x86gen_exp symt e; ldr r; sp := !sp - 1; x86gen_storeargs es rs symt

let rec x86gen_loadargs n rs i =
  match (n, rs) with
  | (0, _) -> ()
  | (n, []) -> let i = i-1 in sta i; sp := !sp + 1; x86gen_loadargs (n-1) [] i
  | (n, r::rs) -> str r; sp := !sp + 1; x86gen_loadargs (n-1) rs i

(* Function generation *)
let rec x86gen_fundef = function
  | [] -> ()
  | ("main", args, exp)::prog -> x86gen_fundef prog
  | (name, args, exp)::prog -> sp := 0;
                               x86_fun_prefix name |> Buffer.add_string code;
                               let arg_count = (List.length args) in
                               x86gen_loadargs arg_count regs 0;
                               let symt = List.mapi (fun i arg -> (arg, (arg_count-i))) args in
                               x86gen_exp symt exp;
                               ldr "%rax";
                               x86_fun_suffix |> Buffer.add_string code;
                               x86gen_fundef prog
let rec x86gen_main = function
  | ("main", args, exp)::prog -> sp := 0;
                                 x86_main_prefix |> Buffer.add_string code;
                                 x86gen_exp [] exp;
                                 x86_main_suffix |> Buffer.add_string code
  | x::prog -> x86gen_main prog
  | [] -> failwith "Unable to Compile"

let x86gen_prog prog = x86_prefix |> Buffer.add_string code;
                       x86gen_fundef prog;
                       x86gen_main prog;
                       x86_suffix |> Buffer.add_string code;
                       Buffer.output_buffer stdout code
