@contributor{bgf2src automated exporter - SLPS}
module Spec_0_05

syntax VariableDeclaration
        = 
        DeclaredIdentifier ("," Identifier)*
 ;
syntax InitializedVariableDeclaration
        = 
        DeclaredIdentifier ("=" Expression)? ("," InitializedIdentifier)*
 ;
syntax InitializedIdentifier
        = 
        Identifier ("=" Expression)?
 ;
syntax DeclaredIdentifier
        = 
        FinalVarOrType Identifier
 ;
syntax FinalVarOrType
        = "final" Type?
        | "var"
        | Type
 ;
syntax FunctionSignature
        = 
        ReturnType? Identifier FormalParameterList
 ;
syntax ReturnType
        = "void"
        | Type
 ;
syntax FunctionBody
        = "=\>" Expression ";"
        | Block
 ;
syntax Block
        = 
        "{" Statements "}"
 ;
syntax FormalParameterList
        = "(" ")"
        | "(" NormalFormalParameters ("," NamedFormalParameters)? ")"
        | "(" NamedFormalParameters ")"
 ;
syntax NormalFormalParameters
        = 
        NormalFormalParameter ("," NormalFormalParameter)*
 ;
syntax NamedFormalParameters
        = 
        "[" DefaultFormalParameter ("," DefaultFormalParameter)* "]"
 ;
syntax NormalFormalParameter
        = FunctionSignature
        | FieldFormalParameter
        | SimpleFormalParameter
 ;
syntax SimpleFormalParameter
        = DeclaredIdentifier
        | Identifier
 ;
syntax FieldFormalParameter
        = 
        FinalVarOrType? "this" "." Identifier
 ;
syntax DefaultFormalParameter
        = 
        NormalFormalParameter ("=" ConstantExpression)?
 ;
syntax ClassDefinition
        = 
        "class" Identifier TypeParameters? Superclass? Interfaces? "{" ClassMemberDefinition* "}"
 ;
syntax ClassMemberDefinition
        = Declaration ";"
        | MethodSignature FunctionBody
 ;
syntax MethodSignature
        = FactoryConstructorSignature
        | "static" FunctionSignature
        | GetterSignature
        | SetterSignature
        | OperatorSignature
        | FunctionSignature Initializers?
        | NamedConstructorSignature Initializers?
 ;
syntax Declaration
        = ConstantConstructorSignature (Redirection | Initializers)?
        | FunctionSignature Redirection
        | NamedConstructorSignature Redirection
        | "abstract" GetterSignature
        | "abstract" SetterSignature
        | "abstract" OperatorSignature
        | "abstract" FunctionSignature
        | "static" "final" Type? StaticFinalDeclarationList
        | "static"? InitializedVariableDeclaration
 ;
syntax StaticFinalDeclarationList
        = 
        StaticFinalDeclaration ("," StaticFinalDeclaration)*
 ;
syntax OperatorSignature
        = 
        ReturnType? Operator Operator FormalParameterList
 ;
syntax Operator
        = UnaryOperator
        | BinaryOperator
        | "[" "]"
        | "[" "]" "="
        | "negate"
 ;
syntax UnaryOperator
        = 
        NegateOperator
 ;
syntax BinaryOperator
        = MultiplicativeOperator
        | AdditiveOperator
        | ShiftOperator
        | RelationalOperator
        | EqualityOperator
        | BitwiseOperator
 ;
syntax PrefixOperator
        = "-"
        | NegateOperator
 ;
syntax NegateOperator
        = "!"
        | "~"
 ;
syntax GetterSignature
        = 
        "static"? ReturnType? "get" Identifier FormalParameterList
 ;
syntax SetterSignature
        = 
        "static"? ReturnType? "set" Identifier FormalParameterList
 ;
syntax ConstructorSignature
        = Identifier FormalParameterList
        | NamedConstructorSignature
 ;
