@contributor{bgf2src automated exporter - SLPS}
module 10101

syntax Program
        = 
        TROLLEY CONSTANTID CONTAINS Declaration* CHECKOUT Mainstatement SEMI DONE SEMI
 ;
syntax Declaration
        = Variabledec
        | Constantdec
        | Proceduredec
 ;
syntax Variabledec
        = 
        VARIABLE ID COLON Type SEMI
 ;
syntax Constantdec
        = 
        CONSTANT CONSTANTID COLON Type ASSIGN CondExpr SEMI
 ;
syntax Proceduredec
        = 
        PROCEDURE ID pid1 PARENOPEN (ID pid2 COLON Type (COMMA ID pid3 COLON Type)*)* PARENCLOSE COLON Type ASSIGN Mainstatement SEMI
 ;
syntax Type
        = INT
        | FLOAT
 ;
syntax CondExpr
        = 
        BoolExpr (MIXFIX CondExpr COLON CondExpr)?
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
        Expr ((GREATEREQUAL | LESSEQUAL | GREATER | LESS | EQUALITY | NONEQUALITY) Expr)*
 ;
syntax Expr
        = 
        MultExpr ((ADDITION | SUBTRACTION) MultExpr)*
 ;
syntax MultExpr
        = 
        ExponExpr ((MULTIPLICATION | DIVISION) ExponExpr)*
 ;
syntax ExponExpr
        = 
        Unaryneg EXPONENTIATION*
 ;
syntax Unaryneg
        = 
        SUBTRACTION* Atom
 ;
syntax Atom
        = INTEGER
        | FLOATINGPOINT
        | CONSTANTID
        | ID
        | PARENOPEN CondExpr PARENCLOSE
        | ProcedureList
 ;
syntax ProcedureList
        = 
        ID PARENOPEN CondExpr id1 (COMMA CondExpr id2)* PARENCLOSE
 ;
syntax Mainstatement
        = ()
        | Statement
        | STATEMENTOPEN Statement (SEMI Statement)* STATEMENTCLOSE
 ;
syntax Statement
        = SKIP
        | ID ASSIGN CondExpr
        | IF BoolExpr THEN Statement ELSE Statement
        | WHILE BoolExpr DO Statement
 ;
syntax SEMI
        = 
        ";"
 ;
syntax COMMA
        = 
        ","
 ;
syntax ASSIGN
        = 
        ":="
 ;
syntax DECIMAL
        = 
        "."
 ;
syntax STATEMENTOPEN
        = 
        "{"
 ;
syntax STATEMENTCLOSE
        = 
        "}"
 ;
syntax PARENOPEN
        = 
        "("
 ;
syntax PARENCLOSE
        = 
        ")"
 ;
syntax ADDITION
        = 
        "+"
 ;
syntax SUBTRACTION
        = 
        "-"
 ;
syntax DIVISION
        = 
        "/"
 ;
syntax MULTIPLICATION
        = 
        "*"
 ;
syntax EXPONENTIATION
        = 
        "**"
 ;
syntax MIXFIX
        = 
        "?"
 ;
syntax COLON
        = 
        ":"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NONEQUALITY
        = 
        "!="
 ;
syntax GREATER
        = 
        "\>"
 ;
syntax GREATEREQUAL
        = 
        "\>="
 ;
syntax LESS
        = 
        "\<"
 ;
syntax LESSEQUAL
        = 
        "\<="
 ;
syntax CONJUNCTION
        = 
        "/\\\\"
 ;
syntax DISJUNCTION
        = 
        "\\\\/"
 ;
syntax INT
        = 
        "int"
 ;
syntax FLOAT
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
syntax CONSTANT
        = 
        "const"
 ;
syntax VARIABLE
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
syntax CONSTANTID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "_") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax INTEGER
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax FLOATINGPOINT
        = 
        INTEGER? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ (("e" | "E") (ADDITION | SUBTRACTION)* INTEGER)?
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
