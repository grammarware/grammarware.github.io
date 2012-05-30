@contributor{bgf2src automated exporter - SLPS}
module Ebnf_iso_2

syntax Syntax
        = 
        Syntax_rule+
 ;
syntax Syntax_rule
        = 
        Meta_identifier "=" Definitions_list ";"
 ;
syntax Definitions_list
        = 
        Single_definition ("|" Single_definition)*
 ;
syntax Single_definition
        = 
        Term ("," Term)*
 ;
syntax Term
        = 
        Factor ("-" Exception)?
 ;
syntax Exception
        = 
        Factor
 ;
syntax Factor
        = 
        (Integer "*")? Primary
 ;
syntax Primary
        = Optional_sequence
        | Repeated_sequence
        | Special_sequence
        | Grouped_sequence
        | Meta_identifier
        | Terminal_string
        | Empty
 ;
syntax Empty
        = 
        ()
 ;
syntax Optional_sequence
        = 
        "[" Definitions_list "]"
 ;
syntax Repeated_sequence
        = 
        "{" Definitions_list "}"
 ;
syntax Grouped_sequence
        = 
        "(" Definitions_list ")"
 ;
syntax Terminal_string
        = "’" Character+ "’"
        | "\"" Character+ "\""
 ;
syntax Meta_identifier
        = 
        Letter (Letter | Decimal_digit)*
 ;
syntax Integer
        = 
        Decimal_digit+
 ;
syntax Special_sequence
        = 
        "?" Character* "?"
 ;
syntax Comment
        = 
        "(*" Comment_symbol* "*)"
 ;
syntax Comment_symbol
        = Comment
        | Terminal_string
        | Special_sequence
        | Character
 ;
