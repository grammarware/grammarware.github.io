@contributor{bgf2src automated exporter - SLPS}
module 11101

syntax Prog
        = 
        TROLLEY Constantidentifier CONTAINS Declaration* CHECKOUT Statement DONE SEMI
 ;
syntax Declaration
        = Constdeclaration
        | Vardeclaration
        | Procdeclaration
 ;
syntax Constdeclaration
        = 
        CONST Constantidentifier COLON Type DEFINED Expression SEMI
 ;
syntax Vardeclaration
        = 
        VAR Varprocidentifier COLON Type SEMI
 ;
syntax Procdeclaration
        = 
        PROC Varprocidentifier Parameterlist COLON Type DEFINED Statement SEMI
 ;
syntax Parameterlist
        = 
        PARENTHESISL {Parameter COMMA}* PARENTHESISR
 ;
syntax Parameter
        = 
        Varprocidentifier COLON Type
 ;
syntax Statement
        = SKIP SEMI
        | Assignment
        | Conditional
        | Loop
        | Groupedstatement
 ;
syntax Groupedstatement
        = 
        BRACKETL Statement+ BRACKETR SEMI
 ;
syntax Assignment
        = 
        Varprocidentifier DEFINED Expression ae SEMI
 ;
syntax Conditional
        = 
        IF Booleanexpression THEN Statement ELSE Statement
 ;
syntax Loop
        = 
        WHILE Booleanexpression DO Statement
 ;
syntax Expression
        = p1: Procedureapplication
        | Booleanexpression b1 (QUESTION Expression COLON Expression)?
 ;
syntax Booleanexpression
        = 
        Andexpression an1 (DISJUNCTION Andexpression)*
 ;
syntax Andexpression
        = 
        Compexpression c1 (CONJUNCTION Compexpression)*
 ;
syntax Compexpression
        = 
        Arithexpression ar1 (ROP Arithexpression)?
 ;
syntax Arithexpression
        = 
        Multdivexpression m1 ((ADDITION | SUBTRACTION) Multdivexpression m2)*
 ;
syntax Multdivexpression
        = 
        Atom a1 ((EXPONENTIATION | DIVISION | MULTIPLICATION) Atom a2)*
 ;
syntax Atom
        = Constantidentifier
        | Varprocidentifier
        | Number
        | PARENTHESISL Expression PARENTHESISR
 ;
syntax Procedureapplication
        = 
        Varprocidentifier PARENTHESISL Arguments PARENTHESISR
 ;
syntax Arguments
        = 
        Expression e1 (COMMA Expression e2)*
 ;
syntax Number
        = INTEGER
        | DOUBLE
 ;
syntax Type
        = INT
        | DBLE
 ;
syntax Constantidentifier
        = 
        CONSTID
 ;
syntax Varprocidentifier
        = 
        VARPROCID
 ;
syntax SEMI
        = 
        ";"
 ;
syntax COLON
        = 
        ":"
 ;
syntax COMMA
        = 
        ","
 ;
syntax DEFINED
        = 
        ":="
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax BRACKETL
        = 
        "{"
 ;
syntax BRACKETR
        = 
        "}"
 ;
syntax PARENTHESISL
        = 
        "("
 ;
syntax PARENTHESISR
        = 
        ")"
 ;
syntax CONJUNCTION
        = 
        "/\\\\"
 ;
syntax DISJUNCTION
        = 
        "\\\\/"
 ;
syntax ADDITION
        = 
        "+"
 ;
syntax SUBTRACTION
        = 
        "-"
 ;
syntax DIVISION
        = 
        "/"
 ;
syntax MULTIPLICATION
        = 
        "*"
 ;
syntax EXPONENTIATION
        = 
        "**"
 ;
syntax ROP
        = "=="
        | "!="
        | "\<"
        | "\<="
        | "\>="
        | "\>"
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
syntax INT
        = 
        "int"
 ;
syntax DBLE
        = 
        "double"
 ;
syntax VAR
        = 
        "var"
 ;
syntax PROC
        = 
        "proc"
 ;
syntax CONST
        = 
        "const"
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
syntax INTEGER
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE
        = 
        INTEGER? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* EXPONENT?
 ;
syntax EXPONENT
        = 
        ("e" | "E") INTEGER
 ;
syntax CONSTID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax VARPROCID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
