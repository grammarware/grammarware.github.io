@contributor{bgf2src automated exporter - SLPS}
module Java_5_jls_read

syntax ClassBodyDeclarations
        = ClassBodyDeclaration
        | ClassBodyDeclarations ClassBodyDeclaration
 ;
syntax NormalClassDeclaration
        = 
        ClassModifiers? "class" Identifier TypeParameters? Super? Interfaces? ClassBody
 ;
syntax PostDecrementExpression
        = 
        PostfixExpression "--"
 ;
syntax ReferenceTypeList
        = ReferenceType
        | ReferenceTypeList "," ReferenceType
 ;
syntax PrimitiveType
        = NumericType
        | "boolean"
 ;
syntax InterfaceTypeList
        = InterfaceType
        | InterfaceTypeList "," InterfaceType
 ;
syntax Statement
        = StatementWithoutTrailingSubstatement
        | LabeledStatement
        | IfThenStatement
        | IfThenElseStatement
        | WhileStatement
        | ForStatement
 ;
syntax AndExpression
        = EqualityExpression
        | AndExpression "&" EqualityExpression
 ;
syntax Annotations
        = Annotation
        | Annotations Annotation
 ;
syntax ConstructorBody
        = 
        "{" ExplicitConstructorInvocation? BlockStatements? "}"
 ;
syntax TypeParameter
        = 
        TypeVariable TypeBound?
 ;
syntax ArgumentList
        = Expression
        | ArgumentList "," Expression
 ;
syntax MethodName
        = Identifier
        | AmbiguousName "." Identifier
 ;
syntax ClassMemberDeclaration
        = FieldDeclaration
        | MethodDeclaration
        | ClassDeclaration
        | InterfaceDeclaration
        | ";"
 ;
syntax Assignment
        = 
        LeftHandSide AssignmentOperator AssignmentExpression
 ;
syntax Interfaces
        = 
        "implements" InterfaceTypeList
 ;
syntax CatchClause
        = 
        "catch" "(" FormalParameter ")" Block
 ;
syntax AbstractMethodModifiers
        = AbstractMethodModifier
        | AbstractMethodModifiers AbstractMethodModifier
 ;
syntax ClassInstanceCreationExpression
        = "new" TypeArguments? ClassOrInterfaceType "(" ArgumentList? ")" ClassBody?
        | Primary "." "new" TypeArguments? Identifier TypeArguments? "(" ArgumentList? ")" ClassBody?
 ;
syntax TypeName
        = Identifier
        | PackageOrTypeName "." Identifier
 ;
syntax InterfaceType
        = 
        TypeDeclSpecifier TypeArguments?
 ;
syntax BlockStatement
        = LocalVariableDeclarationStatement
        | ClassDeclaration
        | Statement
 ;
syntax IfThenStatement
        = 
        "if" "(" Expression ")" Statement
 ;
syntax Annotation
        = NormalAnnotation
        | MarkerAnnotation
        | SingleElementAnnotation
 ;
syntax SwitchBlockStatementGroups
        = SwitchBlockStatementGroup
        | SwitchBlockStatementGroups SwitchBlockStatementGroup
 ;
syntax EnumConstant
        = 
        Annotations Identifier Arguments? ClassBody?
 ;
syntax ClassModifier
        = Annotation
        | "public"
        | "protected"
        | "private"
        | "abstract"
        | "static"
        | "final"
        | "strictfp"
 ;
syntax EnumBodyDeclarations
        = 
        ";" ClassBodyDeclarations?
 ;
syntax SingleTypeImportDeclaration
        = 
        "import" TypeName ";"
 ;
syntax AnnotationTypeDeclaration
        = 
        InterfaceModifiers? "@" "interface" Identifier AnnotationTypeBody
 ;
syntax ConstantDeclaration
        = 
        ConstantModifiers? Type VariableDeclarators ";"
 ;
syntax PreIncrementExpression
        = 
        "++" UnaryExpression
 ;
syntax ExplicitConstructorInvocation
        = NonWildTypeArguments? "this" "(" ArgumentList? ")" ";"
        | NonWildTypeArguments? "super" "(" ArgumentList? ")" ";"
        | Primary "." NonWildTypeArguments? "super" "(" ArgumentList? ")" ";"
 ;
