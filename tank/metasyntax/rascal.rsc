@contributor{bgf2src automated exporter - SLPS}
module Rascal

syntax Module
        = Default: 
        Header header Body body
 ;
syntax Header
        = (Tags tags "module" QualifiedName name ModuleParameters params Import* imports) Parameters
        | (Tags tags "module" QualifiedName name Import* imports) Default
 ;
syntax Tags
        = Default: 
        Tag* tags
 ;
syntax Tag
        = ("@" Name name TagString contents) Default
        | ("@" Name name) Empty
        | ("@" Name name "=" Expression expression) Expression
 ;
syntax Expression
        = ("{" Statement+ statements "}") NonEmptyBlock
        | ("(" Expression expression ")") Bracket
        | (Type type Parameters parameters "{" Statement+ statements "}") Closure
        | ("[" Expression first "," Expression second ".." Expression last "]") StepRange
        | (Parameters parameters "{" Statement* statements "}") VoidClosure
        | (Label label Visit visit) Visit
        | ("(" Expression init "|" Expression result "|" (Expression ("," Expression)*) generators ")") Reducer
        | (BasicType basicType "(" {Expression ","}* arguments ")") ReifiedType
        | (Expression expression "(" {Expression ","}* arguments ")") CallOrTree
        | Literal literal Literal
        | ("any" "(" (Expression ("," Expression)*) generators ")") Any
        | ("all" "(" (Expression ("," Expression)*) generators ")") All
        | Comprehension comprehension Comprehension
        | ("{" {Expression ","}* elements "}") Set
        | ("[" {Expression ","}* elements "]") List
        | ("#" Type type) ReifyType
        | ("[" Expression first ".." Expression last "]") Range
        | ("\<" (Expression ("," Expression)*) elements "\>") Tuple
        | ("(" {Mapping ","}* mappings ")") Map
        | "it" It
        | QualifiedName qualifiedName QualifiedName
        | (Expression expression "[" (Expression ("," Expression)*) subscripts "]") Subscript
        | (Expression expression "." Name field) FieldAccess
        | (Expression expression "[" Name key "=" Expression replacement "]") FieldUpdate
        | (Expression expression "\<" (Field ("," Field)*) fields "\>") FieldProject
        | (Expression argument "?") IsDefined
        | ("!" Expression argument) Negation
        | ("-" Expression argument) Negative
        | (Expression argument "+") TransitiveClosure
        | (Expression argument "*") TransitiveReflexiveClosure
        | (Expression expression "[" "@" Name name "=" Expression value "]") SetAnnotation
        | (Expression expression "@" Name name) GetAnnotation
        | (Expression lhs "o" Expression rhs) Composition
        | (Expression lhs "*" Expression rhs) Product
        | (Expression lhs "join" Expression rhs) Join
        | (Expression lhs "%" Expression rhs) Modulo
        | (Expression lhs "/" Expression rhs) Division
        | (Expression lhs "&" Expression rhs) Intersection
        | (Expression lhs "+" Expression rhs) Addition
        | (Expression lhs "-" Expression rhs) Subtraction
        | (Expression lhs "notin" Expression rhs) NotIn
        | (Expression lhs "in" Expression rhs) In
        | (Expression lhs "\>=" Expression rhs) GreaterThanOrEq
        | (Expression lhs "\<=" Expression rhs) LessThanOrEq
        | (Expression lhs "\<" Expression rhs) LessThan
        | (Expression lhs "\>" Expression rhs) GreaterThan
        | (Expression condition "?" Expression thenExp ":" Expression elseExp) IfThenElse
        | (Expression lhs "==" Expression rhs) Equals
        | (Expression lhs "!=" Expression rhs) NonEquals
        | (Expression lhs "?" Expression rhs) IfDefinedOtherwise
        | (Pattern pattern "!:=" Expression expression) NoMatch
        | (Pattern pattern ":=" Expression expression) Match
        | (Pattern pattern "\<-" Expression expression) Enumerator
        | (Expression lhs "==\>" Expression rhs) Implication
        | (Expression lhs "\<==\>" Expression rhs) Equivalence
        | (Expression lhs "&&" Expression rhs) And
        | (Expression lhs "||" Expression rhs) Or
 ;
