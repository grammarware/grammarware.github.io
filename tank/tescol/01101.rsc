@contributor{bgf2src automated exporter - SLPS}
module 01101

syntax Program
        = 
        Trolley Checkout
 ;
syntax Trolley
        = 
        TROLLEY VarIDs CONTAINS Decleration
 ;
syntax Checkout
        = 
        CHECKOUT OPENBRACKET Statement* CLOSEDBRACKET SEMI DONE SEMI
 ;
syntax Decleration
        = 
        (Const_dec | Var_dec | Proc_dec)*
 ;
syntax Const_dec
        = 
        CONSTANT ConIDs COLON TYPE BECOMES Mix_fix SEMI
 ;
syntax Var_dec
        = 
        VAR VarIDs COLON TYPE SEMI
 ;
syntax Proc_dec
        = 
        PROCEDURE Proc_para COLON TYPE Proc_becomes
 ;
syntax Proc_para
        = 
        VarIDs OPENPARENTHESIS (Parameter COMMA?)* CLOSEDPARENTHESIS
 ;
syntax Parameter
        = 
        VarIDs COLON TYPE
 ;
syntax Proc_becomes
        = 
        BECOMES Cond_statements
 ;
syntax Atom
        = Procedure_call
        | CID
        | ID
        | OPENPARENTHESIS Mix_fix CLOSEDPARENTHESIS
        | INT
        | DOUBLE
 ;
syntax Negation
        = SUB Atom
        | Atom
 ;
syntax Exponential
        = 
        Negation (EXP Negation)*
 ;
syntax Multiplication_division
        = 
        Exponential ((MUL | DIV) Exponential)*
 ;
syntax Arithmetic_expression
        = 
        Multiplication_division ((ADD | SUB) Multiplication_division)*
 ;
syntax Bool_atom
        = 
        Arithmetic_expression ((NONEQUALITY | EQUALITY | MOREOREQUAL | LESSOREQUAL | MORETHEN | LESSTHEN) Arithmetic_expression)*
 ;
syntax Bool_conjunction
        = 
        Bool_atom (CONJUNCTION Bool_atom)*
 ;
syntax Bool_disjunction
        = 
        Bool_conjunction (DISJUNCTION Bool_conjunction)*
 ;
syntax Mix_fix
        = 
        Bool_disjunction (MIX_FIX Arithmetic_expression COLON Atom)?
 ;
syntax Procedure_call
        = 
        VarIDs OPENPARENTHESIS Parameters CLOSEDPARENTHESIS SEMI
 ;
syntax Parameters
        = 
        Mix_fix (COMMA Mix_fix)*
 ;
syntax Statement
        = Conditional
        | Loop
        | Assignment
        | Skip
        | Procedure_call
 ;
syntax Skip
        = 
        SKIP SEMI
 ;
syntax Conditional
        = 
        IF OPENPARENTHESIS Bool_disjunction CLOSEDPARENTHESIS Then_statement Else_statement
 ;
syntax Then_statement
        = 
        THEN Cond_statements
 ;
syntax Else_statement
        = 
        ELSE Cond_statements
 ;
syntax Loop
        = 
        WHILE Bool_disjunction Do_statement
 ;
syntax Do_statement
        = 
        DO Cond_statements
 ;
syntax Cond_statements
        = OPENBRACKET Statement* CLOSEDBRACKET
        | Statement
 ;
syntax Assignment
        = 
        VarIDs BECOMES Mix_fix SEMI
 ;
syntax VarIDs
        = CID
        | ID
 ;
syntax ConIDs
        = 
        CID
 ;
syntax DOUBLE
        = 
        INT? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") (ADD | SUB)? INT)?
 ;
syntax INT
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax COMMENT
        = 
        BEGINCOMMENT ANY* ENDCOMMENT
 ;
syntax TYPE
        = "int"
        | "double"
 ;
syntax DONE
        = 
        "done"
 ;
syntax SKIP
        = 
        "skip"
 ;
syntax TROLLEY
        = 
        "trolley"
 ;
syntax CHECKOUT
        = 
        "checkout"
 ;
syntax CONTAINS
        = 
        "contains"
 ;
syntax VAR
        = 
        "var"
 ;
syntax CONSTANT
        = 
        "const"
 ;
syntax PROCEDURE
        = 
        "proc"
 ;
syntax TROLLY
        = 
        "trolly"
 ;
syntax COMMA
        = 
        ","
 ;
syntax SEMI
        = 
        ";"
 ;
syntax COLON
        = 
        ":"
 ;
syntax ADD
        = 
        "+"
 ;
syntax SUB
        = 
        "-"
 ;
syntax DIV
        = 
        "/"
 ;
syntax MUL
        = 
        "*"
 ;
syntax EXP
        = 
        "**"
 ;
syntax BECOMES
        = 
        ":="
 ;
syntax MIX_FIX
        = 
        "?"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NONEQUALITY
        = 
        "!="
 ;
syntax LESSTHEN
        = 
        "\<"
 ;
syntax MORETHEN
        = 
        "\>"
 ;
syntax LESSOREQUAL
        = 
        "\<="
 ;
syntax MOREOREQUAL
        = 
        "\>="
 ;
syntax CONJUNCTION
        = 
        "/\\\\"
 ;
syntax DISJUNCTION
        = 
        "\\\\/"
 ;
syntax BEGINCOMMENT
        = 
        "/*"
 ;
syntax ENDCOMMENT
        = 
        "*/"
 ;
syntax OPENBRACKET
        = 
        "{"
 ;
syntax CLOSEDBRACKET
        = 
        "}"
 ;
syntax OPENPARENTHESIS
        = 
        "("
 ;
syntax CLOSEDPARENTHESIS
        = 
        ")"
 ;
syntax IF
        = 
        "if"
 ;
syntax THEN
        = 
        "then"
 ;
syntax ELSE
        = 
        "else"
 ;
syntax WHILE
        = 
        "while"
 ;
syntax DO
        = 
        "do"
 ;
syntax CID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
