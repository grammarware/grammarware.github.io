@contributor{bgf2src automated exporter - SLPS}
module 11011

syntax Program
        = 
        TROLLEY CONST_ID Declarations Statements DONE SEMI
 ;
syntax Dec_var
        = 
        VAR Ids COLON Dec_types SEMI
 ;
syntax Declarations
        = 
        CONTAINS (Dec_const | Dec_var | Dec_proc)*
 ;
syntax Dec_const
        = 
        CONST CONST_ID COLON Dec_types DEFAS Expr SEMI
 ;
syntax Ids
        = ID
        | CONST_ID
 ;
syntax Dec_proc
        = 
        PROC ID LPAR Param_list COLON Dec_types DEFAS Statement SEMI
 ;
syntax Dec_types
        = TYPE_INT
        | TYPE_DOUBLE
 ;
syntax Param_list
        = 
        Param_element? (COMMA Param_element)*
 ;
syntax Param_element
        = 
        ID COLON Dec_types
 ;
syntax Statements
        = 
        CHECKOUT Statement SEMI
 ;
syntax Statement
        = Assign
        | SKIP
        | Conditional
        | Loop
        | Statement_group
 ;
syntax Statement_group
        = 
        LCB Statement (SEMI Statement)* RCB
 ;
syntax Assign
        = 
        Ids DEFAS Expr
 ;
syntax Conditional
        = 
        IF Exp_bools THEN Statement ELSE Statement
 ;
syntax Loop
        = 
        WHILE Exp_bools DO Statement
 ;
syntax Expr
        = 
        Exp_bools (QMARK Expr COLON Expr)?
 ;
syntax Exp_bools
        = 
        Exp_and (DISJ Exp_and)*
 ;
syntax Exp_and
        = 
        Exp_comp (CONJ Exp_comp)*
 ;
syntax Exp_comp
        = 
        Exp_addsub ((COND_COMP_GREATE | COND_COMP_GREAT | COND_COMP_LESS | COND_COMP_LESSE | COND_EQUAL | COND_NONEQUAL) Exp_addsub)?
 ;
syntax Exp_addsub
        = 
        Exp_multi ((ARITH_ADD | ARITH_SUB) Exp_multi)*
 ;
syntax Exp_multi
        = 
        Exp_exp ((ARITH_MUL | ARITH_DIV) Exp_exp)*
 ;
syntax Exp_exp
        = 
        Atom (ARITH_EXP Atom)*
 ;
syntax Atom
        = INT
        | DOUBLE
        | Ids Argument_list?
        | LPAR Expr RPAR
 ;
syntax Argument_list
        = 
        LPAR {Expr COMMA}* RPAR
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
syntax DEFAS
        = 
        ":="
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
syntax TYPE_INT
        = 
        "int"
 ;
syntax TYPE_DOUBLE
        = 
        "double"
 ;
syntax INT
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* ("e" ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+)?
 ;
syntax LPAR
        = 
        "("
 ;
syntax RPAR
        = 
        ")"
 ;
syntax LCB
        = 
        "{"
 ;
syntax RCB
        = 
        "}"
 ;
syntax QMARK
        = 
        "?"
 ;
syntax ARITH_ADD
        = 
        "+"
 ;
syntax ARITH_SUB
        = 
        "-"
 ;
syntax ARITH_MUL
        = 
        "*"
 ;
syntax ARITH_DIV
        = 
        "/"
 ;
syntax ARITH_EXP
        = 
        "**"
 ;
syntax COND_EQUAL
        = 
        "=="
 ;
syntax COND_NONEQUAL
        = 
        "!="
 ;
syntax COND_COMP_GREAT
        = 
        "\<"
 ;
syntax COND_COMP_GREATE
        = 
        "\<="
 ;
syntax COND_COMP_LESS
        = 
        "\>"
 ;
syntax COND_COMP_LESSE
        = 
        "\>="
 ;
syntax CONJ
        = 
        "/\\\\"
 ;
syntax DISJ
        = 
        "\\\\/"
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax CONST_ID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "_" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*
 ;
syntax ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
