@contributor{bgf2src automated exporter - SLPS}
module 01111

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
        | PROC ProcDec
 ;
syntax ConstDec
        = 
        CONSTID c COLON Number DEFINEDAS ArithmeticExpression
 ;
syntax VarDec
        = 
        VARANDPROCID v COLON Number
 ;
syntax ProcDec
        = 
        VARANDPROCID p OPAR ParamList? CPAR COLON Number DEFINEDAS Stat
 ;
syntax ParamList
        = 
        VarDec (COMMA VarDec)*
 ;
syntax Stat
        = ConditionalStat
        | LoopStat
        | AssignStat SEMI
        | SKIP SEMI
        | LPAR Stat+ RPAR SEMI
 ;
syntax AssignStat
        = 
        VARANDPROCID DEFINEDAS ArithmeticExpression
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
        | VARANDPROCID
        | ("+" | "-")? INTVALUE
        | ("+" | "-")? DOUBLEVALUE
        | ApplyProc
        | OPAR ArithmeticExpression CPAR
 ;
syntax ArithmeticExpression
        = 
        DisjBool (QUESTION ArithmeticExpression COLON ArithmeticExpression)?
 ;
syntax DisjBool
        = 
        ConjBool (DISJUNCTION ConjBool)*
 ;
syntax ConjBool
        = 
        BoolExpr (CONJUNCTION BoolExpr)*
 ;
syntax BoolExpr
        = 
        SubExpr (Operations SubExpr)?
 ;
syntax SubExpr
        = 
        AddExpr (SUBTRACTION AddExpr)*
 ;
syntax AddExpr
        = 
        MulExpr (ADDITION MulExpr)*
 ;
syntax MulExpr
        = 
        DivExpr (MULTIPLICATION DivExpr)*
 ;
syntax DivExpr
        = 
        ExpExpr (DIVISION ExpExpr)*
 ;
syntax ExpExpr
        = 
        Atom (EXPONENTION Atom)*
 ;
syntax ApplyProc
        = 
        VARANDPROCID OPAR SubExprList CPAR
 ;
syntax SubExprList
        = 
        ArithmeticExpression (COMMA ArithmeticExpression)*
 ;
syntax Number
        = INTKEYWORD
        | DOUBLEKEYWORD
 ;
syntax Comment
        = 
        COMMENT
 ;
syntax Operations
        = EQUALITY
        | NONEQUALITY
        | LESSTHAN
        | LESSTHANOREQUAL
        | GREATERTHAN
        | GREATERTHANOREQUAL
 ;
syntax INTVALUE
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLEVALUE
        = 
        INTVALUE? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") ("+" | "-")? INTVALUE)?
 ;
syntax DONE
        = 
        "done"
 ;
syntax DO
        = 
        "do"
 ;
syntax TROLLEY
        = 
        "trolley"
 ;
syntax PROC
        = 
        "proc"
 ;
syntax CONTAINS
        = 
        "contains"
 ;
syntax CHECKOUT
        = 
        "checkout"
 ;
syntax SKIP
        = 
        "skip"
 ;
syntax CONST
        = 
        "const"
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
syntax INTKEYWORD
        = 
        "int"
 ;
syntax DOUBLEKEYWORD
        = 
        "double"
 ;
syntax COLON
        = 
        ":"
 ;
syntax DEFINEDAS
        = 
        ":="
 ;
syntax SEMI
        = 
        ";"
 ;
syntax OPAR
        = 
        "("
 ;
syntax CPAR
        = 
        ")"
 ;
syntax COMMA
        = 
        ","
 ;
syntax LPAR
        = 
        "{"
 ;
syntax RPAR
        = 
        "}"
 ;
syntax UNDER
        = 
        "_"
 ;
syntax DIVISION
        = 
        "/"
 ;
syntax ADDITION
        = 
        "+"
 ;
syntax SUBTRACTION
        = 
        "-"
 ;
syntax EXPONENTION
        = 
        "**"
 ;
syntax MULTIPLICATION
        = 
        "*"
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NONEQUALITY
        = 
        "!="
 ;
syntax LESSTHAN
        = 
        "\<"
 ;
syntax LESSTHANOREQUAL
        = 
        "\<="
 ;
syntax GREATERTHAN
        = 
        "\>"
 ;
syntax GREATERTHANOREQUAL
        = 
        "\>="
 ;
syntax DISJUNCTION
        = 
        "\\\\/"
 ;
syntax CONJUNCTION
        = 
        "/\\\\"
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax CONSTID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax VARANDPROCID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax WS
        = 
        ("\\t" | "|" | "\\n" | "\\r" | " " | "\\f")+
 ;
