@contributor{bgf2src automated exporter - SLPS}
module Google

syntax CompilationUnit
        = 
        HASHBANG? Directive* TopLevelDefinition* EOF
 ;
syntax HASHBANG
        = 
        "#!" ANY* NEWLINE?
 ;
syntax NEWLINE
        = "\\n"
        | "\\r"
 ;
syntax Directive
        = 
        "#" Identifier Arguments ";"
 ;
syntax Identifier
        = IDENTIFIER_NO_DOLLAR
        | IDENTIFIER
        | ABSTRACT
        | ASSERT
        | CLASS
        | EXTENDS
        | FACTORY
        | GET
        | IMPLEMENTS
        | IMPORT
        | INTERFACE
        | IS
        | LIBRARY
        | NATIVE
        | NEGATE
        | OPERATOR
        | SET
        | SOURCE
        | STATIC
        | TYPEDEF
 ;
syntax IDENTIFIER_NO_DOLLAR
        = 
        IDENTIFIER_START_NO_DOLLAR IDENTIFIER_PART_NO_DOLLAR*
 ;
syntax IDENTIFIER_START_NO_DOLLAR
        = LETTER
        | "_"
 ;
syntax LETTER
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
syntax IDENTIFIER_PART_NO_DOLLAR
        = IDENTIFIER_START_NO_DOLLAR
        | DIGIT
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
syntax IDENTIFIER
        = 
        IDENTIFIER_START IDENTIFIER_PART*
 ;
syntax IDENTIFIER_START
        = IDENTIFIER_START_NO_DOLLAR
        | "$"
 ;
syntax IDENTIFIER_PART
        = IDENTIFIER_START
        | DIGIT
 ;
syntax ABSTRACT
        = 
        "abstract"
 ;
syntax ASSERT
        = 
        "assert"
 ;
syntax CLASS
        = 
        "class"
 ;
syntax EXTENDS
        = 
        "extends"
 ;
syntax FACTORY
        = 
        "factory"
 ;
syntax GET
        = 
        "get"
 ;
syntax IMPLEMENTS
        = 
        "implements"
 ;
syntax IMPORT
        = 
        "import"
 ;
syntax INTERFACE
        = 
        "interface"
 ;
syntax IS
        = 
        "is"
 ;
syntax LIBRARY
        = 
        "library"
 ;
syntax NATIVE
        = 
        "native"
 ;
syntax NEGATE
        = 
        "negate"
 ;
syntax OPERATOR
        = 
        "operator"
 ;
syntax SET
        = 
        "set"
 ;
syntax SOURCE
        = 
        "source"
 ;
syntax STATIC
        = 
        "static"
 ;
syntax TYPEDEF
        = 
        "typedef"
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
syntax Label
        = 
        Identifier ":"
 ;
syntax Expression
        = AssignableExpression AssignmentOperator Expression
        | ConditionalExpression
 ;
syntax AssignableExpression
        = Primary (Arguments* AssignableSelector)+
        | SUPER AssignableSelector
        | Identifier
 ;
syntax Primary
        = PrimaryNoFE
        | PrimaryFE
 ;
syntax PrimaryNoFE
        = THIS
        | SUPER AssignableSelector
        | Literal
        | Identifier
        | CONST? TypeArguments? CompoundLiteral
        | (NEW | CONST) Type ("." Identifier)? Arguments
        | ExpressionInParentheses
 ;
syntax THIS
        = 
        "this"
 ;
syntax SUPER
        = 
        "super"
 ;
syntax AssignableSelector
        = "[" Expression "]"
        | "." Identifier
 ;
syntax Literal
        = NULL
        | TRUE
        | FALSE
        | HEX_NUMBER
        | NUMBER
        | STRING
 ;
syntax NULL
        = 
        "null"
 ;
syntax TRUE
        = 
        "true"
 ;
syntax FALSE
        = 
        "false"
 ;
