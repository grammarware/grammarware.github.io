@contributor{bgf2src automated exporter - SLPS}
module Txl

syntax Program
        = 
        Statement*
 ;
syntax Statement
        = IncludeStatement
        | KeysStatement
        | CompoundsStatement
        | CommentsStatement
        | TokensStatement
        | DefineStatement
        | RedefineStatement
        | RuleStatement
        | FunctionStatement
        | ExternalStatement
        | Comment NL
 ;
syntax IncludeStatement
        = 
        "include" Stringlit NL
 ;
syntax KeysStatement
        = 
        "keys" NL IN Keyword* EX NL "end" "keys" NL NL
 ;
syntax Keyword
        = Literal SP
        | Key SP
 ;
syntax CompoundsStatement
        = 
        "compounds" NL IN Compound* EX NL "end" "compounds" NL NL
 ;
syntax Compound
        = 
        Literal SP
 ;
syntax CommentsStatement
        = 
        "comments" NL IN CommentConvention* EX "end" "comments" NL NL
 ;
syntax CommentConvention
        = Literal SP Literal NL
        | Literal NL
 ;
syntax TokensStatement
        = 
        "tokens" NL IN TokenPattern* EX "end" "tokens" NL NL
 ;
syntax TokenPattern
        = Typeid TAB_24 Stringlit NL
        | TAB_16 "|" TAB_24 Stringlit NL
        | Typeid TAB_16 "..."? "|" TAB_24 Stringlit NL
        | Typeid TAB_16 "+" TAB_24 Stringlit NL
        | Comment NL
 ;
syntax DefineStatement
        = 
        "define" Typeid NL IN IN LiteralOrType* NL BarLiteralsAndTypes* EX EX "end" "define" NL NL RESET
 ;
syntax RedefineStatement
        = 
        "redefine" Typeid NL IN IN DotDotDotBar? LiteralOrType* NL BarLiteralsAndTypes* BarDotDotDot? EX EX "end" RedefineOrDefine NL NL RESET
 ;
syntax RedefineOrDefine
        = "redefine"
        | "define"
 ;
syntax RESET
        = 
        EX EX EX EX EX EX EX EX EX
 ;
syntax DotDotDotBar
        = 
        "..." EX NL "|" TAB IN
 ;
syntax BarDotDotDot
        = 
        EX "|" TAB IN "..." NL
 ;
syntax BarLiteralsAndTypes
        = 
        EX "|" TAB IN LiteralOrType* NL
 ;
syntax LiteralOrType
        = Type SP
        | Literal SP
 ;
syntax Type
        = FormatCues
        | "[" TypeSpec "]"
 ;
syntax FormatCues
        = 
        IN IN FormatCue+ EX EX OptNL?
 ;
syntax OptNL
        = 
        LiteralOrType NL
 ;
syntax FormatCue
        = 
        "[" FormatId "]"
 ;
syntax FormatId
        = "NL"
        | "IN" IN
        | "EX" EX
 ;
syntax TypeSpec
        = TypeModifier? Typeid TypeRepeater?
        | "!"
 ;
syntax TypeModifier
        = "opt"
        | "repeat"
        | "list"
        | "attr"
        | "see"
        | "not"
        | "push"
        | "pop"
        | ":"
        | "~"
        | "\>"
        | "\<"
 ;
syntax TypeRepeater
        = "+"
        | "*"
        | "?"
        | ","
        | ",+"
 ;
syntax TypeidOrQuotedLiteral
        = Typeid
        | QuotedLiteral
 ;
syntax RuleStatement
        = "rule" Ruleid FormalArgument* NL IN IN ConstructDeconstructImportExportOrCondition* EX SkippingType? "replace" DollarStar? SP Type NL IN Pattern ConstructDeconstructImportExportOrCondition* EX "by" NL IN Replacement EX EX "end" "rule" NL NL
        | "rule" Ruleid FormalArgument* NL IN IN ConstructDeconstructImportExportOrCondition* EX SkippingType? "match" DollarStar? SP Type NL IN Pattern EX EX ConstructDeconstructImportExportOrCondition* "end" "rule" NL NL
 ;
syntax FunctionStatement
        = "function" Ruleid FormalArgument* NL IN IN ConstructDeconstructImportExportOrCondition* EX SkippingType? "replace" DollarStar? SP Type NL IN Pattern ConstructDeconstructImportExportOrCondition* EX "by" NL IN Replacement EX EX "end" "function" NL NL
        | "function" Ruleid FormalArgument* NL IN IN ConstructDeconstructImportExportOrCondition* EX SkippingType? "match" DollarStar? SP Type NL IN Pattern ConstructDeconstructImportExportOrCondition* EX EX "end" "function" NL NL
 ;
syntax DollarStar
        = SP "$"
        | SP "*"
 ;
syntax ExternalStatement
        = "external" "rule" Ruleid FormalArgument* NL NL
        | "external" "function" Ruleid FormalArgument* NL NL
 ;
syntax FormalArgument
        = 
        Varid SP Type CommentNL*
 ;
syntax ConstructDeconstructImportExportOrCondition
        = Constructor
        | Deconstructor
        | Condition
        | Importer
        | Exporter
        | EX Comment NL IN
 ;
syntax Constructor
        = 
        EX "construct" Varid SP Type NL IN Replacement
 ;
syntax Deconstructor
        = 
        EX SkippingType? "deconstruct" "not"? "*"? Type? Varid NL IN Pattern
 ;
syntax Condition
        = EX "where" "not"? "all"? NL IN CommentNL* Expression NL
        | EX "assert" "not"? "all"? NL IN CommentNL* Expression NL
 ;
syntax Importer
        = 
        EX "import" Varid Type? NL IN Pattern?
 ;
syntax Exporter
        = 
        EX "export" Varid Type? NL IN Replacement?
 ;
syntax SkippingType
        = 
        "skipping" SP Type CommentNL*
 ;
syntax Pattern
        = 
        LiteralOrVariable* NL
 ;
syntax LiteralOrVariable
        = Literal SP
        | Varid SP Type SP
        | Varid SP
 ;
syntax Replacement
        = 
        LiteralOrExpression* NL
 ;
syntax LiteralOrExpression
        = Literal SP
        | Expression SP
 ;
syntax Expression
        = 
        Varid RuleApplications?
 ;
syntax RuleApplications
        = 
        IN IN CommentNL* RuleApplication+ EX EX RuleoptNL?
 ;
syntax RuleoptNL
        = 
        LiteralOrExpression NL
 ;
syntax RuleApplication
        = SP "[" Ruleid VaridOrLiteral* EachArgs? "]" CommentNL*
        | SP Lengthrule VaridOrLiteral* EachArgs? "]" CommentNL*
 ;
syntax CommentNL
        = 
        SP SP Comment NEWoptNL?
 ;
syntax NEWoptNL
        = 
        NL
 ;
syntax EachArgs
        = 
        SP "each" VaridOrLiteral*
 ;
syntax VaridOrLiteral
        = SP Varid
        | SP Literal
 ;
syntax Literal
        = QuotedLiteral
        | UnquotedLiteral
        | SP Comment NEWoptNL?
 ;
syntax QuotedLiteral
        = "'" UnquotedLiteral
        | "'" Key
 ;
syntax UnquotedLiteral
        = SP "'"
        | Token
 ;
syntax Varid
        = 
        Id
 ;
syntax Typeid
        = Id
        | SP Literal
 ;
syntax Ruleid
        = Id
        | Special
        | "#"
        | Key
 ;
