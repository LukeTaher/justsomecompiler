### Assignment 4 Notes
- Constant folding + propagation
- Loop unrolling
- Function inlining
- Basic subexpression elimination
- Evaluation step counting
- Evaluation timing
- ASTs in `test/asm4/ast`


*see asm4 test script for examples*

## About
A compiler developed in OCaml with OCamllex and Menhir for the Compiler Construction module at the University of Birmingham. Intended to mimic a C-like syntax with functional characteristics.

## Usage
Compile with `make` clean with `make clean`

Run on a given file with `./some_lang.native [-flags] [filename]`

###### Flags
- `-v` - Print abstract syntax tree
- `-o` - Enable optimisations
- `-s` - Output evaluation statistics

## Tests

Run tests with `make tests`

Failed test reports can be found in `test/test.log`

The inputs of tests for assignment X can be viewed in `test/asmX`

The expected results of tests for assignment X can be viewed in `test/asmX/expected`

## Syntax
Programs consist of a sequence of function definitions.

Function definitions consist of a function name, sequence of zero or more arguments and a sequence of instructions:
```
functionName(arguments){instructions}
```

Arguments consist of a list of instructions separated by a comma

Instructions are separated by semicolons as:

```
instruction
instruction; instruction
```

Instructions can be in the form of the following expressions:

```
var varName = 5               //variable declaration
const varName = 5             //constant declaration
varName                       //variable
~x                            //dereference variable

5                              //constant
5 {math operation} x           //mathematical expression
x {bool operation} y           //boolean expression
!(x)                           //boolean negation

someFunctionName(arguments)    //function call
read_int()                     //read int
print(instruction)             //print expression

return instruction             //return
```

and the following constructs:

```
while(expression){instruction}                             //while loop
if(expression){instruction}else{instruction}               //if statement
fun var1, var2, ..., varn -> (instruction)                 //lambda function
```
