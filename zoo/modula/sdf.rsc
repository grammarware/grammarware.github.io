@contributor{bgf2src automated exporter - SLPS}
module Sdf

syntax Compilation
        = 
        "UNSAFE"? (Interface | Module | GenInf | GenMod)
 ;
syntax Interface
        = "INTERFACE" Id ";" Import* Decl* "END" Id "."
        | "INTERFACE" Id "=" Id GenActls "END" Id "."
 ;
syntax Id
        = "NOT"
        | "ROOT"
 ;
syntax Import
        = AsImport
        | FromImport
 ;
syntax AsImport
        = 
        "IMPORT" ImportItem ("," ImportItem)* ";"
 ;
syntax ImportItem
        = Id
        | Id "AS" Id
 ;
syntax FromImport
        = 
        "FROM" Id "IMPORT" IdList ";"
 ;
syntax IdList
        = 
        Id ("," Id)*
 ;
syntax Decl
        = "CONST" (ConstDecl ";")*
        | "TYPE" (TypeDecl ";")*
        | "EXCEPTION" (ExceptionDecl ";")*
        | "VAR" (VariableDecl ";")*
        | ProcedureHead ("=" Block Id)? ";"
        | "REVEAL" (QualId ("=" | "\<:") Type ";")*
 ;
syntax ConstDecl
        = 
        Id (":" Type)? "=" Expr
 ;
syntax Type
        = TypeLiteral
        | QualId
 ;
syntax TypeLiteral
        = ArrayType
        | PackedType
        | EnumType
        | ObjectType
        | ProcedureType
        | RecordType
        | RefType
        | SetType
        | SubrangeType
        | "(" Type ")"
        | TypeName
 ;
syntax ArrayType
        = 
        "ARRAY" {Type ","}* "OF" Type
 ;
syntax PackedType
        = 
        "BITS" Expr "FOR" Type
 ;
syntax Expr
        = Expr "OR" Expr
        | Expr "AND" Expr
        | "NOT" Expr
        | Expr Relop Expr
        | Expr Addop Expr
        | Expr Mulop Expr
        | "+" Expr
        | "-" Expr
        | Expr Selector
        | Id
        | Literal
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
        | "." Id
        | "[" Expr ("," Expr)* "]"
        | "(" {Actual ","}* ")"
 ;
syntax Actual
        = TypeLiteral
        | (Id ":=")? Expr
 ;
syntax Constructor
        = 
        Type "{" AnyCons? "}"
 ;
syntax AnyCons
        = 
        Elt ("," Elt)* ("," "..")?
 ;
syntax Elt
        = Expr ".." Expr
        | Expr
        | Id ":=" Expr
 ;
syntax EnumType
        = 
        "{" IdList? "}"
 ;
syntax ObjectType
        = 
        Ancestor? Brand? "OBJECT" Fields ("METHODS" Methods)? ("OVERRIDES" Overrides)? "END"
 ;
syntax Ancestor
        = TypeName
        | ObjectType
        | QualId
 ;
syntax TypeName
        = "ROOT"
        | "UNTRACED" "ROOT"
 ;
syntax QualId
        = 
        Id ("." Id)?
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
        = IdList ":" Type ":=" Expr
        | IdList ":" Type
        | IdList ":=" Expr
 ;
syntax Methods
        = 
        {Method ";"}*
 ;
syntax Method
        = 
        Id Signature (":=" Expr)?
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
        = Mode? IdList ":" Type ":=" Expr
        | Mode? IdList ":" Type
        | Mode? IdList ":=" Expr
 ;
syntax Mode
        = "VALUE"
        | "VAR"
        | "READONLY"
 ;
syntax Raises
        = "{" {QualId ","}* "}"
        | "ANY"
 ;
syntax Overrides
        = 
        {Override ";"}*
 ;
syntax Override
        = 
        Id ":=" Expr
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
        "[" Expr ".." Expr "]"
 ;
syntax TypeDecl
        = 
        Id ("=" | "\<:") Type
 ;
syntax ExceptionDecl
        = 
        Id ("(" Type ")")?
 ;
syntax VariableDecl
        = IdList ":" Type ":=" Expr
        | IdList ":" Type
        | IdList ":=" Expr
 ;
syntax ProcedureHead
        = 
        "PROCEDURE" Id Signature
 ;
syntax Block
        = 
        Decl* "BEGIN" Stmts "END"
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
        "CASE" Expr "OF" "|"? Case ("|" Case)* ("ELSE" Stmts)? "END"
 ;
syntax Case
        = 
        Label ("," Label)* "=\>" Stmts
 ;
syntax Label
        = 
        Expr (".." Expr)?
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
        "FOR" Id ":=" Expr "TO" Expr ("BY" Expr)? "DO" Stmts "END"
 ;
syntax IfStmt
        = 
        "IF" Expr "THEN" Stmts ("ELSIF" Expr "THEN" Stmts)* ("ELSE" Stmts)? "END"
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
        "RAISE" QualId ("(" Expr ")")?
 ;
syntax RepeatStmt
        = 
        "REPEAT" Stmts "UNTIL" Expr
 ;
syntax ReturnStmt
        = 
        "RETURN" Expr?
 ;
syntax TryFinStmt
        = 
        "TRY" Stmts "FINALLY" Stmts "END"
 ;
syntax TryXptStmt
        = 
        "TRY" Stmts "EXCEPT" "|"? Handler ("|" Handler)* ("ELSE" Stmts)? "END"
 ;
syntax Handler
        = 
        QualId ("," QualId)* ("(" Id ")")? "=\>" Stmts
 ;
syntax TCaseStmt
        = 
        "TYPECASE" Expr "OF" "|"? TCase ("|" TCase)* ("ELSE" Stmts)? "END"
 ;
syntax TCase
        = 
        Type ("," Type)* ("(" Id ")")? "=\>" Stmts
 ;
syntax WhileStmt
        = 
        "WHILE" Expr "DO" Stmts "END"
 ;
syntax WithStmt
        = 
        "WITH" Binding ("," Binding)* "DO" Stmts "END"
 ;
syntax Binding
        = 
        Id "=" Expr
 ;
syntax GenActls
        = 
        "(" IdList? ")"
 ;
syntax Module
        = "MODULE" Id ("EXPORTS" IdList)? ";" Import* Block Id "."
        | "MODULE" Id ("EXPORTS" IdList)? "=" Id GenActls "END" Id "."
 ;
syntax GenInf
        = 
        "GENERIC" "INTERFACE" Id GenFmls ";" Import* Decl* "END" Id "."
 ;
syntax GenFmls
        = 
        "(" IdList? ")"
 ;
syntax GenMod
        = 
        "GENERIC" "MODULE" Id GenFmls ";" Import* Block Id "."
 ;
