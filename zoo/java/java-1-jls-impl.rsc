@contributor{bgf2src automated exporter - SLPS}
module Java_1_jls_impl

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
        Modifiers? "interface" Identifier ExtendsInterfaces? InterfaceBody
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
syntax ConstructorBody
        = 
        "{" ExplicitConstructorInvocation? BlockStatements? "}"
 ;
syntax ArgumentList
        = Expression
        | ArgumentList "," Expression
 ;
syntax ClassMemberDeclaration
        = FieldDeclaration
        | MethodDeclaration
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
syntax PostIncrementExpression
        = 
        PostfixExpression "++"
 ;
syntax InterfaceType
        = 
        ClassOrInterfaceType
 ;
syntax BlockStatement
        = LocalVariableDeclarationStatement
        | Statement
 ;
syntax SwitchBlockStatementGroups
        = SwitchBlockStatementGroup
        | SwitchBlockStatementGroups SwitchBlockStatementGroup
 ;
syntax SingleTypeImportDeclaration
        = 
        "import" Name ";"
 ;
syntax ConditionalExpression
        = ConditionalOrExpression
        | ConditionalOrExpression "?" Expression ":" ConditionalExpression
 ;
syntax PreIncrementExpression
        = 
        "++" UnaryExpression
 ;
syntax ExplicitConstructorInvocation
        = "this" "(" ArgumentList? ")" ";"
        | "super" "(" ArgumentList? ")" ";"
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
syntax ConstantDeclaration
        = 
        FieldDeclaration
 ;
syntax ClassTypeList
        = ClassType
        | ClassTypeList "," ClassType
 ;
syntax PrimaryNoNewArray
        = Literal
        | "this"
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
syntax Finally
        = 
        "finally" Block
 ;
syntax EmptyStatement
        = 
        ";"
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
        | Name
        | PostIncrementExpression
        | PostDecrementExpression
 ;
syntax SwitchLabel
        = "case" ConstantExpression ":"
        | "default" ":"
 ;
syntax AssignmentExpression
        = ConditionalExpression
        | Assignment
 ;
syntax FormalParameter
        = 
        Type VariableDeclaratorId
 ;
syntax ConditionalAndExpression
        = InclusiveOrExpression
        | ConditionalAndExpression "&&" InclusiveOrExpression
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
syntax IfThenStatement
        = 
        "if" "(" Expression ")" Statement
 ;
syntax SynchronizedStatement
        = 
        "synchronized" "(" Expression ")" Block
 ;
syntax ClassInstanceCreationExpression
        = 
        "new" ClassType "(" ArgumentList? ")"
 ;
syntax Super
        = 
        "extends" ClassType
 ;
syntax ArrayCreationExpression
        = "new" PrimitiveType DimExprs Dims?
        | "new" ClassOrInterfaceType DimExprs Dims?
 ;
syntax ArrayInitializer
        = 
        "{" VariableInitializers? ","? "}"
 ;
syntax UnaryExpressionNotPlusMinus
        = PostfixExpression
        | "~" UnaryExpression
        | "!" UnaryExpression
        | CastExpression
 ;
syntax SwitchBlock
        = 
        "{" SwitchBlockStatementGroups? SwitchLabels? "}"
 ;
syntax FieldDeclaration
        = 
        Modifiers? Type VariableDeclarators ";"
 ;
syntax StatementNoShortIf
        = StatementWithoutTrailingSubstatement
        | LabeledStatementNoShortIf
        | IfThenElseStatementNoShortIf
        | WhileStatementNoShortIf
        | ForStatementNoShortIf
 ;
syntax MethodInvocation
        = Name "(" ArgumentList? ")"
        | Primary "." Identifier "(" ArgumentList? ")"
        | "super" "." Identifier "(" ArgumentList? ")"
 ;
syntax AbstractMethodDeclaration
        = 
        MethodHeader ";"
 ;
