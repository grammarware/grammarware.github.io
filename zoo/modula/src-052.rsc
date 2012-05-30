@contributor{bgf2src automated exporter - SLPS}
module Src_052

syntax Compilation
        = 
        "UNSAFE"? (Interface | Module)
 ;
syntax Interface
        = 
        "INTERFACE" Ident ";" Import* Declaration* "END" Ident "."
 ;
syntax Module
        = 
        "MODULE" Ident ("EXPORTS" IDList)? ";" Import* Block Ident "."
 ;
syntax Import
        = 
        ("FROM" Ident)? "IMPORT" IDList ";"
 ;
syntax Block
        = 
        Declaration* "BEGIN" Stmts "END"
 ;
syntax Declaration
        = "CONST" (ConstDecl ";")*
        | "TYPE" (TypeDecl ";")*
        | "EXCEPTION" (ExceptionDecl ";")*
        | "VAR" (VariableDecl ";")*
        | ProcedureHead ("=" Block Ident)? ";"
        | "REVEAL" (TypeID ("=" | "\<:") Type ";")*
 ;
syntax ConstDecl
        = 
        Ident (":" Type)? "=" ConstExpr
 ;
syntax TypeDecl
        = 
        Ident ("=" | "\<:") Type
 ;
syntax ExceptionDecl
        = 
        Ident ("(" Type ")")?
 ;
syntax VariableDecl
        = 
        IDList ":" Type "&" ":=" Expr
 ;
syntax ProcedureHead
        = 
        "PROCEDURE" Ident Signature
 ;
syntax Signature
        = 
        "(" Formals ")" (":" Type)? ("RAISES" Raises)?
 ;
syntax Formals
        = 
        {Formal ";"}*
 ;
syntax Formal
        = 
        ("VALUE" | "VAR" | "READONLY")? IDList ":" Type "&" ":=" ConstExpr
 ;
syntax Raises
        = 
        "{" {ExceptionID ","}* "}"
 ;
syntax Stmts
        = 
        {Stmt ";"}*
 ;
syntax Stmt
        = AssignStmt
        | Block
        | CallStmt
        | CaseStmt
        | ExitStmt
        | EvalStmt
        | ForStmt
        | IfStmt
        | LockStmt
        | LoopStmt
        | RaiseStmt
        | RepeatStmt
        | ReturnStmt
        | TryFinStmt
        | TryXptStmt
        | TCaseStmt
        | WhileStmt
        | WithStmt
 ;
syntax AssignStmt
        = 
        Expr ":=" Expr
 ;
syntax CallStmt
        = 
        Expr "(" {Actual ","}* ")"
 ;
syntax CaseStmt
        = 
        "CASE" Expr "OF" Case? ("|" Case)* ("ELSE" Stmts)? "END"
 ;
syntax ExitStmt
        = 
        "EXIT"
 ;
syntax EvalStmt
        = 
        "EVAL" Expr
 ;
syntax ForStmt
        = 
        "FOR" Ident ":=" Expt "TO" Expr ("BY" Expr)? "DO" Stmts "END"
 ;
syntax IfStmt
        = 
        "IF" Expr "THEN" Stmts ("ELSIF" Expt "THEN" Stmts)* ("ELSE" Stmts)? "END"
 ;
syntax LockStmt
        = 
        "LOCK" Expr "DO" Stmts "END"
 ;
syntax LoopStmt
        = 
        "LOOP" Stmts "END"
 ;
syntax RaiseStmt
        = 
        "RAISE" ExceptionID ("(" Expr ")")?
 ;
syntax Repeatstmt
        = 
        "REPEAT" Stmts "UNTIL" Expr
 ;
syntax ReturnStmt
        = 
        "RETURN" Expr?
 ;
syntax TCaseStmt
        = 
        "TYPECASE" Expr "OF" Tcase? ("|" Tcase)* ("ELSE" Stmts)? "END"
 ;
syntax TryXptStmt
        = 
        "TRY" Stmts "EXCEPT" Handler? ("|" Handler)* ("ELSE" Stmts)? "END"
 ;
syntax TryFinStmt
        = 
        "TRY" Stmts "FINALLY" Stmts "END"
 ;
syntax WhileStmt
        = 
        "WHILE" Expt "DO" Stmts "END"
 ;
syntax WithStmt
        = 
        "WITH" Binding ("," Binding)* "DO" Stmts "END"
 ;
syntax Case
        = 
        Labels ("," Labels)* "=\>" Stmts
 ;
syntax Labels
        = 
        ConstExpr (".." ConstExpr)?
 ;