syntax NamedConstructorSignature
        = 
        Identifier "." Identifier FormalParameterList
 ;
syntax Redirection
        = 
        ":" "this" ("." Identifier)? Arguments
 ;
syntax Initializers
        = 
        ":" SuperCallOrFieldInitializer ("," SuperCallOrFieldInitializer)*
 ;
syntax SuperCallOrFieldInitializer
        = "super" Arguments
        | "super" "." Identifier Arguments
        | FieldInitializer
 ;
syntax FieldInitializer
        = 
        ("this" ".")? Identifier "=" ConditionalExpression
 ;
syntax FactoryConstructorSignature
        = 
        "factory" Qualified TypeParameters? ("." Identifier)? FormalParameterList
 ;
syntax ConstantConstructorSignature
        = 
        "const" Qualified FormalParameterList
 ;
syntax Superclass
        = 
        "extends" Type
 ;
syntax Interfaces
        = 
        "implements" TypeList
 ;
syntax InterfaceDefinition
        = 
        "interface" Identifier TypeParameters? Superinterfaces? FactorySpecification? "{" InterfaceMemberDefinition* "}"
 ;
syntax InterfaceMemberDefinition
        = "static" "final" Type? InitializedIdentifierList ";"
        | FunctionSignature ";"
        | ConstantConstructorSignature ";"
        | NamedConstructorSignature ";"
        | GetterSignature ";"
        | SetterSignature ";"
        | OperatorSignature ";"
        | VariableDeclaration ";"
 ;
syntax FactorySpecification
        = 
        "factory" Qualified TypeParameters?
 ;
syntax Superinterfaces
        = 
        "extends" TypeList
 ;
syntax TypeParameter
        = 
        Identifier ("extends" Type)?
 ;
syntax TypeParameters
        = 
        "\<" TypeParameter ("," TypeParameter)* "\>"
 ;
syntax Expression
        = AssignableExpression AssignmentOperator Expression
        | ConditionalExpression
 ;
syntax ExpressionList
        = 
        Expression ("," Expression)*
 ;
syntax Primary
        = ThisExpression
        | "super" AssignableSelector
        | FunctionExpression
        | Literal
        | Identifier
        | NewExpression
        | ConstantObjectExpression
        | "(" Expression ")"
 ;
syntax Literal
        = NullLiteral
        | BooleanLiteral
        | NumericLiteral
        | StringLiteral
        | MapLiteral
        | ListLiteral
 ;
syntax NullLiteral
        = 
        "null"
 ;
syntax NumericLiteral
        = NUMBER
        | HEX_NUMBER
 ;
syntax NUMBER
        = "+"? DIGIT+ ("." DIGIT+)? EXPONENT?
        | "+"? "." DIGIT+ EXPONENT?
 ;
syntax EXPONENT
        = 
        ("e" | "E") ("+" | "-")? DIGIT+
 ;
syntax HEX_NUMBER
        = "0x" HEX_DIGIT+
        | "0X" HEX_DIGIT+
 ;
syntax HEX_DIGIT
        = "a" "." "." "f"
        | "A" "." "." "F"
        | DIGIT
 ;
syntax BooleanLiteral
        = "true"
        | "false"
 ;
syntax StringLiteral
        = "@"? MULTI_LINE_STRING
        | SINGLE_LINE_STRING
 ;
syntax SINGLE_LINE_STRING
        = "\"" STRING_CONTENT_DQ* "\""
        | "'" STRING_CONTENT_SQ* "'"
        | "@' ' ' " ("~" ("'" | NEWLINE))* "'"
        | "@" "\"" ("~" ("\"" | NEWLINE))* "\""
 ;
syntax MULTI_LINE_STRING
        = "\"\"\"" ("~" "\"\"\"")* "\"\"\""
        | "'''" ("~" "'''")* "'''"
 ;
