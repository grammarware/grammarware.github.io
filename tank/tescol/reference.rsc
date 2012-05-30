@contributor{bgf2src automated exporter - SLPS}
module Reference

syntax Program
        = 
        TROLLEY CONSTID CONTAINS (Declaration SEMI)* CHECKOUT Statement SEMI DONE SEMI
 ;
syntax Declaration
        = ConstDecl
        | VarDecl
        | ProcDecl
 ;
syntax ConstDecl
        = 
        CONST CONSTID COLON Type t DEFAS Expression e
 ;
syntax VarDecl
        = 
        VAR (ID a | CONSTID a) COLON Type t
 ;
syntax ProcDecl
        = 
        PROC (ID a | CONSTID a) LPAR ParamList p RPAR COLON Type t DEFAS Statement st
 ;
syntax Term
        = LPAR Expression RPAR
        | CONSTID ProcApp p
        | ID ProcApp p
 ;
syntax Unary
        = 
        SUB* Term
 ;
syntax Exp
        = 
        Unary a (EXP Unary)*
 ;
syntax Mult
        = 
        Exp a (MULTOP Exp b)*
 ;
syntax Add
        = 
        Mult a ((ADD | SUB) Mult b)*
 ;
syntax Relation
        = 
        Add a (RELOP Add b)?
 ;
syntax Equality
        = 
        Relation a (EQOP Relation b)?
 ;
syntax Disj
        = 
        Equality a (DISJUNC Equality b)*
 ;
syntax Conj
        = 
        Disj a (CONJUNC Disj b)*
 ;
syntax Expression
        = 
        Conj a (TE Expression b COLON Expression c)?
 ;
syntax ProcApp
        = ()
        | LPAR AppList RPAR
 ;
syntax AppList
        = ()
        | Expression e (COMMA Expression f)*
 ;
syntax Number
        = INTEGER
        | DOUBLE
 ;
syntax Assign
        = 
        (ID a | CONSTID a) DEFAS Expression e
 ;
syntax CondSt
        = 
        IF Expression e THEN Statement ELSE Statement
 ;
syntax Loop
        = 
        WHILE Expression e DO Statement
 ;
syntax ParamList
        = ()
        | ParamElem p (COMMA ParamElem q)*
 ;
syntax ParamElem
        = 
        ID COLON Type
 ;
syntax Statement
        = StmtElem
        | StmtList
 ;
syntax StmtList
        = 
        LBRACE StmtElem s (SEMI StmtElem t)* RBRACE
 ;
syntax StmtElem
        = SKIP
        | Assign
        | CondSt
        | Loop
 ;
syntax Type
        = INT
        | DOUB
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
syntax IF
        = 
        "if"
 ;
syntax THEN
        = 
        "then"
 ;
syntax WHILE
        = 
        "while"
 ;
syntax DO
        = 
        "do"
 ;
syntax ELSE
        = 
        "else"
 ;
syntax INT
        = 
        "int"
 ;
syntax DOUB
        = 
        "double"
 ;
syntax COLON
        = 
        ":"
 ;
syntax DEFAS
        = 
        ":="
 ;
syntax COMMA
        = 
        ","
 ;
syntax SEMI
        = 
        ";"
 ;
syntax LPAR
        = 
        "("
 ;
syntax RPAR
        = 
        ")"
 ;
syntax LBRACE
        = 
        "{"
 ;
syntax RBRACE
        = 
        "}"
 ;
syntax ADD
        = 
        "+"
 ;
syntax SUB
        = 
        "-"
 ;
syntax MULTOP
        = MULT
        | DIV
 ;
syntax MULT
        = 
        "*"
 ;
syntax DIV
        = 
        "/"
 ;
syntax EXP
        = 
        "**"
 ;
syntax DISJUNC
        = 
        "/\\\\"
 ;
syntax CONJUNC
        = 
        "\\\\/"
 ;
syntax RELOP
        = LT
        | LTE
        | GT
        | GTE
 ;
syntax EQOP
        = ET
        | NET
 ;
syntax ET
        = 
        "=="
 ;
syntax NET
        = 
        "!="
 ;
syntax LT
        = 
        "\<"
 ;
syntax LTE
        = 
        "\<="
 ;
syntax GT
        = 
        "\>"
 ;
syntax GTE
        = 
        "\>="
 ;
syntax TE
        = 
        "?"
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
syntax UPPER
        = "A"
        | "B"
        | "C"
        | "D"
        | "E"
        | "F"
        | "G"
        | "H"
        | "I"
        | "J"
        | "K"
        | "L"
        | "M"
        | "N"
        | "O"
        | "P"
        | "Q"
        | "R"
        | "S"
        | "T"
        | "U"
        | "V"
        | "W"
        | "X"
        | "Y"
        | "Z"
 ;
syntax LOWER
        = "a"
        | "b"
        | "c"
        | "d"
        | "e"
        | "f"
        | "g"
        | "h"
        | "i"
        | "j"
        | "k"
        | "l"
        | "m"
        | "n"
        | "o"
        | "p"
        | "q"
        | "r"
        | "s"
        | "t"
        | "u"
        | "v"
        | "w"
        | "x"
        | "y"
        | "z"
 ;
syntax INTEGER
        = 
        ("+" | "-")? DIGIT+
 ;
syntax DOUBLE
        = 
        INTEGER? "." DIGIT* (("e" | "E") INTEGER)?
 ;
syntax CONSTID
        = 
        UPPER (UPPER | DIGIT | "_")*
 ;
syntax ID
        = 
        (UPPER | LOWER) (UPPER | LOWER | DIGIT | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
