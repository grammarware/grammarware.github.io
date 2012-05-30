@contributor{bgf2src automated exporter - SLPS}
module 01011

syntax Program
        = 
        TROLLEY ID CONTAINS (Constant | Variable | Proceduredecl)+ CHECKOUT Statement+ DONE SEMI EOF
 ;
syntax Constant
        = 
        "const" ID COLON (INT | DOUBLE) ASSIGN Expression SEMI
 ;
syntax Variable
        = 
        "var" ID COLON (INT | DOUBLE) SEMI
 ;
syntax Proceduredecl
        = 
        "proc" ID LBRACK Parameter (COMMA Parameter)* RBRACK COLON (INT | DOUBLE) ASSIGN Statement
 ;
syntax Parameter
        = 
        ID COLON (INT | DOUBLE)
 ;
syntax Term
        = Procedureapp
        | ID
        | "(" Expression ")"
        | INUMB
        | DNUMB
 ;
syntax Unary
        = 
        (PLUS | Negation)* Term
 ;
syntax Negation
        = 
        "-"
 ;
syntax Mult
        = 
        Unary ((MULTI | DIVIS | EXPO) Unary)*
 ;
syntax Addition
        = 
        Mult ((PLUS | MINUS) Mult)*
 ;
syntax Relation
        = 
        Addition ((EQUALITY | LTHAN | MTHAN | NOTEQUAL | LEQUAL | MEQUAL) Addition)*
 ;
syntax Conj
        = 
        Relation (CONJ Relation)*
 ;
syntax Disj
        = 
        Conj (DISJ Relation)*
 ;
syntax Expression
        = 
        Disj ("\\?" Disj COLON Disj)?
 ;
syntax Procedureapp
        = 
        ID "(" {Expression COMMA}* ")" SEMI?
 ;
syntax Statement
        = LBRACE Statement+ RBRACE SEMI
        | Skip
        | Assignment
        | Conditional
        | Loop
        | Procedureapp
        | Ret
 ;
syntax Skip
        = 
        "skip" SEMI
 ;
syntax Assignment
        = 
        ID ASSIGN Expression SEMI
 ;
syntax Ret
        = 
        "currentProc" ASSIGN Expression SEMI
 ;
syntax Conditional
        = 
        IF Expression THEN Statement+ (ELSE Statement+)?
 ;
syntax Loop
        = 
        WHILE Expression DO Statement+
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
syntax LBRACK
        = 
        "("
 ;
syntax RBRACK
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
syntax PLUS
        = 
        "+"
 ;
syntax MINUS
        = 
        "-"
 ;
syntax COMMA
        = 
        ","
 ;
syntax DIVIS
        = 
        "/"
 ;
syntax MULTI
        = 
        "*"
 ;
syntax EXPO
        = 
        "**"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax LTHAN
        = 
        "\<"
 ;
syntax MTHAN
        = 
        "\>"
 ;
syntax NOTEQUAL
        = 
        "!="
 ;
syntax LEQUAL
        = 
        "\<="
 ;
syntax MEQUAL
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
syntax CONSTANT
        = 
        "const"
 ;
syntax VARIABLE
        = 
        "var"
 ;
syntax PROCEDURE
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
syntax INUMB
        = 
        ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*
 ;
syntax DNUMB
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* ("e" ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*)?
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax EOF
        = 
        ()
 ;