syntax Statement
        = ("assert" Expression expression ";") Assert
        | ("assert" Expression expression ":" Expression message ";") AssertWithMessage
        | (Expression expression ";") Expression
        | (Label label Visit visit) Visit
        | (Label label "while" "(" (Expression ("," Expression)*) conditions ")" Statement body) While
        | (Label label "do" Statement body "while" "(" Expression condition ")" ";") DoWhile
        | (Label label "for" "(" (Expression ("," Expression)*) generators ")" Statement body) For
        | (Label label "if" "(" (Expression ("," Expression)*) conditions ")" Statement thenStatement NoElseMayFollow noElseMayFollow) IfThen
        | (Label label "if" "(" (Expression ("," Expression)*) conditions ")" Statement thenStatement "else" Statement elseStatement) IfThenElse
        | (Label label "switch" "(" Expression expression ")" "{" Case+ cases "}") Switch
        | ("fail" Target target ";") Fail
        | ("break" Target target ";") Break
        | ("continue" Target target ";") Continue
        | ("solve" "(" (QualifiedName ("," QualifiedName)*) variables Bound bound ")" Statement body) Solve
        | ("try" Statement body Catch+ handlers) Try
        | ("try" Statement body Catch+ handlers "finally" Statement finallyBody) TryFinally
        | (Label label "{" Statement+ statements "}") NonEmptyBlock
        | ";" EmptyStatement
        | ("global" Type type (QualifiedName ("," QualifiedName)*) names ";") GlobalDirective
        | (Assignable assignable Assignment operator Statement statement) Assignment
        | ("return" Statement statement) Return
        | ("throw" Statement statement) Throw
        | ("insert" DataTarget dataTarget Statement statement) Insert
        | ("append" DataTarget dataTarget Statement statement) Append
        | FunctionDeclaration functionDeclaration FunctionDeclaration
        | (LocalVariableDeclaration declaration ";") VariableDeclaration
 ;
syntax Label
        = (Name name ":") Default
        | () Empty
 ;
syntax Visit
        = (Strategy strategy "visit" "(" Expression subject ")" "{" Case+ cases "}") GivenStrategy
        | ("visit" "(" Expression subject ")" "{" Case+ cases "}") DefaultStrategy
 ;
syntax Strategy
        = "top-down-break" TopDownBreak
        | "top-down" TopDown
        | "bottom-up" BottomUp
        | "bottom-up-break" BottomUpBreak
        | "outermost" Outermost
        | "innermost" Innermost
 ;
syntax Case
        = ("case" PatternWithAction patternWithAction) PatternWithAction
        | ("default" ":" Statement statement) Default
 ;
syntax PatternWithAction
        = (Pattern pattern "=\>" Replacement replacement) Replacing
        | (Pattern pattern ":" Statement statement) Arbitrary
 ;
syntax Pattern
        = ("{" {Pattern ","}* elements "}") Set
        | ("[" {Pattern ","}* elements "]") List
        | QualifiedName qualifiedName QualifiedName
        | (QualifiedName qualifiedName "*") MultiVariable
        | Literal literal Literal
        | ("\<" (Pattern ("," Pattern)*) elements "\>") Tuple
        | (Type type Name name) TypedVariable
        | ("(" {Mapping ","}* mappings ")") Map
        | (BasicType basicType "(" {Pattern ","}* arguments ")") ReifiedType
        | (Pattern expression "(" {Pattern ","}* arguments ")") CallOrTree
        | (Name name ":" Pattern pattern) VariableBecomes
        | ("[" Type type "]" Pattern pattern) Guarded
        | ("/" Pattern pattern) Descendant
        | ("!" Pattern pattern) Anti
        | (Type type Name name ":" Pattern pattern) TypedVariableBecomes
 ;
