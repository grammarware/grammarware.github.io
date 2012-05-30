@contributor{bgf2src automated exporter - SLPS}
module Java_5_parr

syntax CompilationUnit
        = Annotations ((PackageDeclaration ImportDeclaration* TypeDeclaration*) | (ClassOrInterfaceDeclaration TypeDeclaration*))
        | PackageDeclaration? ImportDeclaration* TypeDeclaration*
 ;
syntax Annotations
        = 
        Annotation+
 ;
syntax Annotation
        = 
        "@" AnnotationName ("(" (ElementValuePairs | ElementValue)? ")")?
 ;
syntax AnnotationName
        = 
        Identifier ("." Identifier)*
 ;
syntax Identifier
        = 
        Letter (Letter | JavaIDDigit)*
 ;
syntax Letter
        = "a"
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
        | "A"
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
 ;
syntax JavaIDDigit
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
        | "A"
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
 ;
syntax ElementValuePairs
        = 
        ElementValuePair ("," ElementValuePair)*
 ;
syntax ElementValuePair
        = 
        Identifier "=" ElementValue
 ;
syntax ElementValue
        = ConditionalExpression
        | Annotation
        | ElementValueArrayInitializer
 ;
syntax ConditionalExpression
        = 
        ConditionalOrExpression ("?" Expression ":" Expression)?
 ;
syntax ConditionalOrExpression
        = 
        ConditionalAndExpression ("||" ConditionalAndExpression)*
 ;
syntax ConditionalAndExpression
        = 
        InclusiveOrExpression ("&&" InclusiveOrExpression)*
 ;
syntax InclusiveOrExpression
        = 
        ExclusiveOrExpression ("|" ExclusiveOrExpression)*
 ;
syntax ExclusiveOrExpression
        = 
        AndExpression ("^" AndExpression)*
 ;
syntax AndExpression
        = 
        EqualityExpression ("&" EqualityExpression)*
 ;
syntax EqualityExpression
        = 
        InstanceOfExpression (("==" | "!=") InstanceOfExpression)*
 ;
syntax InstanceOfExpression
        = 
        RelationalExpression ("instanceof" Type)?
 ;
syntax RelationalExpression
        = 
        ShiftExpression (RelationalOp ShiftExpression)*
 ;
syntax ShiftExpression
        = 
        AdditiveExpression (ShiftOp AdditiveExpression)*
 ;
syntax AdditiveExpression
        = 
        MultiplicativeExpression (("+" | "-") MultiplicativeExpression)*
 ;
syntax MultiplicativeExpression
        = 
        UnaryExpression (("*" | "/" | "%") UnaryExpression)*
 ;
syntax UnaryExpression
        = "+" UnaryExpression
        | "-" UnaryExpression
        | "++" UnaryExpression
        | "--" UnaryExpression
        | UnaryExpressionNotPlusMinus
 ;
syntax UnaryExpressionNotPlusMinus
        = "~" UnaryExpression
        | "!" UnaryExpression
        | CastExpression
        | Primary Selector* ("++" | "--")?
 ;
syntax CastExpression
        = "(" PrimitiveType ")" UnaryExpression
        | "(" (Type | Expression) ")" UnaryExpressionNotPlusMinus
 ;
syntax PrimitiveType
        = "boolean"
        | "char"
        | "byte"
        | "short"
        | "int"
        | "long"
        | "float"
        | "double"
 ;
syntax Type
        = ClassOrInterfaceType ("[" "]")*
        | PrimitiveType ("[" "]")*
 ;
syntax ClassOrInterfaceType
        = 
        Identifier TypeArguments? ("." Identifier TypeArguments?)*
 ;
syntax TypeArguments
        = 
        "\<" TypeArgument ("," TypeArgument)* "\>"
 ;
syntax TypeArgument
        = Type
        | "?" (("extends" | "super") Type)?
 ;
syntax Expression
        = 
        ConditionalExpression (AssignmentOperator Expression)?
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
        | "\<" t1 "\<" t2 "=" t3
        | "\>" t1 "\>" t2 "\>" t3 "="? t4
        | "\>" t1 "\>" t2 "=" t3
 ;
syntax Primary
        = ParExpression
        | "this" ("." Identifier)* IdentifierSuffix?
        | "super" SuperSuffix
        | Literal
        | "new" Creator
        | Identifier ("." Identifier)* IdentifierSuffix?
        | PrimitiveType ("[" "]")* "." "class"
        | "void" "." "class"
 ;
syntax ParExpression
        = 
        "(" Expression ")"
 ;
