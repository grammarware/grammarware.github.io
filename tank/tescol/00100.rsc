@contributor{bgf2src automated exporter - SLPS}
module 00100

syntax Program
        = 
        TROLLEY CID CONTAINS Declarations CHECKOUT Statements DONE SEMI EOF
 ;
syntax Type
        = INT
        | DOUBLE
 ;
syntax Relational
        = EQUALITY
        | NON_EQUALITY
        | LESS
        | LESS_EQUAL
        | GREATER_EQUAL
        | GREATER
 ;
syntax Declarations
        = 
        (Constant | Variable | Procedure)*
 ;
syntax Constant
        = 
        CONST CID COLON Type COLON_EQUALS Expression SEMI
 ;
syntax Variable
        = 
        VAR ID COLON Type SEMI
 ;
syntax Parameter
        = 
        (ID COLON Type)*
 ;
syntax Parameters
        = 
        Parameter (COMMA Parameter)*
 ;
syntax Procedure
        = 
        PROC ID LPAREN Parameters RPAREN COLON Type COLON_EQUALS Statements
 ;
syntax Atom
        = INT_NUMBER
        | DOUBLE_NUMBER
        | ID
        | CID
        | ProcedureApp
        | LPAREN Expression RPAREN
 ;
syntax Negation
        = 
        "-"
 ;
syntax Sign
        = 
        ("+" | Negation)? Atom
 ;
syntax ExpOperand
        = 
        EXPONENTIATION
 ;
syntax MultOperand
        = MULTIPLICATION
        | DIVISION
 ;
syntax AddOperand
        = ADDITION
        | SUBTRACTION
 ;
syntax OrderExpr
        = 
        Sign (ExpOperand Sign)?
 ;
syntax MultExpr
        = 
        OrderExpr (MultOperand OrderExpr)*
 ;
syntax AritExpr
        = 
        MultExpr (AddOperand MultExpr)*
 ;
syntax RealParameters
        = 
        AritExpr (COMMA AritExpr)*
 ;
syntax ProcedureApp
        = 
        ID LPAREN RealParameters? RPAREN
 ;
syntax BooleanExpression
        = 
        AritExpr (Relational AritExpr)?
 ;
syntax BooleanConj
        = 
        BooleanExpression (CONJUNCTION BooleanExpression)*
 ;
syntax BooleanDisj
        = 
        BooleanConj (DISJUNCTION BooleanConj)*
 ;
syntax CondExpr
        = 
        BooleanDisj (QUESTION AritExpr COLON AritExpr)?
 ;
syntax Expression
        = 
        CondExpr
 ;
syntax Skip
        = 
        SKIP SEMI
 ;
syntax Assignment
        = 
        ID COLON_EQUALS Expression SEMI
 ;
syntax IfStat
        = 
        IF Expression THEN Statements ELSE Statements
 ;
syntax Loop
        = 
        WHILE Expression DO Statements
 ;
syntax Statement
        = Skip
        | Assignment
        | IfStat
        | Loop
 ;
syntax GroupStatement
        = 
        LBRACE Statement+ RBRACE SEMI
 ;
syntax Statements
        = Statement
        | GroupStatement
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
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") INT_NUMBER)?
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
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax EOF
        = 
        ()
 ;