syntax QualifiedName
        = Default: 
        (Name ("::" Name)*) names
 ;
syntax Literal
        = IntegerLiteral integerLiteral Integer
        | RegExpLiteral regExpLiteral RegExp
        | RealLiteral realLiteral Real
        | BooleanLiteral booleanLiteral Boolean
        | StringLiteral stringLiteral String
        | DateTimeLiteral dateTimeLiteral DateTime
        | LocationLiteral locationLiteral Location
 ;
syntax IntegerLiteral
        = DecimalIntegerLiteral decimal DecimalIntegerLiteral
        | HexIntegerLiteral hex HexIntegerLiteral
        | OctalIntegerLiteral octal OctalIntegerLiteral
 ;
syntax StringLiteral
        = (PreStringChars pre StringTemplate template StringTail tail) Template
        | (PreStringChars pre Expression expression StringTail tail) Interpolated
        | StringConstant constant NonInterpolated
 ;
syntax StringTemplate
        = ("if" "(" (Expression ("," Expression)*) conditions ")" "{" Statement* preStats StringMiddle body Statement* postStats "}") IfThen
        | ("if" "(" (Expression ("," Expression)*) conditions ")" "{" Statement* preStatsThen StringMiddle thenString Statement* postStatsThen "}" "else" "{" Statement* preStatsElse StringMiddle elseString Statement* postStatsElse "}") IfThenElse
        | ("for" "(" (Expression ("," Expression)*) generators ")" "{" Statement* preStats StringMiddle body Statement* postStats "}") For
        | ("do" "{" Statement* preStats StringMiddle body Statement* postStats "}" "while" "(" Expression condition ")") DoWhile
        | ("while" "(" Expression condition ")" "{" Statement* preStats StringMiddle body Statement* postStats "}") While
 ;
syntax StringMiddle
        = MidStringChars mid Mid
        | (MidStringChars mid StringTemplate template StringMiddle tail) Template
        | (MidStringChars mid Expression expression StringMiddle tail) Interpolated
 ;
syntax StringTail
        = (MidStringChars mid Expression expression StringTail tail) MidInterpolated
        | PostStringChars post Post
        | (MidStringChars mid StringTemplate template StringTail tail) MidTemplate
 ;
syntax DateTimeLiteral
        = JustDate date DateLiteral
        | JustTime time TimeLiteral
        | DateAndTime dateAndTime DateAndTimeLiteral
 ;
syntax LocationLiteral
        = Default: 
        ProtocolPart protocolPart PathPart pathPart
 ;
syntax ProtocolPart
        = ProtocolChars protocolChars NonInterpolated
        | (PreProtocolChars pre Expression expression ProtocolTail tail) Interpolated
 ;
syntax ProtocolTail
        = (MidProtocolChars mid Expression expression ProtocolTail tail) Mid
        | PostProtocolChars post Post
 ;
syntax PathPart
        = PathChars pathChars NonInterpolated
        | (PrePathChars pre Expression expression PathTail tail) Interpolated
 ;
syntax PathTail
        = (MidPathChars mid Expression expression PathTail tail) Mid
        | PostPathChars post Post
 ;
syntax Type
        = ("(" Type type ")") Bracket
        | UserType user User
        | FunctionType function Function
        | StructuredType structured Structured
        | BasicType basic Basic
        | DataTypeSelector selector Selector
        | TypeVar typeVar Variable
        | Symbol symbol Symbol
 ;
syntax UserType
        = QualifiedName name Name
        | (QualifiedName name "[" (Type ("," Type)*) parameters "]") Parametric
 ;
syntax FunctionType
        = TypeArguments: 
        Type type "(" {TypeArg ","}* arguments ")"
 ;
syntax TypeArg
        = Type type Default
        | (Type type Name name) Named
 ;
