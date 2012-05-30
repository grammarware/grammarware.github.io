@contributor{bgf2src automated exporter - SLPS}
module Java_2_jls_impl

syntax ConstantExpression
        = 
        Expression
 ;
syntax PrefixOp
        = "++"
        | "--"
        | "!"
        | "~"
        | "+"
        | "-"
 ;
syntax SwitchLabel
        = "case" ConstantExpression ":"
        | "default" ":"
 ;
syntax VariableInitializer
        = ArrayInitializer
        | Expression
 ;
syntax InterfaceMemberDecl
        = InterfaceMethodOrFieldDecl
        | "void" Identifier VoidInterfaceMethodDeclaratorRest
        | ClassOrInterfaceDeclaration
 ;
syntax FormalParameter
        = 
        "final"? Type VariableDeclaratorId
 ;
syntax TypeDeclaration
        = ClassOrInterfaceDeclaration
        | ";"
 ;
syntax MethodOrFieldDecl
        = 
        Type Identifier MethodOrFieldRest
 ;
syntax ConstantDeclaratorRest
        = 
        BracketsOpt "=" VariableInitializer
 ;
syntax StatementExpression
        = 
        Expression
 ;
syntax InterfaceDeclaration
        = 
        "interface" Identifier ("extends" TypeList)? InterfaceBody
 ;
syntax QualifiedIdentifierList
        = 
        QualifiedIdentifier ("," QualifiedIdentifier)*
 ;
syntax Arguments
        = 
        "(" {Expression ","}* ")"
 ;
syntax Statement
        = Block
        | "if" ParExpression Statement ("else" Statement)?
        | "for" "(" ForInit? ";" Expression? ";" ForUpdate? ")" Statement
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
        | ExpressionStatement
        | Identifier ":" Statement
 ;
syntax VariableDeclaratorId
        = 
        Identifier BracketsOpt
 ;
syntax Type
        = Identifier ("." Identifier)* BracketsOpt
        | BasicType
 ;
syntax ArrayCreatorRest
        = 
        "[" (("]" BracketsOpt ArrayInitializer) | (Expression "]" ("[" Expression "]")* BracketsOpt))
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
        | "strictfp"
 ;
syntax InterfaceMethodOrFieldDecl
        = 
        Type Identifier InterfaceMethodOrFieldRest
 ;
syntax ImportDeclaration
        = 
        "import" Identifier ("." Identifier)* ("." "*")? ";"
 ;
syntax CompilationUnit
        = 
        ("package" QualifiedIdentifier ";")? ImportDeclaration* TypeDeclaration*
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
syntax CatchClause
        = 
        "catch" "(" FormalParameter ")" Block
 ;
syntax Selector
        = "." Identifier Arguments?
        | "." "this"
        | "." "super" SuperSuffix
        | "." "new" InnerCreator
        | "[" Expression "]"
 ;
syntax ModifiersOpt
        = 
        Modifier*
 ;
syntax ClassCreatorRest
        = 
        Arguments ClassBody?
 ;
syntax ConstantDeclarator
        = 
        Identifier ConstantDeclaratorRest
 ;
syntax ClassBodyDeclaration
        = ";"
        | "static"? Block
        | ModifiersOpt MemberDecl
 ;
syntax BlockStatements
        = 
        BlockStatement*
 ;
syntax VoidInterfaceMethodDeclaratorRest
        = 
        FormalParameters BracketsOpt ("throws" QualifiedIdentifierList)? ";"
 ;
syntax LocalVariableDeclarationStatement
        = 
        "final"? Type VariableDeclarators ";"
 ;
syntax Expression1
        = 
        Expression2 Expression1Rest?
 ;
syntax MemberDecl
        = MethodOrFieldDecl
        | "void" Identifier MethodDeclaratorRest
        | Identifier ConstructorDeclaratorRest
        | ClassOrInterfaceDeclaration
 ;
syntax Expression3
        = PrefixOp Expression3
        | "(" (Expression | Type) ")" Expression3
        | Primary Selector* PostfixOp*
 ;
syntax Expression2
        = 
        Expression3 Expression2Rest?
 ;
syntax BracketsOpt
        = 
        ("[" "]")*
 ;