syntax ActualTypeArgumentList
        = ActualTypeArgument
        | ActualTypeArgumentList "," ActualTypeArgument
 ;
syntax VariableInitializers
        = VariableInitializer
        | VariableInitializers "," VariableInitializer
 ;
syntax DimExpr
        = 
        "[" Expression "]"
 ;
syntax Throws
        = 
        "throws" ExceptionTypeList
 ;
syntax BlockStatements
        = BlockStatement
        | BlockStatements BlockStatement
 ;
syntax InterfaceModifiers
        = InterfaceModifier
        | InterfaceModifiers InterfaceModifier
 ;
syntax PrimaryNoNewArray
        = Literal
        | Type "." "class"
        | "void" "." "class"
        | "this"
        | ClassName "." "this"
        | "(" Expression ")"
        | ClassInstanceCreationExpression
        | FieldAccess
        | MethodInvocation
        | ArrayAccess
 ;
syntax AssignmentOperator
        = "="
        | "*="
        | "/="
        | "%="
        | "+="
        | "-="
        | "\<\<="
        | "\>\>="
        | "\>\>\>="
        | "&="
        | "^="
        | "|="
 ;
syntax AnnotationTypeElementDeclarations
        = AnnotationTypeElementDeclaration
        | AnnotationTypeElementDeclarations AnnotationTypeElementDeclaration
 ;
syntax StatementWithoutTrailingSubstatement
        = Block
        | EmptyStatement
        | ExpressionStatement
        | AssertStatement
        | SwitchStatement
        | DoStatement
        | BreakStatement
        | ContinueStatement
        | ReturnStatement
        | SynchronizedStatement
        | ThrowStatement
        | TryStatement
 ;
syntax AdditionalBound
        = 
        "&" InterfaceType
 ;
syntax FieldDeclaration
        = 
        FieldModifiers? Type VariableDeclarators ";"
 ;
syntax TypeBound
        = 
        "extends" ClassOrInterfaceType AdditionalBoundList?
 ;
syntax AdditionalBoundList
        = AdditionalBound AdditionalBoundList
        | AdditionalBound
 ;
syntax VariableDeclarator
        = VariableDeclaratorId
        | VariableDeclaratorId "=" VariableInitializer
 ;
syntax PostfixExpression
        = Primary
        | ExpressionName
        | PostIncrementExpression
        | PostDecrementExpression
 ;
syntax SwitchLabel
        = "case" ConstantExpression ":"
        | "case" EnumConstantName ":"
        | "default" ":"
 ;
syntax ConstantModifier
        = Annotation
        | "public"
        | "static"
        | "final"
 ;
syntax FormalParameter
        = 
        VariableModifiers? Type VariableDeclaratorId
 ;
syntax PackageName
        = Identifier
        | PackageName "." Identifier
 ;
syntax VariableModifiers
        = VariableModifier
        | VariableModifiers VariableModifier
 ;
syntax ConditionalAndExpression
        = InclusiveOrExpression
        | ConditionalAndExpression "&&" InclusiveOrExpression
 ;
syntax MethodModifiers
        = MethodModifier
        | MethodModifiers MethodModifier
 ;
syntax Type
        = PrimitiveType
        | ReferenceType
 ;
syntax EqualityExpression
        = RelationalExpression
        | EqualityExpression "==" RelationalExpression
        | EqualityExpression "!=" RelationalExpression
 ;
syntax InterfaceMemberDeclaration
        = ConstantDeclaration
        | AbstractMethodDeclaration
        | ClassDeclaration
        | InterfaceDeclaration
        | ";"
 ;
syntax MultiplicativeExpression
        = UnaryExpression
        | MultiplicativeExpression "*" UnaryExpression
        | MultiplicativeExpression "/" UnaryExpression
        | MultiplicativeExpression "%" UnaryExpression
 ;
syntax ActualTypeArgument
        = ReferenceType
        | Wildcard
 ;
syntax ExceptionType
        = ClassType
        | TypeVariable
 ;
