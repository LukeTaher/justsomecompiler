open Some_types
open Hashtbl

(* Instruction Set *)
let ram = Hashtbl.create 100
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
let mv addr1 addr2 = replace ram addr1 (find ram addr2)
let neg addr = if (find ram addr) > 0 then replace ram addr 0
                                        else replace ram addr 1

(* Address generation *)
let cur_addr = ref 2
let newaddr () = cur_addr:=!cur_addr+1; !cur_addr

(* Address lookup *)
let rec lookup s = function
    | [] -> failwith ("Unable to match - Address out of bounds")
    | (s', addr)::symt -> if s = s' then addr else lookup s symt

(* Interpreter *)
let rec inter_exp symt = function
  | Const i -> let addr = newaddr() in
                ldc i;
                st addr;
                addr
  | Readint -> 0
  | Printint e -> mv 1 (inter_exp symt e); 1
  | Let (s, e, e') -> let addr = inter_exp symt e in
                      inter_exp ((s, addr)::symt) e'
  (* | New (s, e, e') ->  *)
  (* | Application (s, args) -> *)
  | Identifier s -> lookup s symt
  | Seq (e, e') -> (inter_exp symt e) |> ignore; (inter_exp symt e')
  (* | Lambda (args, e') -> *)
  (* | Asg (e, e') -> *)
  | Operation (oper, e, e') -> let addr1 = inter_exp symt e in
                               let addr2 = inter_exp symt e' in
                               op (oper, addr1, addr2);
                               let addr3 = newaddr() in
                               st addr3;
                               addr3
  | Negation e -> let addr = inter_exp symt e in
                  neg addr;
                  addr
  (* | If (e, e', e'') -> *)
  (* | While (e, e') -> *)
  (* | Deref e -> *)
  | Return e -> inter_exp symt e
  | _ -> failwith "Unable to Interpret"

let rec inter_prog = function
	| ("main", args, exp)::prog -> find ram (inter_exp [] exp)
	| (name, args, exp)::prog -> inter_prog prog
  | _ -> 0