syntax StructuredType
        = Default: 
        BasicType basicType "[" (TypeArg ("," TypeArg)*) arguments "]"
 ;
syntax BasicType
        = "value" Value
        | "loc" Loc
        | "node" Node
        | "num" Num
        | "type" ReifiedType
        | "bag" Bag
        | "int" Int
        | "rel" Relation
        | "parameter" ReifiedTypeParameter
        | "real" Real
        | "fun" ReifiedFunction
        | "tuple" Tuple
        | "str" String
        | "bool" Bool
        | "reified" ReifiedReifiedType
        | "void" Void
        | "non-terminal" ReifiedNonTerminal
        | "datetime" DateTime
        | "set" Set
        | "map" Map
        | "constructor" ReifiedConstructor
        | "list" List
        | "adt" ReifiedAdt
        | "lex" Lex
 ;
syntax DataTypeSelector
        = Selector: 
        QualifiedName sort "." Name production
 ;
syntax TypeVar
        = ("&" Name name) Free
        | ("&" Name name "\<:" Type bound) Bounded
 ;
syntax Symbol
        = ("{" Symbol symbol StrCon sep "}" "+") IterSep
        | ("{" Symbol symbol StrCon sep "}" "*") IterStarSep
        | ("(" Symbol head Symbol+ tail ")") Sequence
        | ("(" ")") Empty
        | SingleQuotedStrCon singelQuotedString CaseInsensitiveLiteral
        | StrCon string Literal
        | CharClass charClass CharacterClass
        | (Symbol symbol "?") Optional
        | (Symbol symbol "+") Iter
        | (Symbol symbol "*") IterStar
        | QualifiedName name Sort
        | (Symbol lhs "|" Symbol rhs) Alternative
 ;
syntax CharClass
        = ("(" CharClass charClass ")") Bracket
        | ("[" OptCharRanges optionalCharRanges "]") SimpleCharclass
        | ("~" CharClass charClass) Complement
        | (CharClass lhs "/" CharClass rhs) Difference
        | (CharClass lhs "/\\" CharClass rhs) Intersection
        | (CharClass lhs "\\/" CharClass rhs) Union
 ;
syntax OptCharRanges
        = CharRanges ranges Present
        | () Absent
 ;
syntax CharRanges
        = (CharRanges lhs CharRanges rhs) Concatenate
        | CharRange range Range
        | ("(" CharRanges ranges ")") Bracket
 ;
syntax CharRange
        = Character character Character
        | (Character start "-" Character end) Range
 ;
syntax Character
        = NumChar numChar Numeric
        | "\\EOF" EOF
        | ShortChar shortChar Short
        | "\\BOT" Bottom
        | "\\TOP" Top
 ;
syntax Mapping
        = Default: 
        &T from ":" &T to
 ;
syntax Replacement
        = Expression replacementExpression Unconditional
        | (Expression replacementExpression "when" (Expression ("," Expression)*) conditions) Conditional
 ;
syntax NoElseMayFollow
        = Default: 
        ()
 ;
syntax Target
        = () Empty
        | Name name Labeled
 ;
syntax Bound
        = (";" Expression expression) Default
        | () Empty
 ;
syntax Catch
        = ("catch" ":" Statement body) Default
        | ("catch" Pattern pattern ":" Statement body) Binding
 ;
syntax Assignable
        = ("(" Assignable arg ")") Bracket
        | QualifiedName qualifiedName Variable
        | (Assignable receiver "[" Expression subscript "]") Subscript
        | (Assignable receiver "." Name field) FieldAccess
        | (Assignable receiver "?" Expression defaultExpression) IfDefinedOrDefault
        | (Name name "(" (Assignable ("," Assignable)*) arguments ")") Constructor
        | ("\<" (Assignable ("," Assignable)*) elements "\>") Tuple
        | (Assignable receiver "@" Name annotation) Annotation
 ;
