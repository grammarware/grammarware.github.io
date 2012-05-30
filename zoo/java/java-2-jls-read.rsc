@contributor{bgf2src automated exporter - SLPS}
module Java_2_jls_read

syntax ClassBodyDeclarations
        = ClassBodyDeclaration
        | ClassBodyDeclarations ClassBodyDeclaration
 ;
syntax PostDecrementExpression
        = 
        PostfixExpression "--"
 ;
syntax ExpressionStatement
        = 
        StatementExpression ";"
 ;
syntax PrimitiveType
        = NumericType
        | "boolean"
 ;
syntax InterfaceTypeList
        = InterfaceType
        | InterfaceTypeList "," InterfaceType
 ;
syntax InterfaceDeclaration
        = 
        InterfaceModifiers? "interface" Identifier ExtendsInterfaces? InterfaceBody
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
syntax PostIncrementExpression
        = 
        PostfixExpression "++"
 ;
syntax TypeName
        = Identifier
        | PackageOrTypeName "." Identifier
 ;
syntax InterfaceType
        = 
        TypeName
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
syntax SwitchBlockStatementGroups
        = SwitchBlockStatementGroup
        | SwitchBlockStatementGroups SwitchBlockStatementGroup
 ;
syntax ClassModifier
        = "public"
        | "protected"
        | "private"
        | "abstract"
        | "static"
        | "final"
        | "strictfp"
 ;
syntax SingleTypeImportDeclaration
        = 
        "import" TypeName ";"
 ;
syntax ConstantDeclaration
        = 
        ConstantModifiers? Type VariableDeclarators
 ;
syntax PreIncrementExpression
        = 
        "++" UnaryExpression
 ;
syntax ExplicitConstructorInvocation
        = "this" "(" ArgumentList? ")" ";"
        | "super" "(" ArgumentList? ")" ";"
        | Primary "." "super" "(" ArgumentList? ")" ";"
 ;
syntax UnaryExpression
        = PreIncrementExpression
        | PreDecrementExpression
        | "+" UnaryExpression
        | "-" UnaryExpression
        | UnaryExpressionNotPlusMinus
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
        "throws" ClassTypeList
 ;
syntax BlockStatements
        = BlockStatement
        | BlockStatements BlockStatement
 ;
syntax InterfaceModifiers
        = InterfaceModifier
        | InterfaceModifiers InterfaceModifier
 ;
syntax ClassTypeList
        = ClassType
        | ClassTypeList "," ClassType
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
syntax Literal
        = IntegerLiteral
        | FloatingPointLiteral
        | BooleanLiteral
        | CharacterLiteral
        | StringLiteral
        | NullLiteral
 ;
syntax FieldDeclaration
        = 
        FieldModifiers? Type VariableDeclarators ";"
 ;
syntax ReturnStatement
        = 
        "return" Expression? ";"
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
        | "default" ":"
 ;
syntax ConstantModifier
        = "public"
        | "static"
        | "final"
 ;
syntax FormalParameter
        = 
        "final"? Type VariableDeclaratorId
 ;
syntax PackageName
        = Identifier
        | PackageName "." Identifier
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
syntax BreakStatement
        = 
        "break" Identifier? ";"
 ;
syntax ConstructorModifier
        = "public"
        | "protected"
        | "private"
 ;
syntax SynchronizedStatement
        = 
        "synchronized" "(" Expression ")" Block
 ;
syntax ClassInstanceCreationExpression
        = "new" ClassOrInterfaceType "(" ArgumentList? ")" ClassBody?
        | Primary "." "new" Identifier "(" ArgumentList? ")" ClassBody?
 ;
syntax Super
        = 
        "extends" ClassType
 ;
syntax ArrayCreationExpression
        = "new" PrimitiveType DimExprs Dims?
        | "new" TypeName DimExprs Dims?
        | "new" PrimitiveType Dims ArrayInitializer
        | "new" TypeName Dims ArrayInitializer
 ;
syntax ArrayInitializer
        = 
        "{" VariableInitializers? ","? "}"
 ;
syntax InterfaceModifier
        = "public"
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
syntax EmptyStatement
        = 
        ";"
 ;
syntax StatementNoShortIf
        = StatementWithoutTrailingSubstatement
        | LabeledStatementNoShortIf
        | IfThenElseStatementNoShortIf
        | WhileStatementNoShortIf
        | ForStatementNoShortIf
 ;
syntax MethodInvocation
        = MethodName "(" ArgumentList? ")"
        | Primary "." Identifier "(" ArgumentList? ")"
        | "super" "." Identifier "(" ArgumentList? ")"
        | ClassName "." "super" "." Identifier "(" ArgumentList? ")"
 ;
syntax AbstractMethodDeclaration
        = 
        AbstractMethodModifiers? ResultType MethodDeclarator Throws? ";"
 ;
syntax IfThenElseStatement
        = 
        "if" "(" Expression ")" StatementNoShortIf "else" Statement
 ;
