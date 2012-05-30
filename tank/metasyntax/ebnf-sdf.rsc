@contributor{bgf2src automated exporter - SLPS}
module Ebnf_sdf

syntax Grammar
        = 
        Rule*
 ;
syntax Rule
        = 
        IdCon "::=" Expression
 ;
syntax IdCon
        = 
        String
 ;
syntax Expression
        = IdCon
        | String
        | "(" Expression ")"
        | Expression "?"
        | Expression "*"
        | Expression "+"
        | Expression "|" Expression
        | Expression Expression
 ;
syntax String
        = 
        "\"" String "\""
 ;
