open Some_types
open Some_asm
open Hashtbl
open Printf

(* Code string *)
let code = Buffer.create 100

(* Registers *)
let sp = ref 0
let bp = ref 0
let regs = ["%rdi"; "%rsi"; "%rdx"; "%rcx"; "%r8"; "%r9"]

(* Instruction Set *)
let lblno = ref 0
let genlblno () = lblno := !lblno+1; !lblno

let cur_lbl = ref ""
let cur_end_lbl = ref ""

let rec string_of_op = function
	  | Add -> "add %rax, %rbx\n"
	  | Sub -> "sub %rax, %rbx\n"
	  | Mul -> "imul %rax, %rbx\n"
	  | Div -> "pushq %rax\n pushq %rbx\n popq %rax\n popq %rbx\n cltd\n
							div %rbx\n movq %rax, %rbx\n"
	  | Eq -> "cmpq %rax, %rbx\n sete %al\n movq %rax, %rbx\n"
	  | Le -> "cmpq %rax, %rbx\n setl %al\n movq %rax, %rbx\n"
	  | Ge -> "cmpq %rax, %rbx\n setg %al\n movq %rax, %rbx\n"
		| Leq -> "cmpq %rax, %rbx\n setle %al\n movq %rax, %rbx\n"
	  | Geq -> "cmpq %rax, %rbx\n setge %al\n movq %rax, %rbx\n"
	  | And -> "and %rax, %rbx\n"
	  | Or -> "or %rax, %rbx\n"

let st n = sp := !sp + 1; "pushq $" ^ (string_of_int n) ^ "\n" |> Buffer.add_string code

let str r = sp := !sp + 1; "pushq " ^ r ^ "\n" |> Buffer.add_string code

let sta addr = sp := !sp + 1;  "pushq " ^ (-16 -8 * addr |> string_of_int) ^ "(%rbp)\n" |> Buffer.add_string code

let ldr r = sp := !sp - 1; "popq " ^ r ^ "\n" |> Buffer.add_string code

let op oper = sp := !sp - 1; "popq %rax\n" ^ "popq %rbx \n" ^ (string_of_op oper) ^
              "pushq %rbx\n" |> Buffer.add_string code

let id addr = sp := !sp + 1; "movq " ^ (-16 -8 * addr |> string_of_int) ^ "(%rbp), %rax\n" ^
              "pushq %rax\n" |> Buffer.add_string code

let ilet () = sp := !sp - 1; "popq %rax\n" ^ "popq %rbx\n" ^
              "pushq %rax\n" |> Buffer.add_string code

let neg () = "popq %rax\n cmpq $0, %rax\n sete %al\n pushq %rax\n popq %rax\n" ^
            "push %rax\n" |> Buffer.add_string code

let lea addr = sp := !sp + 1; "leaq " ^ (-16 -8 * addr |> string_of_int) ^ "(%rbp), %rax\n" ^
               "pushq %rax\n" |> Buffer.add_string code

let deref () = "popq %rax\n" ^ "movq (%rax), %rax\n" ^
               "pushq %rax\n" |> Buffer.add_string code

let asg () = sp := !sp - 1; "popq %rax\n" ^ "popq %rbx\n" ^
             "movq %rax, (%rbx)\n pushq %rax\n" |> Buffer.add_string code

let bcheck () = sp := !sp - 1; "popq %rax\n" ^ "cmpq $0, %rax\n" |> Buffer.add_string code

let jle label = "jle " ^ label ^ "\n" |> Buffer.add_string code

let jmp label = "jmp " ^ label ^ "\n" |> Buffer.add_string code

let printlbl label = label ^ ":\n" |> Buffer.add_string code

let call label = "callq _" ^ label ^ "\n" |> Buffer.add_string code

let movr r r' = "movq " ^ r ^ ", (" ^ r' ^ ") \n" |> Buffer.add_string code

let alc () = "subq	$8, %rsp\n" |> Buffer.add_string code

let dalc () = "addq	$8, %rsp\n" |> Buffer.add_string code

