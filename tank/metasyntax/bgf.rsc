@contributor{bgf2src automated exporter - SLPS}
module Bgf

syntax Grammar
        = 
        Nonterminal root* Production*
 ;
syntax Production
        = 
        Label label? Nonterminal nonterminal Expression
 ;
syntax Expression
        = () epsilon
        | () empty
        | Value value
        | () any
        | Terminal terminal
        | Nonterminal nonterminal
        | (Selector selector Expression) selectable
        | Expression+ sequence
        | Expression marked
        | Expression+ choice
        | Expression optional
        | Expression plus
        | Expression star
 ;
syntax Value
        = () int
        | () string
 ;
syntax Label
        = 
        String
 ;
syntax Nonterminal
        = 
        String
 ;
syntax Selector
        = 
        String
 ;
syntax Terminal
        = 
        String
 ;