syntax HEX_NUMBER
        = "0x" HEX_DIGIT+
        | "0X" HEX_DIGIT+
 ;
syntax HEX_DIGIT
        = "a"
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
        | DIGIT
 ;
syntax NUMBER
        = DIGIT+ NUMBER_OPT_FRACTIONAL_PART EXPONENT? NUMBER_OPT_ILLEGAL_END
        | "." DIGIT+ EXPONENT? NUMBER_OPT_ILLEGAL_END
 ;
syntax NUMBER_OPT_FRACTIONAL_PART
        = "." DIGIT+
        | ()
 ;
syntax EXPONENT
        = 
        ("e" | "E") ("+" | "-")? DIGIT+
 ;
syntax NUMBER_OPT_ILLEGAL_END
        = 
        ()
 ;
syntax STRING
        = "@"? MULTI_LINE_STRING
        | SINGLE_LINE_STRING
 ;
syntax MULTI_LINE_STRING
        = "\"\"\"" ANY* "\"\"\""
        | "\\'\\'\\'" ANY* "\\'\\'\\'"
 ;
syntax SINGLE_LINE_STRING
        = "\"" STRING_CONTENT_DQ* "\""
        | "\\'" STRING_CONTENT_SQ* "\\'"
        | "@" "\\'" ANY* "\\'"
        | "@" "\"" ANY* "\""
 ;
syntax STRING_CONTENT_DQ
        = ANY
        | "\\\\" ANY
 ;
syntax STRING_CONTENT_SQ
        = ANY
        | "\\\\" ANY
 ;
syntax CONST
        = 
        "const"
 ;
syntax TypeArguments
        = 
        "\<" TypeList "\>"
 ;
syntax TypeList
        = 
        Type ("," Type)*
 ;
syntax Type
        = 
        Qualified TypeArguments?
 ;
syntax Qualified
        = 
        Identifier ("." Identifier)?
 ;
syntax CompoundLiteral
        = ListLiteral
        | MapLiteral
 ;
syntax ListLiteral
        = 
        "[" (ExpressionList ","?)? "]"
 ;
syntax ExpressionList
        = 
        Expression ("," Expression)*
 ;
syntax MapLiteral
        = 
        "{" {MapLiteralEntry ","}* "}"
 ;
syntax MapLiteralEntry
        = 
        STRING ":" Expression
 ;
syntax NEW
        = 
        "new"
 ;
syntax ExpressionInParentheses
        = 
        "(" Expression ")"
 ;
syntax PrimaryFE
        = FunctionExpression
        | PrimaryNoFE
 ;
syntax FunctionExpression
        = 
        (ReturnType? Identifier)? FormalParameterList FunctionExpressionBody
 ;
syntax ReturnType
        = VOID
        | Type
 ;
syntax VOID
        = 
        "void"
 ;
syntax FormalParameterList
        = "(" NamedFormalParameters? ")"
        | "(" NormalFormalParameter NormalFormalParameterTail? ")"
 ;
syntax NamedFormalParameters
        = 
        "[" DefaultFormalParameter ("," DefaultFormalParameter)* "]"
 ;
syntax DefaultFormalParameter
        = 
        NormalFormalParameter ("=" ConstantExpression)?
 ;
syntax NormalFormalParameter
        = FunctionDeclaration
        | FieldFormalParameter
        | SimpleFormalParameter
 ;
syntax FunctionDeclaration
        = 
        ReturnType? Identifier FormalParameterList
 ;
syntax FieldFormalParameter
        = 
        FinalVarOrType? THIS "." Identifier
 ;
syntax FinalVarOrType
        = FINAL Type?
        | VAR
        | Type
 ;
syntax FINAL
        = 
        "final"
 ;
syntax VAR
        = 
        "var"
 ;
syntax SimpleFormalParameter
        = DeclaredIdentifier
        | Identifier
 ;
syntax DeclaredIdentifier
        = FINAL Type? Identifier
        | VAR Identifier
        | Type Identifier
 ;