syntax ESCAPE_SEQUENCE
        = "\\n"
        | "\\r"
        | "\\f"
        | "\\b"
        | "\\t"
        | "\\v"
        | "\\x" HEX_DIGIT HEX_DIGIT
        | "\\u" HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
        | "\\u{" HEX_DIGIT_SEQUENCE "}"
 ;
syntax HEX_DIGIT_SEQUENCE
        = 
        HEX_DIGIT HEX_DIGIT? HEX_DIGIT? HEX_DIGIT? HEX_DIGIT? HEX_DIGIT? HEX_DIGIT?
 ;
syntax STRING_CONTENT_DQ
        = "~" ("\\\\" | "  \"  " | "$" | NEWLINE)
        | "\\\\" "~" NEWLINE
        | STRING_INTERPOLATION
 ;
syntax STRING_CONTENT_SQ
        = "~" ("\\\\" | "\\'" | "$" | NEWLINE)
        | "\\\\" "~" NEWLINE
        | STRING_INTERPOLATION
 ;
syntax NEWLINE
        = "\\n"
        | "\\r"
 ;
syntax STRING_INTERPOLATION
        = "$" IDENTIFIER_NO_DOLLAR
        | "$" "{" "Expression" "}"
 ;
syntax ListLiteral
        = 
        "const"? TypeArguments? "[" (ExpressionList ","?)? "]"
 ;
syntax MapLiteral
        = 
        "const"? TypeArguments? "{" {MapLiteralEntry ","}* "}"
 ;
syntax MapLiteralEntry
        = Identifier ":" Expression
        | StringLiteral ":" Expression
 ;
syntax FunctionExpression
        = 
        (ReturnType? Identifier)? FormalParameterList FunctionExpressionBody
 ;
syntax FunctionExpressionBody
        = "=\>" Expression
        | Block
 ;
syntax ThisExpression
        = 
        "this"
 ;
syntax NewExpression
        = 
        "new" Type ("." Identifier)? Arguments
 ;
syntax ConstObjectExpression
        = 
        "const" Type ("." Identifier)? Arguments
 ;
syntax Arguments
        = 
        "(" ArgumentList? ")"
 ;
syntax ArgumentList
        = NamedArgument ("," NamedArgument)*
        | ExpressionList ("," NamedArgument)*
 ;
syntax NamedArgument
        = 
        Label Expression
 ;
syntax AssignmentOperator
        = "="
        | CompoundAssignmentOperator
 ;
syntax CompoundAssignmentOperator
        = "*="
        | "/="
        | "~/="
        | "%="
        | "+="
        | "-="
        | "\<\<="
        | "\>\>\>="
        | "\>\>="
        | "&="
        | "^="
        | "|="
 ;
syntax ConditionalExpression
        = 
        LogicalOrExpression ("?" Expression ":" Expression)?
 ;
syntax LogicalOrExpression
        = 
        LogicalAndExpression ("||" LogicalAndExpression)*
 ;
syntax LogicalAndExpression
        = 
        BitwiseOrExpression ("&&" BitwiseOrExpression)*
 ;
syntax BitwiseOrExpression
        = BitwiseXorExpression ("|" BitwiseXorExpression)*
        | "super" ("|" BitwiseXorExpression)+
 ;
syntax BitwiseXorExpression
        = BitwiseAndExpression ("^" BitwiseAndExpression)*
        | "super" ("^" BitwiseAndExpression)+
 ;
syntax BitwiseAndExpression
        = EqualityExpression ("&" EqualityExpression)*
        | "super" ("&" EqualityExpression)+
 ;
syntax BitwiseOperator
        = "&"
        | "^"
        | "|"
 ;
syntax EqualityExpression
        = RelationalExpression (EqualityOperator RelationalExpression)?
        | "super" EqualityOperator RelationalExpression
 ;
syntax EqualityOperator
        = "=="
        | "!="
        | "==="
        | "!=="
 ;