syntax BreakStatement
        = 
        "break" Identifier? ";"
 ;
syntax ConstructorModifier
        = Annotation
        | "public"
        | "protected"
        | "private"
 ;
syntax ElementValuePairs
        = ElementValuePair
        | ElementValuePairs "," ElementValuePair
 ;
syntax SynchronizedStatement
        = 
        "synchronized" "(" Expression ")" Block
 ;
syntax Literal
        = IntegerLiteral
        | FloatingPointLiteral
        | BooleanLiteral
        | CharacterLiteral
        | StringLiteral
        | NullLiteral
 ;
syntax ElementValue
        = ConditionalExpression
        | Annotation
        | ElementValueArrayInitializer
 ;
syntax Super
        = 
        "extends" ClassType
 ;
syntax ArrayCreationExpression
        = "new" PrimitiveType DimExprs Dims?
        | "new" ClassOrInterfaceType DimExprs Dims?
        | "new" PrimitiveType Dims ArrayInitializer
        | "new" ClassOrInterfaceType Dims ArrayInitializer
 ;
syntax ArrayInitializer
        = 
        "{" VariableInitializers? ","? "}"
 ;
syntax InterfaceModifier
        = Annotation
        | "public"
        | "protected"
        | "private"
        | "abstract"
        | "static"
        | "strictfp"
 ;
syntax UnaryExpressionNotPlusMinus
        = PostfixExpression
        | "~" UnaryExpression
        | "!" UnaryExpression
        | CastExpression
 ;
syntax NonWildTypeArguments
        = 
        "\<" ReferenceTypeList "\>"
 ;
syntax SwitchBlock
        = 
        "{" SwitchBlockStatementGroups? SwitchLabels? "}"
 ;
syntax EmptyStatement
        = 
        ";"
 ;
syntax EnumConstants
        = EnumConstant
        | EnumConstants "," EnumConstant
 ;
syntax LastFormalParameter
        = VariableModifiers? Type "..."? VariableDeclaratorId
        | FormalParameter
 ;
syntax AbstractMethodDeclaration
        = 
        AbstractMethodModifiers? TypeParameters? ResultType MethodDeclarator Throws? ";"
 ;
syntax IfThenElseStatement
        = 
        "if" "(" Expression ")" StatementNoShortIf "else" Statement
 ;
syntax EnhancedForStatement
        = 
        "for" "(" VariableModifiers? Type Identifier ":" Expression ")" Statement
 ;
syntax ReturnStatement
        = 
        "return" Expression? ";"
 ;
syntax Block
        = 
        "{" BlockStatements? "}"
 ;
syntax ForUpdate
        = 
        StatementExpressionList
 ;
syntax ForInit
        = StatementExpressionList
        | LocalVariableDeclaration
 ;
syntax EnumDeclaration
        = 
        ClassModifiers? "enum" Identifier Interfaces? EnumBody
 ;
syntax VariableDeclarators
        = VariableDeclarator
        | VariableDeclarators "," VariableDeclarator
 ;
syntax ThrowStatement
        = 
        "throw" Expression ";"
 ;
syntax ExclusiveOrExpression
        = AndExpression
        | ExclusiveOrExpression "^" AndExpression
 ;
syntax Primary
        = PrimaryNoNewArray
        | ArrayCreationExpression
 ;
syntax PackageDeclaration
        = 
        Annotations? "package" PackageName ";"
 ;
syntax RelationalExpression
        = ShiftExpression
        | RelationalExpression "\<" ShiftExpression
        | RelationalExpression "\>" ShiftExpression
        | RelationalExpression "\<=" ShiftExpression
        | RelationalExpression "\>=" ShiftExpression
        | RelationalExpression "instanceof" ReferenceType
 ;
syntax StatementNoShortIf
        = StatementWithoutTrailingSubstatement
        | LabeledStatementNoShortIf
        | IfThenElseStatementNoShortIf
        | WhileStatementNoShortIf
        | ForStatementNoShortIf
 ;
syntax WhileStatementNoShortIf
        = 
        "while" "(" Expression ")" StatementNoShortIf
 ;