syntax ConstantExpression
        = 
        Expression
 ;
syntax NormalFormalParameterTail
        = "," NamedFormalParameters
        | "," NormalFormalParameter NormalFormalParameterTail?
 ;
syntax FunctionExpressionBody
        = "=\>" Expression
        | Block
 ;
syntax Block
        = 
        "{" Statements "}"
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
        | IterationStatement
        | SelectionStatement
        | TryStatement
        | BREAK Identifier? ";"
        | CONTINUE Identifier? ";"
        | RETURN Expression? ";"
        | THROW Expression? ";"
        | Expression? ";"
        | ASSERT "(" ConditionalExpression ")" ";"
        | FunctionDeclaration FunctionBody
 ;
syntax InitializedVariableDeclaration
        = 
        DeclaredIdentifier ("=" Expression)? ("," InitializedIdentifier)*
 ;
syntax InitializedIdentifier
        = 
        Identifier ("=" Expression)?
 ;
syntax IterationStatement
        = WHILE "(" Expression ")" Statement
        | DO Statement WHILE "(" Expression ")" ";"
        | FOR "(" ForLoopParts ")" Statement
 ;
syntax WHILE
        = 
        "while"
 ;
syntax DO
        = 
        "do"
 ;
syntax FOR
        = 
        "for"
 ;
syntax ForLoopParts
        = ForInitializerStatement Expression? ";" ExpressionList?
        | DeclaredIdentifier IN Expression
        | Identifier IN Expression
 ;
syntax ForInitializerStatement
        = InitializedVariableDeclaration ";"
        | Expression? ";"
 ;
syntax IN
        = 
        "in"
 ;
syntax SelectionStatement
        = IF "(" Expression ")" Statement (ELSE Statement)?
        | SWITCH "(" Expression ")" "{" SwitchCase* DefaultCase? "}"
 ;
syntax IF
        = 
        "if"
 ;
syntax ELSE
        = 
        "else"
 ;
syntax SWITCH
        = 
        "switch"
 ;
syntax SwitchCase
        = 
        Label? (CASE Expression ":")+ Statements
 ;
syntax CASE
        = 
        "case"
 ;
syntax DefaultCase
        = 
        Label? (CASE Expression ":")* DEFAULT ":" Statements
 ;
syntax DEFAULT
        = 
        "default"
 ;
syntax TryStatement
        = 
        TRY Block ((CatchPart+ FinallyPart?) | FinallyPart)
 ;
syntax TRY
        = 
        "try"
 ;
syntax CatchPart
        = 
        CATCH "(" DeclaredIdentifier ("," DeclaredIdentifier)? ")" Block
 ;
syntax CATCH
        = 
        "catch"
 ;
syntax FinallyPart
        = 
        FINALLY Block
 ;
syntax FINALLY
        = 
        "finally"
 ;
syntax BREAK
        = 
        "break"
 ;
syntax CONTINUE
        = 
        "continue"
 ;
syntax RETURN
        = 
        "return"
 ;
syntax THROW
        = 
        "throw"
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
        | SUPER ("|" BitwiseXorExpression)+
 ;
syntax BitwiseXorExpression
        = BitwiseAndExpression ("^" BitwiseAndExpression)*
        | SUPER ("^" BitwiseAndExpression)+
 ;
syntax BitwiseAndExpression
        = EqualityExpression ("&" EqualityExpression)*
        | SUPER ("&" EqualityExpression)+
 ;
syntax EqualityExpression
        = RelationalExpression (EqualityOperator RelationalExpression)?
        | SUPER EqualityOperator RelationalExpression
 ;
syntax RelationalExpression
        = ShiftExpression ((IsOperator Type) | (RelationalOperator ShiftExpression))?
        | SUPER RelationalOperator ShiftExpression
 ;
syntax ShiftExpression
        = AdditiveExpression (ShiftOperator AdditiveExpression)*
        | SUPER (ShiftOperator AdditiveExpression)+
 ;
