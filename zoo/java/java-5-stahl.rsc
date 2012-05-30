@contributor{bgf2src automated exporter - SLPS}
module Java_5_stahl

syntax CompilationUnit
        = 
        (PackageDefinition | ()) ImportDefinition* TypeDefinition*
 ;
syntax PackageDefinition
        = 
        Annotations "package" p Identifier SEMI
 ;
syntax Annotations
        = 
        Annotation*
 ;
syntax Annotation
        = 
        AT Identifier AnnotationInit
 ;
syntax AT
        = 
        "@"
 ;
syntax Identifier
        = 
        IDENT (DOT IDENT)*
 ;
syntax IDENT
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "_" | "$") ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "_" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "$")*
 ;
syntax DOT
        = 
        "."
 ;
syntax AnnotationInit
        = LPAREN lp ((AnnotationMemberInit (COMMA AnnotationMemberInit)*) | AnnotationMemberValue | ()) RPAREN
        | ()
 ;
syntax LPAREN
        = 
        "("
 ;
syntax AnnotationMemberInit
        = 
        IDENT ASSIGN AnnotationMemberValue
 ;
syntax ASSIGN
        = 
        "="
 ;
syntax AnnotationMemberValue
        = Annotation
        | ConditionalExpression
        | AnnotationMemberArrayInitializer
 ;
syntax ConditionalExpression
        = 
        LogicalOrExpression (QUESTION AssignmentExpression COLON ConditionalExpression)?
 ;
syntax LogicalOrExpression
        = 
        LogicalAndExpression (LOR LogicalAndExpression)*
 ;
syntax LogicalAndExpression
        = 
        InclusiveOrExpression (LAND InclusiveOrExpression)*
 ;
syntax InclusiveOrExpression
        = 
        ExclusiveOrExpression (BOR ExclusiveOrExpression)*
 ;
syntax ExclusiveOrExpression
        = 
        AndExpression (BXOR AndExpression)*
 ;
syntax AndExpression
        = 
        EqualityExpression (BAND EqualityExpression)*
 ;
syntax EqualityExpression
        = 
        RelationalExpression ((NOT_EQUAL | EQUAL) RelationalExpression)*
 ;
syntax RelationalExpression
        = 
        ShiftExpression (((LT | GT | LE | GE) ShiftExpression)* | ("instanceof" TypeSpec))
 ;
syntax ShiftExpression
        = 
        AdditiveExpression ((SL | SR | BSR) AdditiveExpression)*
 ;
syntax AdditiveExpression
        = 
        MultiplicativeExpression ((PLUS | MINUS) MultiplicativeExpression)*
 ;
syntax MultiplicativeExpression
        = 
        UnaryExpression ((STAR | DIV | MOD) UnaryExpression)*
 ;
syntax UnaryExpression
        = INC UnaryExpression
        | DEC UnaryExpression
        | MINUS UnaryExpression
        | PLUS UnaryExpression
        | UnaryExpressionNotPlusMinus
 ;
syntax INC
        = 
        "++"
 ;
syntax DEC
        = 
        "--"
 ;
syntax MINUS
        = 
        "-"
 ;
syntax PLUS
        = 
        "+"
 ;
syntax UnaryExpressionNotPlusMinus
        = BNOT UnaryExpression
        | LNOT UnaryExpression
        | LPAREN lpb BuiltInTypeSpec RPAREN UnaryExpression
        | LPAREN lp ClassTypeSpec RPAREN UnaryExpressionNotPlusMinus
        | PostfixExpression
 ;
syntax BNOT
        = 
        "~"
 ;
syntax LNOT
        = 
        "!"
 ;
syntax BuiltInTypeSpec
        = 
        BuiltInType (LBRACK lb RBRACK)*
 ;
syntax BuiltInType
        = "void"
        | "boolean"
        | "byte"
        | "char"
        | "short"
        | "int"
        | "float"
        | "long"
        | "double"
 ;
syntax LBRACK
        = 
        "["
 ;
syntax RBRACK
        = 
        "]"
 ;
syntax RPAREN
        = 
        ")"
 ;
syntax ClassTypeSpec
        = 
        ClassOrInterfaceType (LBRACK lb RBRACK)*
 ;
syntax ClassOrInterfaceType
        = 
        IDENT TypeArguments (DOT IDENT TypeArguments)*
 ;
syntax TypeArguments
        = LT lt TypeArgument (COMMA TypeArgument)* TypeArgumentsEnd?
        | ()
 ;
syntax LT
        = 
        "\<"
 ;
