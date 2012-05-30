@contributor{bgf2src automated exporter - SLPS}
module Java_5_habelitz

syntax JavaSource
        = 
        CompilationUnit
 ;
syntax CompilationUnit
        = 
        AnnotationList PackageDeclaration? ImportDeclaration* TypeDecls*
 ;
syntax AnnotationList
        = 
        Annotation*
 ;
syntax Annotation
        = 
        AT QualifiedIdentifier AnnotationInit?
 ;
syntax AT
        = 
        "@"
 ;
syntax QualifiedIdentifier
        = 
        IDENT (DOT IDENT ident)*
 ;
syntax IDENT
        = 
        JAVA_ID_START JAVA_ID_PART*
 ;
syntax JAVA_ID_START
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
syntax JAVA_ID_PART
        = JAVA_ID_START
        | "0"
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
syntax DOT
        = 
        "."
 ;
syntax AnnotationInit
        = 
        LPAREN AnnotationInitializers RPAREN
 ;
syntax LPAREN
        = 
        "("
 ;
syntax AnnotationInitializers
        = AnnotationInitializer (COMMA AnnotationInitializer)*
        | AnnotationElementValue
 ;
syntax AnnotationInitializer
        = 
        IDENT ASSIGN AnnotationElementValue
 ;
syntax ASSIGN
        = 
        "="
 ;
syntax AnnotationElementValue
        = AnnotationElementValueExpression
        | Annotation
        | AnnotationElementValueArrayInitializer
 ;
syntax AnnotationElementValueExpression
        = 
        ConditionalExpression
 ;
syntax ConditionalExpression
        = 
        LogicalOrExpression (QUESTION AssignmentExpression COLON ConditionalExpression)?
 ;
syntax LogicalOrExpression
        = 
        LogicalAndExpression (LOGICAL_OR LogicalAndExpression)*
 ;
syntax LogicalAndExpression
        = 
        InclusiveOrExpression (LOGICAL_AND InclusiveOrExpression)*
 ;
syntax InclusiveOrExpression
        = 
        ExclusiveOrExpression (OR ExclusiveOrExpression)*
 ;
syntax ExclusiveOrExpression
        = 
        AndExpression (XOR AndExpression)*
 ;
syntax AndExpression
        = 
        EqualityExpression (AND EqualityExpression)*
 ;
syntax EqualityExpression
        = 
        InstanceOfExpression ((EQUAL | NOT_EQUAL) InstanceOfExpression)*
 ;
syntax InstanceOfExpression
        = 
        RelationalExpression (INSTANCEOF Type)?
 ;
syntax RelationalExpression
        = 
        ShiftExpression ((LESS_OR_EQUAL | GREATER_OR_EQUAL | LESS_THAN | GREATER_THAN) ShiftExpression)*
 ;
syntax ShiftExpression
        = 
        AdditiveExpression ((BIT_SHIFT_RIGHT | SHIFT_RIGHT | SHIFT_LEFT) AdditiveExpression)*
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
        = PLUS UnaryExpression
        | MINUS UnaryExpression
        | INC PostfixedExpression
        | DEC PostfixedExpression
        | UnaryExpressionNotPlusMinus
 ;
syntax PLUS
        = 
        "+"
 ;
syntax MINUS
        = 
        "-"
 ;
syntax INC
        = 
        "++"
 ;
syntax PostfixedExpression
        = 
        PrimaryExpression ((DOT outerDot ((GenericTypeArgumentListSimplified? IDENT Arguments?) | THIS | (SUPER Super Arguments) | (SUPER DOT innerDot IDENT Arguments?) | InnerNewExpression)) | (LBRACK Expression RBRACK))* (INC | DEC)?
 ;
syntax PrimaryExpression
        = ParenthesizedExpression
        | Literal
        | NewExpression
        | QualifiedIdentExpression
        | GenericTypeArgumentListSimplified ((SUPER (Arguments | (DOT IDENT Arguments))) | (IDENT Arguments) | (THIS Arguments))
        | THIS Arguments?
        | SUPER Arguments
        | SUPER DOT IDENT (Arguments | ())
        | PrimitiveType ArrayDeclarator* DOT CLASS
        | VOID DOT CLASS
 ;
