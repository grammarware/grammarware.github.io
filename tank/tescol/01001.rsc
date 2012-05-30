@contributor{bgf2src automated exporter - SLPS}
module 01001

syntax Program
        = 
        TROLLEY CONST_ID CONTAINS Declaration* CHECKOUT Statement SEMI DONE SEMI
 ;
syntax Declaration
        = Const_dec
        | Var_dec
        | Proc_dec
 ;
syntax Const_dec
        = 
        CONST CONST_ID COLON Typename DEF Arith_exp SEMI
 ;
syntax Var_dec
        = 
        VAR V_id COLON Typename SEMI
 ;
syntax Proc_dec
        = 
        Proc_header Proc_params Proc_body
 ;
syntax Proc_header
        = 
        PROC P_id
 ;
syntax Proc_params
        = 
        OPEN Param_list CLOSE COLON Typename
 ;
syntax Proc_body
        = 
        DEF Statement SEMI
 ;
syntax Param_list
        = 
        {Param_item COMMA}*
 ;
syntax Param_item
        = 
        Var_id COLON Typename
 ;
syntax Var_id
        = 
        VAR_ID
 ;
syntax Statement
        = Grouped
        | SKIP
        | Assignment
        | Conditional
        | Loop
 ;
syntax Grouped
        = 
        STST (Statement SEMI)+ STED
 ;
syntax Assignment
        = 
        Variable DEF Arith_exp
 ;
syntax Conditional
        = 
        IF Bool_exp THEN Statement ELSE Statement
 ;
syntax Loop
        = 
        WHILE Bool_exp DO Statement
 ;
syntax Arith_exp
        = 
        Bool_exp (QUEST Arith_exp COLON Arith_exp)?
 ;
syntax Bool_exp
        = 
        Con_exp (DISJ Con_exp)*
 ;
syntax Con_exp
        = 
        Comp_exp (CONJ Comp_exp)*
 ;
syntax Comp_exp
        = 
        Plus_min_exp (Rel_operator Plus_min_exp)?
 ;
syntax Plus_min_exp
        = 
        Mult_div_exp ((PLUS | MINUS) Mult_div_exp)*
 ;
syntax Mult_div_exp
        = 
        Exp_exp ((MULT | DIV) Exp_exp)*
 ;
syntax Exp_exp
        = 
        Minus (EXP Minus)?
 ;
syntax Minus
        = Atom
        | MINUS Minus
 ;
syntax Atom
        = Type
        | Constant
        | Variable
        | Procedure
        | OPEN Arith_exp CLOSE
 ;
syntax V_id
        = 
        (VAR_ID | CONST_ID) idname
 ;
syntax P_id
        = 
        (VAR_ID | CONST_ID) idname
 ;
syntax Constant
        = 
        CONST_ID
 ;
syntax Variable
        = 
        VAR_ID
 ;
syntax Procedure
        = 
        VAR_ID OPEN Params_given CLOSE
 ;
syntax Params_given
        = 
        {Arith_exp COMMA}*
 ;
syntax Rel_operator
        = EQ
        | NEQ
        | LESS
        | LESSEQ
        | GRT
        | GRTEQ
 ;
syntax Type
        = INT_T
        | DOUBLE_T
 ;
syntax Typename
        = INT
        | DOUBLE
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
syntax SEMI
        = 
        ";"
 ;
syntax COLON
        = 
        ":"
 ;
syntax DEF
        = 
        ":="
 ;
syntax OPEN
        = 
        "("
 ;
syntax CLOSE
        = 
        ")"
 ;
syntax STST
        = 
        "{"
 ;
syntax STED
        = 
        "}"
 ;
syntax COMMA
        = 
        ","
 ;
syntax QUEST
        = 
        "?"
 ;
syntax PLUS
        = 
        "+"
 ;
syntax MINUS
        = 
        "-"
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
syntax EQ
        = 
        "=="
 ;
syntax NEQ
        = 
        "!="
 ;
syntax LESS
        = 
        "\<"
 ;
syntax LESSEQ
        = 
        "\<="
 ;
syntax GRT
        = 
        "\>"
 ;
syntax GRTEQ
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
syntax INT
        = 
        "int"
 ;
syntax DOUBLE
        = 
        "double"
 ;
syntax INT_T
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE_T
        = 
        INT_T? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") INT_T)?
 ;
syntax CONST_ID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax VAR_ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax COM
        = 
        "/*" ANY* "*/"
 ;
