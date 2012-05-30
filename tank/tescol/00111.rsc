@contributor{bgf2src automated exporter - SLPS}
module 00111

syntax Prog
        = 
        TROLLEY CID CONTAINS Declaration* CHECKOUT CompoundStatement SEMI DONE SEMI
 ;
syntax Declaration
        = 
        (ConstDeclaration | VarDeclaration | ProcDeclaration) SEMI
 ;
syntax Identifier
        = ID
        | CID
 ;
syntax VarDeclaration
        = 
        VAR Identifier COLON Type
 ;
syntax ProcDeclaration
        = 
        PROC Identifier LPAREN ParameterList? RPAREN COLON Type COLON_EQUALS CompoundStatement
 ;
syntax ConstDeclaration
        = 
        CONST CID COLON Type COLON_EQUALS ArithEx
 ;
syntax Type
        = INT
        | DOUBLE
 ;
syntax ArithEx
        = Expr
        | ProcedureApplication
 ;
syntax ParameterList
        = 
        Identifier firstID COLON Type firstType (COMMA Identifier followID COLON Type followType)*
 ;
syntax ProcedureApplication
        = 
        Identifier LPAREN CommaSeparatedArithEx RPAREN
 ;
syntax CommaSeparatedArithEx
        = 
        {ArithEx COMMA}*
 ;
syntax Atom
        = INT_NUMBER
        | DOUBLE_NUMBER
        | Identifier
        | LPAREN ConditionalExpr RPAREN
 ;
syntax Expr
        = 
        ProdExpr ((ADDITION | SUBTRACTION) ProdExpr)*
 ;
syntax ProdExpr
        = 
        ExponentialExpr ((MULTIPLICATION | DIVISION) ExponentialExpr)*
 ;
syntax ExponentialExpr
        = 
        Unary (EXPONENTIATION Unary)?
 ;
syntax Unary
        = 
        (ADDITION | SUBTRACTION)? Atom
 ;
syntax ConjBooleanExpr
        = 
        BooleanExpr (CONJUNCTION BooleanExpr)*
 ;
syntax DisjBooleanExpr
        = 
        ConjBooleanExpr (DISJUNCTION ConjBooleanExpr)*
 ;
syntax BooleanExpr
        = 
        ArithEx ((EQUALITY | NON_EQUALITY | LESS | LESS_EQUAL | GREATER | GREATER_EQUAL) ArithEx)?
 ;
syntax ConditionalExpr
        = 
        DisjBooleanExpr (QUESTION ConditionalExpr COLON ConditionalExpr)?
 ;
syntax CompoundStatement
        = LBRACE Statement (SEMI Statement)* RBRACE
        | Statement
 ;
syntax Statement
        = SKIP
        | Assignment
        | Conditional
        | Loop
 ;
syntax Assignment
        = 
        Identifier COLON_EQUALS ConditionalExpr
 ;
syntax Conditional
        = 
        IF ConditionalExpr THEN Consequent ELSE Alternative
 ;
syntax Consequent
        = 
        CompoundStatement
 ;
syntax Alternative
        = 
        CompoundStatement
 ;
syntax Loop
        = 
        WHILE BooleanExpr DO CompoundStatement
 ;
syntax NEWLINE
        = 
        "\\r"? "\\n"
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
syntax QUESTION
        = 
        "?"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NON_EQUALITY
        = 
        "!="
 ;
syntax LESS
        = 
        "\<"
 ;
syntax LESS_EQUAL
        = 
        "\<="
 ;
syntax GREATER_EQUAL
        = 
        "\>="
 ;
syntax GREATER
        = 
        "\>"
 ;
syntax CONJUNCTION
        = 
        "/\\\\"
 ;
syntax DISJUNCTION
        = 
        "\\\\/"
 ;
syntax COLON_EQUALS
        = 
        ":="
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
syntax TROLLEY
        = 
        "trolley"
 ;
syntax CONTAINS
        = 
        "contains"
 ;
syntax SKIP
        = 
        "skip"
 ;
syntax CHECKOUT
        = 
        "checkout"
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
syntax VAR
        = 
        "var"
 ;
syntax PROC
        = 
        "proc"
 ;
syntax LBRACE
        = 
        "{"
 ;
syntax RBRACE
        = 
        "}"
 ;
syntax LPAREN
        = 
        "("
 ;
syntax RPAREN
        = 
        ")"
 ;
syntax INT_NUMBER
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE_NUMBER
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") ("-" | "+")? INT_NUMBER)?
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
        = " "
        | "\\r"
        | "\\t"
        | "\\u000C"
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