syntax IfThenElseStatement
        = 
        "if" "(" Expression ")" StatementNoShortIf "else" Statement
 ;
syntax ArrayAccess
        = Name "[" Expression "]"
        | PrimaryNoNewArray "[" Expression "]"
 ;
syntax Modifier
        = "public"
        | "protected"
        | "private"
        | "static"
        | "abstract"
        | "final"
        | "native"
        | "synchronized"
        | "transient"
        | "volatile"
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
        "package" Name ";"
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
syntax Literal
        = IntegerLiteral
        | FloatingPointLiteral
        | BooleanLiteral
        | CharacterLiteral
        | StringLiteral
        | NullLiteral
 ;
syntax ConstructorDeclaration
        = 
        Modifiers? ConstructorDeclarator Throws? ConstructorBody
 ;
syntax TypeImportOnDemandDeclaration
        = 
        "import" Name "." "*" ";"
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
syntax ContinueStatement
        = 
        "continue" Identifier? ";"
 ;
syntax ImportDeclaration
        = SingleTypeImportDeclaration
        | TypeImportOnDemandDeclaration
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
syntax ConditionalOrExpression
        = ConditionalAndExpression
        | ConditionalOrExpression "||" ConditionalAndExpression
 ;
syntax ClassBodyDeclaration
        = ClassMemberDeclaration
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
syntax Catches
        = CatchClause
        | Catches CatchClause
 ;
syntax Modifiers
        = Modifier
        | Modifiers Modifier
 ;
syntax DoStatement
        = 
        "do" Statement "while" "(" Expression ")" ";"
 ;
syntax ClassOrInterfaceType
        = 
        Name
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
        Type VariableDeclarators
 ;
syntax ConstructorDeclarator
        = 
        SimpleName "(" FormalParameterList? ")"
 ;
syntax InclusiveOrExpression
        = ExclusiveOrExpression
        | InclusiveOrExpression "|" ExclusiveOrExpression
 ;
syntax ClassType
        = 
        ClassOrInterfaceType
 ;
syntax WhileStatement
        = 
        "while" "(" Expression ")" Statement
 ;
syntax ClassDeclaration
        = 
        Modifiers? "class" Identifier Super? Interfaces? ClassBody
 ;
syntax CastExpression
        = "(" PrimitiveType Dims? ")" UnaryExpression
        | "(" Expression ")" UnaryExpressionNotPlusMinus
        | "(" Name Dims ")" UnaryExpressionNotPlusMinus
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
syntax ArrayType
        = PrimitiveType "[" "]"
        | Name "[" "]"
        | ArrayType "[" "]"
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
syntax QualifiedName
        = 
        Name "." Identifier
 ;
syntax NumericType
        = IntegralType
        | FloatingPointType
 ;
syntax LeftHandSide
        = Name
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
syntax MethodBody
        = Block
        | ";"
 ;
syntax Name
        = SimpleName
        | QualifiedName
 ;
syntax SimpleName
        = 
        Identifier
 ;
syntax ReferenceType
        = ClassOrInterfaceType
        | ArrayType
 ;
syntax CompilationUnit
        = 
        PackageDeclaration? ImportDeclarations? TypeDeclarations?
 ;
syntax ForStatementNoShortIf
        = 
        "for" "(" ForInit? ";" Expression? ";" ForUpdate? ")" StatementNoShortIf
 ;
syntax MethodHeader
        = Modifiers? Type MethodDeclarator Throws?
        | Modifiers? "void" MethodDeclarator Throws?
 ;
syntax LabeledStatementNoShortIf
        = 
        Identifier ":" StatementNoShortIf
 ;
syntax InterfaceBody
        = 
        "{" InterfaceMemberDeclarations? "}"
 ;
syntax FieldAccess
        = Primary "." Identifier
        | "super" "." Identifier
 ;
syntax TypeDeclarations
        = TypeDeclaration
        | TypeDeclarations TypeDeclaration
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