syntax RelationalExpression
        = ShiftExpression ((IsOperator Type) | (RelationalOperator ShiftExpression))?
        | "super" RelationalOperator ShiftExpression
 ;
syntax RelationalOperator
        = "\>="
        | "\>"
        | "\<="
        | "\<"
 ;
syntax ShiftExpression
        = AdditiveExpression (ShiftOperator AdditiveExpression)*
        | "super" (ShiftOperator AdditiveExpression)+
 ;
syntax ShiftOperator
        = "\<\<"
        | "\>\>\>"
        | "\>\>"
 ;
syntax AdditiveExpression
        = MultiplicativeExpression (AdditiveOperator MultiplicativeExpression)*
        | "super" (AdditiveOperator MultiplicativeExpression)+
 ;
syntax AdditiveOperator
        = "+"
        | "-"
 ;
syntax MultiplicativeExpression
        = UnaryExpression (MultiplicativeOperator UnaryExpression)*
        | "super" (MultiplicativeOperator UnaryExpression)+
 ;
syntax MultiplicativeOperator
        = "*"
        | "/"
        | "%"
        | "~/"
 ;
syntax UnaryExpression
        = PrefixOperator UnaryExpression
        | PostfixExpression
        | UnaryOperator "super"
        | "-" "super"
        | IncrementOperator AssignableExpression
 ;
syntax PostfixExpression
        = AssignableExpression PostfixOperator
        | Primary Selector*
 ;
syntax PostfixOperator
        = 
        IncrementOperator
 ;
syntax IncrementOperator
        = "++"
        | "--"
 ;
syntax AssignableExpression
        = Primary (Arguments* AssignableSelector)+
        | "super" AssignableSelector
        | Identifier
 ;
syntax Selector
        = AssignableSelector
        | Arguments
 ;
syntax AssignableSelector
        = "[" Expression "]"
        | "." Identifier
 ;
syntax Identifier
        = IDENTIFIER_NO_DOLLAR
        | IDENTIFIER
        | BUILT_IN_IDENTIFIER
 ;
syntax IDENTIFIER_NO_DOLLAR
        = 
        IDENTIFIER_START_NO_DOLLAR IDENTIFIER_PART_NO_DOLLAR*
 ;
syntax IDENTIFIER
        = 
        IDENTIFIER_START IDENTIFIER_PART*
 ;
syntax BUILT_IN_IDENTIFIER
        = "abstract"
        | "assert"
        | "Dynamic"
        | "factory"
        | "get"
        | "implements"
        | Import
        | "interface"
        | "library"
        | "negate"
        | Operator
        | "set"
        | "source"
        | "static"
        | "typedef"
 ;
syntax IDENTIFIER_START
        = IDENTIFIER_START_NO_DOLLAR
        | "$"
 ;
syntax IDENTIFIER_START_NO_DOLLAR
        = "LETTER"
        | "_"
 ;
syntax IDENTIFIER_PART_NO_DOLLAR
        = IDENTIFIER_START_NO_DOLLAR
        | DIGIT
 ;
syntax IDENTIFIER_PART
        = IDENTIFIER_START
        | DIGIT
 ;
syntax Qualified
        = 
        Identifier ("." Identifier)?
 ;
syntax IsOperator
        = 
        "is" "!"?
 ;
syntax Statements
        = 
        Statement*
 ;
syntax Statement
        = 
        Label* NonLabelledStatement
 ;
syntax NonLabelledStatement
        = Block
        | InitializedVariableDeclaration ";"
        | ForStatement
        | WhileStatement
        | DoStatement
        | SwitchStatement
        | IfStatement
        | TryStatement
        | BreakStatement
        | ContinueStatement
        | ReturnStatement
        | ThrowStatement
        | ExpressionStatement
        | AssertStatement
        | FunctionSignature FunctionBody
 ;
syntax ExpressionStatement
        = 
        Expression? ";"
 ;
syntax IfStatement
        = 
        "if" "(" Expression ")" Statement ("else" Statement)?
 ;