syntax Assignment
        = "?=" IfDefined
        | "/=" Division
        | "*=" Product
        | "&=" Intersection
        | "-=" Subtraction
        | "=" Default
        | "+=" Addition
 ;
syntax DataTarget
        = () Empty
        | (Name label ":") Labeled
 ;
syntax FunctionDeclaration
        = (Tags tags Visibility visibility Signature signature ";") Abstract
        | (Tags tags Visibility visibility Signature signature FunctionBody body) Default
 ;
syntax Visibility
        = "private" Private
        | () Default
        | "public" Public
 ;
syntax Signature
        = (Type type FunctionModifiers modifiers Name name Parameters parameters "throws" (Type ("," Type)*) exceptions) WithThrows
        | (Type type FunctionModifiers modifiers Name name Parameters parameters) NoThrows
 ;
syntax FunctionModifiers
        = List: 
        FunctionModifier* modifiers
 ;
syntax FunctionModifier
        = Java: 
        "java"
 ;
syntax Parameters
        = ("(" Formals formals ")") Default
        | ("(" Formals formals "..." ")") VarArgs
 ;
syntax Formals
        = Default: 
        {Formal ","}* formals
 ;
syntax Formal
        = TypeName: 
        Type type Name name
 ;
syntax FunctionBody
        = Default: 
        "{" Statement* statements "}"
 ;
syntax LocalVariableDeclaration
        = Declarator declarator Default
        | ("dynamic" Declarator declarator) Dynamic
 ;
syntax Declarator
        = Default: 
        Type type (Variable ("," Variable)*) variables
 ;
syntax Variable
        = (Name name "=" Expression initial) Initialized
        | Name name UnInitialized
 ;
syntax Comprehension
        = ("{" (Expression ("," Expression)*) results "|" (Expression ("," Expression)*) generators "}") Set
        | ("(" Expression from ":" Expression to "|" (Expression ("," Expression)*) generators ")") Map
        | ("[" (Expression ("," Expression)*) results "|" (Expression ("," Expression)*) generators "]") List
 ;
syntax Field
        = IntegerLiteral fieldIndex Index
        | Name fieldName Name
 ;
syntax ModuleParameters
        = Default: 
        "[" (TypeVar ("," TypeVar)*) parameters "]"
 ;
syntax Import
        = ("extend" ImportedModule module ";") Extend
        | ("import" ImportedModule module ";") Default
        | SyntaxDefinition syntax Syntax
 ;
syntax ImportedModule
        = QualifiedName name Default
        | (QualifiedName name ModuleActuals actuals Renamings renamings) ActualsRenaming
        | (QualifiedName name Renamings renamings) Renamings
        | (QualifiedName name ModuleActuals actuals) Actuals
 ;
syntax ModuleActuals
        = Default: 
        "[" (Type ("," Type)*) types "]"
 ;
syntax Renamings
        = Default: 
        "renaming" (Renaming ("," Renaming)*) renamings
 ;
syntax Renaming
        = Default: 
        Name from "=\>" Name to
 ;
syntax SyntaxDefinition
        = ("layout" Sym defined "=" Prod production ";") Layout
        | (Start start "syntax" Sym defined "=" Prod production ";") Language
 ;
syntax Sym
        = (Sym symbol "+") Iter
        | ("{" Sym symbol StringConstant sep "}" "+") IterSep
        | ("@" IntegerLiteral column) Column
        | Class charClass CharacterClass
        | StringConstant string Literal
        | "$" EndOfLine
        | (Sym symbol NonterminalLabel label) Labeled
        | Nonterminal nonterminal Nonterminal
        | ("&" Nonterminal nonterminal) Parameter
        | (Sym symbol "*") IterStar
        | (ParameterizedNonterminal pnonterminal "[" (Sym ("," Sym)*) parameters "]") Parametrized
        | (Sym symbol "?") Optional
        | ("{" Sym symbol StringConstant sep "}" "*") IterStarSep
        | CaseInsensitiveStringConstant cistring CaseInsensitiveLiteral
        | "^" StartOfLine
 ;
