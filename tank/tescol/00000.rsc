@contributor{bgf2src automated exporter - SLPS}
module 00000

syntax Program
        = 
        TROLLEY CONSTID n1 CONTAINS Declaration* d1 CHECKOUT Statement s1 DONE SEMI
 ;
syntax Declaration
        = Constdec
        | Vardec
        | Procdec
 ;
syntax Constdec
        = 
        CONST CONSTID id1 COLON Type t1 ASSIGN Arithexp a1 SEMI
 ;
syntax Vardec
        = 
        VAR ID id1 COLON Type t1 SEMI
 ;
syntax Procdec
        = 
        PROC ID id1 LPAR Paralist p1 RPAR COLON Type t1 ASSIGN Statement s1
 ;
syntax Paralist
        = 
        (Parameter COMMA)* Parameter
 ;
syntax Parameter
        = 
        ID id1 COLON Type
 ;
syntax Type
        = INTWORD
        | DOUWORD
 ;
syntax Arithexp
        = 
        Connexp (QMARK Connexp COLON Connexp)?
 ;
syntax Connexp
        = 
        Compexp c1 (Compoperator co1 Compexp c2)*
 ;
syntax Compexp
        = 
        Addsubexp (Comparisonsymbol Addsubexp)*
 ;
syntax Addsubexp
        = 
        Multidivexp ((ADD | SUB) Multidivexp)*
 ;
syntax Multidivexp
        = 
        Expoexp ((MULTI | DIV) Expoexp)*
 ;
syntax Expoexp
        = 
        Negateexp (EXPO Negateexp)?
 ;
syntax Negateexp
        = SUB Negateexp
        | Parexp
 ;
syntax Parexp
        = Literal
        | CONSTID id2
        | ID id1
        | LPAR Arithexp RPAR
 ;
syntax Statement
        = LBRACE Substatement* RBRACE SEMI
        | Substatement
 ;
syntax Substatement
        = SKIP SEMI
        | Assignment
        | Cond
        | Loop
 ;
syntax Assignment
        = 
        ID id1 ASSIGN Arithexp a1 SEMI
 ;
syntax Cond
        = 
        IF Arithexp a1 THEN Statement s1 ELSE Statement s2
 ;
syntax Loop
        = 
        WHILE Arithexp a1 DO Statement s1
 ;
syntax Keyword
        = DONE
        | TROLLEY
        | CONTAINS
        | CHECKOUT
        | SKIP
        | CONST
        | PROC
        | VAR
        | IF
        | THEN
        | ELSE
        | WHILE
        | DO
        | INTWORD
        | DOUWORD
 ;
syntax Token
        = Keyword
        | WS
        | Identifier
        | Symbol
        | COMMENT
        | Literal
        | Constantid
 ;
syntax Identifier
        = 
        ID
 ;
syntax Constantid
        = 
        CONSTID
 ;
syntax Symbol
        = Syntaxsymbol
        | Operatorsymbol
        | Comparisonsymbol
 ;
syntax Syntaxsymbol
        = SEMI
        | COLON
        | COMMA
        | LPAR
        | RPAR
        | ASSIGN
        | QMARK
        | LBRACE
        | RBRACE
 ;
syntax Operatorsymbol
        = ADD
        | SUB
        | DIV
        | MULTI
        | EXPO
 ;
syntax Comparisonsymbol
        = EQUALS
        | NOTEQ
        | LT
        | LTE
        | GT
        | GTE
 ;
syntax Compoperator
        = CONJUNCT
        | DISJUNCT
 ;
syntax Literal
        = INT
        | DOUBLE
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
syntax INTWORD
        = 
        "int"
 ;
syntax DOUWORD
        = 
        "double"
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax INT
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE
        = 
        INT? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ (("e" | "E") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+)?
 ;
syntax COLON
        = 
        ":"
 ;
syntax COMMA
        = 
        ","
 ;
syntax SEMI
        = 
        ";"
 ;
syntax LPAR
        = 
        "("
 ;
syntax RPAR
        = 
        ")"
 ;
syntax ASSIGN
        = 
        COLON "="
 ;
syntax LBRACE
        = 
        "{"
 ;
syntax RBRACE
        = 
        "}"
 ;
syntax QMARK
        = 
        "?"
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
syntax MULTI
        = 
        "*"
 ;
syntax EXPO
        = 
        "**"
 ;
syntax EQUALS
        = 
        "=="
 ;
syntax NOTEQ
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
syntax CONJUNCT
        = 
        "/\\\\"
 ;
syntax DISJUNCT
        = 
        "\\\\/"
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