syntax IdentifierSuffix
        = ("[" "]")+ "." "class"
        | ("[" Expression "]")+
        | Arguments
        | "." "class"
        | "." ExplicitGenericInvocation
        | "." "this"
        | "." "super" Arguments
        | "." "new" InnerCreator
 ;
syntax Arguments
        = 
        "(" ExpressionList? ")"
 ;
syntax ExpressionList
        = 
        Expression ("," Expression)*
 ;
syntax ExplicitGenericInvocation
        = 
        NonWildcardTypeArguments Identifier Arguments
 ;
syntax NonWildcardTypeArguments
        = 
        "\<" TypeList "\>"
 ;
syntax TypeList
        = 
        Type ("," Type)*
 ;
syntax InnerCreator
        = 
        NonWildcardTypeArguments? Identifier ClassCreatorRest
 ;
syntax ClassCreatorRest
        = 
        Arguments ClassBody?
 ;
syntax ClassBody
        = 
        "{" ClassBodyDeclaration* "}"
 ;
syntax ClassBodyDeclaration
        = ";"
        | "static"? Block
        | Modifiers MemberDecl
 ;
syntax Block
        = 
        "{" BlockStatement* "}"
 ;
syntax BlockStatement
        = LocalVariableDeclarationStatement
        | ClassOrInterfaceDeclaration
        | Statement
 ;
syntax LocalVariableDeclarationStatement
        = 
        LocalVariableDeclaration ";"
 ;
syntax LocalVariableDeclaration
        = 
        VariableModifiers Type VariableDeclarators
 ;
syntax VariableModifiers
        = 
        VariableModifier*
 ;
syntax VariableModifier
        = "final"
        | Annotation
 ;
syntax VariableDeclarators
        = 
        VariableDeclarator ("," VariableDeclarator)*
 ;
syntax VariableDeclarator
        = 
        VariableDeclaratorId ("=" VariableInitializer)?
 ;
syntax VariableDeclaratorId
        = 
        Identifier ("[" "]")*
 ;
syntax VariableInitializer
        = ArrayInitializer
        | Expression
 ;
syntax ArrayInitializer
        = 
        "{" {VariableInitializer ","}* "}"
 ;
syntax ClassOrInterfaceDeclaration
        = 
        ClassOrInterfaceModifiers (ClassDeclaration | InterfaceDeclaration)
 ;
syntax ClassOrInterfaceModifiers
        = 
        ClassOrInterfaceModifier*
 ;
syntax ClassOrInterfaceModifier
        = Annotation
        | "public"
        | "protected"
        | "private"
        | "abstract"
        | "static"
        | "final"
        | "strictfp"
 ;
syntax ClassDeclaration
        = NormalClassDeclaration
        | EnumDeclaration
 ;
syntax NormalClassDeclaration
        = 
        "class" Identifier TypeParameters? ("extends" Type)? ("implements" TypeList)? ClassBody
 ;
syntax TypeParameters
        = 
        "\<" TypeParameter ("," TypeParameter)* "\>"
 ;
syntax TypeParameter
        = 
        Identifier ("extends" TypeBound)?
 ;
syntax TypeBound
        = 
        Type ("&" Type)*
 ;
syntax EnumDeclaration
        = 
        ENUM Identifier ("implements" TypeList)? EnumBody
 ;
syntax ENUM
        = 
        "enum"
 ;
syntax EnumBody
        = 
        "{" EnumConstants? ","? EnumBodyDeclarations? "}"
 ;
syntax EnumConstants
        = 
        EnumConstant ("," EnumConstant)*
 ;
syntax EnumConstant
        = 
        Annotations? Identifier Arguments? ClassBody?
 ;
syntax EnumBodyDeclarations
        = 
        ";" ClassBodyDeclaration*
 ;
syntax InterfaceDeclaration
        = NormalInterfaceDeclaration
        | AnnotationTypeDeclaration
 ;
syntax NormalInterfaceDeclaration
        = 
        "interface" Identifier TypeParameters? ("extends" TypeList)? InterfaceBody
 ;
syntax InterfaceBody
        = 
        "{" InterfaceBodyDeclaration* "}"
 ;
syntax InterfaceBodyDeclaration
        = Modifiers InterfaceMemberDecl
        | ";"
 ;
syntax Modifiers
        = 
        Modifier*
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
syntax InterfaceMemberDecl
        = InterfaceMethodOrFieldDecl
        | InterfaceGenericMethodDecl
        | "void" Identifier VoidInterfaceMethodDeclaratorRest
        | InterfaceDeclaration
        | ClassDeclaration
 ;
syntax InterfaceMethodOrFieldDecl
        = 
        Type Identifier InterfaceMethodOrFieldRest
 ;
