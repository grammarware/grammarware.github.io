@contributor{bgf2src automated exporter - SLPS}
module Java_5_jls_impl

syntax NormalClassDeclaration
        = 
        "class" Identifier TypeParameters? ("extends" Type)? ("implements" TypeList)? ClassBody
 ;
syntax ExplicitGenericInvocation
        = 
        NonWildcardTypeArguments ExplicitGenericInvocationSuffix
 ;
syntax InterfaceDeclaration
        = NormalInterfaceDeclaration
        | AnnotationTypeDeclaration
 ;
syntax Statement
        = Block
        | "assert" Expression (":" Expression)? ";"
        | "if" ParExpression Statement ("else" Statement)?
        | "for" "(" ForControl ")" Statement
        | "while" ParExpression Statement
        | "do" Statement "while" ParExpression ";"
        | "try" Block (Catches | (Catches? "finally" Block))
        | "switch" ParExpression "{" SwitchBlockStatementGroups "}"
        | "synchronized" ParExpression Block
        | "return" Expression? ";"
        | "throw" Expression ";"
        | "break" Identifier? ";"
        | "continue" Identifier? ";"
        | ";"
        | StatementExpression ";"
        | Identifier ":" Statement
 ;
syntax Annotations
        = 
        Annotation Annotations?
 ;
syntax ElementValue
        = ConditionalExpression
        | Annotation
        | ElementValueArrayInitializer
 ;
syntax TypeParameter
        = 
        Identifier ("extends" Bound)?
 ;
syntax CatchClause
        = 
        "catch" "(" FormalParameter ")" Block
 ;
syntax ClassCreatorRest
        = 
        Arguments ClassBody?
 ;
syntax ClassBodyDeclaration
        = ";"
        | "static"? Block
        | Modifier* MemberDecl
 ;
syntax BlockStatement
        = LocalVariableDeclarationStatement
        | ClassOrInterfaceDeclaration
        | (Identifier ":")? Statement
 ;
syntax Annotation
        = 
        "@" QualifiedIdentifier ("(" (Identifier "=")? ElementValue ")")?
 ;
syntax SwitchBlockStatementGroups
        = 
        SwitchBlockStatementGroup*
 ;
syntax EnumConstant
        = 
        Annotations Identifier Arguments? ClassBody?
 ;
syntax QualifiedIdentifier
        = 
        Identifier ("." Identifier)*
 ;
syntax ConstantDeclaratorsRest
        = 
        ConstantDeclaratorRest ("," ConstantDeclarator)*
 ;
syntax AnnotationTypeDeclaration
        = 
        "@" "interface" Identifier AnnotationTypeBody
 ;
syntax NonWildcardTypeArguments
        = 
        "\<" TypeList "\>"
 ;
syntax Expressions
        = 
        ("," StatementExpression)*
 ;
syntax Expression3
        = PrefixOp Expression3
        | "(" (Expression | Type) ")" Expression3
        | Primary Selector* PostfixOp*
 ;
syntax BlockStatements
        = 
        BlockStatement*
 ;
syntax IdentifierSuffix
        = "[" (("]" ("[" "]")* "." "class") | (Expression "]"))
        | Arguments
        | "." ("class" | ExplicitGenericInvocation | "this" | ("super" Arguments) | ("new" NonWildcardTypeArguments? InnerCreator))
 ;
syntax InterfaceMethodDeclaratorRest
        = 
        FormalParameters ("[" "]")* ("throws" QualifiedIdentifierList)? ";"
 ;
syntax FormalParameterDeclsRest
        = VariableDeclaratorId ("," FormalParameterDecls)?
        | "..." VariableDeclaratorId
 ;
syntax AssignmentOperator
        = "="
        | "+="
        | "-="
        | "*="
        | "/="
        | "&="
        | "|="
        | "^="
        | "%="
        | "\<\<="
        | "\>\>="
        | "\>\>\>="
 ;
syntax ParExpression
        = 
        "(" Expression ")"
 ;
syntax AnnotationTypeElementDeclarations
        = AnnotationTypeElementDeclaration
        | AnnotationTypeElementDeclarations AnnotationTypeElementDeclaration
 ;
syntax VariableDeclaratorsRest
        = 
        VariableDeclaratorRest ("," VariableDeclarator)*
 ;
syntax ForControl
        = ForVarControl
        | ForInit ";" Expression? ";" ForUpdate?
 ;
syntax VariableDeclarator
        = 
        Identifier VariableDeclaratorRest
 ;
syntax ConstantExpression
        = 
        Expression
 ;
syntax SwitchLabel
        = "case" ConstantExpression ":"
        | "case" EnumConstantName ":"
        | "default" ":"
 ;
syntax ElementValues
        = 
        ElementValue ("," ElementValues)?
 ;
syntax InterfaceMemberDecl
        = InterfaceMethodOrFieldDecl
        | InterfaceGenericMethodDecl
        | "void" Identifier VoidInterfaceMethodDeclaratorRest
        | InterfaceDeclaration
        | ClassDeclaration
 ;
