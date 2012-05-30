@contributor{bgf2src automated exporter - SLPS}
module 01100

syntax Program
        = TROLLEY Constidentifier CONTAINS Declaration CHECKOUT Statements DONE SEMICOLON
        | TROLLEY Constidentifier CONTAINS CHECKOUT Statements DONE SEMICOLON
 ;
syntax Dec
        = Constdec
        | Vardec
        | Procdec
 ;
syntax Declaration
        = 
        Dec+
 ;
syntax Constdec
        = 
        CONST Constidentifier COLON Type DEFINE Expression SEMICOLON
 ;
syntax Vardec
        = 
        VAR Identifier COLON Type SEMICOLON
 ;
syntax Procdec
        = 
        PROCEDURE Identifier id LEFTPARENTHESIS ((RIGHTPARENTHESIS COLON Type DEFINE Statements) | (Identifier ids COLON Type (COMA Identifier ids COLON Type)* RIGHTPARENTHESIS COLON Type DEFINE Statements))
 ;
syntax Procedure
        = 
        Identifier LEFTPARENTHESIS (() | (Expression (COMA Expression)*)) RIGHTPARENTHESIS
 ;
syntax Stat
        = Skip
        | Assign
        | Cond
        | Loop
 ;
syntax Statements
        = Stat
        | LEFTCURLY Stat+ RIGHTCURLY SEMICOLON
 ;
syntax Skip
        = 
        SKIPTOKEN SEMICOLON
 ;
syntax Assign
        = 
        Identifier DEFINE Expression SEMICOLON
 ;
syntax Cond
        = 
        IF Expression THEN Statements dothen ELSE Statements doelse
 ;
syntax Loop
        = 
        WHILE Expression DO Statements
 ;
syntax Expression
        = 
        CondExp
 ;
syntax CondExp
        = 
        Disjunct ((QUESTIONMARK CondExp exp1 COLON CondExp exp2) | ())
 ;
syntax Disjunct
        = 
        Conjunct ((DISJUNCTION Conjunct)+ | ())
 ;
syntax Conjunct
        = 
        Comparison ((CONJUNCTION Comparison)+ | ())
 ;
syntax Comparison
        = Addition a2 BooleanSymbols Addition a1
        | Addition
 ;
syntax Addition
        = 
        Substract ((ADDITION Substract)+ | ())
 ;
syntax Substract
        = 
        Multipli ((SUBSTRACTION Multipli)+ | ())
 ;
syntax Multipli
        = 
        Divide ((MULTIPLICATION Divide)+ | ())
 ;
syntax Divide
        = 
        Exponent ((DIVISION Exponent)+ | ())
 ;
syntax Exponent
        = 
        Atom ((EXPONENT Atom) | ())
 ;
syntax Atom
        = Number
        | Procedure
        | Identifier
        | LEFTPARENTHESIS CondExp RIGHTPARENTHESIS
        | SUBSTRACTION CondExp
 ;
syntax Type
        = TYPEINT
        | TYPEDOUBLE
 ;
syntax BooleanSymbols
        = EQUALITY
        | NONEQUALITY
        | DIFFERENTOREQUAL
        | STRICTLYDIFFERENT
 ;
syntax Constidentifier
        = 
        CONSTID
 ;
syntax Identifier
        = ID
        | Constidentifier
 ;
syntax Number
        = ADDITION? INT
        | ADDITION? DOUBLE
        | SUBSTRACTION INT
        | SUBSTRACTION DOUBLE
 ;
syntax DEFINE
        = 
        ":="
 ;
syntax COLON
        = 
        ":"
 ;
syntax SEMICOLON
        = 
        ";"
 ;
syntax COMA
        = 
        ","
 ;
syntax DOUBLE
        = 
        INT? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("E" | "e") (ADDITION | SUBSTRACTION)? INT)?
 ;
syntax INT
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax ADDITION
        = 
        "+"
 ;
syntax SUBSTRACTION
        = 
        "-"
 ;
syntax DIVISION
        = 
        "/"
 ;
syntax EXPONENT
        = 
        "**"
 ;
syntax MULTIPLICATION
        = 
        "*"
 ;
syntax LEFTPARENTHESIS
        = 
        "("
 ;
syntax RIGHTPARENTHESIS
        = 
        ")"
 ;
syntax LEFTCURLY
        = 
        "{"
 ;
syntax RIGHTCURLY
        = 
        "}"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NONEQUALITY
        = 
        "!="
 ;
syntax DIFFERENTOREQUAL
        = "\<="
        | "\>="
 ;
syntax STRICTLYDIFFERENT
        = "\<"
        | "\>"
 ;
syntax CONJUNCTION
        = 
        "/\\\\"
 ;
syntax DISJUNCTION
        = 
        "\\\\/"
 ;
syntax QUESTIONMARK
        = 
        "?"
 ;
syntax DONE
        = 
        "done"
 ;
syntax SKIPTOKEN
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
syntax CONST
        = 
        "const"
 ;
syntax VAR
        = 
        "var"
 ;
syntax PROCEDURE
        = 
        "proc"
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
syntax TYPEINT
        = 
        "int"
 ;
syntax TYPEDOUBLE
        = 
        "double"
 ;
syntax CONSTID
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
