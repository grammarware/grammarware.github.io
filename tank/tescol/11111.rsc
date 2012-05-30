@contributor{bgf2src automated exporter - SLPS}
module 11111

syntax Program
        = 
        TROLLEY CONSTID CONTAINS Declaration* CHECKOUT Statement SEMI DONE SEMI
 ;
syntax Id
        = CONSTID
        | VARID
 ;
syntax Declaration
        = Constant_declaration
        | Variable_declaration
        | Procedure_declaration
 ;
syntax Constant_declaration
        = 
        CONST CONSTID COLON Type ASSIGN Expression SEMI
 ;
syntax Variable_declaration
        = 
        VAR Id COLON Type SEMI
 ;
syntax Procedure_declaration
        = 
        PROC Id LPAREN Param_list RPAREN COLON Type ASSIGN Statement SEMI
 ;
syntax Param_list
        = 
        (Id COLON Type (COMMA Id COLON Type)*)?
 ;
syntax Type
        = INT
        | DOUBLE
 ;
syntax Term
        = INT_NUMBER
        | DOUBLE_NUMBER
        | LPAREN Expression RPAREN
        | Id
        | Proc
 ;
syntax Proc
        = 
        Id LPAREN {Term COMMA}* RPAREN
 ;
syntax Unary
        = 
        Negation* Term
 ;
syntax Negation
        = 
        SUBTRACTION
 ;
syntax Expon
        = 
        Unary (EXPONENTIATION Unary)*
 ;
syntax Mult
        = 
        Expon ((MULTIPLICATION | DIVISION) Expon)*
 ;
syntax Add
        = 
        Mult ((ADDITION | SUBTRACTION) Mult)*
 ;
syntax Relational
        = 
        Add (Relational_op Add)*
 ;
syntax Conjunction
        = 
        Relational (CONJUNCTION Relational)*
 ;
syntax Disjunction
        = 
        Conjunction (DISJUNCTION Conjunction)*
 ;
syntax Expression
        = 
        Disjunction (MIXFIX Expression COLON Expression)?
 ;
syntax Relational_op
        = EQUAL
        | NONEQUAL
        | GREATER
        | GREATER_EQUAL
        | LESS
        | LESS_EQUAL
 ;
syntax Statement
        = Single_statement
        | Multiple_statement
 ;
syntax Single_statement
        = SKIP
        | Assignment
        | Conditional
        | Loop
 ;
syntax Assignment
        = 
        Id ASSIGN Expression
 ;
syntax Conditional
        = 
        IF Expression THEN Statement ELSE Statement
 ;
syntax Loop
        = 
        WHILE Expression DO Statement
 ;
syntax Multiple_statement
        = 
        LBRACE Single_statement (SEMI Single_statement)* RBRACE
 ;
syntax SEMI
        = 
        ";"
 ;
syntax COLON
        = 
        ":"
 ;
syntax ASSIGN
        = 
        ":="
 ;
syntax LPAREN
        = 
        "("
 ;
syntax RPAREN
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
syntax MULTIPLICATION
        = 
        "*"
 ;
syntax EXPONENTIATION
        = 
        "**"
 ;
syntax EQUAL
        = 
        "=="
 ;
syntax NONEQUAL
        = 
        "!="
 ;
syntax GREATER
        = 
        "\>"
 ;
syntax GREATER_EQUAL
        = 
        "\>="
 ;
syntax LESS
        = 
        "\<"
 ;
syntax LESS_EQUAL
        = 
        "\<="
 ;
syntax CONJUNCTION
        = 
        "/\\\\"
 ;
syntax DISJUNCTION
        = 
        "\\\\/"
 ;
syntax MIXFIX
        = 
        "?"
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
syntax VAR
        = 
        "var"
 ;
syntax CONST
        = 
        "const"
 ;
syntax PROC
        = 
        "proc"
 ;
syntax INT
        = 
        "int"
 ;
syntax DOUBLE
        = 
        "double"
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
syntax CONSTID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax VARID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax NEWLINE
        = 
        "\\r"? "\\n"
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax INT_NUMBER
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE_NUMBER
        = 
        (("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+)? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+? (("e" | "E") ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+)?
 ;
