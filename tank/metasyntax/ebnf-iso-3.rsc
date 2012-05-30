@contributor{bgf2src automated exporter - SLPS}
module Ebnf_iso_3

syntax SYNTAX
        = 
        SYNTAX_RULE+
 ;
syntax SYNTAX_RULE
        = 
        META_IDENTIFIER "=" DEFINITIONS_LIST "."
 ;
syntax DEFINITIONS_LIST
        = 
        SINGLE_DEFINITION ("/" SINGLE_DEFINITION)*
 ;
syntax SINGLE_DEFINITION
        = 
        TERM ("," TERM)*
 ;
syntax TERM
        = 
        FACTOR ("-" EXCEPTION)?
 ;
syntax EXCEPTION
        = 
        FACTOR
 ;
syntax FACTOR
        = 
        (INTEGER "*")? PRIMARY
 ;
syntax PRIMARY
        = OPTIONAL_SEQUENCE
        | REPEATED_SEQUENCE
        | SPECIAL_SEQUENCE
        | GROUPED_SEQUENCE
        | META_IDENTIFIER
        | TERMINAL
        | EMPTY
 ;
syntax EMPTY
        = 
        ()
 ;
syntax OPTIONAL_SEQUENCE
        = 
        "(/" DEFINITIONS_LIST "/)"
 ;
syntax REPEATED_SEQUENCE
        = 
        "(:" DEFINITIONS_LIST ":)"
 ;
syntax GROUPED_SEQUENCE
        = 
        "(" DEFINITIONS_LIST ")"
 ;
syntax TERMINAL
        = "’" CHARACTER+ "’"
        | "\"" CHARACTER+ "\""
 ;
syntax META_IDENTIFIER
        = 
        LETTER (LETTER | DIGIT)*
 ;
syntax INTEGER
        = 
        DIGIT+
 ;
syntax SPECIAL_SEQUENCE
        = 
        "?" CHARACTER* "?"
 ;
syntax COMMENT
        = 
        "(*" COMMENT_SYMBOL* "*)"
 ;
syntax COMMENT_SYMBOL
        = COMMENT
        | TERMINAL
        | SPECIAL_SEQUENCE
        | CHARACTER
 ;