syntax ExtendsInterfaces
        = "extends" InterfaceType
        | ExtendsInterfaces "," InterfaceType
 ;
syntax WildcardBounds
        = "extends" ReferenceType
        | "super" ReferenceType
 ;
syntax AbstractMethodModifier
        = Annotation
        | "public"
        | "abstract"
 ;
syntax MethodInvocation
        = MethodName "(" ArgumentList? ")"
        | Primary "." NonWildTypeArguments? Identifier "(" ArgumentList? ")"
        | "super" "." NonWildTypeArguments? Identifier "(" ArgumentList? ")"
        | ClassName "." "super" "." NonWildTypeArguments? Identifier "(" ArgumentList? ")"
        | TypeName "." NonWildTypeArguments Identifier "(" ArgumentList? ")"
 ;
syntax ConstantExpression
        = 
        Expression
 ;
syntax TypeDeclSpecifier
        = TypeName
        | ClassOrInterfaceType "." Identifier
 ;
syntax ExceptionTypeList
        = ExceptionType
        | ExceptionTypeList "," ExceptionType
 ;
syntax VariableInitializer
        = Expression
        | ArrayInitializer
 ;
syntax StaticInitializer
        = 
        "static" Block
 ;
syntax Finally
        = 
        "finally" Block
 ;
syntax MarkerAnnotation
        = 
        "@" TypeName
 ;
syntax ConstructorDeclaration
        = 
        ConstructorModifiers? ConstructorDeclarator Throws? ConstructorBody
 ;
syntax ElementValuePair
        = 
        Identifier "=" ElementValue
 ;
syntax TypeImportOnDemandDeclaration
        = 
        "import" PackageOrTypeName "." "*" ";"
 ;
syntax ArrayAccess
        = ExpressionName "[" Expression "]"
        | PrimaryNoNewArray "[" Expression "]"
 ;
syntax InterfaceMemberDeclarations
        = InterfaceMemberDeclaration
        | InterfaceMemberDeclarations InterfaceMemberDeclaration
 ;
syntax ForStatement
        = BasicForStatement
        | EnhancedForStatement
 ;
syntax PostIncrementExpression
        = 
        PostfixExpression "++"
 ;
syntax PackageOrTypeName
        = Identifier
        | PackageOrTypeName "." Identifier
 ;
syntax AmbiguousName
        = Identifier
        | AmbiguousName "." Identifier
 ;
syntax ContinueStatement
        = 
        "continue" Identifier? ";"
 ;
syntax ImportDeclaration
        = SingleTypeImportDeclaration
        | TypeImportOnDemandDeclaration
        | SingleStaticImportDeclaration
        | StaticImportOnDemandDeclaration
 ;
syntax CompilationUnit
        = 
        PackageDeclaration? ImportDeclarations? TypeDeclarations?
 ;
syntax ElementValues
        = ElementValue
        | ElementValues "," ElementValue
 ;
syntax SwitchStatement
        = 
        "switch" "(" Expression ")" SwitchBlock
 ;
syntax Dims
        = "[" "]"
        | Dims "[" "]"
 ;
syntax ClassBody
        = 
        "{" ClassBodyDeclarations? "}"
 ;
syntax AssertStatement
        = "assert" Expression ";"
        | "assert" Expression ":" Expression ";"
 ;
syntax ClassBodyDeclaration
        = ClassMemberDeclaration
        | InstanceInitializer
        | StaticInitializer
        | ConstructorDeclaration
 ;
syntax SwitchBlockStatementGroup
        = 
        SwitchLabels BlockStatements
 ;
syntax MethodDeclaration
        = 
        MethodHeader MethodBody
 ;
syntax PreDecrementExpression
        = 
        "--" UnaryExpression
 ;
syntax MethodModifier
        = Annotation
        | "public"
        | "protected"
        | "private"
        | "abstract"
        | "static"
        | "final"
        | "synchronized"
        | "native"
        | "strictfp"
 ;
syntax DoStatement
        = 
        "do" Statement "while" "(" Expression ")" ";"
 ;
syntax TypeArguments
        = 
        "\<" ActualTypeArgumentList "\>"
 ;
