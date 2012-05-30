@contributor{bgf2src automated exporter - SLPS}
module 11100

syntax Program
        = 
        TROLLEY CONSTID CONTAINS (Definition SEMI?)* CHECKOUT Statement SEMI? DONE SEMI
 ;
syntax Definition
        = CONST CONSTID COLON Type ASSIGNMENT Expression
        | VAR ID COLON Type
        | PROC ID LEFTBRACKET Parameters? RIGHTBRACKET COLON Type ASSIGNMENT Statement
 ;
syntax Statement
        = SKIP SEMI
        | ID ASSIGNMENT Expression SEMI
        | IF Boolexp THEN Statement ELSE Statement
        | WHILE Boolexp DO Statement
        | LEFTBRACE Statement+ RIGHTBRACE
 ;
syntax Atom
        = Procedurecall
        | ID
        | CONSTID
        | LEFTBRACKET Expression RIGHTBRACKET
        | Value
 ;
syntax Unary
        = 
        MINUS t* Atom
 ;
syntax Mult
        = 
        Unary t (MULTIPLIER Unary)*
 ;
syntax Addition
        = 
        Mult t (Addop Mult)*
 ;
syntax Predicate
        = 
        Addition t (COMPARISON Addition u)?
 ;
syntax Boolexp
        = 
        Predicate t (BOOLOPERATOR Predicate u)*
 ;
syntax Expression
        = 
        Boolexp (QMARK Mult t COLON Mult f)?
 ;
syntax Procedurecall
        = 
        ID LEFTBRACKET Arguments? RIGHTBRACKET
 ;
syntax Arguments
        = 
        Expression (COMMA Expression)*
 ;
syntax Parameter
        = 
        ID COLON Type
 ;
syntax Parameters
        = 
        Parameter (COMMA Parameter)*
 ;
syntax Addop
        = PLUS
        | MINUS
 ;
syntax Type
        = INTTYPE
        | DOUBLETYPE
 ;
syntax Value
        = INT
        | DOUBLE
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax TROLLEY
        = 
        "trolley"
 ;
syntax CONTAINS
        = 
        "contains"
 ;
syntax CHECKOUT
        = 
        "checkout"
 ;
syntax DONE
        = 
        "done"
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
syntax SKIP
        = 
        "skip"
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
syntax INTTYPE
        = 
        "int"
 ;
syntax DOUBLETYPE
        = 
        "double"
 ;
syntax TRUE
        = 
        "true"
 ;
syntax FALSE
        = 
        "false"
 ;
syntax MULTIPLIER
        = "**"
        | "/"
        | "*"
 ;
syntax PLUS
        = 
        "+"
 ;
syntax MINUS
        = 
        "-"
 ;
syntax BOOLOPERATOR
        = "/\\\\"
        | "\\\\/"
 ;
syntax COMPARISON
        = "=="
        | "!="
        | "\<="
        | "\>="
        | "\<"
        | "\>"
 ;
syntax ASSIGNMENT
        = 
        ":="
 ;
syntax COLON
        = 
        ":"
 ;
syntax SEMI
        = 
        ";"
 ;
syntax COMMA
        = 
        ","
 ;
syntax QMARK
        = 
        "?"
 ;
syntax LEFTBRACKET
        = 
        "("
 ;
syntax RIGHTBRACKET
        = 
        ")"
 ;
syntax LEFTBRACE
        = 
        "{"
 ;
syntax RIGHTBRACE
        = 
        "}"
 ;
syntax CONSTID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax INT
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE
        = 
        INT? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") INT)?
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
