open Some_types
open Hashtbl

(* Functions *)
let funs = Hashtbl.create 100

(* Instruction Set *)
let ram = Hashtbl.create 103
let acc = ref 0

let fun_of_op = function
	  | Add -> (+)
	  | Sub -> (-)
	  | Mul -> ( * )
	  | Div -> (/)
	  | Eq -> (fun x y -> if x = y then 1 else 0)
	  | Le -> (fun x y -> if x < y then 1 else 0)
	  | Ge -> (fun x y -> if x > y then 1 else 0)
	  | Leq -> (fun x y -> if x <= y then 1 else 0)
	  | Geq -> (fun x y -> if x >= y then 1 else 0)
	  | And -> (fun x y -> if x=1 && y=1 then 1 else 0)
	  | Or -> (fun x y -> if x=1 || y=1 then 1 else 0)

let op (op, addr1, addr2) =
        acc := (fun_of_op op) (find ram addr1) (find ram addr2)
let st addr = replace ram addr !acc
let ldc n = acc := n
let ld addr = acc := find ram addr
let mv addr1 addr2 = replace ram addr1 (find ram addr2)
let mvfa addr1 = replace ram addr1 (find ram !acc)
let mvta addr1 = replace ram !acc (find ram addr1)
let neg addr = if (find ram addr) > 0 then replace ram addr 0
                                        else replace ram addr 1
let cmp addr n = if (find ram addr) = n then acc := 1
                                          else acc:= 0

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
let rec inter_exp symt = function
  | Const i -> let addr = newaddr() in
                ldc i;
                st addr;
                addr
  | Readint -> 0
  | Printint e -> mv 1 (inter_exp symt e); 1
  | Let (s, e, e') -> let addr1 = inter_exp symt e in
                      let addr2 = inter_exp ((s, addr1)::symt) e' in
                      mv addr1 addr2;
                      stack_base := addr1;
                      addr1
  | New (s, e, e') -> let hbtemp = !heap_base in
                      let addr1 = inter_exp symt e in
                      let haddr = heapalloc() in
                      mv haddr addr1;
                      ldc haddr;
                      st addr1;
                      let addr2 = inter_exp ((s, addr1)::symt) e' in
                      mv addr1 addr2;
                      stack_base := addr1;
                      heap_base := hbtemp;
                      addr1
  | Application (s, args) -> inter_fundef (s, args) symt
  | Identifier s -> let addr = lookup s symt in
                    let addr' = newaddr() in
                    mv addr' addr;
                    addr'
  | Seq (e, e') -> (inter_exp symt e) |> ignore; (inter_exp symt e')
  (* | Lambda (args, e') -> *)
  | Asg (e, e') -> let addr1 = inter_exp symt e in
                   let addr2 = inter_exp symt e' in
									 ld addr1;
                   mvta addr2;
                   stack_base := addr1;
                   addr1
  | Operation (oper, e, e') -> let addr1 = inter_exp symt e in
                               let addr2 = inter_exp symt e' in
                               op (oper, addr1, addr2);
                               stack_base := addr1;
                               st addr1;
                               addr1
  | Negation e -> let addr = inter_exp symt e in
                  let addr' = newaddr() in
                  mv addr' addr;
                  neg addr';
                  addr'
  | If (e, e', e'') -> let addr = inter_exp symt e in
                       cmp addr 1;
                       if !acc = 1 then inter_exp symt e'
                       else inter_exp symt e''
  | While (e, e') as exp -> let addr = inter_exp symt e in
                     cmp addr 1;
                     if !acc = 1 then (let raddr = inter_exp symt e' in
                                        let addr = inter_exp symt e in
                                        cmp addr 1;
                                        if !acc = 1 then inter_exp symt exp
                                        else raddr)
                     else 2
  | Deref e -> let addr = inter_exp symt e in
               ld addr;
               mvfa addr;
               addr
  | Return e -> inter_exp symt e
  | _ -> failwith "Unable to Interpret"

(* Function interpretation *)
and inter_fundef (name, argvs) symt =
  let (args, exp) = try find funs name
                    with Not_found -> failwith ("Unable to match - Function definition "^ name ^" not found")(*lambda_fetch name env*) in
  let stemp = !stack_base in
  let htemp = !heap_base in
  let res = inter_exp (gen_stackframe args argvs symt) exp in
  stack_base := stemp;
  heap_base := htemp;
  res

(* Stack Frame *)
and gen_stackframe args argvs symt =
  match (args, argvs) with
  | (arg::args, argv::argvs) -> let addr1 = inter_exp symt argv in
                                (arg, addr1)::(gen_stackframe args argvs symt)
  | _ -> []

let rec inter_prog prog =
  replace ram 2 0;
  match prog with
  | (name, args, exp)::prog -> replace funs name (args, exp); inter_prog prog
	| _ -> find ram (inter_fundef ("main", []) [])