syntax AdditiveExpression
        = MultiplicativeExpression (AdditiveOperator MultiplicativeExpression)*
        | SUPER (AdditiveOperator MultiplicativeExpression)+
 ;
syntax MultiplicativeExpression
        = UnaryExpression (MultiplicativeOperator UnaryExpression)*
        | SUPER (MultiplicativeOperator UnaryExpression)+
 ;
syntax UnaryExpression
        = PostfixExpression
        | PrefixOperator UnaryExpression
        | NegateOperator SUPER
        | "-" SUPER
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
syntax Selector
        = AssignableSelector
        | Arguments
 ;
syntax PrefixOperator
        = AdditiveOperator
        | NegateOperator
 ;
syntax AdditiveOperator
        = "+"
        | "-"
 ;
syntax NegateOperator
        = "!"
        | "~"
 ;
syntax MultiplicativeOperator
        = "*"
        | "/"
        | "%"
        | "~/"
 ;
syntax ShiftOperator
        = "\<\<"
        | "\>" "\>" "\>"
        | "\>" "\>"
 ;
syntax IsOperator
        = 
        IS "!"?
 ;
syntax RelationalOperator
        = "\>" "="
        | "\>"
        | "\<="
        | "\<"
 ;
syntax EqualityOperator
        = "=="
        | "!="
        | "==="
        | "!=="
 ;
syntax FunctionBody
        = "=\>" Expression ";"
        | Block
 ;
syntax AssignmentOperator
        = "="
        | "*="
        | "/="
        | "~/="
        | "%="
        | "+="
        | "-="
        | "\<\<="
        | "\>" "\>" "\>" "="
        | "\>" "\>" "="
        | "&="
        | "^="
        | "|="
 ;
syntax TopLevelDefinition
        = ClassDefinition
        | InterfaceDefinition
        | FunctionTypeAlias
        | FunctionDeclaration FunctionBodyOrNative
        | ReturnType? GetOrSet Identifier FormalParameterList FunctionBodyOrNative
        | FINAL Type? StaticFinalDeclarationList ";"
        | ConstInitializedVariableDeclaration ";"
 ;
syntax ClassDefinition
        = CLASS Identifier TypeParameters? Superclass? Interfaces? "{" ClassMemberDefinition* "}"
        | CLASS Identifier TypeParameters? Interfaces? NATIVE STRING "{" ClassMemberDefinition* "}"
 ;
syntax TypeParameters
        = 
        "\<" TypeParameter ("," TypeParameter)* "\>"
 ;
syntax TypeParameter
        = 
        Identifier (EXTENDS Type)?
 ;
syntax Superclass
        = 
        EXTENDS Type
 ;
syntax Interfaces
        = 
        IMPLEMENTS TypeList
 ;
syntax ClassMemberDefinition
        = Declaration ";"
        | ConstructorDeclaration ";"
        | MethodDeclaration FunctionBodyOrNative
        | CONST FactoryConstructorDeclaration FunctionNative
 ;
syntax Declaration
        = ConstantConstructorDeclaration (Redirection | Initializers)?
        | FunctionDeclaration Redirection
        | NamedConstructorDeclaration Redirection
        | ABSTRACT SpecialSignatureDefinition
        | ABSTRACT FunctionDeclaration
        | STATIC FINAL Type? StaticFinalDeclarationList
        | STATIC? ConstInitializedVariableDeclaration
 ;
syntax ConstantConstructorDeclaration
        = 
        CONST Qualified FormalParameterList
 ;
syntax Redirection
        = 
        ":" THIS ("." Identifier)? Arguments
 ;
syntax Initializers
        = 
        ":" SuperCallOrFieldInitializer ("," SuperCallOrFieldInitializer)*
 ;
syntax SuperCallOrFieldInitializer
        = SUPER Arguments
        | SUPER "." Identifier Arguments
        | FieldInitializer
 ;
syntax FieldInitializer
        = 
        (THIS ".")? Identifier "=" ConditionalExpression
 ;
