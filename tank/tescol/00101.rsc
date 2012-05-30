@contributor{bgf2src automated exporter - SLPS}
module 00101

syntax Program
        = 
        Stat
 ;
syntax Stat
        = 
        Header CHECKOUT Body Done
 ;
syntax Header
        = 
        TROLLEY CONSTID CONTAINS Header_declaration*
 ;
syntax Body
        = 
        Statement SEMICOLON
 ;
syntax Done
        = 
        DONE SEMICOLON
 ;
syntax Statement
        = Statement_main
        | OPENCURL Statement_main (SEMICOLON Statement_main)* CLOSECURL
 ;
syntax Statement_main
        = SKIP
        | If_statement
        | While_statement
        | Assignment
 ;
syntax If_statement
        = 
        IF Expr THEN Statement a ELSE Statement b
 ;
syntax While_statement
        = 
        WHILE Expr DO Statement
 ;
syntax Assignment
        = 
        Id DEFINEDAS Expr
 ;
syntax Header_declaration
        = Const_dec
        | Var_dec
        | Proc_dec
 ;
syntax Const_dec
        = 
        CONST CONSTID COLON Types DEFINEDAS Expr SEMICOLON
 ;
syntax Var_dec
        = 
        VAR Id COLON Types SEMICOLON
 ;
syntax Proc_dec
        = 
        PROC Id Parameter_list COLON Types DEFINEDAS Statement SEMICOLON
 ;
syntax Parameter_list
        = 
        OPENPAR Parameter_list_inside? CLOSEPAR
 ;
syntax Parameter_list_inside
        = 
        Parameter_element (COMMA Parameter_element)*
 ;
syntax Parameter_element
        = 
        ID COLON Types
 ;
syntax Expr
        = 
        Boolean_expr a (MIXFIX Expr b COLON Expr c)?
 ;
syntax Boolean_expr
        = 
        Boolean_OR
 ;
syntax Boolean_OR
        = 
        Boolean_AND a (OR Boolean_AND b)*
 ;
syntax Boolean_AND
        = 
        Boolean_predicate a (AND Boolean_predicate b)*
 ;
syntax Boolean_predicate
        = 
        Arith_expr a (Relationals Arith_expr b)?
 ;
syntax Arith_expr
        = 
        Arith_addsub
 ;
syntax Arith_addsub
        = 
        Arith_muldiv a ((ADDITION | SUBTRACTION) Arith_muldiv b)*
 ;
syntax Arith_muldiv
        = 
        Arith_expo a ((MULTIPLICATION | DIVISION) Arith_expo b)*
 ;
syntax Arith_expo
        = 
        Arith_atom a (EXPONENTIAL Arith_atom b)*
 ;
syntax Arith_atom
        = (ADDITION | SUBTRACTION)? Number
        | Id
        | OPENPAR Expr CLOSEPAR
        | Proc_call
 ;
syntax Proc_call
        = 
        Id OPENPAR (Expr a (COMMA Expr b)*)? CLOSEPAR
 ;
syntax SEMICOLON
        = 
        ";"
 ;
syntax COLON
        = 
        ":"
 ;
syntax DEFINEDAS
        = 
        ":="
 ;
syntax OPENPAR
        = 
        "("
 ;
syntax CLOSEPAR
        = 
        ")"
 ;
syntax OPENCURL
        = 
        "{"
 ;
syntax CLOSECURL
        = 
        "}"
 ;
syntax COMMA
        = 
        ","
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
syntax EXPONENTIAL
        = 
        "**"
 ;
syntax MULTIPLICATION
        = 
        "*"
 ;
syntax MIXFIX
        = 
        "?"
 ;
syntax Relationals
        = EQUALITY
        | NON_EQUALITY
        | L_THAN
        | LE_THAN
        | G_THAN
        | GE_THAN
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NON_EQUALITY
        = 
        "!="
 ;
syntax L_THAN
        = 
        "\<"
 ;
syntax LE_THAN
        = 
        "\<="
 ;
syntax G_THAN
        = 
        "\>"
 ;
syntax GE_THAN
        = 
        "\>="
 ;
syntax Logical
        = AND
        | OR
 ;
syntax AND
        = 
        "/\\\\"
 ;
syntax OR
        = 
        "\\\\/"
 ;
syntax COMMENT_BLOCK
        = 
        "/*" ANY* "*/"
 ;
syntax TROLLEY
        = 
        "trolley"
 ;
syntax CONTAINS
        = 
        "contains"
 ;
syntax CHECKOUT
        = 
        "checkout"
 ;
syntax DONE
        = 
        "done"
 ;
syntax SKIP
        = 
        "skip"
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
syntax Types
        = INTEGER
        | DOUBLE
 ;
syntax INTEGER
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
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax Number
        = INT_VAL
        | DOUBLE_VAL
 ;
syntax INT_VAL
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE_VAL
        = 
        INT_VAL? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") ("+" | "-")? INT_VAL)?
 ;
syntax Id
        = ID
        | CONSTID
 ;
syntax CONSTID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
