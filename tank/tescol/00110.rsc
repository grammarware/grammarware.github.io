@contributor{bgf2src automated exporter - SLPS}
module 00110

syntax Program
        = 
        TROLLEY CONST_ID CONTAINS Declarations* CHECKOUT Statement* SEMI DONE SEMI
 ;
syntax Term
        = LEFT_PAREN Expression RIGHT_PAREN
        | ProcedureApplication
        | VAR_ID v2
        | CONST_ID
        | INTEGER
        | DOUBLE
 ;
syntax Unary
        = 
        (PLUS | MINUS)* Term
 ;
syntax Mult
        = 
        Unary ((MULT | DIV | EXPON) Unary)*
 ;
syntax Add
        = 
        Mult ((PLUS | MINUS) Mult)*
 ;
syntax CondExpr
        = 
        Add (Q_MARK Add COLON Add)?
 ;
syntax Relational
        = 
        CondExpr ((EQUALITY | NOT_EQUAL | LESS_THAN | LESS_THAN_OR_EQUAL | GREATER_THAN | GREATER_THAN_OR_EQUAL) CondExpr)*
 ;
syntax Conjunction
        = 
        Relational (CONJ Relational)*
 ;
syntax Expression
        = 
        Conjunction (DISJUNCT Conjunction)*
 ;
syntax ProcedureApplication
        = 
        VAR_ID LEFT_PAREN ProcedureParams p RIGHT_PAREN
 ;
syntax ProcedureParams
        = 
        Expression (COMMA Expression)*
 ;
syntax Declarations
        = ConstantDeclaration
        | VariableDeclaration
        | ProcedureDeclaration
 ;
syntax ConstantDeclaration
        = 
        CONST CONST_ID COLON TYPE DEFINE_AS Add SEMI
 ;
syntax VariableDeclaration
        = 
        VAR VAR_ID COLON TYPE SEMI
 ;
syntax ProcedureDeclaration
        = 
        PROC VAR_ID LEFT_PAREN Parameters RIGHT_PAREN COLON TYPE DEFINE_AS Statement
 ;
syntax Parameters
        = 
        Parameter (COMMA Parameter)*
 ;
syntax Parameter
        = 
        VAR_ID COLON TYPE
 ;
syntax Statement
        = AssignmentStatement
        | WhileStatement
        | IfStatement
        | SkipStatement
        | LEFT_BRACKET (AssignmentStatement | WhileStatement | IfStatement | SkipStatement)+ RIGHT_BRACKET
 ;
syntax AssignmentStatement
        = 
        VAR_ID DEFINE_AS Expression SEMI
 ;
syntax SkipStatement
        = 
        SKIP SEMI
 ;
syntax WhileStatement
        = 
        WHILE Expression DO Statement
 ;
syntax IfStatement
        = 
        IF Expression THEN Statement s1 ELSE Statement s2
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
syntax DEFINE_AS
        = 
        ":="
 ;
syntax EQUAL
        = 
        "="
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
syntax EXPON
        = 
        "**"
 ;
syntax VAR
        = 
        "var"
 ;
syntax PROC
        = 
        "proc"
 ;
syntax CONST
        = 
        "const"
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
syntax EXPR
        = 
        "expr"
 ;
syntax COND
        = 
        "cond"
 ;
syntax IFELSE
        = 
        "ifelse"
 ;
syntax PARAM
        = 
        "param"
 ;
syntax TESCO
        = 
        "tesco"
 ;
syntax VARDECL
        = 
        "vardecl"
 ;
syntax CONSTDECL
        = 
        "constdecl"
 ;
syntax PROCDECL
        = 
        "procdecl"
 ;
syntax BODY
        = 
        "body"
 ;
syntax PROCAPP
        = 
        "procApp"
 ;
syntax LEFT_PAREN
        = 
        "("
 ;
syntax RIGHT_PAREN
        = 
        ")"
 ;
syntax LEFT_BRACKET
        = 
        "{"
 ;
syntax RIGHT_BRACKET
        = 
        "}"
 ;
syntax TYPE
        = "int"
        | "double"
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
        = " "
        | "\\t"
        | "\\f"
        | "\\r\\n"
        | "\\r"
        | "\\n"
 ;
syntax COMMENT
        = 
        "/*" ANY* "*/"
 ;
syntax INTEGER
        = 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax DOUBLE
        = 
        INTEGER? "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* (("e" | "E") INTEGER)?
 ;
syntax EQUALITY
        = 
        "=="
 ;
syntax NOT_EQUAL
        = 
        "!="
 ;
syntax LESS_THAN
        = 
        "\<"
 ;
syntax LESS_THAN_OR_EQUAL
        = 
        "\<="
 ;
syntax GREATER_THAN
        = 
        "\>"
 ;
syntax GREATER_THAN_OR_EQUAL
        = 
        "\>="
 ;
syntax Q_MARK
        = 
        "?"
 ;
syntax CONJ
        = 
        "/\\\\"
 ;
syntax DISJUNCT
        = 
        "\\\\/"
 ;
