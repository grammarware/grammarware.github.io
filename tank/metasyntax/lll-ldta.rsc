@contributor{bgf2src automated exporter - SLPS}
module Lll_ldta

syntax Grammar
        = 
        Rule+
 ;
syntax Rule
        = 
        Sort ":" Alts ";"
 ;
syntax Alts
        = 
        Alt Alts_tail*
 ;
syntax Alts_tail
        = 
        "|" Alt
 ;
syntax Alt
        = 
        Term*
 ;
syntax Term
        = 
        Basis Repetition?
 ;
syntax Basis
        = Literal
        | Sort
 ;
syntax Repetition
        = "*"
        | "+"
        | "?"
 ;
