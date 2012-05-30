@contributor{bgf2src automated exporter - SLPS}
module 00001

syntax Program
        = 
        TROLLEY CID CONTAINS (Declarations SEMI)* Statements DONE SEMI
 ;
syntax Declarations
        = ConstDec
        | VarDec
        | ProcDec
 ;
syntax ConstDec
        = 
        CONST CID COLON Types ASSI Expr
 ;
syntax VarDec
        = 
        VAR Id COLON Types
 ;
syntax ProcDec
        = 
        PROC ID OPAR Paramlist CPAR COLON Types ASSI Statement
 ;
syntax Statements
        = 
        CHECKOUT Statement SEMI
 ;
syntax Statement
        = Assignment
        | Conditional
        | Loops
        | Grstatement
        | SKIP
 ;
syntax Conditional
        = 
        IF BoolExpr THEN Statement ELSE Statement
 ;
syntax Assignment
        = 
        Id ASSI Expr
 ;
syntax Grstatement
        = 
        OCB Statement (SEMI Statement)* CCB
 ;
syntax Loops
        = 
        WHILE BoolExpr DO Statement
 ;
syntax Paramlist
        = 
        (ID COLON Types)? (COM ID COLON Types)*
 ;
syntax Expr
        = 
        BoolExpr (MIXFIX Expr COLON Expr)?
 ;
syntax BoolExpr
        = 
        AndExpr (DISJ AndExpr)*
 ;
syntax AndExpr
        = 
        CompExpr (CONJ CompExpr)*
 ;
syntax CompExpr
        = 
        Plusexpr ((GT | LT | GTE | LTE | EQ | NEQ) Plusexpr)?
 ;
syntax Plusexpr
        = 
        MultExpr ((PLUS | MINUS) MultExpr)*
 ;
syntax MultExpr
        = 
        ExpExp ((MULTI | DIV) ExpExp)*
 ;
syntax ExpExp
        = 
        Atom (EXP Atom)*
 ;
syntax Atom
        = INTG
        | DOUBLE
        | ID Arglist?
        | CID Arglist?
        | OPAR Expr CPAR
 ;
syntax Arglist
        = 
        OPAR {Expr COM}* CPAR
 ;
syntax Comment
        = 
        COMMENT
 ;
syntax Types
        = TYPEI
        | TYPED
 ;
syntax Id
        = ID
        | CID
 ;
syntax DOUBLE
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") INTG)?
 ;
syntax INTG
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax EXP
        = 
        "**"
 ;
syntax COLON
        = 
        ":"
 ;
syntax PLUS
        = 
        "+"
 ;
syntax MINUS
        = 
        "-"
 ;
syntax MULTI
        = 
        "*"
 ;
syntax DIV
        = 
        "/"
 ;
syntax COM
        = 
        ","
 ;
syntax ASSI
        = 
        ":="
 ;
syntax EQ
        = 
        "=="
 ;
syntax NEQ
        = 
        "!="
 ;
syntax LT
        = 
        "\<"
 ;
syntax LTE
        = 
        "\<="
 ;
syntax GT
        = 
        "\>"
 ;
syntax GTE
        = 
        "\>="
 ;
syntax CONJ
        = 
        "/\\\\"
 ;
syntax DISJ
        = 
        "\\\\/"
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax OPAR
        = 
        "("
 ;
syntax CPAR
        = 
        ")"
 ;
syntax OCB
        = 
        "{"
 ;
syntax CCB
        = 
        "}"
 ;
syntax SEMI
        = 
        ";"
 ;
syntax MIXFIX
        = 
        "?"
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
syntax PROC
        = 
        "proc"
 ;
syntax VAR
        = 
        "var"
 ;
syntax TYPEI
        = 
        "int"
 ;
syntax TYPED
        = 
        "double"
 ;
syntax CONST
        = 
        "const"
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
