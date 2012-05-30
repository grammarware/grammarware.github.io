@contributor{bgf2src automated exporter - SLPS}
module Lll_kort

syntax Specification
        = 
        Rule+
 ;
syntax Rule
        = 
        Ident ":" Disjunction ";"
 ;
syntax Disjunction
        = 
        Conjunction ("|" Conjunction)*
 ;
syntax Conjunction
        = 
        Term+
 ;
syntax Term
        = 
        Basis Repetition?
 ;
syntax Basis
        = Ident
        | Literal
        | "%epsilon"
        | Alternation
        | Group
 ;
syntax Repetition
        = "+"
        | "*"
        | "?"
 ;
syntax Alternation
        = 
        "{" Basis Basis "}" Repetition
 ;
syntax Group
        = 
        "(" Disjunction ")"
 ;
