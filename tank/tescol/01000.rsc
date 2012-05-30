@contributor{bgf2src automated exporter - SLPS}
module 01000

syntax Program
        = 
        TROLLEY CONSTID CONTAINS Declarations CHECKOUT Statement SEMI DONE SEMI
 ;
syntax Declarations
        = 
        (Constdec | Vardec | Procdec)+
 ;
syntax Constdec
        = 
        CONST CONSTID COL Type DEF Arith SEMI
 ;
syntax Vardec
        = 
        VAR Id COL Type SEMI
 ;
syntax Procdec
        = 
        PROC Id LBRACK Param RBRACK COL Type DEF Statement SEMI
 ;
syntax Statements
        = Assign
        | Condstatement
        | Loop
 ;
syntax Statement
        = SKIP
        | Statements
        | LCBRACK Statement (SEMI Statement)* RCBRACK
 ;
syntax Assign
        = 
        Id DEF Arith
 ;
syntax Condstatement
        = 
        IF OrExpr THEN Statement ELSE Statement
 ;
syntax Loop
        = 
        WHILE OrExpr DO Statement
 ;
syntax Param
        = 
        (Id l COL Type ltype (COMMA Id r COL Type rtype)*)?
 ;
syntax ComparOps
        = EQ
        | NEQ
        | LT
        | GT
        | LTE
        | GTE
 ;
syntax Arith
        = 
        OrExpr (QUES Arith COL Arith)?
 ;
syntax OrExpr
        = 
        AndExpr (DISJ AndExpr)*
 ;
syntax AndExpr
        = 
        ComparExpr (CONJ ComparExpr)*
 ;
syntax ComparExpr
        = 
        ArithExpr (ComparOps ArithExpr)*
 ;
syntax ArithExpr
        = 
        MultiExpr ((ADD | SUB) MultiExpr)*
 ;
syntax MultiExpr
        = 
        ExpExpr ((MULT | DIV) ExpExpr)*
 ;
syntax ExpExpr
        = 
        Atom (EXP Atom)*
 ;
syntax Atom
        = INTNUM
        | DOUBNUM
        | Id
        | Procapp
        | LBRACK Arith RBRACK
 ;
syntax Nums
        = VARID
        | CONSTID
        | INTNUM
        | DOUBNUM
 ;
syntax Procapp
        = 
        Id LBRACK Arith (COMMA Arith)* RBRACK
 ;
syntax Type
        = INT
        | DOUBLE
 ;
syntax Id
        = CONSTID
        | VARID
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax SEMI
        = 
        ";"
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
syntax DOUBLE
        = 
        "double"
 ;
syntax CONST
        = 
        "const"
 ;
syntax PROC
        = 
        "proc"
 ;
syntax VAR
        = 
        "var"
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
syntax CONSTID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax VARID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax INTNUM
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBNUM
        = 
        INTNUM? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") INTNUM)?
 ;
syntax LBRACK
        = 
        "("
 ;
syntax RBRACK
        = 
        ")"
 ;
syntax LCBRACK
        = 
        "{"
 ;
syntax RCBRACK
        = 
        "}"
 ;
syntax ADD
        = 
        "+"
 ;
syntax SUB
        = 
        "-"
 ;
syntax EXP
        = 
        "**"
 ;
syntax MULT
        = 
        "*"
 ;
syntax DEF
        = 
        ":="
 ;
syntax DIV
        = 
        "/"
 ;
syntax QUES
        = 
        "?"
 ;
syntax COL
        = 
        ":"
 ;
syntax COMMA
        = 
        ","
 ;
syntax EQ
        = 
        "=="
 ;
syntax NEQ
        = 
        "!="
 ;
syntax LTE
        = 
        "\<="
 ;
syntax GTE
        = 
        "\>="
 ;
syntax LT
        = 
        "\<"
 ;
syntax GT
        = 
        "\>"
 ;
syntax CONJ
        = 
        "/\\\\"
 ;
syntax DISJ
        = 
        "\\\\/"
 ;
