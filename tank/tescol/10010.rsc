@contributor{bgf2src automated exporter - SLPS}
module 10010

syntax Program
        = 
        TROLLEY ID CONTAINS Declaration+ CHECKOUT Statement SEMI DONE SEMI
 ;
syntax Declaration
        = 
        (Constdecl | Vardecl | Procdecl) SEMI
 ;
syntax Constdecl
        = 
        CONST ID COLON Type DEF ArithmeticExpression
 ;
syntax Vardecl
        = 
        VAR ID COLON Type
 ;
syntax Procdecl
        = 
        PROC ID LPAREN ParameterList RPAREN COLON Type DEF Statement
 ;
syntax ParameterList
        = 
        ID COLON Type (COMMA ID COLON Type)*
 ;
syntax ArithmeticExpression
        = 
        ProcedureApplication (ConditionalExpression QUESTION ArithmeticExpression COLON ArithmeticExpression)?
 ;
syntax ProcedureApplication
        = 
        Arithmetic (ID LPAREN ExpressionList RPAREN)?
 ;
syntax ExpressionList
        = 
        ArithmeticExpression (COMMA ArithmeticExpression)*
 ;
syntax Arithmetic
        = 
        Number (ArithmeticOperator Number)*
 ;
syntax Number
        = INT
        | DOUBLE
        | ID
        | LPAREN ConditionalExpression RPAREN
 ;
syntax ConditionalExpression
        = 
        BooleanExpression (QUESTION Conditional COLON Conditional)?
 ;
syntax BooleanExpression
        = 
        ConjExpression (CONJUNC ConjExpression)*
 ;
syntax ConjExpression
        = 
        DisjExpression (DISJUNC DisjExpression)*
 ;
syntax DisjExpression
        = 
        Expression (RelationalOperator Expression)?
 ;
syntax Expression
        = 
        Number (ArithmeticOperator Number)*
 ;
syntax Statement
        = SKIP
        | Assignment
        | Conditional
        | Loop
        | StatementList
 ;
syntax Assignment
        = 
        ID DEF ArithmeticExpression
 ;
syntax Conditional
        = 
        IF BooleanExpression THEN Statement ELSE Statement
 ;
syntax Loop
        = 
        WHILE BooleanExpression DO Statement
 ;
syntax StatementList
        = 
        CLPAREN Statement SEMI (Statement SEMI)* CRPAREN
 ;
syntax Operator
        = DEF
        | QUESTION
        | CONJUNC
        | DISJUNC
        | ArithmeticOperator
        | RelationalOperator
 ;
syntax ArithmeticOperator
        = ADD
        | SUBTRACT
        | DIVIDE
        | MULTIPLY
        | EXPON
 ;
syntax RelationalOperator
        = EQUAL
        | NOTEQUAL
        | MORETHAN
        | LESSTHAN
        | MORETHANEQUAL
        | LESSTHANEQUAL
 ;
syntax Type
        = INTKEYWORD
        | DOUBLEKEYWORD
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
syntax INTKEYWORD
        = 
        "int"
 ;
syntax DOUBLEKEYWORD
        = 
        "double"
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
syntax CMT
        = 
        "/*" ANY* "*/"
 ;
syntax INT
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE
        = 
        INT? "." (("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* | (("e" | "E") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+))
 ;
syntax LPAREN
        = 
        "("
 ;
syntax RPAREN
        = 
        ")"
 ;
syntax CLPAREN
        = 
        "{"
 ;
syntax CRPAREN
        = 
        "}"
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
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
syntax DEF
        = 
        ":="
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax ADD
        = 
        "+"
 ;
syntax SUBTRACT
        = 
        "-"
 ;
syntax DIVIDE
        = 
        "/"
 ;
syntax MULTIPLY
        = 
        "*"
 ;
syntax EXPON
        = 
        "**"
 ;
syntax EQUAL
        = 
        "=="
 ;
syntax NOTEQUAL
        = 
        "!="
 ;
syntax MORETHAN
        = 
        "\>"
 ;
syntax LESSTHAN
        = 
        "\<"
 ;
syntax MORETHANEQUAL
        = 
        "\>="
 ;
syntax LESSTHANEQUAL
        = 
        "\<="
 ;
syntax CONJUNC
        = 
        "/\\\\"
 ;
syntax DISJUNC
        = 
        "\\\\/"
 ;