syntax ForStatement
        = 
        "for" "(" ForLoopParts ")" Statement
 ;
syntax ForLoopParts
        = ForInitializerStatement Expression? ";" ExpressionList?
        | DeclaredIdentifier "in" Expression
        | Identifier "in" Expression
 ;
syntax ForInitializerStatement
        = InitializedVariableDeclaration ";"
        | Expression? ";"
 ;
syntax WhileStatement
        = 
        "while" "(" Expression ")" Statement
 ;
syntax DoStatement
        = 
        "do" Statement "while" "(" Expression ")" ";"
 ;
syntax SwitchStatement
        = 
        "switch" "(" Expression ")" "{" SwitchCase* DefaultCase? "}"
 ;
syntax SwitchCase
        = 
        Label? ("case" Expression ":")+ Statements
 ;
syntax DefaultCase
        = 
        Label? ("case" Expression ":")* "default" ":" Statements
 ;
syntax TryStatement
        = 
        "try" Block ((CatchPart+ FinallyPart?) | FinallyPart)
 ;
syntax CatchPart
        = 
        "catch" "(" SimpleFormalParameter ("," SimpleFormalParameter)? ")" Block
 ;
syntax FinallyPart
        = 
        "finally" Block
 ;
syntax ReturnStatement
        = 
        "return" Expression? ";"
 ;
syntax Label
        = 
        Identifier ":"
 ;
syntax BreakStatement
        = 
        "break" Identifier? ";"
 ;
syntax ContinueStatement
        = 
        "continue" Identifier? ";"
 ;
syntax ThrowStatement
        = 
        "throw" Expression? ";"
 ;
syntax AssertStatement
        = 
        "assert" "(" ConditionalExpression ")" ";"
 ;
syntax TopLevelDefinition
        = ClassDefinition
        | InterfaceDefinition
        | FunctionTypeAlias
        | FunctionSignature FunctionBody
        | ReturnType? GetOrSet Identifier FormalParameterList FunctionBody
        | "final" Type? StaticFinalDeclarationList ";"
        | VariableDeclaration ";"
 ;
syntax GetOrSet
        = "get"
        | "set"
 ;
syntax LibraryDefinition
        = 
        ScriptTag? LibraryName Import* Include* Resource* TopLevelDefinition*
 ;
syntax ScriptTag
        = 
        "#!" ("~" NEWLINE)* NEWLINE
 ;
syntax LibraryName
        = 
        "#" "library" "(" StringLiteral ")" ";"
 ;
syntax Resource
        = 
        "#" "resource" "(" StringLiteral ")" ";"
 ;
syntax Import
        = 
        "#" "import" "(" StringLiteral ("," "prefix:" StringLiteral)? ")" ";"
 ;
syntax Include
        = 
        "#" "source" "(" StringLiteral ")" ";"
 ;
syntax CompilationUnit
        = 
        TopLevelDefinition* EOF
 ;
syntax ScriptDefinition
        = 
        ScriptTag? LibraryName? Import* Include* Resource* TopLevelDefinition*
 ;
syntax Type
        = 
        Qualified TypeArguments?
 ;
syntax TypeArguments
        = 
        "\<" TypeList "\>"
 ;
syntax TypeList
        = 
        Type ("," Type)*
 ;
syntax FunctionTypeAlias
        = 
        "typedef" FunctionPrefix TypeParameters? FormalParameterList ";"
 ;
syntax FunctionPrefix
        = 
        ReturnType? Identifier
 ;
syntax DIGIT
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
syntax WHITESPACE
        = 
        ("\\t" | " " | NEWLINE)+
 ;
syntax SINGLE_LINE_COMMENT
        = 
        "//" "~" NEWLINE* NEWLINE?
 ;
syntax MULTI_LINE_COMMENT
        = 
        "/*" (MULTI_LINE_COMMENT | ("~" "*/"))* "*/"
 ;