syntax ArrayAccess
        = ExpressionName "[" Expression "]"
        | PrimaryNoNewArray "[" Expression "]"
 ;
syntax ForUpdate
        = 
        StatementExpressionList
 ;
syntax ForInit
        = StatementExpressionList
        | LocalVariableDeclaration
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
        "package" PackageName ";"
 ;
syntax RelationalExpression
        = ShiftExpression
        | RelationalExpression "\<" ShiftExpression
        | RelationalExpression "\>" ShiftExpression
        | RelationalExpression "\<=" ShiftExpression
        | RelationalExpression "\>=" ShiftExpression
        | RelationalExpression "instanceof" ReferenceType
 ;
syntax WhileStatementNoShortIf
        = 
        "while" "(" Expression ")" StatementNoShortIf
 ;
syntax ExtendsInterfaces
        = "extends" InterfaceType
        | ExtendsInterfaces "," InterfaceType
 ;
syntax AbstractMethodModifier
        = "public"
        | "abstract"
 ;
syntax ConstantExpression
        = 
        Expression
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
syntax ConstructorDeclaration
        = 
        ConstructorModifiers? ConstructorDeclarator Throws? ConstructorBody
 ;
syntax TypeImportOnDemandDeclaration
        = 
        "import" PackageOrTypeName "." "*" ";"
 ;
syntax PreDecrementExpression
        = 
        "--" UnaryExpression
 ;
syntax InterfaceMemberDeclarations
        = InterfaceMemberDeclaration
        | InterfaceMemberDeclarations InterfaceMemberDeclaration
 ;
syntax ForStatement
        = 
        "for" "(" ForInit? ";" Expression? ";" ForUpdate? ")" Statement
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
 ;
syntax CompilationUnit
        = 
        PackageDeclaration? ImportDeclarations? TypeDeclarations?
 ;
syntax SwitchStatement
        = 
        "switch" "(" Expression ")" SwitchBlock
 ;
syntax Dims
        = "[" "]"
        | Dims "[" "]"
 ;
syntax ConditionalOrExpression
        = ConditionalAndExpression
        | ConditionalOrExpression "||" ConditionalAndExpression
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
syntax MethodModifier
        = "public"
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
syntax FormalParameterList
        = FormalParameter
        | FormalParameterList "," FormalParameter
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
syntax LocalVariableDeclaration
        = 
        "final"? Type VariableDeclarators
 ;
syntax ConstructorDeclarator
        = 
        Identifier "(" FormalParameterList? ")"
 ;
syntax InclusiveOrExpression
        = ExclusiveOrExpression
        | InclusiveOrExpression "|" ExclusiveOrExpression
 ;
syntax ClassType
        = 
        TypeName
 ;
syntax WhileStatement
        = 
        "while" "(" Expression ")" Statement
 ;
syntax ClassDeclaration
        = 
        ClassModifiers? "class" Identifier Super? Interfaces? ClassBody
 ;
syntax AssignmentExpression
        = ConditionalExpression
        | Assignment
 ;
syntax CastExpression
        = "(" PrimitiveType Dims? ")" UnaryExpression
        | "(" ReferenceType ")" UnaryExpressionNotPlusMinus
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
syntax NumericType
        = IntegralType
        | FloatingPointType
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
syntax ReferenceType
        = ClassOrInterfaceType
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
        MethodModifiers? ResultType MethodDeclarator Throws?
 ;
syntax LabeledStatementNoShortIf
        = 
        Identifier ":" StatementNoShortIf
 ;
syntax ConstantModifiers
        = ConstantModifier
        | ConstantModifiers ConstantModifier
 ;
syntax FieldAccess
        = Primary "." Identifier
        | "super" "." Identifier
        | ClassName "." "super" "." Identifier
 ;
syntax TypeDeclarations
        = TypeDeclaration
        | TypeDeclarations TypeDeclaration
 ;
syntax FieldModifier
        = "public"
        | "protected"
        | "private"
        | "static"
        | "final"
        | "transient"
        | "volatile"
 ;
syntax StatementWithoutTrailingSubstatement
        = Block
        | EmptyStatement
        | ExpressionStatement
        | SwitchStatement
        | DoStatement
        | BreakStatement
        | ContinueStatement
        | ReturnStatement
        | SynchronizedStatement
        | ThrowStatement
        | TryStatement
 ;
syntax DimExprs
        = DimExpr
        | DimExprs DimExpr
 ;
syntax InterfaceBody
        = 
        "{" InterfaceMemberDeclarations? "}"
 ;
syntax ClassBody
        = 
        "{" ClassBodyDeclarations? "}"
 ;
syntax Block
        = 
        "{" BlockStatements? "}"
 ;
syntax SwitchBlock
        = 
        "{" SwitchBlockStatementGroups? SwitchLabels? "}"
 ;
syntax ConstructorBody
        = 
        "{" ExplicitConstructorInvocation? BlockStatements? "}"
 ;
syntax ClassName
        = Identifier
        | AmbiguousName "." Identifier
 ;
