@contributor{bgf2src automated exporter - SLPS}
module 10001

syntax Prog
        = 
        Stat+
 ;
syntax Stat
        = Expr SEMI
        | Trolley
        | Checkout
        | Assignment
        | Ifstat
        | Whilestat
        | SKIP SEMI
        | LBRACE Stat+ RBRACE
        | SEMI
 ;
syntax Type
        = INT
        | DOUBLE
 ;
syntax Def
        = CONST Cid n COLON Type t COLON_EQUALS Expr e SEMI
        | VAR Vartypedef SEMI
        | Procedure SEMI
 ;
syntax Vartypedef
        = 
        Id COLON (INT | DOUBLE)
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
        Expr ((GREATER_EQUAL | LESS_EQUAL | EQUALITY | NON_EQUALITY | LESS | GREATER) Expr)?
 ;
syntax Expr
        = 
        MultExpr ((ADDITION | SUBTRACTION) MultExpr)*
 ;
syntax MultExpr
        = 
        Atom ((MULTIPLICATION | DIVISION | EXPONENTIATION) Atom)*
 ;
syntax ID
        = 
        "id"
 ;
syntax Id
        = 
        i: IDENT
 ;
syntax Cid
        = 
        i: CIDENT
 ;
syntax Atom
        = INT_NUMBER
        | DOUBLE_NUMBER
        | Id
        | Cid
        | LPAREN CondExpr RPAREN
        | Proccall
 ;
syntax Trolley
        = 
        TROLLEY Cid CONTAINS Def*
 ;
syntax Checkout
        = 
        CHECKOUT Stat SEMI? DONE SEMI
 ;
syntax Assignment
        = 
        Id COLON_EQUALS CondExpr SEMI
 ;
syntax Ifstat
        = 
        IF CondExpr e THEN Stat ts ELSE Stat es
 ;
syntax Whilestat
        = 
        WHILE CondExpr e DO Stat s
 ;
syntax ARGLIST
        = 
        "arglist"
 ;
syntax PROCBODY
        = 
        "procbody"
 ;
syntax Procedure
        = 
        PROC Id i LPAREN (Vartypedef a (COMMA Vartypedef a)*)? RPAREN COLON_EQUALS Stat s
 ;
syntax CALL
        = 
        "call"
 ;
syntax Proccall
        = 
        Id i LPAREN (Atom a (COMMA Atom a)*)? RPAREN
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
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE_NUMBER
        = 
        INT_NUMBER? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* ("e" INT_NUMBER)?
 ;
syntax CIDENT
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax IDENT
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
