@contributor{bgf2src automated exporter - SLPS}
module 10011

syntax Program
        = 
        TROLLEY CONSTANT CONTAINS Declaration* CHECKOUT Statementlist SEMI DONE SEMI
 ;
syntax TROLLEY
        = 
        "trolley"
 ;
syntax CONSTANT
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax CONTAINS
        = 
        "contains"
 ;
syntax Declaration
        = Consdec
        | Vardec
        | Procdec
 ;
syntax Consdec
        = 
        CONST CONSTANT COLON Type DEFAS Aexpr SEMI
 ;
syntax CONST
        = 
        "const"
 ;
syntax COLON
        = 
        ":"
 ;
syntax Type
        = INTEGER
        | DOUBLE
 ;
syntax INTEGER
        = 
        "int"
 ;
syntax DOUBLE
        = 
        "double"
 ;
syntax DEFAS
        = 
        ":="
 ;
syntax Aexpr
        = 
        Cexpr
 ;
syntax Cexpr
        = 
        Bexpr (QM Cexpr COLON Cexpr)?
 ;
syntax Bexpr
        = 
        Con (DISJUN Con)*
 ;
syntax Con
        = 
        Ropexpr (CONJUN Ropexpr)*
 ;
syntax Ropexpr
        = 
        Expr (Rop Expr)?
 ;
syntax Expr
        = MultExpr ((PLUS | MINUS) MultExpr)*
        | Procapp
 ;
syntax MultExpr
        = 
        Expon ((MULT | DIV) Expon)*
 ;
syntax Expon
        = 
        Sign (EXPON Sign)*
 ;
syntax Sign
        = 
        (MINUS | PLUS)? Atom
 ;
syntax MINUS
        = 
        "-"
 ;
syntax PLUS
        = 
        "+"
 ;
syntax Atom
        = Number
        | VARIABLE
        | CONSTANT
        | LPAR Cexpr RPAR
 ;
syntax Number
        = INT
        | DUB
 ;
syntax INT
        = "0"
        | ("1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*
 ;
syntax DUB
        = 
        INT? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") INT)?
 ;
syntax VARIABLE
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax LPAR
        = 
        "("
 ;
syntax RPAR
        = 
        ")"
 ;
syntax EXPON
        = 
        "**"
 ;
syntax MULT
        = 
        "*"
 ;
syntax DIV
        = 
        "/"
 ;
syntax Procapp
        = 
        VARIABLE LPAR Aexprlist RPAR
 ;
syntax Aexprlist
        = 
        Aexpr (COMMA Aexpr)*
 ;
syntax COMMA
        = 
        ","
 ;
syntax Rop
        = EQ
        | NEQ
        | LESS
        | MORE
        | LESSEQ
        | MOREEQ
 ;
syntax EQ
        = 
        "=="
 ;
syntax NEQ
        = 
        "!="
 ;
syntax LESS
        = 
        "\<"
 ;
syntax MORE
        = 
        "\>"
 ;
syntax LESSEQ
        = 
        "\<="
 ;
syntax MOREEQ
        = 
        "\>="
 ;
syntax CONJUN
        = 
        "/\\\\"
 ;
syntax DISJUN
        = 
        "\\\\/"
 ;
syntax QM
        = 
        "?"
 ;
syntax SEMI
        = 
        ";"
 ;
syntax Vardec
        = 
        VAR Parameter SEMI
 ;
syntax VAR
        = 
        "var"
 ;
syntax Parameter
        = 
        VARIABLE COLON Type
 ;
syntax Procdec
        = 
        PROC VARIABLE LPAR Paramlist RPAR COLON Type DEFAS Statementlist SEMI
 ;
syntax PROC
        = 
        "proc"
 ;
syntax Paramlist
        = 
        Parameter (COMMA Parameter)*
 ;
syntax Statementlist
        = Statement
        | LCPAR Statement (SEMI Statement)* RCPAR
 ;
syntax Statement
        = SKIP
        | Assignment
        | Conditional
        | Loop
 ;
syntax SKIP
        = 
        "skip"
 ;
syntax Assignment
        = 
        VARIABLE DEFAS Aexpr
 ;
syntax Conditional
        = 
        IF Bexpr THEN Statementlist ELSE Statementlist
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
syntax Loop
        = 
        WHILE Bexpr DO Statementlist
 ;
syntax WHILE
        = 
        "while"
 ;
syntax DO
        = 
        "do"
 ;
syntax LCPAR
        = 
        "{"
 ;
syntax RCPAR
        = 
        "}"
 ;
syntax CHECKOUT
        = 
        "checkout"
 ;
syntax DONE
        = 
        "done"
 ;