syntax Handler
        = 
        ExceptionID ("," ExceptionID)* ("(" Ident ")")? "=\>" Stmts
 ;
syntax Tcase
        = 
        Type ("," Type)* ("(" Ident ")")? "=\>" Stmts
 ;
syntax Binding
        = 
        Ident "=" Expr
 ;
syntax Actual
        = (Ident ":=")? Expr
        | Type
 ;
syntax Type
        = TypeName
        | ArrayType
        | PackedType
        | EnumType
        | ObjectType
        | ProcedureType
        | RecordType
        | RefType
        | SetType
        | SubrangeType
        | "(" Type ")"
 ;
syntax ArrayType
        = 
        "ARRAY" {Type ","}* "OF" Type
 ;
syntax PackedType
        = 
        "BITS" ConstExpr "FOR" Type
 ;
syntax EnumType
        = 
        "{" IDList? "}"
 ;
syntax ObjectType
        = 
        Ancestor? Brand? "OBJECT" Fields ("METHODS" Methods)? "END"
 ;
syntax ProcedureType
        = 
        "PROCEDURE" Signature
 ;
syntax RecordType
        = 
        "RECORD" Fields "END"
 ;
syntax RefType
        = 
        "UNTRACED"? Brand? "REF" Type
 ;
syntax SetType
        = 
        "SET" "OF" Type
 ;
syntax SubrangeType
        = 
        "[" ConstExpr ".." ConstExpr "]"
 ;
syntax Ancestor
        = TypeName
        | ObjectType
        | "UNTRACED"
 ;
syntax Brand
        = 
        "BRANDED" TextLiteral?
 ;
syntax Fields
        = 
        {Field ";"}*
 ;
syntax Field
        = 
        IDList ":" Type "&" ":=" ConstExpr
 ;
syntax Methods
        = 
        {Method ";"}*
 ;
syntax Method
        = 
        Ident Signature "&" ":=" ProcedureID
 ;
syntax ConstExpr
        = 
        Expr
 ;
syntax Expr
        = 
        E1 ("OR" E1)*
 ;
syntax E1
        = 
        E2 ("AND" E2)*
 ;
syntax E2
        = 
        "NOT"* E3
 ;
syntax E3
        = 
        E4 (Relop E4)*
 ;
syntax E4
        = 
        E5 (Addop E5)*
 ;
syntax E5
        = 
        E6 (Mulop E6)*
 ;
syntax E6
        = 
        ("+" | "-")* E7
 ;
syntax E7
        = 
        E8 Selector*
 ;
syntax E8
        = Ident
        | Number
        | CharLiteral
        | TextLiteral
        | Constructor
        | "(" Expr ")"
 ;
syntax Relop
        = "="
        | "#"
        | "\<"
        | "\<="
        | "\>"
        | "\>="
        | "IN"
 ;
syntax Addop
        = "+"
        | "-"
        | "&"
 ;
syntax Mulop
        = "*"
        | "/"
        | "DIV"
        | "MOD"
 ;
syntax Selector
        = "^"
        | "." Ident
        | "[" Expr ("," Expr)* "]"
        | "(" {Actual ","}* ")"
 ;
syntax Constructor
        = 
        Type "{" (SetCons | RecordCons | ArrayCons)? "}"
 ;
syntax SetCons
        = 
        SetElt ("." SetElt)*
 ;
syntax SetElt
        = 
        Expr (".." Expr)?
 ;
syntax RecordCons
        = 
        RecordElt ("," RecordElt)*
 ;
syntax RecordElt
        = 
        (Ident ":=")? Expr
 ;
syntax ArrayCons
        = 
        Expr ("," Expr)* ("," "..")?
 ;
syntax TypeName
        = Ident ("." Ident)?
        | "ROOT"
        | "UNTRACED" "ROOT"
 ;
syntax ExceptionID
        = 
        Ident ("." Ident)?
 ;
syntax ProcedureID
        = 
        Ident ("." Ident)?
 ;
syntax IDList
        = 
        Ident ("," Ident)*
 ;
syntax Literal
        = Number
        | CharLiteral
        | TextLiteral
 ;
syntax Ident
        = 
        Letter (Letter | Digit | "_")*
 ;
syntax Operator
        = "+"
        | "-"
        | "*"
        | "/"
        | "."
        | "^"
        | ":" "="
        | "="
        | "$"
        | "\<"
        | "\<" "="
        | "\>" "="
        | "\>"
        | "&"
        | "\<" ":"
        | "=" "\>"
        | ","
        | ";"
        | "|"
        | ":"
        | "." "."
        | "("
        | ")"
        | "{"
        | "}"
        | "["
        | "]"
 ;
