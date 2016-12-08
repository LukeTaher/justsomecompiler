(* AST types *)

type biop =
  | Add | Sub | Mul | Div
  | Eq  | Le  | Ge  | Leq | Geq
  | And | Or

type expression =
  | Seq of expression * expression (* e; e *)
  | While of expression * expression (* while(e){e} *)
  | If of expression * expression * expression (* if(e){e}else{e} *)
  | Asg of expression * expression (* e = e *)
  | Deref of expression
  | Operation of biop * expression * expression (* e + e *)
  | Negation of expression (* !e *)
  | Application of string * expression list (* e(e) *)
  | Lambda of string list * expression
  | Const of int (* 7 *)
  | Readint (* read_int() *)
  | Printint of expression (* print_int(e) *)
  | Identifier of string (* x *)
  | Let of string * expression * expression (* const int x = e; e *)
  | New of string * expression * expression (* const int x = e; e *)
  | Return of expression (* return e *)
  | Break
  | Continue

type fundef = string * string list * expression (* x(e){e} *)

type program = fundef list

(* Store data type *)
type value =
  | Bool of bool
  | Integer of int
  | Address of int
  | Unit of unit
  | Function of string list * expression

(* AST pretty print *)

let rec tab_string = function | 0 -> "" | x -> "\t" ^ tab_string (x-1)

let string_of_biop = function
  | Add -> "Add"
  | Sub -> "Sub"
  | Mul -> "Mul"
  | Div -> "Div"
  | Eq -> "Eq"
  | Le -> "Le"
  | Ge -> "Ge"
  | Leq -> "Leq"
  | Geq -> "Geq"
  | And -> "And"
  | Or -> "Or"

let rec string_of_expression expr depth =
  match expr with
    | Const i -> "Const " ^ string_of_int i
    | Seq (e, e') ->  "Seq (\n" ^
                      tab_string (depth+1) ^
                      string_of_expression e (depth+1) ^ ",\n" ^
                      tab_string (depth+1) ^
                      string_of_expression e'(depth+1) ^ "\n" ^
                      tab_string (depth) ^
                      ")"
    | While (e, e') ->  "While (" ^
                        string_of_expression e (depth+1) ^ ",\n" ^
                        tab_string (depth+1) ^
                        string_of_expression e' (depth+1) ^ "\n" ^
                        tab_string (depth) ^
                        ")"
    | If (e, e', e'') -> "If (" ^ string_of_expression e (depth+1) ^ ",\n" ^
                         tab_string (depth+1) ^
                         string_of_expression e' (depth+1) ^ ",\n" ^
                         tab_string (depth+1) ^
                         string_of_expression e'' (depth+1) ^ "\n" ^
                         tab_string (depth) ^
                         ")"
    | Asg (e, e') -> "Asg (" ^ string_of_expression e (depth+1) ^ ", " ^
                               string_of_expression e' (depth+1) ^ ")"
    | Deref e -> "Deref (" ^ string_of_expression e (depth+1) ^ ")"
    | Operation (op, e, e') -> "Operation (" ^ string_of_biop op ^ ", " ^
                                string_of_expression e (depth+1) ^ ", " ^
                                string_of_expression e' (depth+1) ^ ")"
    | Negation e -> "Negation (" ^ string_of_expression e (depth+1) ^ ")"
    | Application (s, e) -> "Application (" ^ s ^ ", [" ^
                               string_of_params e ^ "])"
    | Lambda (s, e) -> "Lambda (" ^ string_of_args s ^ ", " ^
                          string_of_expression e (depth+1) ^ ")"
    | Readint -> "Readint"
    | Printint e -> "Printint (" ^ string_of_expression e (depth+1) ^ ")"
    | Identifier s -> "Identifier \"" ^ s ^ "\""
    | Let (s, e, e') -> "Let (\"" ^ s ^ "\", " ^
                        string_of_expression e (depth+1) ^ ",\n" ^
                        tab_string (depth+1) ^
                        string_of_expression e' (depth+1) ^ "\n" ^
                        tab_string (depth) ^
                        ")"
    | New (s, e, e') -> "New (\"" ^ s ^ "\", " ^
                        string_of_expression e (depth+1) ^ ",\n" ^
                        tab_string (depth+1) ^
                        string_of_expression e' (depth+1) ^ "\n" ^
                        tab_string (depth) ^
                        ")"
    | Return e -> "Return (" ^ string_of_expression e (depth+1) ^ ")"
    | Break -> "Break"
    | Continue -> "Continue"

and string_of_params = function
  | [] -> ""
  | [x] -> string_of_expression x 0
  | x::xs -> string_of_expression x 0 ^ "; " ^ string_of_params xs

and string_of_args = function
  | [] -> ""
  | [x] -> x
  | x::xs -> x ^ "; " ^ string_of_args xs

let string_of_fundef (name, ps, exp) = "(\"" ^ name ^ "\", [" ^ string_of_args ps ^
                                       "],\n\t" ^ string_of_expression exp 1 ^
                                       "\n)"

let rec string_of_prog' = function
  | [] -> ""
  | [x] -> string_of_fundef x
  | x::xs -> string_of_fundef x ^ ";\n" ^ string_of_prog' xs

let string_of_prog fs = "[\n" ^ string_of_prog' fs ^ "\n]\n"
