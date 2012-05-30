@contributor{bgf2src automated exporter - SLPS}
module 00011

syntax Program
        = 
        TROLLEY CONSTID CONTAINS Declarations CHECKOUT Statement? SEMI? DONE SEMI
 ;
syntax Declarations
        = 
        (Constdeclaration | Vardeclaration | Procdeclaration)*
 ;
syntax Constdeclaration
        = 
        CONST CONSTID COLON Type ASSIGN Expression SEMI
 ;
syntax Vardeclaration
        = 
        VAR Identifier COLON Type SEMI
 ;
syntax Procdeclaration
        = 
        PROC ID OPARAN Paramlist? CPARAN COLON Type ASSIGN Statement SEMI
 ;
syntax Paramlist
        = 
        Param (COMMA Param)*
 ;
syntax Param
        = 
        ID COLON Type
 ;
syntax Type
        = INTTYPE
        | DOUBLETYPE
 ;
syntax Expression
        = 
        Atom ((Operator Expression) | (MIXFIX Expression l COLON Expression r) | (OPARAN Functionparamlist CPARAN) | ())
 ;
syntax Functionparamlist
        = 
        Expression (COMMA Expression)*
 ;
syntax Atom
        = Literal
        | Identifier
        | OPARAN Expression CPARAN
 ;
syntax Operator
        = Arithmeticoperator
        | Booleanoperator
 ;
syntax Arithmeticoperator
        = ADDITION
        | SUBTRACT
        | DIVISION
        | MULTIPLY
        | EXP
 ;
syntax Booleanoperator
        = EQUAL
        | NONEQUAL
        | LESS
        | LESSEQUAL
        | MORE
        | MOREEQUAL
        | CONJUNCTION
        | DISJUNCTION
 ;
syntax Statement
        = SKIP SEMI
        | Assignmentstatement SEMI
        | Whilestatement
        | Ifstatement
        | OBRACE Statement+ CBRACE
 ;
syntax Identifier
        = ID
        | CONSTID
 ;
syntax Assignmentstatement
        = 
        Identifier ASSIGN Expression
 ;
syntax Ifstatement
        = 
        IF Expression THEN Statement s1 ((ELSE Statement s2) | ())
 ;
syntax Whilestatement
        = 
        WHILE Expression DO Statement
 ;
syntax Literal
        = INT
        | DOUBLE
 ;
syntax SEMI
        = 
        ";"
 ;
syntax COLON
        = 
        ":"
 ;
syntax OBRACE
        = 
        "{"
 ;
syntax CBRACE
        = 
        "}"
 ;
syntax ASSIGN
        = 
        ":="
 ;
syntax OPARAN
        = 
        "("
 ;
syntax CPARAN
        = 
        ")"
 ;
syntax COMMA
        = 
        ","
 ;
syntax MIXFIX
        = 
        "?"
 ;
syntax ADDITION
        = 
        "+"
 ;
syntax SUBTRACT
        = 
        "-"
 ;
syntax DIVISION
        = 
        "/"
 ;
syntax MULTIPLY
        = 
        "*"
 ;
syntax EXP
        = 
        "**"
 ;
syntax EQUAL
        = 
        "=="
 ;
syntax NONEQUAL
        = 
        "!="
 ;
syntax LESS
        = 
        "\<"
 ;
syntax LESSEQUAL
        = 
        "\<="
 ;
syntax MORE
        = 
        "\>"
 ;
syntax MOREEQUAL
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
syntax WHILE
        = 
        "while"
 ;
syntax DO
        = 
        "do"
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
syntax INTTYPE
        = 
        "int"
 ;
syntax DOUBLETYPE
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
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax INT
        = 
        ("+" | "-")? ("0" | (("1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*))
 ;
syntax DOUBLE
        = 
        INT? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* ("e" INT)?
 ;