syntax Class
        = ("[" Range* ranges "]") SimpleCharclass
        | ("!" Class charClass) Complement
        | (Class lhs "-" Class rhs) Difference
        | (Class lhs "&&" Class rhs) Intersection
        | (Class lhs "||" Class rhs) Union
        | ("(" Class charclass ")") Bracket
 ;
syntax Range
        = (Char start "-" Char end) FromTo
        | Char character Character
 ;
syntax Prod
        = (":" Name referenced) Reference
        | (Prod prod LanguageAction action) Action
        | (ProdModifier* modifiers Name name ":" Sym* args) Labeled
        | "..." Others
        | (ProdModifier* modifiers Sym* args) Unlabeled
        | (Assoc associativity "(" Prod group ")") AssociativityGroup
        | (Prod lhs "-" Prod rhs) Reject
        | (Prod lhs "#" Prod rhs) Follow
        | (Prod lhs "|" Prod rhs) All
        | (Prod lhs "\>" Prod rhs) First
 ;
syntax LanguageAction
        = ("=\>" Expression expression) Build
        | ("{" Statement* statements "}") Action
 ;
syntax ProdModifier
        = Assoc associativity Associativity
        | "bracket" Bracket
        | "lex" Lexical
 ;
syntax Assoc
        = "assoc" Associative
        | "left" Left
        | "non-assoc" NonAssociative
        | "right" Right
 ;
syntax Start
        = () Absent
        | "start" Present
 ;
syntax Body
        = Toplevels: 
        Toplevel* toplevels
 ;
syntax Toplevel
        = GivenVisibility: 
        Declaration declaration
 ;
syntax Declaration
        = (Tags tags Visibility visibility Type type (Variable ("," Variable)*) variables ";") Variable
        | (Tags tags Visibility visibility "anno" Type annoType Type onType "@" Name name ";") Annotation
        | (Tags tags Visibility visibility "view" Name view "\<:" Name superType "=" (Alternative ("|" Alternative)*) alts ";") View
        | (Tags tags Visibility visibility "alias" UserType user "=" Type base ";") Alias
        | (Tags tags Visibility visibility "tag" Kind kind Name name "on" (Type ("," Type)*) types ";") Tag
        | (Tags tags Visibility visibility "data" UserType user ";") DataAbstract
        | (Tags tags Visibility visibility "data" UserType user "=" (Variant ("|" Variant)*) variants ";") Data
        | (Tags tags "rule" Name name PatternWithAction patternAction ";") Rule
        | FunctionDeclaration functionDeclaration Function
        | (Test test ";") Test
 ;
syntax Alternative
        = NamedType: 
        Name name Type type
 ;
syntax Kind
        = "function" Function
        | "variable" Variable
        | "all" All
        | "anno" Anno
        | "data" Data
        | "view" View
        | "rule" Rule
        | "alias" Alias
        | "module" Module
        | "tag" Tag
 ;
syntax Variant
        = NAryConstructor: 
        Name name "(" {TypeArg ","}* arguments ")"
 ;
syntax Test
        = (Tags tags "test" Expression expression ":" StringLiteral labeled) Labeled
        | (Tags tags "test" Expression expression) Unlabeled
 ;
syntax PreModule
        = Default: 
        Header header Marker Rest
 ;
syntax Rest
        = 
        Word*;
 ;
syntax Command
        = Expression expression Expression
        | Declaration declaration Declaration
        | (":" ShellCommand command) Shell
        | Statement statement Statement
        | Import imported Import
 ;
syntax ShellCommand
        = ("set" QualifiedName name Expression expression) SetOption
        | ("undeclare" QualifiedName name) Undeclare
        | "help" Help
        | ("edit" QualifiedName name) Edit
        | ("unimport" QualifiedName name) Unimport
        | "declarations" ListDeclarations
        | "quit" Quit
        | "history" History
        | "test" Test
        | "modules" ListModules
 ;
