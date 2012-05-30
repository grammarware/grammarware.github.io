@contributor{bgf2src automated exporter - SLPS}
module 11000

syntax Program
        = 
        Trolley Checkout Done
 ;
syntax Trolley
        = 
        TROLLEY CID CONTAINS Declarations*
 ;
syntax Checkout
        = 
        CHECKOUT Statements
 ;
syntax Done
        = 
        DONE SEMI
 ;
syntax Declarations
        = Constant
        | Variable
        | Procedure
 ;
syntax Constant
        = 
        CONSTANT CID COLON (INTEGER | DOUBLE) DEFINE Expression SEMI
 ;
syntax Variable
        = 
        VARIABLE (ID | CID) COLON (INTEGER | DOUBLE) SEMI
 ;
syntax Procedure
        = 
        PROCEDURE (ID | CID) LEFTBRACKET Parameters RIGHTBRACKET COLON Numbervalues DEFINE Statements
 ;
syntax Parameters
        = 
        {Parameter COMMA}*
 ;
syntax Parameter
        = 
        (ID | CONSTANT) COLON Numbervalues
 ;
syntax Statements
        = 
        (Statement | (CURLYLEFT Statement Statement* CURLYRIGHT)) SEMI
 ;
syntax Statement
        = 
        (Ifstatement | Whilestatement | Skip | Assignment) SEMI
 ;
syntax Ifstatement
        = 
        IF LEFTBRACKET Expression RIGHTBRACKET THEN Statements ELSE Statements
 ;
syntax Whilestatement
        = 
        WHILE Expression DO Statements
 ;
syntax Skip
        = 
        SKIP
 ;
syntax Assignment
        = 
        (ID | CID) DEFINE Expression
 ;
syntax Atom
        = INT
        | DOU
        | ID
        | CID
        | LEFTBRACKET Expression RIGHTBRACKET
 ;
syntax Expo
        = 
        Atom (EXPONENTIATION Atom)?
 ;
syntax Negation
        = 
        (ADDITION | SUBTRACTION)? Expo
 ;
syntax Divide
        = 
        Negation (DIVISION Negation)?
 ;
syntax Multiply
        = 
        Divide (MULTIPLICATION Divide)*
 ;
syntax Addition
        = 
        Multiply (ADDITION Multiply)*
 ;
syntax Subtraction
        = 
        Addition (SUBTRACTION Addition)*
 ;
syntax Booleanop
        = 
        Subtraction (Relationships Subtraction)?
 ;
syntax Conjunction
        = 
        Booleanop (AND Booleanop)*
 ;
syntax Disjunction
        = 
        Conjunction (OR Conjunction)*
 ;
syntax Conditexpr
        = 
        Disjunction (QUESTION Disjunction COLON Disjunction)*
 ;
syntax Runproc
        = Conditexpr
        | (ID | CID) LEFTBRACKET {Expression COMMA}* RIGHTBRACKET
 ;
syntax Expression
        = 
        Runproc
 ;
syntax Numbervalues
        = INTEGER
        | DOUBLE
 ;
syntax INT
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOU
        = 
        INT? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* EXPONENT?
 ;
syntax EXPONENT
        = 
        ("e" | "E") ("+" | "-") INT
 ;
syntax Relationships
        = EQUALITY
        | NONEQUALITY
        | GREATERTHAN
        | LESSTHAN
        | GREATEROREQUAL
        | LESSOREQUAL
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
syntax INTEGER
        = 
        "int"
 ;
syntax DOUBLE
        = 
        "double"
 ;
syntax LEFTBRACKET
        = 
        "("
 ;
syntax RIGHTBRACKET
        = 
        ")"
 ;
syntax SEMI
        = 
        ";"
 ;
syntax CURLYLEFT
        = 
        "{"
 ;
syntax CURLYRIGHT
        = 
        "}"
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax COLON
        = 
        ":"
 ;
syntax DEFINE
        = 
        ":="
 ;
syntax COMMA
        = 
        ","
 ;
syntax IF
        = 
        "if"
 ;
syntax WHILE
        = 
        "while"
 ;
syntax DO
        = 
        "do"
 ;
syntax THEN
        = 
        "then"
 ;
syntax ELSE
        = 
        "else"
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
        "\\\\"
 ;
syntax MULTIPLICATION
        = 
        "*"
 ;
syntax EXPONENTIATION
        = 
        "**"
 ;
syntax OR
        = 
        "\\\\/"
 ;
syntax AND
        = 
        "/\\\\"
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NONEQUALITY
        = 
        "!="
 ;
syntax GREATERTHAN
        = 
        "\>"
 ;
syntax LESSTHAN
        = 
        "\<"
 ;
syntax GREATEROREQUAL
        = 
        "\>="
 ;
syntax LESSOREQUAL
        = 
        "\<="
 ;
syntax CID
        = 
        ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "_") ("A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax ID
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "_") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "_")*
 ;
syntax WS
        = 
        (" " | "\\t" | "\\r" | "\\n")+
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
