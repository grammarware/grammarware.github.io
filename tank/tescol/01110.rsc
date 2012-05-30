@contributor{bgf2src automated exporter - SLPS}
module 01110

syntax Prog
        = 
        TROLLEY CID CONTAINS Declaration* CheckoutStat
 ;
syntax Declaration
        = ConstDec
        | VarDec
        | ProcDec
 ;
syntax CheckoutStat
        = 
        CHECKOUT Statement DONE SEMI
 ;
syntax ConstDec
        = 
        CONST CID name COLON Type t COLON_EQUALS MixFix c SEMI
 ;
syntax VarDec
        = 
        VAR ID name COLON Type t SEMI
 ;
syntax ProcDec
        = 
        PROC ID name LPAREN (ID a COLON Type a_t (COMMA ID b COLON Type b_t)*)? RPAREN COLON Type r_t COLON_EQUALS Statement c
 ;
syntax Statement
        = Assignment
        | IfStat
        | LoopStat
        | SkipStat
        | LBRACE Statement+ RBRACE SEMI
 ;
syntax SkipStat
        = 
        SKIP SEMI
 ;
syntax Assignment
        = 
        (CID | ID) COLON_EQUALS MixFix SEMI
 ;
syntax StartStat
        = 
        TROLLEY CID CONTAINS
 ;
syntax Type
        = 
        (INT | DOUBLE)?
 ;
syntax Atom
        = INT_NUMBER
        | DOUBLE_NUMBER
        | ID
        | CID
        | ProcCall
        | LPAREN MixFix RPAREN
 ;
syntax ProcCall
        = 
        (ID name | CID name) LPAREN (MixFix a (COMMA MixFix b)*)? RPAREN
 ;
syntax Negation
        = 
        "-"
 ;
syntax Unary
        = 
        ("+" | Negation)* Atom
 ;
syntax ExpoExpr
        = 
        Unary (EXPONENTIATION Unary)*
 ;
syntax MultDivExpr
        = 
        ExpoExpr ((MULTIPLICATION | DIVISION) ExpoExpr)*
 ;
syntax AddSubExpr
        = 
        MultDivExpr ((ADDITION | SUBTRACTION) MultDivExpr)*
 ;
syntax Relation
        = 
        AddSubExpr ((EQUALITY | NON_EQUALITY | LESS | LESS_EQUAL | GREATER_EQUAL | GREATER) AddSubExpr)*
 ;
syntax ConjDisjunExpr
        = 
        Relation ((CONJUNCTION | DISJUNCTION) Relation)*
 ;
syntax MixFix
        = ConjDisjunExpr a QUESTION ConjDisjunExpr b COLON ConjDisjunExpr c
        | ConjDisjunExpr
 ;
syntax IfStat
        = IF MixFix a THEN Statement b ELSE Statement c
        | IF MixFix a THEN Statement b
 ;
syntax LoopStat
        = 
        WHILE MixFix a DO Statement b
 ;
syntax SEMI
        = 
        ";"
 ;
syntax COMMA
        = 
        ","
 ;
syntax COLON
        = 
        ":"
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NON_EQUALITY
        = 
        "!="
 ;
syntax LESS
        = 
        "\<"
 ;
syntax LESS_EQUAL
        = 
        "\<="
 ;
syntax GREATER_EQUAL
        = 
        "\>="
 ;
syntax GREATER
        = 
        "\>"
 ;
syntax CONJUNCTION
        = 
        "/\\\\"
 ;
syntax DISJUNCTION
        = 
        "\\\\/"
 ;
syntax COLON_EQUALS
        = 
        ":="
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
syntax DONE
        = 
        "done"
 ;
syntax TROLLEY
        = 
        "trolley"
 ;
syntax CONTAINS
        = 
        "contains"
 ;
syntax SKIP
        = 
        "skip"
 ;
syntax CHECKOUT
        = 
        "checkout"
 ;
syntax INT
        = 
        "int"
 ;
syntax DOUBLE
        = 
        "double"
 ;
syntax CONST
        = 
        "const"
 ;
syntax VAR
        = 
        "var"
 ;
syntax PROC
        = 
        "proc"
 ;
syntax LBRACE
        = 
        "{"
 ;
syntax RBRACE
        = 
        "}"
 ;
syntax LPAREN
        = 
        "("
 ;
syntax RPAREN
        = 
        ")"
 ;
syntax INT_NUMBER
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE_NUMBER
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") INT_NUMBER)?
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
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