syntax InterfaceMethodOrFieldRest
        = ConstantDeclaratorsRest ";"
        | InterfaceMethodDeclaratorRest
 ;
syntax ConstantDeclaratorsRest
        = 
        ConstantDeclaratorRest ("," ConstantDeclarator)*
 ;
syntax ConstantDeclaratorRest
        = 
        ("[" "]")* "=" VariableInitializer
 ;
syntax ConstantDeclarator
        = 
        Identifier ConstantDeclaratorRest
 ;
syntax InterfaceMethodDeclaratorRest
        = 
        FormalParameters ("[" "]")* ("throws" QualifiedNameList)? ";"
 ;
syntax FormalParameters
        = 
        "(" FormalParameterDecls? ")"
 ;
syntax FormalParameterDecls
        = 
        VariableModifiers Type FormalParameterDeclsRest
 ;
syntax FormalParameterDeclsRest
        = VariableDeclaratorId ("," FormalParameterDecls)?
        | "..." VariableDeclaratorId
 ;
syntax QualifiedNameList
        = 
        QualifiedName ("," QualifiedName)*
 ;
syntax QualifiedName
        = 
        Identifier ("." Identifier)*
 ;
syntax InterfaceGenericMethodDecl
        = 
        TypeParameters (Type | "void") Identifier InterfaceMethodDeclaratorRest
 ;
syntax VoidInterfaceMethodDeclaratorRest
        = 
        FormalParameters ("throws" QualifiedNameList)? ";"
 ;
syntax AnnotationTypeDeclaration
        = 
        "@" "interface" Identifier AnnotationTypeBody
 ;
syntax AnnotationTypeBody
        = 
        "{" AnnotationTypeElementDeclaration* "}"
 ;
syntax AnnotationTypeElementDeclaration
        = 
        Modifiers AnnotationTypeElementRest
 ;
syntax AnnotationTypeElementRest
        = Type AnnotationMethodOrConstantRest ";"
        | NormalClassDeclaration ";"?
        | NormalInterfaceDeclaration ";"?
        | EnumDeclaration ";"?
        | AnnotationTypeDeclaration ";"?
 ;
syntax AnnotationMethodOrConstantRest
        = AnnotationMethodRest
        | AnnotationConstantRest
 ;
syntax AnnotationMethodRest
        = 
        Identifier "(" ")" DefaultValue?
 ;
syntax DefaultValue
        = 
        "default" ElementValue
 ;
syntax AnnotationConstantRest
        = 
        VariableDeclarators
 ;
syntax Statement
        = Block
        | ASSERT Expression (":" Expression)? ";"
        | "if" ParExpression Statement ("else" Statement)?
        | "for" "(" ForControl ")" Statement
        | "while" ParExpression Statement
        | "do" Statement "while" ParExpression ";"
        | "try" Block ((Catches "finally" Block) | Catches | ("finally" Block))
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
syntax ASSERT
        = 
        "assert"
 ;
syntax ForControl
        = EnhancedForControl
        | ForInit? ";" Expression? ";" ForUpdate?
 ;
syntax EnhancedForControl
        = 
        VariableModifiers Type Identifier ":" Expression
 ;
syntax ForInit
        = LocalVariableDeclaration
        | ExpressionList
 ;
syntax ForUpdate
        = 
        ExpressionList
 ;
syntax Catches
        = 
        CatchClause CatchClause*
 ;
syntax CatchClause
        = 
        "catch" "(" FormalParameter ")" Block
 ;
syntax FormalParameter
        = 
        VariableModifiers Type VariableDeclaratorId
 ;
syntax SwitchBlockStatementGroups
        = 
        SwitchBlockStatementGroup*
 ;
syntax SwitchBlockStatementGroup
        = 
        SwitchLabel+ BlockStatement*
 ;
syntax SwitchLabel
        = "case" ConstantExpression ":"
        | "case" EnumConstantName ":"
        | "default" ":"
 ;
syntax ConstantExpression
        = 
        Expression
 ;
syntax EnumConstantName
        = 
        Identifier
 ;
syntax StatementExpression
        = 
        Expression
 ;
syntax MemberDecl
        = GenericMethodOrConstructorDecl
        | MemberDeclaration
        | "void" Identifier VoidMethodDeclaratorRest
        | Identifier ConstructorDeclaratorRest
        | InterfaceDeclaration
        | ClassDeclaration
 ;
syntax GenericMethodOrConstructorDecl
        = 
        TypeParameters GenericMethodOrConstructorRest
 ;
syntax GenericMethodOrConstructorRest
        = (Type | "void") Identifier MethodDeclaratorRest
        | Identifier ConstructorDeclaratorRest
 ;
