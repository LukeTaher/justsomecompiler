## About
A compiler developed in OCaml for the Compiler Construction module at the University of Birmingham. Intended to mimick a C-like syntax.
## Usage
Compile with `make` clean with `make clean`

Run on a given file with `./some_lang.native [filename]` 

## Syntax
Programs consist of a sequence of function definitions.

Function definitions consist of a function name, sequence of zero or more arguments and a sequence of instructions:
```
functionName(arguments){instructions}
```

Arguments consist of a list of instructions seperated by a comma

Instructions can be in the form of the following expressions:

```
instruction
instruction instruction

int varName = 5;               //variable declaration
const int varName = 5;         //constant declaration
varName;                       //dereferenced variable

5;                             //constant
5 {math operation} x;          //mathmatical expression
x {bool operation} y;          //boolean expression
!x;                            //boolean negation

someFunctionName(arguments);   //function call
read_int();                    //read int
print_int(instruction)         //print int

return instruction;            //return
```

and the following constructs:

```
while(expression){instruction}                             //while loop
if(expression){instruction}else(expression){instruction}   //if statement
```