syntax ConditionalExpression
        = ConditionalOrExpression
        | ConditionalOrExpression "?" Expression ":" ConditionalExpression
 ;
syntax ClassOrInterfaceType
        = ClassType
        | InterfaceType
 ;
syntax InstanceInitializer
        = 
        Block
 ;
syntax TryStatement
        = "try" Block Catches
        | "try" Block Catches? Finally
 ;
syntax SwitchLabels
        = SwitchLabel
        | SwitchLabels SwitchLabel
 ;
syntax Wildcard
        = 
        "?" WildcardBounds?
 ;
syntax FormalParameterList
        = LastFormalParameter
        | FormalParameters "," LastFormalParameter
 ;
syntax Expression
        = 
        AssignmentExpression
 ;
syntax StatementExpressionList
        = StatementExpression
        | StatementExpressionList "," StatementExpression
 ;
syntax AdditiveExpression
        = MultiplicativeExpression
        | AdditiveExpression "+" MultiplicativeExpression
        | AdditiveExpression "-" MultiplicativeExpression
 ;
syntax FloatingPointType
        = "float"
        | "double"
 ;
syntax ExpressionStatement
        = 
        StatementExpression ";"
 ;
syntax LocalVariableDeclaration
        = 
        VariableModifiers? Type VariableDeclarators
 ;
syntax ConstructorDeclarator
        = 
        TypeParameters? Identifier "(" FormalParameterList? ")"
 ;
syntax InclusiveOrExpression
        = ExclusiveOrExpression
        | InclusiveOrExpression "|" ExclusiveOrExpression
 ;
syntax ClassType
        = 
        TypeDeclSpecifier TypeArguments?
 ;
syntax WhileStatement
        = 
        "while" "(" Expression ")" Statement
 ;
syntax FormalParameters
        = FormalParameter
        | FormalParameters "," FormalParameter
 ;
syntax VariableModifier
        = "final"
        | Annotation
 ;
syntax ClassDeclaration
        = NormalClassDeclaration
        | EnumDeclaration
 ;
syntax FieldAccess
        = Primary "." Identifier
        | "super" "." Identifier
        | ClassName "." "super" "." Identifier
 ;
syntax AssignmentExpression
        = ConditionalExpression
        | Assignment
 ;
syntax BasicForStatement
        = 
        "for" "(" ForInit? ";" Expression? ";" ForUpdate? ")" Statement
 ;
syntax ConditionalOrExpression
        = ConditionalAndExpression
        | ConditionalOrExpression "||" ConditionalAndExpression
 ;
syntax NormalAnnotation
        = 
        "@" TypeName "(" ElementValuePairs? ")"
 ;
syntax ImportDeclarations
        = ImportDeclaration
        | ImportDeclarations ImportDeclaration
 ;
syntax TypeDeclaration
        = ClassDeclaration
        | InterfaceDeclaration
        | ";"
 ;
syntax LabeledStatement
        = 
        Identifier ":" Statement
 ;
syntax ExpressionName
        = Identifier
        | AmbiguousName "." Identifier
 ;
syntax ArrayType
        = 
        Type "[" "]"
 ;
syntax StatementExpression
        = Assignment
        | PreIncrementExpression
        | PreDecrementExpression
        | PostIncrementExpression
        | PostDecrementExpression
        | MethodInvocation
        | ClassInstanceCreationExpression
 ;
syntax Arguments
        = 
        "(" ArgumentList? ")"
 ;
syntax MethodDeclarator
        = Identifier "(" FormalParameterList? ")"
        | MethodDeclarator "[" "]"
 ;
syntax VariableDeclaratorId
        = Identifier
        | VariableDeclaratorId "[" "]"
 ;
syntax IntegralType
        = "byte"
        | "short"
        | "int"
        | "long"
        | "char"
 ;
syntax UnaryExpression
        = PreIncrementExpression
        | PreDecrementExpression
        | "+" UnaryExpression
        | "-" UnaryExpression
        | UnaryExpressionNotPlusMinus
 ;
syntax NumericType
        = IntegralType
        | FloatingPointType
 ;