syntax MethodDeclaratorRest
        = 
        FormalParameters ("[" "]")* ("throws" QualifiedNameList)? (MethodBody | ";")
 ;
syntax MethodBody
        = 
        Block
 ;
syntax ConstructorDeclaratorRest
        = 
        FormalParameters ("throws" QualifiedNameList)? ConstructorBody
 ;
syntax ConstructorBody
        = 
        "{" ExplicitConstructorInvocation? BlockStatement* "}"
 ;
syntax ExplicitConstructorInvocation
        = NonWildcardTypeArguments? ("this" | "super") Arguments ";"
        | Primary "." NonWildcardTypeArguments? "super" Arguments ";"
 ;
syntax MemberDeclaration
        = 
        Type (MethodDeclaration | FieldDeclaration)
 ;
syntax MethodDeclaration
        = 
        Identifier MethodDeclaratorRest
 ;
syntax FieldDeclaration
        = 
        VariableDeclarators ";"
 ;
syntax VoidMethodDeclaratorRest
        = 
        FormalParameters ("throws" QualifiedNameList)? (MethodBody | ";")
 ;
syntax SuperSuffix
        = Arguments
        | "." Identifier Arguments?
 ;
syntax Literal
        = IntegerLiteral
        | FloatingPointLiteral
        | CharacterLiteral
        | StringLiteral
        | BooleanLiteral
        | "null"
 ;
syntax IntegerLiteral
        = HexLiteral
        | OctalLiteral
        | DecimalLiteral
 ;
syntax HexLiteral
        = 
        "0" ("x" | "X") HexDigit+ IntegerTypeSuffix?
 ;
syntax HexDigit
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
        | "a"
        | "b"
        | "c"
        | "d"
        | "e"
        | "f"
        | "A"
        | "B"
        | "C"
        | "D"
        | "E"
        | "F"
 ;
syntax IntegerTypeSuffix
        = "l"
        | "L"
 ;
syntax OctalLiteral
        = 
        "0" ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")+ IntegerTypeSuffix?
 ;
syntax DecimalLiteral
        = 
        ("0" | (("1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*)) IntegerTypeSuffix?
 ;
syntax FloatingPointLiteral
        = ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* Exponent? FloatTypeSuffix?
        | "." ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ Exponent? FloatTypeSuffix?
        | ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ Exponent FloatTypeSuffix?
        | ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ FloatTypeSuffix
 ;
syntax Exponent
        = 
        ("e" | "E") ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax FloatTypeSuffix
        = "f"
        | "F"
        | "d"
        | "D"
 ;
syntax CharacterLiteral
        = 
        "\\'" (EscapeSequence | String) "\\'"
 ;
syntax EscapeSequence
        = "\\\\" ("b" | "t" | "n" | "f" | "r" | "\\\"" | "\\'" | "\\\\")
        | UnicodeEscape
        | OctalEscape
 ;
syntax UnicodeEscape
        = 
        "\\\\" "u" HexDigit HexDigit HexDigit HexDigit
 ;
syntax OctalEscape
        = "\\\\" ("0" | "1" | "2" | "3") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")
        | "\\\\" ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")
        | "\\\\" ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")
 ;
syntax StringLiteral
        = 
        "\"" (EscapeSequence | String)* "\""
 ;
syntax BooleanLiteral
        = "true"
        | "false"
 ;
syntax Creator
        = NonWildcardTypeArguments CreatedName ClassCreatorRest
        | CreatedName (ArrayCreatorRest | ClassCreatorRest)
 ;
syntax CreatedName
        = ClassOrInterfaceType
        | PrimitiveType
 ;
syntax ArrayCreatorRest
        = 
        "[" (("]" ("[" "]")* ArrayInitializer) | (Expression "]" ("[" Expression "]")* ("[" "]")*))
 ;
syntax Selector
        = "." Identifier Arguments?
        | "." "this"
        | "." "super" SuperSuffix
        | "." "new" InnerCreator
        | "[" Expression "]"
 ;
syntax ShiftOp
        = "\<" t1 "\<"? t2
        | "\>" t1 "\>" t2 "\>" t3
        | "\>" t1 "\>"? t2
 ;
syntax RelationalOp
        = "\<" t1 "="? t2
        | "\>" t1 "="? t2
        | "\<"
        | "\>"
 ;
syntax ElementValueArrayInitializer
        = 
        "{" {ElementValue ","}* ","? "}"
 ;
syntax PackageDeclaration
        = 
        "package" QualifiedName ";"
 ;
syntax ImportDeclaration
        = 
        "import" "static"? QualifiedName ("." "*")? ";"
 ;
syntax TypeDeclaration
        = ClassOrInterfaceDeclaration
        | ";"
 ;
