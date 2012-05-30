@contributor{bgf2src automated exporter - SLPS}
module 10110

syntax Program
        = 
        TROLLEY Cidentifier CONTAINS Dec* CHECKOUT CURLY_L {Statement SEMI}* CURLY_R SEMI DONE SEMI EOF
 ;
syntax Identifier
        = ID
        | CID
 ;
syntax Cidentifier
        = 
        CID
 ;
syntax Whitespace
        = 
        WS
 ;
syntax Comment
        = 
        COMMENT
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax Operator
        = ADD
        | SUBTRACT
        | MULTIPLY
        | DIVIDE
        | EXPONENTIATION
        | EQUAL
 ;
syntax Comparator
        = EQUALITY
        | NON_EQUALITY
        | LESS_THAN
        | GREATER_THAN
        | LESS_THAN_EQ
        | GREATER_THAN_EQ
 ;
syntax ADD
        = 
        "+"
 ;
syntax SUBTRACT
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
syntax EXPONENTIATION
        = 
        MULTIPLY "*"
 ;
syntax EQUAL
        = 
        "="
 ;
syntax CONJ
        = 
        "/\\\\"
 ;
syntax DISJ
        = 
        "\\\\/"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NON_EQUALITY
        = 
        "!="
 ;
syntax LESS_THAN
        = 
        "\<"
 ;
syntax GREATER_THAN
        = 
        "\>"
 ;
syntax LESS_THAN_EQ
        = 
        "\<="
 ;
syntax GREATER_THAN_EQ
        = 
        "\>="
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax EXPONENT
        = 
        ("e" | "E") ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE
        = INT "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* EXPONENT?
        | "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ EXPONENT?
        | INT EXPONENT
        | "."
 ;
syntax INT
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
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
syntax PROC
        = 
        "proc"
 ;
syntax DO
        = 
        "do"
 ;
syntax WHILE
        = 
        "while"
 ;
syntax KEY_INT
        = 
        "int"
 ;
syntax KEY_DOUBLE
        = 
        "double"
 ;
syntax VAR
        = 
        "var"
 ;
syntax CONST
        = 
        "const"
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
syntax CURLY_L
        = 
        "{"
 ;
syntax CURLY_R
        = 
        "}"
 ;
syntax DEFINED_AS
        = 
        ":="
 ;
syntax RPAR
        = 
        ")"
 ;
syntax LPAR
        = 
        "("
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
        (" " | "\\t" | "\\r" | "\\n" | "\\f")+
 ;
syntax Type
        = "int"
        | "double"
 ;
syntax Var
        = 
        "var" Identifier COLON Type SEMI
 ;
syntax Constant
        = 
        "const" Cidentifier COLON Type DEFINED_AS Expr SEMI
 ;
syntax Proc
        = 
        "proc" Identifier "(" Identifier COLON Type (COMMA Identifier COLON Type)* ")" COLON Type DEFINED_AS Statement* SEMI
 ;
syntax Negation
        = 
        "-"
 ;
syntax CondExpr
        = 
        BoolExpr (QUESTION CondExpr COLON CondExpr)?
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
        Expr (Comparator Expr)?
 ;
syntax Expr
        = 
        Negation? Expr2
 ;
syntax Expr2
        = 
        MultExpr ((ADD | SUBTRACT) MultExpr)*
 ;
syntax MultExpr
        = 
        PowerExpr ((MULTIPLY | DIVIDE) PowerExpr)*
 ;
syntax PowerExpr
        = 
        Atom (EXPONENTIATION Atom)*
 ;
syntax Atom
        = INT
        | DOUBLE
        | ID
        | CID
        | LPAR CondExpr RPAR
        | Procedure_expr
 ;
syntax Cond_expr
        = 
        QUESTION BoolExpr QUESTION Expr COLON Expr
 ;
syntax Procedure_expr
        = 
        Identifier LPAR Expr (COMMA Expr)* RPAR
 ;
syntax Dec
        = Constant
        | Var
        | Proc
 ;
syntax Conditional
        = 
        IF CondExpr THEN Statement ELSE Statement
 ;
syntax Assignment
        = 
        Identifier DEFINED_AS Expr
 ;
syntax Statement
        = SKIP
        | Conditional
        | Loop
        | Assignment
        | Cond_expr
        | CURLY_L (SKIP | Conditional | Loop | Assignment | Cond_expr) (SEMI Statement)* CURLY_R
 ;
syntax Loop
        = 
        WHILE BoolExpr DO Statement
 ;
syntax EOF
        = 
        ()
 ;
