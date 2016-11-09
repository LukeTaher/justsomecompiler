open Some_types
open Hashtbl

(* Functions *)
let funs = Hashtbl.create 100

(* Instruction Set *)
(* let ram = Hashtbl.create 103  *)
let acc = ref 0

let lblno = ref 0
let genlblno () = lblno := !lblno; !lblno

let string_of_op = function
	  | Add -> "add"
	  | Sub -> "sub"
	  | Mul -> "mul"
	  | Div -> "div"
	  | Eq -> "eq"
	  | Le -> "le"
	  | Ge -> "ge"
	  | Leq -> "leq"
	  | Geq -> "geq"
	  | And -> "and"
	  | Or -> "or"

let code = Buffer.create 100

let op (op, addr1, addr2) = "\t" ^ (string_of_op op) ^ " r" ^ (string_of_int addr1) ^
                            ", r" ^ (string_of_int addr2) ^ "\n"
                            |> Buffer.add_string code
let st addr = "\tst r" ^ (string_of_int addr) ^ "\n" |> Buffer.add_string code
let ldc n = "\tldc " ^ (string_of_int n) ^ "\n" |> Buffer.add_string code
let ld addr = "\tld r" ^ (string_of_int addr) ^ "\n" |> Buffer.add_string code
let mv addr1 addr2 = "\tmv r" ^ (string_of_int addr1) ^
                     ", r" ^ (string_of_int addr2) ^ "\n"
                     |> Buffer.add_string code
let mvfa addr1 = "\tmvfa r" ^ (string_of_int addr1) ^ "\n"
                |> Buffer.add_string code
let mvta addr1 = "\tmvta r" ^ (string_of_int addr1) ^ "\n"
                |> Buffer.add_string code
let neg addr = "\tneg r" ^ (string_of_int addr) ^ "\n" |> Buffer.add_string code
let cmp addr n = "\tcmp r" ^ (string_of_int addr) ^
                 ", " ^ (string_of_int n) ^ "\n"
                 |> Buffer.add_string code
let jmp lbl = "\tjmp " ^ lbl ^ "\n" |> Buffer.add_string code
let jmpz lbl = "\tjmpz " ^ lbl ^ "\n" |> Buffer.add_string code
let printlbl lbl = lbl ^ ":\n" |> Buffer.add_string code

(* Address generation *)
let stack_base = ref 3
let newaddr () = stack_base:=!stack_base+1; if !stack_base < 53 then !stack_base
                                            else failwith "Buffer Overflow"

let heap_base = ref 103
let heapalloc () = heap_base:=!heap_base-1; if !heap_base > 52 then !heap_base
                                            else failwith "Buffer Overflow"

(* Address lookup *)
let rec lookup s = function
    | [] -> failwith "Unable to match - Address out of bounds"
    | (s', addr)::symt -> if s = s' then addr else lookup s symt

(* Interpreter *)
let rec cgen_exp symt = function
  | Const i -> let addr = newaddr() in
                ldc i;
                st addr;
                addr
  | Readint -> 0
  | Printint e -> mv 1 (cgen_exp symt e); 1
  | Let (s, e, e') -> let addr1 = cgen_exp symt e in
                      let addr2 = cgen_exp ((s, addr1)::symt) e' in
                      mv addr1 addr2;
                      stack_base := addr1;
                      addr1
  | New (s, e, e') -> let hbtemp = !heap_base in
                      let addr1 = cgen_exp symt e in
                      let haddr = heapalloc() in
                      mv haddr addr1;
                      ldc haddr;
                      st addr1;
                      let addr2 = cgen_exp ((s, addr1)::symt) e' in
                      mv addr1 addr2;
                      stack_base := addr1;
                      heap_base := hbtemp;
                      addr1
  (* | Application (s, args) -> inter_fundef (s, args) symt *)
  | Identifier s -> let addr = lookup s symt in
                    let addr' = newaddr() in
                    mv addr' addr;
                    addr'
  | Seq (e, e') -> (cgen_exp symt e) |> ignore; (cgen_exp symt e')
  (* | Lambda (args, e') -> *)
  | Asg (e, e') -> let addr1 = cgen_exp symt e in
                   let addr2 = cgen_exp symt e' in
									 ld addr1;
                   mvta addr2;
                   stack_base := addr1;
                   addr1
  | Operation (oper, e, e') -> let addr1 = cgen_exp symt e in
                               let addr2 = cgen_exp symt e' in
                               op (oper, addr1, addr2);
                               stack_base := addr1;
                               st addr1;
                               addr1
  | Negation e -> let addr = cgen_exp symt e in
                  let addr' = newaddr() in
                  mv addr' addr;
                  neg addr';
                  addr'
  | If (e, e', e'') -> let addr1 = cgen_exp symt e in
                       let lbl = "BRANCH"^(string_of_int (genlblno())) in
                       let endlbl = "END_"^lbl in
                       cmp addr1 1;
                       jmpz lbl;
                       let addr2 = cgen_exp symt e' in
                       mv addr1 addr2;
                       stack_base := addr1;
                       jmp endlbl;
                       printlbl lbl;
                       let addr2 = cgen_exp symt e'' in
                       mv addr1 addr2;
                       stack_base := addr1;
                       printlbl endlbl;
                       addr1
  | While (e, e') ->  let addr1 = cgen_exp symt e in
                      let lbl = "WHILE"^(string_of_int (genlblno())) in
                      let endlbl = "END_"^lbl in
                      let addr3 = newaddr() in
                      ldc 0;
                      st addr3;
                      printlbl lbl;
                      cmp addr1 1;
                      jmpz endlbl;
                      let addr2 = cgen_exp symt e' in
                      mv addr3 addr2;
                      jmp lbl;
                      printlbl endlbl;
                      addr3
  | Deref e -> let addr = cgen_exp symt e in
               ld addr;
               mvfa addr;
               addr
  | Return e -> cgen_exp symt e
  | _ -> failwith "Unable to Interpret"

(* Function interpretation *)
(* and inter_fundef (name, argvs) symt =
  let (args, exp) = try find funs name
                    with Not_found -> failwith ("Unable to match - Function definition "^ name ^" not found")(*lambda_fetch name env*) in
  let stemp = !stack_base in
  let htemp = !heap_base in
  let res = cgen_exp (gen_stackframe args argvs symt) exp in
  stack_base := stemp;
  heap_base := htemp;
  res *)

(* Stack Frame *)
(* and gen_stackframe args argvs symt =
  match (args, argvs) with
  | (arg::args, argv::argvs) -> let addr1 = cgen_exp symt argv in
                                (arg, addr1)::(gen_stackframe args argvs symt)
  | _ -> [] *)

let rec cgen_prog' = function
  | ("main", args, exp)::prog ->printlbl "_start";
                                let addr = (cgen_exp [] exp) in
                                ld addr;
                                jmp "END";
                                printlbl "END";
                                "\tnop\n" |> Buffer.add_string code;
                                Buffer.output_buffer stdout code;
                                cgen_prog' prog
  | (name, args, exp)::prog ->  printlbl name;
                                let addr = (cgen_exp [] exp) in
                                ld addr;
                                Buffer.output_buffer stdout code;
                                cgen_prog' prog
  | _ -> ()

let rec add_funs = function
  | (name, (args:string list), exp)::prog -> replace funs name (args, exp); add_funs prog
  | _ -> ()

let rec cgen_prog prog = add_funs prog; cgen_prog' prog
  (* | (name, args, exp)::prog -> replace funs name (args, exp); cgen_prog prog
	| _ -> find ram (inter_fundef ("main", []) []) *)
