@contributor{bgf2src automated exporter - SLPS}
module Java_5_studman

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
        AT Identifier i (LPAREN AnnotationArguments args? RPAREN)?
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
syntax LPAREN
        = 
        "("
 ;
syntax AnnotationArguments
        = AnnotationMemberValueInitializer
        | AnntotationMemberValuePairs
 ;
syntax AnnotationMemberValueInitializer
        = ConditionalExpression
        | Annotation
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
        IDENT TypeArguments? (DOT IDENT TypeArguments?)*
 ;
syntax TypeArguments
        = 
        LT TypeArgument (COMMA TypeArgument)* TypeArgumentsOrParametersEnd?
 ;
syntax LT
        = 
        "\<"
 ;
syntax TypeArgument
        = TypeArgumentSpec
        | WildcardType
 ;
syntax TypeArgumentSpec
        = ClassTypeSpec
        | BuiltInTypeArraySpec
 ;
syntax BuiltInTypeArraySpec
        = 
        BuiltInType (LBRACK lb RBRACK)+
 ;
syntax WildcardType
        = 
        QUESTION q TypeArgumentBounds?
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax TypeArgumentBounds
        = 
        ("extends" | "super") ClassOrInterfaceType
 ;
syntax COMMA
        = 
        ","
 ;