syntax AnnotationTypeBody
        = 
        "{" AnnotationTypeElementDeclarations? "}"
 ;
syntax LeftHandSide
        = ExpressionName
        | FieldAccess
        | ArrayAccess
 ;
syntax IfThenElseStatementNoShortIf
        = 
        "if" "(" Expression ")" StatementNoShortIf "else" StatementNoShortIf
 ;
syntax LocalVariableDeclarationStatement
        = 
        LocalVariableDeclaration ";"
 ;
syntax CastExpression
        = "(" PrimitiveType Dims? ")" UnaryExpression
        | "(" ReferenceType ")" UnaryExpressionNotPlusMinus
 ;
syntax ShiftExpression
        = AdditiveExpression
        | ShiftExpression "\<\<" AdditiveExpression
        | ShiftExpression "\>\>" AdditiveExpression
        | ShiftExpression "\>\>\>" AdditiveExpression
 ;
syntax FieldModifiers
        = FieldModifier
        | FieldModifiers FieldModifier
 ;
syntax MethodBody
        = Block
        | ";"
 ;
syntax TypeVariable
        = 
        Identifier
 ;
syntax DefaultValue
        = 
        "default" ElementValue
 ;
syntax Catches
        = CatchClause
        | Catches CatchClause
 ;
syntax ResultType
        = Type
        | "void"
 ;
syntax ConstructorModifiers
        = ConstructorModifier
        | ConstructorModifiers ConstructorModifier
 ;
syntax StaticImportOnDemandDeclaration
        = 
        "import" "static" TypeName "." "*" ";"
 ;
syntax EnumBody
        = 
        (EnumConstants? ","? EnumBodyDeclarations?)*
 ;
syntax ReferenceType
        = ClassOrInterfaceType
        | TypeVariable
        | ArrayType
 ;
syntax ClassModifiers
        = ClassModifier
        | ClassModifiers ClassModifier
 ;
syntax ForStatementNoShortIf
        = 
        "for" "(" ForInit? ";" Expression? ";" ForUpdate? ")" StatementNoShortIf
 ;
syntax MethodHeader
        = 
        MethodModifiers? TypeParameters? ResultType MethodDeclarator Throws?
 ;
syntax LabeledStatementNoShortIf
        = 
        Identifier ":" StatementNoShortIf
 ;
syntax InterfaceBody
        = 
        "{" InterfaceMemberDeclarations? "}"
 ;
syntax ConstantModifiers
        = ConstantModifier
        | ConstantModifier ConstantModifiers
 ;
syntax SingleElementAnnotation
        = 
        "@" TypeName "(" ElementValue ")"
 ;
syntax EnumConstantName
        = 
        Identifier
 ;
syntax TypeDeclarations
        = TypeDeclaration
        | TypeDeclarations TypeDeclaration
 ;
syntax FieldModifier
        = Annotation
        | "public"
        | "protected"
        | "private"
        | "static"
        | "final"
        | "transient"
        | "volatile"
 ;
syntax AnnotationTypeElementDeclaration
        = AbstractMethodModifiers? Type Identifier "(" ")" Dims? DefaultValue? ";"
        | ConstantDeclaration
        | ClassDeclaration
        | InterfaceDeclaration
        | EnumDeclaration
        | AnnotationTypeDeclaration
        | ";"
 ;
syntax DimExprs
        = DimExpr
        | DimExprs DimExpr
 ;
syntax SingleStaticImportDeclaration
        = 
        "import" "static" TypeName "." Identifier ";"
 ;
syntax InterfaceDeclaration
        = NormalInterfaceDeclaration
        | AnnotationTypeDeclaration
 ;
syntax NormalInterfaceDeclaration
        = 
        InterfaceModifiers? "interface" Identifier ExtendsInterfaces? InterfaceBody
 ;
syntax ElementValueArrayInitializer
        = 
        "{" ElementValues? ","? "}"
 ;
syntax TypeParameters
        = 
        "\<" TypeParameterList "\>"
 ;
syntax TypeParameterList
        = TypeParameterList "," TypeParameter
        | TypeParameter
 ;
syntax ClassName
        = Identifier
        | AmbiguousName "." Identifier
 ;