syntax TypeArgument
        = QUESTION q (("extends" ReferenceTypeSpec) | ("super" ReferenceTypeSpec))?
        | ReferenceTypeSpec
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax ReferenceTypeSpec
        = ClassTypeSpec
        | ArrayTypeSpec
 ;
syntax ArrayTypeSpec
        = 
        BuiltInType (LBRACK lb RBRACK)+
 ;
syntax COMMA
        = 
        ","
 ;
syntax TypeArgumentsEnd
        = GT
        | SR
        | BSR
 ;
syntax GT
        = 
        "\>"
 ;
syntax SR
        = 
        "\>\>"
 ;
syntax BSR
        = 
        "\>\>\>"
 ;
syntax PostfixExpression
        = 
        PrimaryExpression ((DOT "this") | (DOT TypeArguments ta1 ((IDENT (LPAREN lp ArgList RPAREN)?) | ("super" ((LPAREN lp3 ArgList RPAREN) | (DOT TypeArguments ta2 IDENT (LPAREN lps ArgList RPAREN)?))))) | (DOT NewExpression) | (LBRACK lb Expression RBRACK))* (INC in | DEC de)?
 ;
syntax PrimaryExpression
        = IdentPrimary (DOT "class")?
        | Constant
        | "true"
        | "false"
        | "null"
        | NewExpression
        | "this"
        | "super"
        | LPAREN AssignmentExpression RPAREN
        | BuiltInType (LBRACK lbt RBRACK)* DOT "class"
 ;
syntax IdentPrimary
        = 
        TypeArguments ta1 IDENT ((DOT TypeArguments ta2 IDENT) | ())* ((LPAREN lp ArgList RPAREN) | (LBRACK lbc RBRACK)+)?
 ;
syntax ArgList
        = ExpressionList
        | ()
 ;
syntax ExpressionList
        = 
        Expression (COMMA Expression)*
 ;
syntax Expression
        = 
        AssignmentExpression
 ;
syntax AssignmentExpression
        = 
        ConditionalExpression ((ASSIGN | PLUS_ASSIGN | MINUS_ASSIGN | STAR_ASSIGN | DIV_ASSIGN | MOD_ASSIGN | SR_ASSIGN | BSR_ASSIGN | SL_ASSIGN | BAND_ASSIGN | BXOR_ASSIGN | BOR_ASSIGN) AssignmentExpression)?
 ;
syntax PLUS_ASSIGN
        = 
        "+="
 ;
syntax MINUS_ASSIGN
        = 
        "-="
 ;
syntax STAR_ASSIGN
        = 
        "*="
 ;
syntax DIV_ASSIGN
        = 
        "/="
 ;
syntax MOD_ASSIGN
        = 
        "%="
 ;
syntax SR_ASSIGN
        = 
        "\>\>="
 ;
syntax BSR_ASSIGN
        = 
        "\>\>\>="
 ;
syntax SL_ASSIGN
        = 
        "\<\<="
 ;
syntax BAND_ASSIGN
        = 
        "&="
 ;
syntax BXOR_ASSIGN
        = 
        "^="
 ;
syntax BOR_ASSIGN
        = 
        "|="
 ;
syntax Constant
        = NUM_INT
        | CHAR_LITERAL
        | STRING_LITERAL
        | NUM_FLOAT
        | NUM_LONG
        | NUM_DOUBLE
 ;
