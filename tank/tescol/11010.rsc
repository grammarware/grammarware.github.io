@contributor{bgf2src automated exporter - SLPS}
module 11010

syntax Program
        = 
        ProgTree+
 ;
syntax ProgTree
        = 
        TROLLEY CONSTID CONTAINS Declarations* CHECKOUT Stat DONE SEMI
 ;
syntax Declarations
        = CONST ConstDec SEMI
        | VAR VarDec SEMI
        | PROC ProcDec SEMI
 ;
syntax ConstDec
        = 
        CONSTID COLON Type DEFINEDAS SubExpr
 ;
syntax VarDec
        = 
        SmallId v1 COLON Type
 ;
syntax ProcDec
        = 
        SmallId p1 LEFTPAR ParamList RIGHTPAR COLON Type DEFINEDAS Stat
 ;
syntax ParamList
        = 
        VarDec (COMMA VarDec)*
 ;
syntax Stat
        = ConditionalStat
        | LoopStat
        | AssignStat
        | LEFTBRACE Stat (SEMI Stat)* RIGHTBRACE SEMI
        | SKIP
 ;
syntax AssignStat
        = 
        SmallId DEFINEDAS CondExpr
 ;
syntax ConditionalStat
        = 
        IF BoolExpr THEN Stat ELSE Stat
 ;
syntax LoopStat
        = 
        WHILE BoolExpr DO Stat
 ;
syntax Atom
        = CONSTID
        | ID
        | INT
        | DOUBLE
        | LEFTPAR CondExpr RIGHTPAR
        | ApplyProc
 ;
syntax CondExpr
        = 
        BoolExpr (QUESTION CondExpr COLON CondExpr)?
 ;
syntax BoolExpr
        = 
        AndExpr (DISJUNCTION AndExpr)*
 ;
syntax AndExpr
        = 
        CompExpr (CONJUNCTION CompExpr)*
 ;
syntax CompExpr
        = 
        SubExpr ((EQUALITY | NOTEQUAL | LESSTHAN | LESSTHANEQUAL | MORETHAN | MORETHANEQUAL) SubExpr)?
 ;
syntax SubExpr
        = 
        AddExpr (MINUS AddExpr)*
 ;
syntax AddExpr
        = 
        MulExpr (PLUS MulExpr)*
 ;
syntax MulExpr
        = 
        DivExpr (MULTIPLY DivExpr)*
 ;
syntax DivExpr
        = 
        ExpExpr (DIVIDE ExpExpr)*
 ;
syntax ExpExpr
        = 
        Atom (EXPONENTIATION Atom)*
 ;
syntax SmallId
        = CONSTID
        | ID
 ;
syntax ApplyProc
        = 
        SmallId LEFTPAR ExprList RIGHTPAR
 ;
syntax ExprList
        = 
        CompExpr (COMMA CompExpr)*
 ;
syntax Type
        = INTEGER
        | FLOATDOUBLE
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
syntax QUESTION
        = 
        "?"
 ;
syntax DEFINEDAS
        = 
        ":="
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
syntax INTEGER
        = 
        "int"
 ;
syntax FLOATDOUBLE
        = 
        "double"
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax LEFTBRACE
        = 
        "{"
 ;
syntax RIGHTBRACE
        = 
        "}"
 ;
syntax LEFTPAR
        = 
        "("
 ;
syntax RIGHTPAR
        = 
        ")"
 ;
syntax INT
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") INT)?
 ;
syntax EXPONENT
        = 
        ("e" | "E") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax PLUS
        = 
        "+"
 ;
syntax MINUS
        = 
        "-"
 ;
syntax EXPONENTIATION
        = 
        "**"
 ;
syntax MULTIPLY
        = 
        "*"
 ;
syntax DIVIDE
        = 
        "/"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NOTEQUAL
        = 
        "!="
 ;
syntax LESSTHAN
        = 
        "\<"
 ;
syntax LESSTHANEQUAL
        = 
        "\<="
 ;
syntax MORETHAN
        = 
        "\>"
 ;
syntax MORETHANEQUAL
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
syntax ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