syntax AnnotationConstantRest
        = 
        VariableDeclarators
 ;
syntax QualifiedIdentifierList
        = 
        QualifiedIdentifier ("," QualifiedIdentifier)*
 ;
syntax GenericMethodOrConstructorRest
        = (Type | "void") Identifier MethodDeclaratorRest
        | Identifier ConstructorDeclaratorRest
 ;
syntax ArrayCreatorRest
        = 
        "[" (("]" ("[" "]")* ArrayInitializer) | (Expression "]" ("[" Expression "]")* ("[" "]")*))
 ;
syntax Type
        = Identifier TypeArguments? ("." Identifier TypeArguments?)* ("[" "]")*
        | BasicType
 ;
syntax FormalParameters
        = 
        "(" FormalParameterDecls? ")"
 ;
syntax TypeList
        = 
        Type ("," Type)*
 ;
syntax Selector
        = "." Identifier Arguments?
        | "." ExplicitGenericInvocation
        | "." "this"
        | "." "super" SuperSuffix
        | "." "new" NonWildcardTypeArguments? InnerCreator
        | Expression?
 ;
syntax VoidInterfaceMethodDeclaratorRest
        = 
        FormalParameters ("throws" QualifiedIdentifierList)? ";"
 ;
syntax InterfaceBodyDeclaration
        = ";"
        | Modifier* InterfaceMemberDecl
 ;
syntax MethodDeclaratorRest
        = 
        FormalParameters ("[" "]")* ("throws" QualifiedIdentifierList)? (MethodBody | ";")
 ;
syntax EnumConstants
        = EnumConstant
        | EnumConstants "," EnumConstant
 ;
syntax VariableDeclaratorRest
        = 
        ("[" "]")* ("=" VariableInitializer)?
 ;
syntax MethodOrFieldRest
        = VariableDeclaratorRest
        | MethodDeclaratorRest
 ;
syntax Modifier
        = Annotation
        | "public"
        | "protected"
        | "private"
        | "static"
        | "abstract"
        | "final"
        | "native"
        | "synchronized"
        | "transient"
        | "volatile"
        | "strictfp"
 ;
syntax Block
        = 
        "{" BlockStatements "}"
 ;
syntax PostfixOp
        = "++"
        | "--"
 ;
syntax ForInit
        = 
        StatementExpression Expressions
 ;
syntax EnumDeclaration
        = 
        "enum" Identifier ("implements" TypeList)? EnumBody
 ;
syntax VariableDeclarators
        = 
        VariableDeclarator ("," VariableDeclarator)*
 ;
syntax Primary
        = ParExpression
        | NonWildcardTypeArguments (ExplicitGenericInvocationSuffix | ("this" Arguments))
        | "this" Arguments?
        | "super" SuperSuffix
        | Literal
        | "new" Creator
        | Identifier ("." Identifier)* IdentifierSuffix?
        | BasicType ("[" "]")* "." "class"
        | "void" "." "class"
 ;
syntax Expression2Rest
        = (InfixOp Expression3)*
        | "instanceof" Type
 ;
syntax VariableInitializer
        = ArrayInitializer
        | Expression
 ;
syntax Literal
        = IntegerLiteral
        | FloatingPointLiteral
        | CharacterLiteral
        | StringLiteral
        | BooleanLiteral
        | NullLiteral
 ;
syntax ExplicitGenericInvocationSuffix
        = "super" SuperSuffix
        | Identifier Arguments
 ;
syntax ImportDeclaration
        = 
        "import" "static"? Identifier ("." Identifier)* ("." "*")? ";"
 ;
syntax BasicType
        = "byte"
        | "short"
        | "char"
        | "int"
        | "long"
        | "float"
        | "double"
        | "boolean"
 ;
syntax GenericMethodOrConstructorDecl
        = 
        TypeParameters GenericMethodOrConstructorRest
 ;
syntax ConstantDeclarator
        = 
        Identifier ConstantDeclaratorRest
 ;
syntax ClassBody
        = 
        "{" ClassBodyDeclaration* "}"
 ;
syntax MemberDecl
        = GenericMethodOrConstructorDecl
        | MethodOrFieldDecl
        | "void" Identifier VoidMethodDeclaratorRest
        | Identifier ConstructorDeclaratorRest
        | InterfaceDeclaration
        | ClassDeclaration
 ;
syntax SwitchBlockStatementGroup
        = 
        SwitchLabel BlockStatements
 ;
syntax Catches
        = 
        CatchClause CatchClause*
 ;
syntax InterfaceMethodOrFieldRest
        = ConstantDeclaratorsRest ";"
        | InterfaceMethodDeclaratorRest
 ;
syntax Expression1Rest
        = 
        "?" Expression ":" Expression1
 ;
syntax TypeArguments
        = 
        "\<" TypeArgument ("," TypeArgument)* "\>"
 ;
syntax Expression
        = 
        Expression1 (AssignmentOperator Expression1)?
 ;
syntax ConditionalExpression
        = 
        Expression2 Expression1Rest
 ;