syntax NamedConstructorDeclaration
        = 
        Identifier "." Identifier FormalParameterList
 ;
syntax SpecialSignatureDefinition
        = STATIC? ReturnType? GetOrSet Identifier FormalParameterList
        | ReturnType? OPERATOR UserDefinableOperator FormalParameterList
 ;
syntax GetOrSet
        = GET
        | SET
 ;
syntax UserDefinableOperator
        = MultiplicativeOperator
        | AdditiveOperator
        | ShiftOperator
        | RelationalOperator
        | BitwiseOperator
        | "=="
        | "~"
        | NEGATE
        | "[" "]"
        | "[" "]" "="
 ;
syntax BitwiseOperator
        = "&"
        | "^"
        | "|"
 ;
syntax StaticFinalDeclarationList
        = 
        StaticFinalDeclaration ("," StaticFinalDeclaration)*
 ;
syntax StaticFinalDeclaration
        = 
        Identifier "=" ConstantExpression
 ;
syntax ConstInitializedVariableDeclaration
        = 
        DeclaredIdentifier ("=" ConstantExpression)? ("," ConstInitializedIdentifier)*
 ;
syntax ConstInitializedIdentifier
        = 
        Identifier ("=" ConstantExpression)?
 ;
syntax ConstructorDeclaration
        = Identifier FormalParameterList (Redirection | Initializers)?
        | NamedConstructorDeclaration (Redirection | Initializers)?
 ;
syntax MethodDeclaration
        = FactoryConstructorDeclaration
        | STATIC FunctionDeclaration
        | SpecialSignatureDefinition
        | FunctionDeclaration Initializers?
        | NamedConstructorDeclaration Initializers?
 ;
syntax FactoryConstructorDeclaration
        = 
        FACTORY Qualified TypeParameters? ("." Identifier)? FormalParameterList
 ;
syntax FunctionBodyOrNative
        = NATIVE FunctionBody
        | FunctionNative
        | FunctionBody
 ;
syntax FunctionNative
        = 
        NATIVE STRING? ";"
 ;
syntax InterfaceDefinition
        = 
        INTERFACE Identifier TypeParameters? Superinterfaces? FactorySpecification? "{" InterfaceMemberDefinition* "}"
 ;
syntax Superinterfaces
        = 
        EXTENDS TypeList
 ;
syntax FactorySpecification
        = 
        FACTORY Type
 ;
syntax InterfaceMemberDefinition
        = STATIC FINAL Type? InitializedIdentifierList ";"
        | FunctionDeclaration ";"
        | ConstantConstructorDeclaration ";"
        | NamedConstructorDeclaration ";"
        | SpecialSignatureDefinition ";"
        | VariableDeclaration ";"
 ;
syntax InitializedIdentifierList
        = 
        InitializedIdentifier ("," InitializedIdentifier)*
 ;
syntax VariableDeclaration
        = 
        DeclaredIdentifier ("," Identifier)*
 ;
syntax FunctionTypeAlias
        = 
        TYPEDEF FunctionPrefix TypeParameters? FormalParameterList ";"
 ;
syntax FunctionPrefix
        = 
        ReturnType? Identifier
 ;
syntax LibraryUnit
        = 
        LibraryDefinition EOF
 ;
syntax LibraryDefinition
        = 
        LIBRARY "{" LibraryBody "}"
 ;
syntax LibraryBody
        = 
        LibraryImport? LibrarySource?
 ;
syntax LibraryImport
        = 
        IMPORT "=" "[" ImportReferences? "]"
 ;
syntax ImportReferences
        = 
        ImportReference ("," ImportReference)* ","?
 ;
syntax ImportReference
        = 
        (IDENTIFIER ":")? STRING
 ;
syntax LibrarySource
        = 
        SOURCE "=" "[" SourceUrls? "]"
 ;
syntax SourceUrls
        = 
        STRING ("," STRING)* ","?
 ;
