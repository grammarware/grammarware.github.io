@contributor{bgf2src automated exporter - SLPS}
module 10111

syntax Prog
        = 
        KW_TROLLEY ID_GENERAL KW_CONTAINS Decl* KW_CHECKOUT Statement KW_DONE SYM_SEMI
 ;
syntax Mixfix
        = 
        Predicate (SYM_QM Mixfix SYM_COLON Mixfix)?
 ;
syntax Predicate
        = 
        Pred_term (SYM_OR Pred_term)*
 ;
syntax Pred_term
        = 
        Pred_base (SYM_AND Pred_base)*
 ;
syntax Pred_base
        = 
        Expr (Comparator Expr)*
 ;
syntax Expr
        = 
        Subtraction_subexpr (SYM_ADD Subtraction_subexpr)*
 ;
syntax Subtraction_subexpr
        = 
        Term (SYM_SUB Term)*
 ;
syntax Term
        = 
        Div_subterm (SYM_MULT Div_subterm)*
 ;
syntax Div_subterm
        = 
        Molecule (SYM_DIV Molecule)*
 ;
syntax Molecule
        = 
        Atom (SYM_EXP Molecule)?
 ;
syntax Atom
        = Immediate
        | Varproc_id v
        | Proc_call
        | Parenthesised
 ;
syntax Decl
        = (Const_decl | Var_decl) SYM_SEMI
        | Proc_decl
 ;
syntax Const_decl
        = 
        KW_CONST ID_GENERAL id SYM_COLON Type t SYM_ASS Expr e
 ;
syntax Var_decl
        = 
        KW_VAR Varproc_id id SYM_COLON Type t (SYM_ASS Expr)?
 ;
syntax Proc_decl
        = 
        KW_PROC Varproc_id id Param_decl_list SYM_COLON Type SYM_ASS Statement
 ;
syntax Param_and_type
        = 
        Varproc_id SYM_COLON Type
 ;
syntax Param_decl_list
        = 
        SYM_OPEN_PAREN {Param_and_type SYM_COMMA}* SYM_CLOSE_PAREN
 ;
syntax Statement
        = KW_SKIP SYM_SEMI
        | Varproc_id a SYM_ASS Mixfix c SYM_SEMI
        | SYM_OPEN_BRACE Statement+ SYM_CLOSE_BRACE SYM_SEMI
        | KW_IF Mixfix KW_THEN Statement KW_ELSE Statement
        | KW_WHILE Mixfix KW_DO Statement
 ;
syntax Comparator
        = SYM_EQ
        | SYM_INEQ
        | SYM_GT
        | SYM_NS_GT
        | SYM_LT
        | SYM_NS_LT
 ;
syntax Parenthesised
        = 
        SYM_OPEN_PAREN Mixfix SYM_CLOSE_PAREN
 ;
syntax Type
        = KW_TYPE_INT
        | KW_TYPE_DOUBLE
 ;
syntax Varproc_id
        = ID_VARPROC
        | ID_GENERAL
 ;
syntax Arg_list
        = 
        SYM_OPEN_PAREN {Expr SYM_COMMA}* SYM_CLOSE_PAREN
 ;
syntax Proc_call
        = 
        Varproc_id id Arg_list l
 ;
syntax Immediate
        = IntegerNum
        | DoubleNum
 ;
syntax IntegerNum
        = 
        (SYM_ADD | SYM_SUB)? INT
 ;
syntax DoubleNum
        = 
        (SYM_ADD | SYM_SUB)? DOUBLE
 ;
syntax DOUBLE
        = 
        INT? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* EXPONENT?
 ;
syntax INT
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax KW_TYPE_INT
        = 
        "int"
 ;
syntax KW_TYPE_DOUBLE
        = 
        "double"
 ;
syntax KW_DONE
        = 
        "done"
 ;
syntax KW_SKIP
        = 
        "skip"
 ;
syntax KW_IF
        = 
        "if"
 ;
syntax KW_THEN
        = 
        "then"
 ;
syntax KW_ELSE
        = 
        "else"
 ;
syntax KW_WHILE
        = 
        "while"
 ;
syntax KW_DO
        = 
        "do"
 ;
syntax KW_TROLLEY
        = 
        "trolley"
 ;
syntax KW_CHECKOUT
        = 
        "checkout"
 ;
syntax KW_CONTAINS
        = 
        "contains"
 ;
syntax KW_CONST
        = 
        "const"
 ;
syntax KW_VAR
        = 
        "var"
 ;
syntax KW_PROC
        = 
        "proc"
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax SYM_SEMI
        = 
        ";"
 ;
syntax SYM_COMMA
        = 
        ","
 ;
syntax SYM_COLON
        = 
        ":"
 ;
syntax SYM_QM
        = 
        "?"
 ;
syntax SYM_ASS
        = 
        ":="
 ;
syntax SYM_OPEN_PAREN
        = 
        "("
 ;
syntax SYM_CLOSE_PAREN
        = 
        ")"
 ;
syntax SYM_OPEN_BRACE
        = 
        "{"
 ;
syntax SYM_CLOSE_BRACE
        = 
        "}"
 ;
syntax SYM_EXP
        = 
        "**"
 ;
syntax SYM_ADD
        = 
        "+"
 ;
syntax SYM_SUB
        = 
        "-"
 ;
syntax SYM_MULT
        = 
        "*"
 ;
syntax SYM_DIV
        = 
        "/"
 ;
syntax SYM_AND
        = 
        "/\\\\"
 ;
syntax SYM_OR
        = 
        "\\\\/"
 ;
syntax SYM_EQ
        = 
        "=="
 ;
syntax SYM_INEQ
        = 
        "!="
 ;
syntax SYM_LT
        = 
        "\<"
 ;
syntax SYM_GT
        = 
        "\>"
 ;
syntax SYM_NS_LT
        = 
        "\<="
 ;
syntax SYM_NS_GT
        = 
        "\>="
 ;
syntax ID_GENERAL
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "_") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax ID_VARPROC
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "_") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax EXPONENT
        = 
        ("e" | "E") (SYM_ADD | SYM_SUB)? INT
 ;