syntax MethodOrFieldRest
        = VariableDeclaratorRest
        | MethodDeclaratorRest
 ;
syntax MoreStatementExpressions
        = 
        ("," StatementExpression)*
 ;
syntax SwitchBlockStatementGroups
        = 
        SwitchBlockStatementGroup*
 ;
syntax ArrayInitializer
        = 
        "{" {VariableInitializer ","}* "}"
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
        ("?" Expression ":" Expression1)?
 ;
syntax Infixop
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
syntax MethodDeclaratorRest
        = 
        FormalParameters BracketsOpt ("throws" QualifiedIdentifierList)? (MethodBody | ";")
 ;
syntax InterfaceBodyDeclaration
        = ";"
        | ModifiersOpt InterfaceMemberDecl
 ;
syntax QualifiedIdentifier
        = 
        Identifier ("." Identifier)*
 ;
syntax ConstantDeclaratorsRest
        = 
        ConstantDeclaratorRest ("," ConstantDeclarator)*
 ;
syntax ClassOrInterfaceDeclaration
        = 
        ModifiersOpt (ClassDeclaration | InterfaceDeclaration)
 ;
syntax SuperSuffix
        = Arguments
        | "." Identifier Arguments?
 ;
syntax VariableDeclaratorRest
        = 
        BracketsOpt ("=" VariableInitializer)?
 ;
syntax BlockStatement
        = LocalVariableDeclarationStatement
        | ClassOrInterfaceDeclaration
        | (Identifier ":")? Statement
 ;
syntax InterfaceBody
        = 
        "{" InterfaceBodyDeclaration* "}"
 ;
syntax Literal
        = IntegerLiteral
        | FloatingPointLiteral
        | CharacterLiteral
        | StringLiteral
        | BooleanLiteral
        | NullLiteral
 ;
syntax Expression
        = 
        Expression1 (AssignmentOperator Expression1)?
 ;
syntax SwitchBlockStatementGroup
        = 
        SwitchLabel BlockStatements
 ;
syntax Block
        = 
        "{" BlockStatements "}"
 ;
syntax PostfixOp
        = "++"
        | "--"
 ;
syntax InterfaceMethodDeclaratorRest
        = 
        FormalParameters BracketsOpt ("throws" QualifiedIdentifierList)? ";"
 ;
syntax IdentifierSuffix
        = "[" (("]" BracketsOpt "." "class") | (Expression "]"))
        | Arguments
        | "." ("class" | "this" | ("super" Arguments) | ("new" InnerCreator))
 ;
syntax ForUpdate
        = 
        StatementExpression MoreStatementExpressions
 ;
syntax ForInit
        = StatementExpression MoreStatementExpressions
        | "final"? Type VariableDeclarators
 ;
syntax Creator
        = 
        QualifiedIdentifier (ArrayCreatorRest | ClassCreatorRest)
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
syntax VariableDeclarators
        = 
        VariableDeclarator ("," VariableDeclarator)*
 ;
syntax ClassBody
        = 
        "{" ClassBodyDeclaration* "}"
 ;
syntax Primary
        = "(" Expression ")"
        | "this" Arguments?
        | "super" SuperSuffix
        | Literal
        | "new" Creator
        | Identifier ("." Identifier)* IdentifierSuffix?
        | BasicType BracketsOpt "." "class"
        | "void" "." "class"
 ;
syntax ConstructorDeclaratorRest
        = 
        FormalParameters ("throws" QualifiedIdentifierList)? MethodBody
 ;
syntax FormalParameters
        = 
        "(" {FormalParameter ","}* ")"
 ;
syntax TypeList
        = 
        Type ("," Type)*
 ;
syntax MethodBody
        = 
        Block
 ;
syntax ClassDeclaration
        = 
        "class" Identifier ("extends" Type)? ("implements" TypeList)? ClassBody
 ;
syntax Expression2Rest
        = (Infixop Expression3)*
        | "instanceof" Type
 ;
syntax InnerCreator
        = 
        Identifier ClassCreatorRest
 ;
syntax VariableDeclarator
        = 
        Identifier VariableDeclaratorRest
 ;
syntax ExpressionStatement
        = 
        StatementExpression ";"
 ;