syntax CharLiteral
        = 
        "’" (PrintingChar | Escape) "’"
 ;
syntax TextLiteral
        = 
        "\"" (PrintingChar | Escape)* "\""
 ;
syntax Escape
        = "\\" "n"
        | "\\" "t"
        | "\\" "r"
        | "\\" "f"
        | "\\" "\\"
        | "\\" "’"
        | "\\" "\""
        | "\\" OctalDigit OctalDigit OctalDigit
 ;
syntax Number
        = Digit+
        | Digit+ "_" HexDigit+
        | Digit+ "." Digit+ Exponent?
 ;
syntax Exponent
        = 
        ("E" | "e" | "D" | "d") ("+" | "-")? Digit+
 ;
syntax PrintingChar
        = Letter
        | Digit
        | UtherChar
 ;
syntax HexDigit
        = Digit
        | "A"
        | "B"
        | "C"
        | "D"
        | "E"
        | "F"
        | "a"
        | "b"
        | "c"
        | "d"
        | "e"
        | "f"
 ;
syntax Digit
        = "0"
        | "1"
        | "2"
        | "3"
        | "4"
        | "5"
        | "6"
        | "7"
        | "8"
        | "9"
 ;
syntax OctalDigit
        = "0"
        | "1"
        | "2"
        | "3"
        | "4"
        | "5"
        | "6"
        | "7"
 ;
syntax Letter
        = "A"
        | "B"
        | "C"
        | "D"
        | "E"
        | "F"
        | "G"
        | "H"
        | "I"
        | "J"
        | "K"
        | "L"
        | "M"
        | "N"
        | "O"
        | "P"
        | "Q"
        | "R"
        | "S"
        | "T"
        | "U"
        | "V"
        | "W"
        | "X"
        | "Y"
        | "Z"
        | "a"
        | "b"
        | "c"
        | "d"
        | "e"
        | "f"
        | "g"
        | "h"
        | "i"
        | "j"
        | "k"
        | "l"
        | "m"
        | "n"
        | "o"
        | "p"
        | "q"
        | "r"
        | "s"
        | "t"
        | "u"
        | "v"
        | "w"
        | "x"
        | "y"
        | "z"
 ;
syntax OtherChar
        = " "
        | "!"
        | "#"
        | "$"
        | "%"
        | "&"
        | "("
        | ")"
        | "*"
        | "+"
        | ","
        | "-"
        | "."
        | "/"
        | ":"
        | ";"
        | "\<"
        | "="
        | "\>"
        | "?"
        | "@"
        | "["
        | "]"
        | "^"
        | "_"
        | "‘"
        | "{"
        | "|"
        | "}"
        | "~"
        | ExtendedChar
 ;
syntax ExtendedChar
        = " "
        | "¡"
        | "¢"
        | "£"
        | "¤"
        | "¥"
        | "¦"
        | "§"
        | "¨"
        | "©"
        | "ª"
        | "«"
        | "¬"
        | "­"
        | "®"
        | "¯"
        | "°"
        | "±"
        | "²"
        | "³"
        | "´"
        | "µ"
        | "¶"
        | "·"
        | "¸"
        | "¹"
        | "º"
        | "»"
        | "¼"
        | "½"
        | "¾"
        | "¿"
        | "À"
        | "Á"
        | "Â"
        | "Ã"
        | "Ä"
        | "Å"
        | "Æ"
        | "Ç"
        | "È"
        | "É"
        | "Ê"
        | "Ë"
        | "Ì"
        | "Í"
        | "Î"
        | "Ï"
        | "Ð"
        | "Ñ"
        | "Ò"
        | "Ó"
        | "Ô"
        | "Õ"
        | "Ö"
        | "×"
        | "Ø"
        | "Ù"
        | "Ú"
        | "Û"
        | "Ü"
        | "Ý"
        | "Þ"
        | "ß"
        | "à"
        | "á"
        | "â"
        | "ã"
        | "ä"
        | "å"
        | "æ"
        | "ç"
        | "è"
        | "é"
        | "ê"
        | "ë"
        | "ì"
        | "í"
        | "î"
        | "ï"
        | "ð"
        | "ñ"
        | "ò"
        | "ó"
        | "ô"
        | "õ"
        | "ö"
        | "÷"
        | "ø"
        | "ù"
        | "ú"
        | "û"
        | "ü"
        | "ý"
        | "þ"
        | "ÿ"
 ;
