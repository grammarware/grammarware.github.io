@contributor{bgf2src automated exporter - SLPS}
module 11110

syntax Prog
        = 
        Stat+
 ;
syntax Stat
        = 
        CompilationUnit
 ;
syntax Type
        = INT
        | DOUBLE
 ;
syntax CompilationUnit
        = 
        TROLLEY CONSTID CONTAINS Declarations de CHECKOUT Statement s SEMI DONE SEMI
 ;
syntax Declarations
        = 
        (ConstDeclaration | VarDeclaration | ProDeclaration)+
 ;
syntax ConstDeclaration
        = 
        CONST CONSTID COLON Type t COLON_EQUALS ArithmeticExpr ar SEMI
 ;
syntax VarDeclaration
        = 
        VAR ID COLON Type t SEMI
 ;
syntax ProDeclaration
        = 
        PROC ID LPAREN ParameterList p1 RPAREN COLON Type t COLON_EQUALS Statement s1 SEMI
 ;
syntax ParameterList
        = 
        ParameterElement ("," ParameterElement)*
 ;
syntax ParameterElement
        = 
        ID id COLON Type t
 ;
syntax ListofStatement
        = 
        "{" SingleStatement (SEMI SingleStatement s)+ "}"
 ;
syntax SingleStatement
        = SkipStm
        | LoopStm
        | CondStm
        | a: AssgStm
 ;
syntax Statement
        = e: SingleStatement
        | b: ListofStatement
 ;
syntax SkipStm
        = 
        SKIP
 ;
syntax LoopStm
        = 
        WHILE LPAREN? BooleanExpr e RPAREN? DO? Statement s
 ;
syntax CondStm
        = 
        IF LPAREN? BooleanExpr a RPAREN? THEN? Statement b (ELSE Statement c)?
 ;
syntax AssgStm
        = 
        ID COLON_EQUALS ArithmeticExpr a1
 ;
syntax ArithmeticExpr
        = ConditionalExpr
        | a: ApplyProcedure
 ;
syntax ApplyProcedure
        = 
        ID LPAREN ExpressionList RPAREN
 ;
syntax ExpressionList
        = 
        ArithmeticExpr ("," ArithmeticExpr)*
 ;
syntax ConditionalExpr
        = 
        BooleanExpr (QUESTION ConditionalExpr COLON ConditionalExpr)?
 ;
syntax BooleanExpr
        = 
        ConjunctionExpression (DISJUNCTION ConjunctionExpression)*
 ;
syntax ConjunctionExpression
        = 
        EqualityExpression (CONJUNCTION EqualityExpression)*
 ;
syntax EqualityExpression
        = 
        RelationalExpression ((EQUALITY | NON_EQUALITY) RelationalExpression)?
 ;
syntax RelationalExpression
        = 
        AddtExpr ((LESS_EQUAL | GREATER_EQUAL | LESS | GREATER) AddtExpr)?
 ;
syntax AddtExpr
        = 
        MultExpr ((ADDITION | SUBTRACTION) MultExpr)*
 ;
syntax MultExpr
        = 
        UnaryExpr ((MULTIPLICATION | DIVISION | EXPONENTIATION) UnaryExpr)*
 ;
syntax UnaryExpr
        = "-" Atom
        | Atom
 ;
syntax Atom
        = INTEGER
        | FLOAT
        | CONSTID
        | "(" ConditionalExpr ")"
        | ApplyProcedure
        | ID
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
        (" " | "\\t" | "\\n" | "\\r")+
 ;
syntax INTEGER
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*
 ;
syntax FLOAT
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+)?
 ;
syntax COMMENTS
        = 
        "/*" ANY* "*/"
 ;
