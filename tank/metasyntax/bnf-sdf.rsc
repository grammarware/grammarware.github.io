@contributor{bgf2src automated exporter - SLPS}
module Bnf_sdf

syntax Rules
        = 
        Rule*
 ;
syntax Rule
        = 
        NonTerminal "::=" Elements
 ;
syntax NonTerminal
        = 
        "\<" String "\>"
 ;
syntax Elements
        = 
        Element ("|" Element)*
 ;
syntax Element
        = NonTerminal
        | Terminal
        | "[" Element ("|" Element)* "]"
        | "{" Element ("|" Element)* "}"
        | "|"
        | "["
        | "]"
        | "{"
        | "}"
        | "\<"
        | "\>"
        | "..."
        | "::="
        | Element Element
 ;
syntax Terminal
        = 
        String
 ;