syntax Creator
        = 
        NonWildcardTypeArguments? CreatedName (ArrayCreatorRest | ClassCreatorRest)
 ;
syntax InfixOp
        = "||"
        | "&&"
        | "|"
        | "^"
        | "&"
        | "=="
        | "!="
        | "\<"
        | "\>"
        | "\<="
        | "\>="
        | "\<\<"
        | "\>\>"
        | "\>\>\>"
        | "+"
        | "-"
        | "*"
        | "/"
        | "%"
 ;
syntax ClassOrInterfaceDeclaration
        = 
        Modifier* (ClassDeclaration | InterfaceDeclaration)
 ;
syntax ConstructorDeclaratorRest
        = 
        FormalParameters ("throws" QualifiedIdentifierList)? MethodBody
 ;
syntax InterfaceMethodOrFieldDecl
        = 
        Type Identifier InterfaceMethodOrFieldRest
 ;
syntax ClassDeclaration
        = NormalClassDeclaration
        | EnumDeclaration
 ;
syntax MethodOrFieldDecl
        = 
        Type Identifier MethodOrFieldRest
 ;
syntax InnerCreator
        = 
        Identifier ClassCreatorRest
 ;
syntax PrefixOp
        = "++"
        | "--"
        | "!"
        | "~"
        | "+"
        | "-"
 ;
syntax CreatedName
        = 
        Identifier NonWildcardTypeArguments? ("." Identifier NonWildcardTypeArguments?)*
 ;
syntax TypeDeclaration
        = ClassOrInterfaceDeclaration
        | ";"
 ;
syntax FormalParameterDecls
        = 
        ("final" Annotations? Type FormalParameterDeclsRest)?
 ;
syntax ConstantDeclaratorRest
        = 
        ("[" "]")* "=" VariableInitializer
 ;
syntax StatementExpression
        = 
        Expression
 ;
syntax Arguments
        = 
        "(" {Expression ","}* ")"
 ;
syntax ElementValueArrayInitializer
        = 
        "{" ElementValues? ","? "}"
 ;
syntax VariableDeclaratorId
        = 
        Identifier ("[" "]")*
 ;
syntax AnnotationMethodRest
        = 
        "(" ")" ("[" "]")* DefaultValue?
 ;
syntax VoidMethodDeclaratorRest
        = 
        FormalParameters ("throws" QualifiedIdentifierList)? (MethodBody | ";")
 ;
syntax LocalVariableDeclarationStatement
        = 
        "final"? Type VariableDeclarators ";"
 ;
syntax Expression1
        = 
        Expression2 Expression1Rest?
 ;
syntax TypeParameters
        = 
        "\<" TypeParameter ("," TypeParameter)* "\>"
 ;
syntax Expression2
        = 
        Expression3 Expression2Rest?
 ;
syntax MethodBody
        = 
        Block
 ;
syntax ForVarControlRest
        = VariableDeclaratorsRest ";" Expression? ";" ForUpdate?
        | ":" Expression
 ;
syntax EnumBodyDeclarations
        = 
        ";" ClassBodyDeclaration*
 ;
syntax DefaultValue
        = 
        "default" ElementValue
 ;
syntax AnnotationMethodOrConstantRest
        = Identifier AnnotationMethodRest
        | AnnotationConstantRest
 ;
syntax SuperSuffix
        = Arguments
        | "." Identifier Arguments?
 ;
syntax InterfaceGenericMethodDecl
        = 
        TypeParameters (Type | "void") Identifier InterfaceMethodDeclaratorRest
 ;
syntax EnumBody
        = 
        (EnumConstants? ","? EnumBodyDeclarations?)*
 ;
syntax CompilationUnit
        = 
        (Annotations? "package" QualifiedIdentifier ";")? ImportDeclaration* TypeDeclaration*
 ;
syntax InterfaceBody
        = 
        "{" InterfaceBodyDeclaration* "}"
 ;
syntax EnumConstantName
        = 
        Identifier
 ;
syntax Bound
        = 
        Type ("&" Type)*
 ;
syntax TypeArgument
        = Type
        | "?" (("extends" | "super") Type)?
 ;
syntax AnnotationTypeElementRest
        = Type AnnotationMethodOrConstantRest ";"
        | ClassDeclaration
        | InterfaceDeclaration
        | EnumDeclaration
        | AnnotationTypeDeclaration
 ;
syntax AnnotationTypeElementDeclaration
        = 
        Modifier* AnnotationTypeElementRest
 ;
syntax NormalInterfaceDeclaration
        = 
        "interface" Identifier TypeParameters? ("extends" TypeList)? InterfaceBody
 ;
syntax AnnotationTypeBody
        = 
        "{" AnnotationTypeElementDeclarations? "}"
 ;
syntax ArrayInitializer
        = 
        "{" {VariableInitializer ","}* "}"
 ;
syntax ForVarControl
        = 
        "final"? Annotations? Type Identifier ForVarControlRest
 ;
syntax ForUpdate
        = 
        StatementExpression Expressions
 ;
syntax FormalParameter
        = 
        "final"? Type VariableDeclaratorId
 ;
