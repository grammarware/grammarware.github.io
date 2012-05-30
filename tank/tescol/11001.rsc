@contributor{bgf2src automated exporter - SLPS}
module 11001

syntax Program
        = 
        TROLLEY CONSTID Contains Checkout Done
 ;
syntax Contains
        = 
        CONTAINS ((Procdeclaration | Constdeclaration | Vardeclaration) SEMI)*
 ;
syntax Checkout
        = 
        CHECKOUT Statement SEMI
 ;
syntax Done
        = 
        DONE SEMI
 ;
syntax Varid
        = CONSTID
        | VARID
 ;
syntax Assignment
        = 
        Id name DEFINEDAS Expression exp
 ;
syntax Constdeclaration
        = 
        CONST CONSTID name COLON Type t DEFINEDAS Expression exp
 ;
syntax Vardeclaration
        = 
        VAR Varid name COLON Type t
 ;
syntax Procdeclaration
        = 
        PROC Varid name LPAREN Parameterlist params RPAREN COLON Type t DEFINEDAS Statement content
 ;
syntax Parameterlist
        = Varid name COLON Type t (COMMA Parameterlist params)?
        | ()
 ;
syntax Statement
        = SKIP
        | LBRACE Statement (SEMI Statement)* SEMI? RBRACE
        | Assignment
        | Ifstatement
        | Whilestatement
 ;
syntax Ifstatement
        = 
        IF Expression exp THEN Statement ELSE Statement
 ;
syntax Whilestatement
        = 
        WHILE Expression exp DO Statement
 ;
syntax Expression
        = 
        Mixfix e
 ;
syntax Mixfix
        = 
        Conjunction e (QUESTION Mixfix t COLON Mixfix f)?
 ;
syntax Conjunction
        = 
        Disjunction l (AND Disjunction r)*
 ;
syntax Disjunction
        = 
        Comparison l (OR Comparison r)*
 ;
syntax Comparison
        = 
        Addition_exp l (Conditional c Addition_exp r)?
 ;
syntax Addition_exp
        = 
        Multiply_exp l ((PLUS o | MINUS o) Multiply_exp r)*
 ;
syntax Multiply_exp
        = 
        Exp_exp l ((MUL o | FSLASH o) Exp_exp r)*
 ;
syntax Exp_exp
        = 
        Atom_exp l (EXP Atom_exp r)*
 ;
syntax Atom_exp
        = Unary_exp e
        | LPAREN Expression exp RPAREN
        | Proccall proc
 ;
syntax Unary_exp
        = 
        MINUS? (Number num | Id var)
 ;
syntax Proccall
        = 
        Varid proc LPAREN Argumentlist args RPAREN
 ;
syntax Argumentlist
        = Expression exp (COMMA Argumentlist args)?
        | ()
 ;
syntax Conditional
        = EQUALITY t
        | INEQUALITY t
        | LANGLE t
        | RANGLE t
        | LTEQUALS t
        | GTEQUALS t
 ;
syntax Number
        = FLOAT f
        | INT i
        | UINT u
 ;
syntax Id
        = 
        (CONSTID | VARID) name
 ;
syntax SEMI
        = 
        ";"
 ;
syntax COLON
        = 
        ":"
 ;
syntax EQUALS
        = 
        "="
 ;
syntax COMMA
        = 
        ","
 ;
syntax PLUS
        = 
        "+"
 ;
syntax MINUS
        = 
        "-"
 ;
syntax MUL
        = 
        "*"
 ;
syntax EXP
        = 
        "**"
 ;
syntax FSLASH
        = 
        "/"
 ;
syntax LPAREN
        = 
        "("
 ;
syntax RPAREN
        = 
        ")"
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax BANG
        = 
        "!"
 ;
syntax LANGLE
        = 
        "\<"
 ;
syntax RANGLE
        = 
        "\>"
 ;
syntax LBRACE
        = 
        "{"
 ;
syntax RBRACE
        = 
        "}"
 ;
syntax AND
        = 
        "/\\\\"
 ;
syntax OR
        = 
        "\\\\/"
 ;
syntax DEFINEDAS
        = 
        COLON EQUALS
 ;
syntax GTEQUALS
        = 
        RANGLE EQUALS
 ;
syntax LTEQUALS
        = 
        LANGLE EQUALS
 ;
syntax EQUALITY
        = 
        EQUALS EQUALS
 ;
syntax INEQUALITY
        = 
        BANG EQUALS
 ;
syntax DONE
        = 
        "done"
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
syntax SKIP
        = 
        "skip"
 ;
syntax VAR
        = 
        "var"
 ;
syntax CONST
        = 
        "const"
 ;
syntax Type
        = TINT
        | TDOUBLE
 ;
syntax TINT
        = 
        "int"
 ;
syntax TDOUBLE
        = 
        "double"
 ;
syntax CONSTID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax VARID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax UINT
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax INT
        = 
        ("+" | "-")? UINT
 ;
syntax FLOAT
        = 
        INT? "." UINT? EXPONENT?
 ;
syntax EXPONENT
        = 
        ("e" | "E") INT
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