(* Address lookup *)
let rec lookup s = function
  | [] -> failwith "Unable to match - Address out of bounds"
  | (s', addr)::symt -> if s = s' then addr else lookup s symt

(* Code generation *)
let rec x86gen_exp symt = function
  | Const i -> st i
  | Readint ->
							 call "read";
							 str "%rax";
  | Printint e -> x86gen_exp symt e;
                  ldr "%rdi";
                  call "print"
  | Let (s, e, e') -> x86gen_exp symt e;
                      x86gen_exp ((s, !sp) :: symt) e';
                      ilet ()
  | New (s, e, e') -> x86gen_exp symt e;
                      lea !sp;
                      x86gen_exp ((s, !sp) :: symt) e'
  | Application (s, args) -> x86gen_storeargs (List.rev args) regs symt;
														 call s;
														 str "%rax"
  | Identifier s -> let addr = lookup s symt in
                    id addr
  | Seq (e, e') -> x86gen_exp symt e;
                   x86gen_exp symt e';
									 ilet ()
  | Asg (e, e') -> x86gen_exp symt e;
                   x86gen_exp symt e';
                   asg ()
  | Operation (oper, e, e') -> x86gen_exp symt e;
                               x86gen_exp symt e';
                               op oper
  | Negation e -> x86gen_exp symt e;
                  neg ()
  | If (e, e', e'') -> let lbl = "BRANCH"^(string_of_int (genlblno())) in
                       let endlbl = "END_"^lbl in
                       x86gen_exp symt e;
                       bcheck ();
                       jle lbl;
											 let old_sp = !sp in
                       x86gen_exp symt e';
                       jmp endlbl;
                       printlbl lbl;
											 sp := old_sp;
                       x86gen_exp symt e'';
                       printlbl endlbl
  | While (e, e') -> let temp_cur_lbl = !cur_lbl in
										 let temp_cur_end_lbl = !cur_end_lbl in
									   cur_lbl := "LOOP"^(string_of_int (genlblno()));
                     cur_end_lbl := "END_"^(!cur_lbl);
										 st 0;
                     printlbl !cur_lbl;
                     x86gen_exp symt e;
                     bcheck ();
                     jle !cur_end_lbl;
                     x86gen_exp symt e';
                     jmp !cur_lbl;
                     printlbl !cur_end_lbl;
										 cur_lbl := temp_cur_lbl;
										 cur_end_lbl := temp_cur_end_lbl
  | Deref e -> x86gen_exp symt e;
               deref ()
  | Return e -> x86gen_exp symt e
	| Break -> if !cur_end_lbl <> "" then jmp !cur_end_lbl
						 else failwith "Unable to match - Control statement outside loop"
	| Continue -> if !cur_lbl <> "" then jmp !cur_lbl
								else failwith "Unable to match - Control statement outside loop"
  | _ -> failwith "Unable to Compile"

(* Stack frame generation *)
and x86gen_storeargs es rs symt =
  match (es, rs) with
  | ([], _) -> ()
  | (es, []) -> x86gen_storeargs' (List.rev es) symt
  | (e::es, r::rs) -> x86gen_exp symt e; ldr r; x86gen_storeargs es rs symt

and x86gen_storeargs' es symt =
  match es with
  | [] -> ()
  | e::es -> alc (); x86gen_exp symt e; x86gen_storeargs' es symt

let rec x86gen_loadargs n rs i =
  match (n, rs) with
  | (0, _) -> ()
  | (n, []) -> sta (-i); x86gen_loadargs (n-1) [] (i+2)
  | (n, r::rs) -> str r; x86gen_loadargs (n-1) rs i

(* Function generation *)
let rec x86gen_fundef n = function
  | [] -> ()
  | ("main", args, exp)::prog -> x86gen_fundef n prog
  | (name, args, exp)::prog -> sp := 0;
                               x86_fun_prefix name n |> Buffer.add_string code;
                               let arg_count = (List.length args) in
                               x86gen_loadargs arg_count regs 4;
                               let symt = List.mapi (fun i arg -> (arg, (arg_count-i))) args in
                               x86gen_exp symt exp;
                               ldr "%rax";
                               x86_fun_suffix |> Buffer.add_string code;
                               x86gen_fundef (n+3) prog

(* Main method generation *)
let rec x86gen_main = function
  | ("main", args, exp)::prog -> sp := 0;
                                 x86_main_prefix |> Buffer.add_string code;
                                 x86gen_exp [] exp;
                                 x86_main_suffix |> Buffer.add_string code
  | x::prog -> x86gen_main prog
  | [] -> failwith "Unable to Compile"

(* Program code generation *)
let x86gen_prog prog = x86_prefix |> Buffer.add_string code;
                       x86gen_fundef 0 prog;
                       x86gen_main prog;
                       x86_suffix |> Buffer.add_string code;
                       Buffer.output_buffer stdout code