syntax NUM_INT
        = "." (("." ".") | (("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ EXPONENT? FLOAT_SUFFIX f1?)?)
        | (("0" ((("x" | "X") HEX_DIGIT+) | ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ | ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")+)?) | (("1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*)) ("l" | "L" | ("." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* EXPONENT? FLOAT_SUFFIX f2?) | (EXPONENT FLOAT_SUFFIX f3?) | FLOAT_SUFFIX f4)?
 ;
syntax EXPONENT
        = 
        ("e" | "E") ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax FLOAT_SUFFIX
        = "f"
        | "F"
        | "d"
        | "D"
 ;
syntax HEX_DIGIT
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
syntax CHAR_LITERAL
        = 
        "\\'" (ESC | String) "\\'"
 ;
syntax ESC
        = 
        "\\\\" ("n" | "r" | "t" | "b" | "f" | "\"" | "\\'" | "\\\\" | ("u"+ HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT) | (("0" | "1" | "2" | "3") (("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")?)?) | (("4" | "5" | "6" | "7") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")?))
 ;
syntax STRING_LITERAL
        = 
        "\"" (ESC | String)* "\""
 ;
syntax NUM_FLOAT
        = "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ EXPONENT? ("f" | "F")
        | "0" ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ ("." | EXPONENT | "f" | "F")
        | ("1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* ((("." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*)? EXPONENT? ("f" | "F")) | EXPONENT)
 ;
syntax NUM_LONG
        = 
        ("1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* ("l" | "L")
 ;
syntax NUM_DOUBLE
        = "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ EXPONENT? ("d" | "D")
        | "0" ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ ("." | EXPONENT | "d" | "D")
        | ("1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* ((("." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*)? EXPONENT? ("d" | "D")) | EXPONENT)
 ;
syntax NewExpression
        = 
        "new" TypeArguments Type ((LPAREN ArgList RPAREN ClassBlock?) | (NewArrayDeclarator ArrayInitializer?))
 ;
syntax Type
        = ClassOrInterfaceType
        | BuiltInType
 ;
syntax ClassBlock
        = 
        LCURLY (ClassField | SEMI)* RCURLY
 ;
syntax LCURLY
        = 
        "{"
 ;
syntax ClassField
        = Modifiers mods (InnerTypeDef it | (TypeParameters tp ((CtorHead h ConstructorBody s) | MemberDef md)))
        | "static" CompoundStatement s3
        | s4: CompoundStatement
 ;
syntax Modifiers
        = 
        (Modifier | Annotation)*
 ;
syntax Modifier
        = "private"
        | "public"
        | "protected"
        | "static"
        | "transient"
        | "final"
        | "abstract"
        | "native"
        | "threadsafe"
        | "synchronized"
        | "volatile"
        | "strictfp"
 ;
syntax InnerTypeDef
        = ed: EnumDefinition
        | cd: ClassDefinition
        | id: InterfaceDefinition
        | ad: AnnotationTypeDefinition
 ;
syntax EnumDefinition
        = 
        ENUM IDENT ImplementsClause ic EnumBlock eb
 ;
syntax ENUM
        = 
        "enum"
 ;
syntax ImplementsClause
        = 
        ("implements" i ClassOrInterfaceType (COMMA ClassOrInterfaceType)*)?
 ;
syntax EnumBlock
        = 
        LCURLY {EnumConst COMMA}* COMMA? (SEMI (ClassField | SEMI)*)? RCURLY
 ;
syntax EnumConst
        = 
        Annotations IDENT EnumConstInit ClassBlock?
 ;
syntax EnumConstInit
        = LPAREN lp ArgList RPAREN
        | ()
 ;
syntax SEMI
        = 
        ";"
 ;
syntax RCURLY
        = 
        "}"
 ;
syntax ClassDefinition
        = 
        "class" IDENT TypeParameters tp SuperClassClause sc ImplementsClause ic ClassBlock cb
 ;
syntax TypeParameters
        = LT lt TypeParameter (COMMA TypeParameter)* TypeArgumentsEnd?
        | ()
 ;
syntax TypeParameter
        = 
        IDENT ("extends" ClassOrInterfaceType (BAND ClassOrInterfaceType)*)?
 ;
syntax BAND
        = 
        "&"
 ;
syntax SuperClassClause
        = 
        ("extends" ClassOrInterfaceType)?
 ;
syntax InterfaceDefinition
        = 
        "interface" IDENT TypeParameters tp InterfaceExtends ie InterfaceBlock ib
 ;
syntax InterfaceExtends
        = 
        ("extends" e ClassOrInterfaceType (COMMA ClassOrInterfaceType)*)?
 ;
syntax InterfaceBlock
        = 
        LCURLY (InterfaceField | SEMI)* RCURLY
 ;
syntax InterfaceField
        = 
        Modifiers mods (InnerTypeDef it | (TypeParameters tp MemberDef md))
 ;
syntax MemberDef
        = 
        TypeSpec t ((IDENT LPAREN ParameterDeclarationList param RPAREN DeclaratorBrackets rt ThrowsClause tc? (SEMI | CompoundStatement s2)) | (VariableDefinitions v SEMI))
 ;
syntax TypeSpec
        = ClassTypeSpec
        | BuiltInTypeSpec
 ;
syntax ParameterDeclarationList
        = 
        {ParameterDeclaration COMMA}*
 ;
syntax ParameterDeclaration
        = 
        ParameterModifier pm TypeSpec t ELLIPSIS el? IDENT id DeclaratorBrackets pd
 ;
syntax ParameterModifier
        = 
        ("final" | Annotation)*
 ;
syntax ELLIPSIS
        = 
        "..."
 ;
syntax DeclaratorBrackets
        = 
        (LBRACK lb RBRACK)*
 ;
syntax ThrowsClause
        = 
        "throws" Identifier (COMMA Identifier)*
 ;
syntax CompoundStatement
        = 
        LCURLY lc Statement* RCURLY
 ;
syntax Statement
        = CompoundStatement
        | Declaration SEMI
        | Expression SEMI
        | Modifiers m (EnumDefinition | ClassDefinition)
        | IDENT COLON c Statement
        | "if" LPAREN Expression RPAREN Statement ("else" Statement)?
        | "for" LPAREN ((ParameterDeclaration COLON Expression) | (ForInit SEMI ForCond SEMI ForIter)) RPAREN Statement
        | "while" LPAREN Expression RPAREN Statement
        | "do" Statement "while" LPAREN Expression RPAREN SEMI
        | "break" IDENT? SEMI
        | "continue" IDENT? SEMI
        | "return" Expression? SEMI
        | "switch" LPAREN Expression RPAREN LCURLY CasesGroup* RCURLY
        | TryBlock
        | "throw" Expression SEMI
        | "synchronized" LPAREN Expression RPAREN CompoundStatement
        | ASSERT Expression (COLON Expression)? SEMI
        | s: SEMI
 ;
syntax Declaration
        = 
        Modifiers m TypeSpec t VariableDefinitions v
 ;
syntax VariableDefinitions
        = 
        VariableDeclarator (COMMA VariableDeclarator)*
 ;
syntax VariableDeclarator
        = 
        IDENT id DeclaratorBrackets d VarInitializer v
 ;
syntax VarInitializer
        = 
        (ASSIGN Initializer)?
 ;
syntax Initializer
        = Expression
        | ArrayInitializer
 ;
syntax ArrayInitializer
        = 
        LCURLY lc {Initializer COMMA}* COMMA? RCURLY
 ;
syntax COLON
        = 
        ":"
 ;
syntax ForInit
        = 
        (Declaration | ExpressionList)?
 ;
syntax ForCond
        = 
        Expression?
 ;
syntax ForIter
        = 
        ExpressionList?
 ;
syntax CasesGroup
        = 
        ACase+ CaseSList
 ;
syntax ACase
        = 
        (("case" Expression) | "default") COLON
 ;
syntax CaseSList
        = 
        Statement*
 ;
syntax TryBlock
        = 
        "try" CompoundStatement Handler* FinallyClause?
 ;
syntax Handler
        = 
        "catch" LPAREN ParameterDeclaration RPAREN CompoundStatement
 ;
syntax FinallyClause
        = 
        "finally" CompoundStatement
 ;
syntax ASSERT
        = 
        "assert"
 ;
syntax AnnotationTypeDefinition
        = 
        AT "interface" IDENT AnnotationBlock ab
 ;
syntax AnnotationBlock
        = 
        LCURLY (AnnotationField | SEMI)* RCURLY
 ;
syntax AnnotationField
        = 
        Modifiers mods (InnerTypeDef it | (TypeSpec ts ((IDENT i LPAREN RPAREN DefaultValue dv SEMI) | (VariableDefinitions v SEMI))))
 ;
syntax DefaultValue
        = 
        ("default" AnnotationMemberValue)?
 ;
syntax CtorHead
        = 
        IDENT LPAREN ParameterDeclarationList RPAREN ThrowsClause?
 ;
syntax ConstructorBody
        = 
        LCURLY lc ExplicitConstructorInvocation? Statement* RCURLY
 ;
syntax ExplicitConstructorInvocation
        = 
        TypeArguments (("this" LPAREN lp1 ArgList RPAREN SEMI) | ("super" LPAREN lp2 ArgList RPAREN SEMI))
 ;
syntax NewArrayDeclarator
        = 
        (LBRACK lb Expression? RBRACK)+
 ;
syntax STAR
        = 
        "*"
 ;
syntax DIV
        = 
        "/"
 ;
syntax MOD
        = 
        "%"
 ;
syntax SL
        = 
        "\<\<"
 ;
syntax LE
        = 
        "\<="
 ;
syntax GE
        = 
        "\>="
 ;
syntax NOT_EQUAL
        = 
        "!="
 ;
syntax EQUAL
        = 
        "=="
 ;
syntax BXOR
        = 
        "^"
 ;
syntax BOR
        = 
        "|"
 ;
syntax LAND
        = 
        "&&"
 ;
syntax LOR
        = 
        "||"
 ;
syntax AnnotationMemberArrayInitializer
        = 
        LCURLY lc {AnnotationMemberValue COMMA}* COMMA? RCURLY
 ;
syntax ImportDefinition
        = 
        "import" i "static"? IdentifierStar SEMI
 ;
syntax IdentifierStar
        = 
        IDENT (DOT IDENT)* (DOT STAR)?
 ;
syntax TypeDefinition
        = Modifiers m (ClassDefinition | EnumDefinition | InterfaceDefinition | AnnotationTypeDefinition)
        | SEMI
 ;