syntax ParenthesizedExpression
        = 
        LPAREN Expression RPAREN
 ;
syntax Expression
        = 
        AssignmentExpression
 ;
syntax AssignmentExpression
        = 
        ConditionalExpression ((ASSIGN | PLUS_ASSIGN | MINUS_ASSIGN | STAR_ASSIGN | DIV_ASSIGN | AND_ASSIGN | OR_ASSIGN | XOR_ASSIGN | MOD_ASSIGN | SHIFT_LEFT_ASSIGN | SHIFT_RIGHT_ASSIGN | BIT_SHIFT_RIGHT_ASSIGN) AssignmentExpression)?
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
syntax AND_ASSIGN
        = 
        "&="
 ;
syntax OR_ASSIGN
        = 
        "|="
 ;
syntax XOR_ASSIGN
        = 
        "^="
 ;
syntax MOD_ASSIGN
        = 
        "%="
 ;
syntax SHIFT_LEFT_ASSIGN
        = 
        "\<\<="
 ;
syntax SHIFT_RIGHT_ASSIGN
        = 
        "\>\>="
 ;
syntax BIT_SHIFT_RIGHT_ASSIGN
        = 
        "\>\>\>="
 ;
syntax RPAREN
        = 
        ")"
 ;
syntax Literal
        = HEX_LITERAL
        | OCTAL_LITERAL
        | DECIMAL_LITERAL
        | FLOATING_POINT_LITERAL
        | CHARACTER_LITERAL
        | STRING_LITERAL
        | TRUE
        | FALSE
        | NULL
 ;
syntax HEX_LITERAL
        = 
        "0" ("x" | "X") HEX_DIGIT+ INTEGER_TYPE_SUFFIX?
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
syntax INTEGER_TYPE_SUFFIX
        = "l"
        | "L"
 ;
syntax OCTAL_LITERAL
        = 
        "0" ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")+ INTEGER_TYPE_SUFFIX?
 ;
syntax DECIMAL_LITERAL
        = 
        ("0" | (("1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")*)) INTEGER_TYPE_SUFFIX?
 ;
