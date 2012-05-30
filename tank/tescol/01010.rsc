@contributor{bgf2src automated exporter - SLPS}
module 01010

syntax Program
        = 
        TROLLEY CONSTID CONTAINS Declaration* CHECKOUT Statement SEMI DONE SEMI EOF
 ;
syntax Declaration
        = Procdec
        | Constdec
        | Vardec
 ;
syntax Procdec
        = 
        PROC Procdescribe COLON Type ASSIGN Statement SEMI
 ;
syntax Procdescribe
        = 
        Id LPARA Paramdecs RPARA
 ;
syntax Paramdecs
        = 
        {Paramdec COMMA}*
 ;
syntax Paramdec
        = 
        Id COLON Type
 ;
syntax Argslist
        = 
        LPARA {Expr COMMA}* RPARA
 ;
syntax Constdec
        = 
        CONST CONSTID COLON Type ASSIGN Expr SEMI
 ;
syntax Vardec
        = 
        VAR Id COLON Type SEMI
 ;
syntax Assignment
        = 
        Id ASSIGN Expr
 ;
syntax Ifthenelse
        = 
        IF Cond Thenclause Elseclause
 ;
syntax Thenclause
        = 
        THEN Statement
 ;
syntax Elseclause
        = 
        ELSE Statement
 ;
syntax Whiledo
        = 
        WHILE Cond DO Statement
 ;
syntax Statement
        = SKIP
        | LCURL Statement (SEMI Statement)* RCURL
        | Assignment
        | Ifthenelse
        | Whiledo
 ;
syntax Expr
        = 
        Cond (QUEST Expr COLON Expr)?
 ;
syntax Sub_add_expr
        = 
        Mul_div_expr (Addsub Mul_div_expr)*
 ;
syntax Mul_div_expr
        = 
        Expexpr ((MUL | DIV) Expexpr)*
 ;
syntax Expexpr
        = 
        Atom (EXP Expexpr)?
 ;
syntax Atom
        = Negative Unsignedatom
        | Unsignedatom
 ;
syntax Unsignedatom
        = Bracketexpr
        | Id Argslist?
        | Sign Number
        | Number
 ;
syntax Bracketexpr
        = 
        LPARA Expr RPARA
 ;
syntax Cond
        = 
        Andcond (OR Andcond)*
 ;
syntax Andcond
        = 
        Pred (AND Pred)*
 ;
syntax Pred
        = 
        Sub_add_expr (Comparator Sub_add_expr)?
 ;
syntax COLON
        = 
        ":"
 ;
syntax SEMI
        = 
        ";"
 ;
syntax QUEST
        = 
        "?"
 ;
syntax COMMA
        = 
        ","
 ;
syntax ASSIGN
        = 
        ":="
 ;
syntax Comparator
        = EQL
        | NEQL
        | GRT
        | GRTE
        | LST
        | LSTE
 ;
syntax EQL
        = 
        "=="
 ;
syntax NEQL
        = 
        "!="
 ;
syntax GRT
        = 
        "\>"
 ;
syntax GRTE
        = 
        "\>="
 ;
syntax LST
        = 
        "\<"
 ;
syntax LSTE
        = 
        "\<="
 ;
syntax Arithop
        = POSITIVE
        | NEGATIVE
        | ADDITION
        | SUBTRACTION
        | MUL
        | DIV
        | EXP
 ;
syntax Addsub
        = ADDITION
        | POSITIVE
        | SUBTRACTION
        | NEGATIVE
 ;
syntax Positive
        = POSITIVE
        | ADDITION
 ;
syntax Negative
        = NEGATIVE
        | SUBTRACTION
 ;
syntax Sign
        = POSITIVE
        | NEGATIVE
 ;
syntax ADDITION
        = 
        "+" (" " | "\\t" | "\\r" | "\\n" | COMMENT)
 ;
syntax SUBTRACTION
        = 
        "-" (" " | "\\t" | "\\r" | "\\n" | COMMENT)
 ;
syntax POSITIVE
        = 
        "+"
 ;
syntax NEGATIVE
        = 
        "-"
 ;
syntax MUL
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
syntax Logicop
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
syntax LPARA
        = 
        "("
 ;
syntax RPARA
        = 
        ")"
 ;
syntax LCURL
        = 
        "{"
 ;
syntax RCURL
        = 
        "}"
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
syntax Vartype
        = CONST
        | VAR
        | PROC
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
syntax Type
        = INT
        | DOUBLE
 ;
syntax INT
        = 
        "int"
 ;
syntax DOUBLE
        = 
        "double"
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
syntax Number
        = INUM
        | NUM
 ;
syntax INUM
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax NUM
        = 
        INUM? "." INUM? (("e" | "E") (POSITIVE | NEGATIVE)? INUM)?
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax Comments
        = 
        COMMENT*
 ;
syntax EOF
        = 
        ()
 ;