syntax TypeArgumentsOrParametersEnd
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
        PrimaryExpression ((DOT TypeArguments? ((IDENT (LPAREN lp ArgList RPAREN)?) | ("super" ((LPAREN lp3 ArgList RPAREN) | (DOT TypeArguments? IDENT (LPAREN lps ArgList RPAREN)?))))) | (DOT "this") | (DOT NewExpression) | (LBRACK lb Expression RBRACK))* (INC in | DEC de)?
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
        TypeArguments ta1? IDENT ((DOT TypeArguments ta2? IDENT) | ())* ((LPAREN lp ArgList RPAREN) | (LBRACK lbc RBRACK)+)?
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
syntax ASSIGN
        = 
        "="
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
        = "." ((("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ EXPONENT? FLOAT_SUFFIX f1?) | "..")?
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
        "new" TypeArguments? Type ((LPAREN ArgList RPAREN ClassBlock?) | (NewArrayDeclarator ArrayInitializer?))
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
        = Modifiers mods (TypeDefinitionInternal td | (TypeParameters tp? ((CtorHead h ConstructorBody s) | (TypeSpec t ((IDENT LPAREN ParameterDeclarationList param RPAREN DeclaratorBrackets rt ThrowsClause tc? (CompoundStatement s2 | SEMI)) | (VariableDefinitions v SEMI))))))
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
syntax TypeDefinitionInternal
        = ClassDefinition
        | InterfaceDefinition
        | EnumDefinition
        | AnnotationDefinition
 ;
syntax ClassDefinition
        = 
        "class" IDENT TypeParameters tp? SuperClassClause sc ImplementsClause ic ClassBlock cb
 ;
syntax TypeParameters
        = 
        LT TypeParameter (COMMA TypeParameter)* TypeArgumentsOrParametersEnd?
 ;
syntax TypeParameter
        = 
        IDENT id TypeParameterBounds?
 ;
syntax TypeParameterBounds
        = 
        "extends" ClassOrInterfaceType (BAND ClassOrInterfaceType)*
 ;
syntax BAND
        = 
        "&"
 ;
syntax SuperClassClause
        = 
        ("extends" ClassOrInterfaceType c)?
 ;
syntax ImplementsClause
        = 
        ("implements" i ClassOrInterfaceType (COMMA ClassOrInterfaceType)*)?
 ;
syntax InterfaceDefinition
        = 
        "interface" IDENT TypeParameters tp? InterfaceExtends ie InterfaceBlock ib
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
        Modifiers mods (TypeDefinitionInternal td | (TypeParameters tp? TypeSpec t ((IDENT LPAREN ParameterDeclarationList param RPAREN DeclaratorBrackets rt ThrowsClause tc? SEMI) | (VariableDefinitions v SEMI))))
 ;
syntax TypeSpec
        = ClassTypeSpec
        | BuiltInTypeSpec
 ;
syntax ParameterDeclarationList
        = 
        ((ParameterDeclaration (COMMA ParameterDeclaration)* (COMMA VariableLengthParameterDeclaration)?) | VariableLengthParameterDeclaration)?
 ;
syntax ParameterDeclaration
        = 
        ParameterModifier pm TypeSpec t IDENT id DeclaratorBrackets pd
 ;
syntax ParameterModifier
        = 
        Annotation* "final" f? Annotation*
 ;
syntax DeclaratorBrackets
        = 
        (LBRACK lb RBRACK)*
 ;
syntax VariableLengthParameterDeclaration
        = 
        ParameterModifier pm TypeSpec t TRIPLE_DOT IDENT id DeclaratorBrackets pd
 ;
syntax TRIPLE_DOT
        = 
        "..."
 ;
syntax ThrowsClause
        = 
        "throws" Identifier (COMMA Identifier)*
 ;
syntax SEMI
        = 
        ";"
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
        LCURLY lc {Initializer COMMA}* RCURLY
 ;
syntax RCURLY
        = 
        "}"
 ;
syntax EnumDefinition
        = 
        "enum" IDENT ImplementsClause ic EnumBlock eb
 ;
syntax EnumBlock
        = 
        LCURLY {EnumConstant COMMA}* (SEMI (ClassField | SEMI)*)? RCURLY
 ;
syntax EnumConstant
        = 
        Annotations an IDENT i (LPAREN ArgList a RPAREN)? EnumConstantBlock b?
 ;
syntax EnumConstantBlock
        = 
        LCURLY (EnumConstantField | SEMI)* RCURLY
 ;
syntax EnumConstantField
        = Modifiers mods (TypeDefinitionInternal td | (TypeParameters tp? TypeSpec t ((IDENT LPAREN ParameterDeclarationList param RPAREN DeclaratorBrackets rt ThrowsClause tc? (CompoundStatement s2 | SEMI)) | (VariableDefinitions v SEMI))))
        | s4: CompoundStatement
 ;
syntax CompoundStatement
        = 
        LCURLY lc Statement* RCURLY
 ;
syntax Statement
        = CompoundStatement
        | Declaration SEMI
        | Expression SEMI
        | Modifiers m ClassDefinition
        | IDENT COLON c Statement
        | "if" LPAREN Expression RPAREN Statement ("else" Statement)?
        | ForStatement
        | "while" LPAREN Expression RPAREN Statement
        | "do" Statement "while" LPAREN Expression RPAREN SEMI
        | "break" IDENT? SEMI
        | "continue" IDENT? SEMI
        | "return" Expression? SEMI
        | "switch" LPAREN Expression RPAREN LCURLY CasesGroup* RCURLY
        | TryBlock
        | "throw" Expression SEMI
        | "synchronized" LPAREN Expression RPAREN CompoundStatement
        | "assert" Expression (COLON Expression)? SEMI
        | s: SEMI
 ;
syntax Declaration
        = 
        Modifiers m TypeSpec t VariableDefinitions v
 ;
syntax COLON
        = 
        ":"
 ;
syntax ForStatement
        = 
        "for" f LPAREN (TraditionalForClause | ForEachClause) RPAREN Statement
 ;
syntax TraditionalForClause
        = 
        ForInit SEMI ForCond SEMI ForIter
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
syntax ForEachClause
        = 
        ParameterDeclaration p COLON Expression
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
syntax AnnotationDefinition
        = 
        AT "interface" IDENT AnnotationBlock ab
 ;
syntax AnnotationBlock
        = 
        LCURLY (AnnotationField | SEMI)* RCURLY
 ;
syntax AnnotationField
        = 
        Modifiers mods (TypeDefinitionInternal td | (TypeSpec t ((IDENT i LPAREN RPAREN DeclaratorBrackets rt ("default" AnnotationMemberValueInitializer amvi)? SEMI) | (VariableDefinitions v SEMI))))
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
        TypeArguments? (("this" LPAREN lp1 ArgList RPAREN SEMI) | ("super" LPAREN lp2 ArgList RPAREN SEMI))
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
        LCURLY lc {AnnotationMemberArrayValueInitializer COMMA}* RCURLY
 ;
syntax AnnotationMemberArrayValueInitializer
        = ConditionalExpression
        | Annotation
 ;
syntax AnntotationMemberValuePairs
        = 
        AnnotationMemberValuePair (COMMA AnnotationMemberValuePair)*
 ;
syntax AnnotationMemberValuePair
        = 
        IDENT i ASSIGN AnnotationMemberValueInitializer v
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
        = Modifiers m TypeDefinitionInternal
        | SEMI
 ;