syntax FLOATING_POINT_LITERAL
        = ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ ((DOT ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")* EXPONENT? FLOAT_TYPE_SUFFIX?) | (EXPONENT FLOAT_TYPE_SUFFIX?) | FLOAT_TYPE_SUFFIX)
        | DOT ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+ EXPONENT? FLOAT_TYPE_SUFFIX?
 ;
syntax EXPONENT
        = 
        ("e" | "E") ("+" | "-")? ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
syntax FLOAT_TYPE_SUFFIX
        = "f"
        | "F"
        | "d"
        | "D"
 ;
syntax CHARACTER_LITERAL
        = 
        "\\'" (ESCAPE_SEQUENCE | String) "\\'"
 ;
syntax ESCAPE_SEQUENCE
        = "\\\\" ("b" | "t" | "n" | "f" | "r" | "\\\"" | "\\'" | "\\\\")
        | UNICODE_ESCAPE
        | OCTAL_ESCAPE
 ;
syntax UNICODE_ESCAPE
        = 
        "\\\\" "u" HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
 ;
syntax OCTAL_ESCAPE
        = ("0" | "1" | "2" | "3") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")
        | "\\\\" ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7") ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")
        | "\\\\" ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7")
 ;
syntax STRING_LITERAL
        = 
        "\"" (ESCAPE_SEQUENCE | String)* "\""
 ;
syntax TRUE
        = 
        "true"
 ;
syntax FALSE
        = 
        "false"
 ;
syntax NULL
        = 
        "null"
 ;
syntax NewExpression
        = 
        NEW ((PrimitiveType NewArrayConstruction) | (GenericTypeArgumentListSimplified? QualifiedTypeIdentSimplified (NewArrayConstruction | (Arguments ClassBody?))))
 ;
syntax NEW
        = 
        "new"
 ;
syntax PrimitiveType
        = BOOLEAN
        | CHAR
        | BYTE
        | SHORT
        | INT
        | LONG
        | FLOAT
        | DOUBLE
 ;
syntax BOOLEAN
        = 
        "boolean"
 ;
syntax CHAR
        = 
        "char"
 ;
syntax BYTE
        = 
        "byte"
 ;
syntax SHORT
        = 
        "short"
 ;
syntax INT
        = 
        "int"
 ;
syntax LONG
        = 
        "long"
 ;
syntax FLOAT
        = 
        "float"
 ;
syntax DOUBLE
        = 
        "double"
 ;
syntax NewArrayConstruction
        = ArrayDeclaratorList ArrayInitializer
        | LBRACK Expression RBRACK (LBRACK Expression RBRACK)* ArrayDeclaratorList?
 ;
syntax ArrayDeclaratorList
        = 
        ArrayDeclarator+
 ;
syntax ArrayDeclarator
        = 
        LBRACK RBRACK
 ;
syntax LBRACK
        = 
        "["
 ;
syntax RBRACK
        = 
        "]"
 ;
syntax ArrayInitializer
        = 
        LCURLY {VariableInitializer COMMA}* RCURLY
 ;
syntax LCURLY
        = 
        "{"
 ;
syntax VariableInitializer
        = ArrayInitializer
        | Expression
 ;
syntax COMMA
        = 
        ","
 ;
syntax RCURLY
        = 
        "}"
 ;
syntax GenericTypeArgumentListSimplified
        = 
        LESS_THAN GenericTypeArgumentSimplified (COMMA GenericTypeArgumentSimplified)* GenericTypeListClosing
 ;
syntax LESS_THAN
        = 
        "\<"
 ;
syntax GenericTypeArgumentSimplified
        = Type
        | QUESTION
 ;
syntax Type
        = SimpleType
        | ObjectType
 ;
syntax SimpleType
        = 
        PrimitiveType ArrayDeclaratorList?
 ;
syntax ObjectType
        = 
        QualifiedTypeIdent ArrayDeclaratorList?
 ;
syntax QualifiedTypeIdent
        = 
        TypeIdent (DOT TypeIdent)*
 ;
syntax TypeIdent
        = 
        IDENT GenericTypeArgumentList?
 ;
syntax GenericTypeArgumentList
        = 
        LESS_THAN GenericTypeArgument (COMMA GenericTypeArgument)* GenericTypeListClosing
 ;
syntax GenericTypeArgument
        = Type
        | QUESTION GenericWildcardBoundType?
 ;
syntax QUESTION
        = 
        "?"
 ;
syntax GenericWildcardBoundType
        = 
        (EXTENDS | SUPER) Type
 ;
syntax EXTENDS
        = 
        "extends"
 ;
syntax SUPER
        = 
        "super"
 ;
syntax GenericTypeListClosing
        = GREATER_THAN
        | SHIFT_RIGHT
        | BIT_SHIFT_RIGHT
        | ()
 ;
syntax GREATER_THAN
        = 
        "\>"
 ;
syntax SHIFT_RIGHT
        = 
        "\>\>"
 ;
syntax BIT_SHIFT_RIGHT
        = 
        "\>\>\>"
 ;
syntax QualifiedTypeIdentSimplified
        = 
        TypeIdentSimplified (DOT TypeIdentSimplified)*
 ;
syntax TypeIdentSimplified
        = 
        IDENT GenericTypeArgumentListSimplified?
 ;
syntax Arguments
        = 
        LPAREN ExpressionList? RPAREN
 ;
syntax ExpressionList
        = 
        Expression (COMMA Expression)*
 ;
syntax ClassBody
        = 
        LCURLY ClassScopeDeclarations* RCURLY
 ;
syntax ClassScopeDeclarations
        = Block
        | STATIC Block
        | ModifierList ((GenericTypeParameterList? ((Type IDENT FormalParameterList ArrayDeclaratorList? ThrowsClause? (Block | SEMI)) | (VOID IDENT FormalParameterList ThrowsClause? (Block | SEMI)) | (IDENT ident FormalParameterList ThrowsClause? Block))) | (Type ClassFieldDeclaratorList SEMI))
        | TypeDeclaration
        | SEMI
 ;
syntax Block
        = 
        LCURLY BlockStatement* RCURLY
 ;
syntax BlockStatement
        = LocalVariableDeclaration SEMI
        | TypeDeclaration
        | Statement
 ;
syntax LocalVariableDeclaration
        = 
        LocalModifierList Type ClassFieldDeclaratorList
 ;
syntax LocalModifierList
        = 
        LocalModifier*
 ;
syntax LocalModifier
        = FINAL
        | Annotation
 ;
syntax FINAL
        = 
        "final"
 ;
syntax ClassFieldDeclaratorList
        = 
        ClassFieldDeclarator (COMMA ClassFieldDeclarator)*
 ;
syntax ClassFieldDeclarator
        = 
        VariableDeclaratorId (ASSIGN VariableInitializer)?
 ;
syntax VariableDeclaratorId
        = 
        IDENT ArrayDeclaratorList?
 ;
syntax SEMI
        = 
        ";"
 ;
syntax TypeDeclaration
        = 
        ModifierList (ClassTypeDeclaration | InterfaceTypeDeclaration | EnumTypeDeclaration | AnnotationTypeDeclaration)
 ;
syntax ModifierList
        = 
        Modifier*
 ;
syntax Modifier
        = PUBLIC
        | PROTECTED
        | PRIVATE
        | STATIC
        | ABSTRACT
        | NATIVE
        | SYNCHRONIZED
        | TRANSIENT
        | VOLATILE
        | STRICTFP
        | LocalModifier
 ;
syntax PUBLIC
        = 
        "public"
 ;
syntax PROTECTED
        = 
        "protected"
 ;
syntax PRIVATE
        = 
        "private"
 ;
syntax STATIC
        = 
        "static"
 ;
syntax ABSTRACT
        = 
        "abstract"
 ;
syntax NATIVE
        = 
        "native"
 ;
syntax SYNCHRONIZED
        = 
        "synchronized"
 ;
syntax TRANSIENT
        = 
        "transient"
 ;
syntax VOLATILE
        = 
        "volatile"
 ;
syntax STRICTFP
        = 
        "strictfp"
 ;
syntax ClassTypeDeclaration
        = 
        CLASS IDENT GenericTypeParameterList? ClassExtendsClause? ImplementsClause? ClassBody
 ;
syntax CLASS
        = 
        "class"
 ;
syntax GenericTypeParameterList
        = 
        LESS_THAN GenericTypeParameter (COMMA GenericTypeParameter)* GenericTypeListClosing
 ;
syntax GenericTypeParameter
        = 
        IDENT Bound?
 ;
syntax Bound
        = 
        EXTENDS Type (AND Type)*
 ;
syntax AND
        = 
        "&"
 ;
syntax ClassExtendsClause
        = 
        EXTENDS Type
 ;
syntax ImplementsClause
        = 
        IMPLEMENTS TypeList
 ;
syntax IMPLEMENTS
        = 
        "implements"
 ;
syntax TypeList
        = 
        Type (COMMA Type)*
 ;
syntax InterfaceTypeDeclaration
        = 
        INTERFACE IDENT GenericTypeParameterList? InterfaceExtendsClause? InterfaceBody
 ;
syntax INTERFACE
        = 
        "interface"
 ;
syntax InterfaceExtendsClause
        = 
        EXTENDS TypeList
 ;
syntax InterfaceBody
        = 
        LCURLY InterfaceScopeDeclarations* RCURLY
 ;
syntax InterfaceScopeDeclarations
        = ModifierList ((GenericTypeParameterList? ((Type IDENT FormalParameterList ArrayDeclaratorList? ThrowsClause? SEMI) | (VOID IDENT FormalParameterList ThrowsClause? SEMI))) | (Type InterfaceFieldDeclaratorList SEMI))
        | TypeDeclaration
        | SEMI
 ;
syntax FormalParameterList
        = 
        LPAREN ((FormalParameterStandardDecl (COMMA FormalParameterStandardDecl)* (COMMA FormalParameterVarArgDecl)?) | FormalParameterVarArgDecl | ()) RPAREN
 ;
syntax FormalParameterStandardDecl
        = 
        LocalModifierList Type VariableDeclaratorId
 ;
syntax FormalParameterVarArgDecl
        = 
        LocalModifierList Type ELLIPSIS VariableDeclaratorId
 ;
syntax ELLIPSIS
        = 
        "..."
 ;
syntax ThrowsClause
        = 
        THROWS QualifiedIdentList
 ;
syntax THROWS
        = 
        "throws"
 ;
syntax QualifiedIdentList
        = 
        QualifiedIdentifier (COMMA QualifiedIdentifier)*
 ;
syntax VOID
        = 
        "void"
 ;
syntax InterfaceFieldDeclaratorList
        = 
        InterfaceFieldDeclarator (COMMA InterfaceFieldDeclarator)*
 ;
syntax InterfaceFieldDeclarator
        = 
        VariableDeclaratorId ASSIGN VariableInitializer
 ;
syntax EnumTypeDeclaration
        = 
        ENUM IDENT ImplementsClause? EnumBody
 ;
syntax ENUM
        = 
        "enum"
 ;
syntax EnumBody
        = 
        LCURLY EnumScopeDeclarations RCURLY
 ;
syntax EnumScopeDeclarations
        = 
        EnumConstants COMMA? EnumClassScopeDeclarations?
 ;
syntax EnumConstants
        = 
        EnumConstant (COMMA EnumConstant)*
 ;
syntax EnumConstant
        = 
        AnnotationList IDENT Arguments? ClassBody?
 ;
syntax EnumClassScopeDeclarations
        = 
        SEMI ClassScopeDeclarations*
 ;
syntax AnnotationTypeDeclaration
        = 
        AT INTERFACE IDENT AnnotationBody
 ;
syntax AnnotationBody
        = 
        LCURLY AnnotationScopeDeclarations* RCURLY
 ;
syntax AnnotationScopeDeclarations
        = ModifierList Type ((IDENT LPAREN RPAREN AnnotationDefaultValue? SEMI) | (ClassFieldDeclaratorList SEMI))
        | TypeDeclaration
 ;
syntax AnnotationDefaultValue
        = 
        DEFAULT AnnotationElementValue
 ;
syntax DEFAULT
        = 
        "default"
 ;
syntax Statement
        = Block
        | ASSERT Expression expr1 ((COLON Expression expr2 SEMI) | SEMI)
        | IF ParenthesizedExpression Statement ifStat ((ELSE Statement elseStat) | ())
        | FOR LPAREN ((ForInit SEMI ForCondition SEMI ForUpdater RPAREN Statement) | (LocalModifierList Type IDENT COLON Expression RPAREN Statement))
        | WHILE ParenthesizedExpression Statement
        | DO Statement WHILE ParenthesizedExpression SEMI
        | TRY Block ((Catches FinallyClause?) | FinallyClause)
        | SWITCH ParenthesizedExpression LCURLY SwitchBlockLabels RCURLY
        | SYNCHRONIZED ParenthesizedExpression Block
        | RETURN Expression? SEMI
        | THROW Expression SEMI
        | BREAK IDENT? SEMI
        | CONTINUE IDENT? SEMI
        | IDENT COLON Statement
        | Expression SEMI
        | SEMI
 ;
syntax ASSERT
        = 
        "assert"
 ;
syntax COLON
        = 
        ":"
 ;
syntax IF
        = 
        "if"
 ;
syntax ELSE
        = 
        "else"
 ;
syntax FOR
        = 
        "for"
 ;
syntax ForInit
        = LocalVariableDeclaration
        | ExpressionList
        | ()
 ;
syntax ForCondition
        = 
        Expression?
 ;
syntax ForUpdater
        = 
        ExpressionList?
 ;
syntax WHILE
        = 
        "while"
 ;
syntax DO
        = 
        "do"
 ;
syntax TRY
        = 
        "try"
 ;
syntax Catches
        = 
        CatchClause+
 ;
syntax CatchClause
        = 
        CATCH LPAREN FormalParameterStandardDecl RPAREN Block
 ;
syntax CATCH
        = 
        "catch"
 ;
syntax FinallyClause
        = 
        FINALLY Block
 ;
syntax FINALLY
        = 
        "finally"
 ;
syntax SWITCH
        = 
        "switch"
 ;
syntax SwitchBlockLabels
        = 
        SwitchCaseLabels SwitchDefaultLabel? SwitchCaseLabels
 ;
syntax SwitchCaseLabels
        = 
        SwitchCaseLabel*
 ;
syntax SwitchCaseLabel
        = 
        CASE Expression COLON BlockStatement*
 ;
syntax CASE
        = 
        "case"
 ;
syntax SwitchDefaultLabel
        = 
        DEFAULT COLON BlockStatement*
 ;
syntax RETURN
        = 
        "return"
 ;
syntax THROW
        = 
        "throw"
 ;
syntax BREAK
        = 
        "break"
 ;
syntax CONTINUE
        = 
        "continue"
 ;
syntax QualifiedIdentExpression
        = 
        QualifiedIdentifier ((ArrayDeclarator+ DOT CLASS) | Arguments | (DOT outerDot (CLASS | (GenericTypeArgumentListSimplified ((SUPER Super Arguments) | (SUPER DOT innerDot IDENT Arguments) | (IDENT Arguments))) | THIS | (SUPER Super Arguments) | InnerNewExpression)))?
 ;
syntax THIS
        = 
        "this"
 ;
syntax InnerNewExpression
        = 
        NEW GenericTypeArgumentListSimplified? IDENT Arguments ClassBody?
 ;
syntax DEC
        = 
        "--"
 ;
syntax UnaryExpressionNotPlusMinus
        = NOT UnaryExpression
        | LOGICAL_NOT UnaryExpression
        | LPAREN Type RPAREN UnaryExpression
        | PostfixedExpression
 ;
syntax NOT
        = 
        "~"
 ;
syntax LOGICAL_NOT
        = 
        "!"
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
syntax SHIFT_LEFT
        = 
        "\<\<"
 ;
syntax LESS_OR_EQUAL
        = 
        "\<="
 ;
syntax GREATER_OR_EQUAL
        = 
        "\>="
 ;
syntax INSTANCEOF
        = 
        "instanceof"
 ;
syntax EQUAL
        = 
        "=="
 ;
syntax NOT_EQUAL
        = 
        "!="
 ;
syntax XOR
        = 
        "^"
 ;
syntax OR
        = 
        "|"
 ;
syntax LOGICAL_AND
        = 
        "&&"
 ;
syntax LOGICAL_OR
        = 
        "||"
 ;
syntax AnnotationElementValueArrayInitializer
        = 
        LCURLY {AnnotationElementValue COMMA}* COMMA? RCURLY
 ;
syntax PackageDeclaration
        = 
        PACKAGE QualifiedIdentifier SEMI
 ;
syntax PACKAGE
        = 
        "package"
 ;
syntax ImportDeclaration
        = 
        IMPORT STATIC? QualifiedIdentifier DOTSTAR? SEMI
 ;
syntax IMPORT
        = 
        "import"
 ;
syntax DOTSTAR
        = 
        ".*"
 ;
syntax TypeDecls
        = TypeDeclaration
        | SEMI
 ;
