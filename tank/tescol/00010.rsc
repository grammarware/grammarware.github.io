@contributor{bgf2src automated exporter - SLPS}
module 00010

syntax Prog
        = 
        Header Decl MainStat
 ;
syntax Header
        = 
        TROLLEY CONST_ID CONTAINS
 ;
syntax Decl
        = 
        (ConstDecl | VarDecl | ProcDecl)*
 ;
syntax ConstDecl
        = 
        CONST CONST_ID COLON Type DEFINED_AS ArithmeticExpr SEMI
 ;
syntax VarDecl
        = 
        VAR VAR_ID COLON Type SEMI
 ;
syntax ProcDecl
        = 
        PROC VAR_ID LPAR Parameter? RPAR COLON Type DEFINED_AS Stat
 ;
syntax Parameter
        = 
        VAR_ID i COLON Type t (COMMA Parameter)*
 ;
syntax MainStat
        = 
        CHECKOUT Stat DONE SEMI
 ;
syntax Stat
        = Skip
        | Assign
        | Cond
        | Loop
        | LCURLYPAR Stat* RCURLYPAR SEMI
 ;
syntax Skip
        = 
        SKIP SEMI
 ;
syntax Assign
        = 
        VAR_ID DEFINED_AS ArithmeticExpr SEMI
 ;
syntax Cond
        = 
        IF LPAR BooleanExpr b RPAR THEN Stat ts (ELSE Stat es)?
 ;
syntax Loop
        = 
        WHILE LPAR BooleanExpr b RPAR DO Stat s
 ;
syntax ArithmeticExpr
        = 
        ExprLevel1 ((PLUS | MINUS) ExprLevel1)*
 ;
syntax ExprLevel1
        = 
        ExpExpr ((MULTIPLY | DIVIDE) ExpExpr)*
 ;
syntax ExpExpr
        = 
        UnaryExpr (EXPONENTIATE UnaryExpr)*
 ;
syntax UnaryExpr
        = MINUS Atom
        | PLUS Atom
        | Atom
 ;
syntax Atom
        = INT
        | DOUBLE
        | CONST_ID
        | VAR_ID
        | LPAR BracketedExpr RPAR
        | ProcApply
 ;
syntax BracketedExpr
        = CondExpr
        | ArithmeticExpr
 ;
syntax CondExpr
        = 
        TestPart ArithmeticExpr e1 COLON ArithmeticExpr e2
 ;
syntax TestPart
        = 
        BooleanExpr CONDITION
 ;
syntax ProcApply
        = 
        VAR_ID LPAR Args? RPAR
 ;
syntax Args
        = 
        ArithmeticExpr (COMMA ArithmeticExpr)*
 ;
syntax BooleanExpr
        = 
        ConjunctionExpr (OR ConjunctionExpr)*
 ;
syntax ConjunctionExpr
        = 
        BooleanAtom (AND BooleanAtom)*
 ;
syntax BooleanAtom
        = ArithmeticExpr BooleanOperator ArithmeticExpr
        | LPAR BooleanExpr RPAR
 ;
syntax BooleanOperator
        = EQUAL
        | NOT_EQUAL
        | GREATER
        | GREATER_EQUAL
        | LESS
        | LESS_EQUAL
 ;
syntax Type
        = INT_TYPE
        | DOUBLE_TYPE
 ;
syntax EXPONENT
        = 
        ("e" | "E") ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DIGIT
        = "0"
        | "1"
        | "2"
        | "3"
        | "4"
        | "5"
        | "6"
        | "7"
        | "8"
        | "9"
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
syntax CONDITION
        = 
        "?"
 ;
syntax LPAR
        = 
        "("
 ;
syntax RPAR
        = 
        ")"
 ;
syntax LCURLYPAR
        = 
        "{"
 ;
syntax RCURLYPAR
        = 
        "}"
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
syntax INT_TYPE
        = 
        "int"
 ;
syntax DOUBLE_TYPE
        = 
        "double"
 ;
syntax INT
        = 
        DIGIT+
 ;
syntax DOUBLE
        = 
        DIGIT* "." DIGIT* EXPONENT?
 ;
syntax PLUS
        = 
        "+"
 ;
syntax MINUS
        = 
        "-"
 ;
syntax MULTIPLY
        = 
        "*"
 ;
syntax DIVIDE
        = 
        "/"
 ;
syntax EXPONENTIATE
        = 
        "**"
 ;
syntax AND
        = 
        "/\\\\"
 ;
syntax OR
        = 
        "\\\\/"
 ;
syntax DEFINED_AS
        = 
        ":="
 ;
syntax EQUAL
        = 
        "=="
 ;
syntax NOT_EQUAL
        = 
        "!="
 ;
syntax GREATER
        = 
        "\>"
 ;
syntax GREATER_EQUAL
        = 
        "\>="
 ;
syntax LESS
        = 
        "\<"
 ;
syntax LESS_EQUAL
        = 
        "\<="
 ;
syntax CONST_ID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | DIGIT | "_")*
 ;
syntax VAR_ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | DIGIT | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n" | "\\u000C")+
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
